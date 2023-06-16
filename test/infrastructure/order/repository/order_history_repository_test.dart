import 'package:ezrxmobile/config.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_remote.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class OrderHistoryLocalDataSourceMock extends Mock
    implements OrderHistoryLocalDataSource {}

class OrderHistoryRemoteDataSourceMock extends Mock
    implements OrderHistoryRemoteDataSource {}

void main() {
  // late OrderHistoryRepository orderHistoryRepository;
  // late Config mockConfig;
  // late OrderHistoryLocalDataSource orderHistoryLocalDataSource;
  // late OrderHistoryRemoteDataSource orderHistoryRemoteDataSource;

  // final orderHistoryMockList = OrderHistory.empty();

  // final mockUser = User.empty();
  // final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  // final mockOrderHistoryFilter = OrderHistoryFilter.empty();
  // final mockShipToInfo = ShipToInfo.empty().copyWith(
  //     building: 'fakeBuilding',
  //     shipToCustomerCode: 'fake-ship-to-customer-code');
  // final mockCustomerCodeInfo = CustomerCodeInfo.empty()
  //     .copyWith(customerCodeSoldTo: 'fake-customer-code');
  // final fakeToDate = DateTime.parse(
  //   DateFormat('yyyyMMdd').format(
  //     DateTime.now(),
  //   ),
  // );

  // final fakeFromDate = DateTime.parse(
  //   DateFormat('yyyyMMdd').format(
  //     DateTime.now().subtract(
  //       const Duration(days: 28),
  //     ),
  //   ),
  // );

  setUpAll(() {
    // mockConfig = MockConfig();
    // orderHistoryLocalDataSource = OrderHistoryLocalDataSourceMock();
    // orderHistoryRemoteDataSource = OrderHistoryRemoteDataSourceMock();

    // orderHistoryRepository = OrderHistoryRepository(
    //   config: mockConfig,
    //   localDataSource: orderHistoryLocalDataSource,
    //   orderHistoryRemoteDataSource: orderHistoryRemoteDataSource,
    // );
  });
//TODO : will enhance
  /*
  group('OrderHistoryRepository should - ', () {
    test('get OrderHistory successfully locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderHistoryLocalDataSource.getOrderHistoryForSalesRep())
          .thenAnswer((invocation) async => orderHistoryMockList);

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderStatus: '',
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
          orderStatus: 'orderBy',
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
          orderStatus: 'orderBy',
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
          orderStatus: 'orderBy',
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
          orderStatus: 'orderDate',
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
      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs.copyWith(
              languageValue: LanguageValue('E'), languageFilter: true),
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderStatus: 'orderDate',
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
            orderStatus: 'orderBy',
            userName: '',
            language: ''),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderStatus: 'orderBy',
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
          },
          soldTo: mockCustomerCodeInfo.customerCodeSoldTo,
          shipTo: mockShipToInfo.shipToCustomerCode,
          pageSize: 10,
          offset: 0,
          orderStatus: 'orderDate',
          language: '',
          query: '',
        ),
      ).thenAnswer((invocation) async => orderHistoryMockList);

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderStatus: 'orderDate',
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
          orderStatus: 'orderBy', language: '', query: '',
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryRepository.getOrderHistory(
          salesOrgConfig: mockSalesOrganisationConfigs,
          soldTo: mockCustomerCodeInfo,
          shipTo: mockShipToInfo,
          orderStatus: 'orderBy',
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
*/
}
