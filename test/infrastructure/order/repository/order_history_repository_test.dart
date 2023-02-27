import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class OrderHistoryLocalDataSourceMock extends Mock
    implements OrderHistoryLocalDataSource {}

class OrderHistoryRemoteDataSourceMock extends Mock
    implements OrderHistoryRemoteDataSource {}

class CountlyServiceMock extends Mock implements CountlyService {}

void main() {
  late OrderHistoryRepository orderHistoryRepository;
  late Config mockConfig;
  late OrderHistoryLocalDataSource orderHistoryLocalDataSource;
  late OrderHistoryRemoteDataSource orderHistoryRemoteDataSource;
  late CountlyService countlyService;
  final orderHistoryMockList = OrderHistory.empty();

  final mockUser = User.empty();
  final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  final mockOrderHistoryFilter = OrderHistoryFilter.empty();
  final mockShipToInfo = ShipToInfo.empty().copyWith(
      building: 'fakeBuilding',
      shipToCustomerCode: 'fake-ship-to-customer-code');
  final mockCustomerCodeInfo = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: 'fake-customer-code');

  setUpAll(() {
    mockConfig = MockConfig();
    orderHistoryLocalDataSource = OrderHistoryLocalDataSourceMock();
    orderHistoryRemoteDataSource = OrderHistoryRemoteDataSourceMock();
    countlyService = CountlyServiceMock();
    orderHistoryRepository = OrderHistoryRepository(
      config: mockConfig,
      localDataSource: orderHistoryLocalDataSource,
      countlyService: countlyService,
      orderHistoryRemoteDataSource: orderHistoryRemoteDataSource,
    );
  });

  group('OrderHistoryRepository should - ', () {
    test('get OrderHistory successfully locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderHistoryLocalDataSource.getOrderHistoryForSalesRep())
          .thenAnswer((invocation) async => orderHistoryMockList);

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderBy: '',
          sort: '',
          user: mockUser.copyWith(
              role:
                  Role.empty().copyWith(type: RoleType('external_sales_rep'))),
          pageSize: 10,
          offset: 0,
          orderHistoryFilter: mockOrderHistoryFilter);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistory fail locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderHistoryLocalDataSource.getOrderHistoryForSalesRep())
          .thenThrow((invocation) async => MockException());

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderBy: 'orderBy',
          sort: 'sort',
          user: mockUser,
          pageSize: 10,
          offset: 0,
          orderHistoryFilter: mockOrderHistoryFilter);
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get OrderHistory successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderHistoryLocalDataSource.getOrderHistory())
          .thenAnswer((invocation) async => orderHistoryMockList);

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderBy: 'orderBy',
          sort: 'sort',
          user: mockUser,
          pageSize: 1,
          offset: 0,
          orderHistoryFilter: mockOrderHistoryFilter);
      expect(
        result.isRight(),
        true,
      );
    });

    test('get OrderHistory fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderHistoryLocalDataSource.getOrderHistory())
          .thenThrow((invocation) async => MockException());

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderBy: 'orderBy',
          sort: 'sort',
          user: mockUser,
          pageSize: 1,
          offset: 0,
          orderHistoryFilter: mockOrderHistoryFilter);

      expect(
        result.isLeft(),
        true,
      );
    });
    test('get OrderHistory successfully remotely for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryRemoteDataSource.getOrderHistorySalesRep(
            loginUserType: 'salesRep',
            soldTo: '1000004567',
            shipTo: '2678999',
            fromDate: '20221223',
            toDate: '20221230',
            pageSize: 10,
            offset: 0,
            orderBy: 'orderDate',
            sort: 'desc',
            userName: 'mock_user',
            orderId: '234567',
            poNumber: '23333',
            materialSearch: '299999',
            principalSearch: '32222',
            language: 'E'),
      ).thenAnswer((invocation) async => orderHistoryMockList);

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs.copyWith(
              languageValue: LanguageValue('E'), languageFilter: true),
          soldTo:
              mockCustomerCodeInfo.copyWith(customerCodeSoldTo: '1000004567'),
          shipTo: mockShipToInfo.copyWith(shipToCustomerCode: '2678999'),
          orderBy: 'orderDate',
          sort: 'desc',
          user: mockUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
              username: Username('mock_user')),
          pageSize: 10,
          offset: 0,
          orderHistoryFilter: mockOrderHistoryFilter.copyWith(
              orderId: SearchKey('234567'),
              materialSearch: SearchKey('299999'),
              poNumber: SearchKey('23333'),
              principalSearch: SearchKey('32222')));
      expect(
        result.isRight(),
        false,
      );
    });
    test('get OrderHistory fail remotely for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryRemoteDataSource.getOrderHistorySalesRep(
            loginUserType: mockUser.role.type.loginUserType,
            soldTo: mockCustomerCodeInfo.customerCodeSoldTo,
            shipTo: mockShipToInfo.shipToCustomerCode,
            fromDate: mockOrderHistoryFilter.fromDate.apiDateTimeFormat,
            toDate: mockOrderHistoryFilter.toDate.apiDateTimeFormat,
            pageSize: 1,
            offset: 0,
            orderBy: 'orderBy',
            sort: 'sort',
            userName: '',
            orderId: mockOrderHistoryFilter.orderId.getOrDefaultValue(''),
            poNumber: mockOrderHistoryFilter.poNumber.getOrDefaultValue(''),
            materialSearch:
                mockOrderHistoryFilter.materialSearch.getOrDefaultValue(''),
            principalSearch:
                mockOrderHistoryFilter.principalSearch.getOrDefaultValue(''),
            language: ''),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderBy: 'orderBy',
          sort: 'sort',
          user: mockUser,
          pageSize: 1,
          offset: 0,
          orderHistoryFilter: mockOrderHistoryFilter);
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get OrderHistory successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryRemoteDataSource.getOrderHistory(
            loginUserType: mockUser.role.type.loginUserType,
            soldTo: mockCustomerCodeInfo.customerCodeSoldTo,
            shipTo: mockShipToInfo.shipToCustomerCode,
            fromDate:
                mockOrderHistoryFilter.fromDate.apiDateTimeFormat,
            toDate:
                mockOrderHistoryFilter.toDate.apiDateTimeFormat,
            pageSize: 10,
            offset: 0,
            orderBy: 'orderDate',
            sort: 'desc',
            companyName: '',
            orderId: mockOrderHistoryFilter.orderId.getOrDefaultValue(''),
            poNumber: mockOrderHistoryFilter.poNumber.getOrDefaultValue(''),
            materialSearch:
                mockOrderHistoryFilter.materialSearch.getOrDefaultValue(''),
            principalSearch:
                mockOrderHistoryFilter.principalSearch.getOrDefaultValue('')),
      ).thenAnswer((invocation) async => orderHistoryMockList);

      when(() => countlyService.addCountlyEvent(
            'order_history_filter',
            segmentation: {
              'isDateChanged':
                  mockOrderHistoryFilter.toDate.isBefore(DateTime.now()),
            },
          )).thenAnswer((invocation) => Future.value());

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderBy: 'orderDate',
          sort: 'desc',
          user: User.empty().copyWith(
              username: Username('mock_user'),
              role: Role.empty().copyWith(type: RoleType('salesRep'))),
          pageSize: 10,
          offset: 0,
          orderHistoryFilter: mockOrderHistoryFilter);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistory fail remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryRemoteDataSource.getOrderHistory(
            loginUserType: mockUser.role.type.loginUserType,
            soldTo: mockCustomerCodeInfo.customerCodeSoldTo,
            shipTo: mockShipToInfo.shipToCustomerCode,
            fromDate:
                mockOrderHistoryFilter.fromDate.apiDateTimeFormat,
            toDate:
                mockOrderHistoryFilter.toDate.apiDateTimeFormat,
            pageSize: 1,
            offset: 0,
            orderBy: 'orderBy',
            sort: 'sort',
            companyName: '',
            orderId: mockOrderHistoryFilter.orderId.getOrDefaultValue(''),
            poNumber: mockOrderHistoryFilter.poNumber.getOrDefaultValue(''),
            materialSearch:
                mockOrderHistoryFilter.materialSearch.getOrDefaultValue(''),
            principalSearch:
                mockOrderHistoryFilter.principalSearch.getOrDefaultValue('')),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderBy: 'orderBy',
          sort: 'sort',
          user: mockUser.copyWith(username: Username('')),
          pageSize: 1,
          offset: 0,
          orderHistoryFilter: mockOrderHistoryFilter);
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
