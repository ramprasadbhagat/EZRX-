import 'dart:ui';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_details_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class OrderHistoryDetailsLocalDataSourceMock extends Mock
    implements ViewByOrderDetailsLocalDataSource {}

class OrderHistoryDetailsRemoteDataSourceMock extends Mock
    implements ViewByOrderDetailsRemoteDataSource {}

void main() {
  late ViewByOrderDetailsRepository orderHistoryDetailsRepository;
  late Config mockConfig;
  late ViewByOrderDetailsLocalDataSource orderHistoryDetailsLocalDataSource;
  late ViewByOrderDetailsRemoteDataSource orderHistoryDetailsRemoteDataSource;
  late CustomerCodeInfo customerCodeInfo;
  late SalesOrganisation salesOrganisation;

  final orderHistoryDetailsMockList = OrderHistoryDetails.empty();

  final mockUser = User.empty().copyWith(
    preferredLanguage: const Locale(ApiLanguageCode.english),
  );

  final mockOrderHistoryItem = OrderHistoryDetailsOrderHeader.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    orderHistoryDetailsLocalDataSource =
        OrderHistoryDetailsLocalDataSourceMock();
    orderHistoryDetailsRemoteDataSource =
        OrderHistoryDetailsRemoteDataSourceMock();

    orderHistoryDetailsRepository = ViewByOrderDetailsRepository(
      config: mockConfig,
      localDataSource: orderHistoryDetailsLocalDataSource,
      orderHistoryDetailsRemoteDataSource: orderHistoryDetailsRemoteDataSource,
    );
    customerCodeInfo =
        CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0030082707');
    salesOrganisation =
        SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001'));
  });

  group('OrderHistoryDetailsRepository should - ', () {
    test('get OrderHistoryDetails successfully locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => orderHistoryDetailsLocalDataSource.getOrderHistoryDetails(),
      ).thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          username: Username('mock_user'),
        ),
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistory Details fail locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => orderHistoryDetailsLocalDataSource.getOrderHistoryDetails(),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          username: Username('mock_user'),
        ),
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get OrderHistoryDetails successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderHistoryDetailsLocalDataSource.getOrderHistoryDetails())
          .thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('get OrderHistory fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderHistoryDetailsLocalDataSource.getOrderHistoryDetails())
          .thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
      );

      expect(
        result.isLeft(),
        true,
      );
    });
    test('get OrderHistoryDetails successfully remotely for salesrep',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
          searchKey: '0200268014',
          language: 'EN',
          salesOrg: '2001',
          soldTo: '0030082707',
        ),
      ).thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: OrderNumber('0200268014'),
        user: mockUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
          username: Username('user_test'),
        ),
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistoryDetails fail remotely for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
          searchKey: '',
          language: '',
          salesOrg: '',
          soldTo: '',
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          username: Username('mock_user'),
        ),
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get OrderHistoryDetails successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
          searchKey: '0200268014',
          language: 'EN',
          salesOrg: '2001',
          soldTo: '0030082707',
        ),
      ).thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: OrderNumber('0200268014'),
        user: mockUser,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistoryDetails fail remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
          searchKey: mockOrderHistoryItem.orderNumber.getOrDefaultValue(''),
          language: '',
          salesOrg: '',
          soldTo: '',
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderNumber: mockOrderHistoryItem.orderNumber,
        user: mockUser,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
