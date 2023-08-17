import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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

  final orderHistoryDetailsMockList = OrderHistoryDetails.empty();

  final mockUser =
      User.empty().copyWith(preferredLanguage: LanguageValue('EN'));

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
  });

  group('OrderHistoryDetailsRepository should - ', () {
    test('get OrderHistoryDetails successfully locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => orderHistoryDetailsLocalDataSource
            .getOrderHistoryDetailsForSalesRep(),
      ).thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderHeader: mockOrderHistoryItem,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          username: Username('mock_user'),
        ),
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistory Details fail locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => orderHistoryDetailsLocalDataSource
            .getOrderHistoryDetailsForSalesRep(),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderHeader: mockOrderHistoryItem,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          username: Username('mock_user'),
        ),
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
        orderHeader: mockOrderHistoryItem,
        user: mockUser,
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
        orderHeader: mockOrderHistoryItem,
        user: mockUser,
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
        () => orderHistoryDetailsRemoteDataSource
            .getOrderHistoryDetailsForSalesRep(
          companyName: '',
          orderId: '02001949952333',
          language: '',
          userName: 'user_test',
        ),
      ).thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderHeader: mockOrderHistoryItem.copyWith(
          orderNumber: OrderNumber('02001949952333'),
        ),
        user: mockUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
          username: Username('user_test'),
        ),
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderHistoryDetails fail remotely for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderHistoryDetailsRemoteDataSource
            .getOrderHistoryDetailsForSalesRep(
          userName: '',
          orderId: '',
          language: '',
          companyName: '',
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderHeader: mockOrderHistoryItem,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          username: Username('mock_user'),
        ),
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
            orderId: '200012', language: 'EN',),
      ).thenAnswer((invocation) async => orderHistoryDetailsMockList);

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderHeader:
            mockOrderHistoryItem.copyWith(orderNumber: OrderNumber('200012')),
        user: mockUser,
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
          orderId: mockOrderHistoryItem.orderNumber.getOrDefaultValue(''),
          language: '',
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsRepository.getViewByOrderDetails(
        orderHeader: mockOrderHistoryItem,
        user: mockUser,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
