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
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
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
  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().subtract(
        const Duration(days: 7),
      ),
    ),
  );

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
         
          shipTo: mockShipToInfo.shipToCustomerCode,
          soldTo: mockCustomerCodeInfo.customerCodeSoldTo,
          pageSize: 10,
          offset: 0,
          language: 'E',
          userName: 'mock_user',
          orderBy: 'orderDate',
          sort: 'desc',
          filterQuery: {
            'orderNumber': 'fake_orderNumber',
            'poReference': 'fake_poReference',
            'materialSearch': 'fake_materialSearch',
            'principalSearch': 'fake_principalSearch',
            'toDate': DateTimeStringValue(getDateStringByDateTime(fakeToDate))
                .apiDateTimeFormat,
            'fromDate':
                DateTimeStringValue(getDateStringByDateTime(fakeFromDate))
                    .apiDateTimeFormat,
          },
        ),
      ).thenAnswer((invocation) async => orderHistoryMockList);
      when(() => countlyService.addCountlyEvent(
            'order_history_filter',
            segmentation: {
              'isDateChanged':
                  mockOrderHistoryFilter.toDate.isBefore(DateTime.now()),
            },
          )).thenAnswer((invocation) => Future.value());
      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs.copyWith(
              languageValue: LanguageValue('E'), languageFilter: true),
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderBy: 'orderDate',
          sort: 'desc',
          user: mockUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
              username: Username('mock_user')),
          pageSize: 10,
          offset: 0,
          orderHistoryFilter: mockOrderHistoryFilter.copyWith(
              materialSearch: SearchKey('fake_materialSearch'),
              principalSearch: SearchKey('fake_principalSearch'),
              poNumber: SearchKey('fake_poReference'),
              orderId: SearchKey(
                'fake_orderNumber',
              )));
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistory fail remotely for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryRemoteDataSource.getOrderHistorySalesRep(
            filterQuery: {
              'toDate': DateTimeStringValue(getDateStringByDateTime(fakeToDate))
                  .apiDateTimeFormat,
              'fromDate':
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate))
                      .apiDateTimeFormat,
            },
            soldTo: mockCustomerCodeInfo.customerCodeSoldTo,
            shipTo: mockShipToInfo.shipToCustomerCode,
            pageSize: 1,
            offset: 0,
            orderBy: 'orderBy',
            sort: 'sort',
            userName: '',
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
          filterQuery: {
            'toDate': DateTimeStringValue(getDateStringByDateTime(fakeToDate))
                .apiDateTimeFormat,
            'fromDate':
                DateTimeStringValue(getDateStringByDateTime(fakeFromDate))
                    .apiDateTimeFormat,
            'orderNumber': 'fake_orderNumber',
            'poReference': 'fake_poReference',
            'materialSearch': 'fake_materialSearch',
            'principalSearch': 'fake_principalSearch',
          },
          soldTo: mockCustomerCodeInfo.customerCodeSoldTo,
          shipTo: mockShipToInfo.shipToCustomerCode,
          pageSize: 10,
          offset: 0,
          orderBy: 'orderDate',
          sort: 'desc',
          companyName: '',
        ),
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
          orderHistoryFilter: mockOrderHistoryFilter.copyWith(
              materialSearch: SearchKey('fake_materialSearch'),
              principalSearch: SearchKey('fake_principalSearch'),
              poNumber: SearchKey('fake_poReference'),
              orderId: SearchKey(
                'fake_orderNumber',
              )));
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistory fail remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryRemoteDataSource.getOrderHistory(
          filterQuery: {
            'toDate': DateTimeStringValue(getDateStringByDateTime(fakeToDate))
                .apiDateTimeFormat,
            'fromDate':
                DateTimeStringValue(getDateStringByDateTime(fakeFromDate))
                    .apiDateTimeFormat,
          },
          soldTo: mockCustomerCodeInfo.customerCodeSoldTo,
          shipTo: mockShipToInfo.shipToCustomerCode,
          pageSize: 1,
          offset: 0,
          orderBy: 'orderBy',
          sort: 'sort',
          companyName: '',
        ),
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
