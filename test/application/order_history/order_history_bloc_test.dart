import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryRepoMock extends Mock implements OrderHistoryRepository {}

const _defaultPageSize = 10;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final orderHistoryRepository = OrderHistoryRepoMock();
  final mockUser = User.empty();
  final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();
  late final OrderHistory orderHistoryListMock;
  final fakeFromDate = DateTime.parse(DateFormat('yyyyMMdd')
      .format(DateTime.now().subtract(const Duration(days: 7))));
  final fakeToDate =
      DateTime.parse(DateFormat('yyyyMMdd').format(DateTime.now()));
  const fakeSort = 'desc';
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    orderHistoryListMock =
        await OrderHistoryLocalDataSource().getOrderHistory();
  });
  group(' Order History Bloc', () {
    blocTest('Initialize',
        build: () => OrderHistoryListBloc(
            orderHistoryRepository: orderHistoryRepository),
        act: (OrderHistoryListBloc bloc) =>
            bloc.add(const OrderHistoryListEvent.initialized()),
        expect: () => [OrderHistoryListState.initial()]);
  });
  blocTest(
    'Get  order History failure',
    build: () =>
        OrderHistoryListBloc(orderHistoryRepository: orderHistoryRepository),
    setUp: () {
      when(() => orderHistoryRepository.getOrderHistory(
            user: mockUser,
            salesOrgConfig: mockSalesOrganisationConfigs,
            soldTo: mockCustomerCodeInfo,
            shipTo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0,
            fromDate: fakeFromDate,
            toDate: fakeToDate,
            sort: fakeSort,
            orderBy: 'orderDate',
          )).thenAnswer(
        (invocation) async => const Left(
          ApiFailure.other('fake-error'),
        ),
      );
    },
    act: (OrderHistoryListBloc bloc) => bloc.add(OrderHistoryListEvent.fetch(
      user: mockUser,
      customerCodeInfo: mockCustomerCodeInfo,
      salesOrgConfigs: mockSalesOrganisationConfigs,
      shipToInfo: mockShipToInfo,
    )),
    expect: () => [
      OrderHistoryListState.initial().copyWith(
        isFetching: true,
        failureOrSuccessOption: none(),
      ),
      OrderHistoryListState.initial().copyWith(
        isFetching: false,
        failureOrSuccessOption:
            optionOf(const Left(ApiFailure.other('fake-error'))),
      ),
    ],
  );

  blocTest(
    'Get  order History success',
    build: () =>
        OrderHistoryListBloc(orderHistoryRepository: orderHistoryRepository),
    setUp: () {
      when(() => orderHistoryRepository.getOrderHistory(
            user: mockUser,
            salesOrgConfig: mockSalesOrganisationConfigs,
            soldTo: mockCustomerCodeInfo,
            shipTo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0,
            fromDate: fakeFromDate,
            toDate: fakeToDate,
            sort: fakeSort,
            orderBy: 'orderDate',
          )).thenAnswer(
        (invocation) async => Right(orderHistoryListMock),
      );
    },
    act: (OrderHistoryListBloc bloc) => bloc.add(OrderHistoryListEvent.fetch(
      user: mockUser,
      customerCodeInfo: mockCustomerCodeInfo,
      salesOrgConfigs: mockSalesOrganisationConfigs,
      shipToInfo: mockShipToInfo,
    )),
    expect: () => [
      OrderHistoryListState.initial().copyWith(
        isFetching: true,
        failureOrSuccessOption: none(),
      ),
      OrderHistoryListState.initial().copyWith(
          isFetching: false,
          orderHistoryList: orderHistoryListMock,
          failureOrSuccessOption: none(),
          canLoadMore:
              orderHistoryListMock.orderHistoryItems.length >= _defaultPageSize,
          nextPageIndex: 1)
    ],
  );

  blocTest(
    'Get  orderHistory success and load more success',
    build: () =>
        OrderHistoryListBloc(orderHistoryRepository: orderHistoryRepository),
    setUp: () {
      when(() => orderHistoryRepository.getOrderHistory(
            user: mockUser,
            salesOrgConfig: mockSalesOrganisationConfigs,
            soldTo: mockCustomerCodeInfo,
            shipTo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0,
            fromDate: fakeFromDate,
            toDate: fakeToDate,
            sort: fakeSort,
            orderBy: 'orderDate',
          )).thenAnswer(
        (invocation) async => Right(orderHistoryListMock),
      );
      when(() => orderHistoryRepository.getOrderHistory(
            user: mockUser,
            salesOrgConfig: mockSalesOrganisationConfigs,
            soldTo: mockCustomerCodeInfo,
            shipTo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: orderHistoryListMock.orderHistoryItems.length,
            fromDate: fakeFromDate,
            toDate: fakeToDate,
            sort: fakeSort,
            orderBy: 'orderDate',
          )).thenAnswer(
        (invocation) async => Right(orderHistoryListMock),
      );
    },
    act: (OrderHistoryListBloc bloc) => bloc
      ..add(OrderHistoryListEvent.fetch(
        user: mockUser,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrgConfigs: mockSalesOrganisationConfigs,
        shipToInfo: mockShipToInfo,
      ))
      ..add(OrderHistoryListEvent.loadMore(
        user: mockUser,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrgConfigs: mockSalesOrganisationConfigs,
        shipToInfo: mockShipToInfo,
      )),
    expect: () => [
      OrderHistoryListState.initial().copyWith(
        isFetching: true,
        failureOrSuccessOption: none(),
      ),
      OrderHistoryListState.initial().copyWith(
        isFetching: false,
        orderHistoryList: orderHistoryListMock,
        failureOrSuccessOption: none(),
        canLoadMore: true,
        nextPageIndex: 1,
      ),
      OrderHistoryListState.initial().copyWith(
        isFetching: true,
        orderHistoryList: orderHistoryListMock,
        failureOrSuccessOption: none(),
        canLoadMore: true,
        nextPageIndex: 1,
      ),
      OrderHistoryListState.initial().copyWith(
        isFetching: false,
        orderHistoryList: orderHistoryListMock.copyWith(orderHistoryItems: [
          ...orderHistoryListMock.orderHistoryItems,
          ...orderHistoryListMock.orderHistoryItems
        ]),
        failureOrSuccessOption: none(),
        canLoadMore: true,
        nextPageIndex: 2,
      ),
    ],
  );

  blocTest(
    'Get orderHistory success and load more fail',
    build: () =>
        OrderHistoryListBloc(orderHistoryRepository: orderHistoryRepository),
    setUp: () {
      when(() => orderHistoryRepository.getOrderHistory(
            user: mockUser,
            salesOrgConfig: mockSalesOrganisationConfigs,
            soldTo: mockCustomerCodeInfo,
            shipTo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0,
            fromDate: fakeFromDate,
            toDate: fakeToDate,
            sort: fakeSort,
            orderBy: 'orderDate',
          )).thenAnswer(
        (invocation) async => Right(orderHistoryListMock),
      );
      when(() => orderHistoryRepository.getOrderHistory(
            user: mockUser,
            salesOrgConfig: mockSalesOrganisationConfigs,
            soldTo: mockCustomerCodeInfo,
            shipTo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: orderHistoryListMock.orderHistoryItems.length,
            fromDate: fakeFromDate,
            toDate: fakeToDate,
            sort: fakeSort,
            orderBy: 'orderDate',
          )).thenAnswer(
        (invocation) async => const Left(
          ApiFailure.other('fake-error'),
        ),
      );
    },
    act: (OrderHistoryListBloc bloc) => bloc
      ..add(OrderHistoryListEvent.fetch(
        user: mockUser,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrgConfigs: mockSalesOrganisationConfigs,
        shipToInfo: mockShipToInfo,
      ))
      ..add(OrderHistoryListEvent.loadMore(
        user: mockUser,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrgConfigs: mockSalesOrganisationConfigs,
        shipToInfo: mockShipToInfo,
      )),
    expect: () => [
      OrderHistoryListState.initial().copyWith(
        isFetching: true,
        failureOrSuccessOption: none(),
      ),
      OrderHistoryListState.initial().copyWith(
        isFetching: false,
        orderHistoryList: orderHistoryListMock,
        failureOrSuccessOption: none(),
        canLoadMore: true,
        nextPageIndex: 1,
      ),
      OrderHistoryListState.initial().copyWith(
        isFetching: true,
        orderHistoryList: orderHistoryListMock,
        failureOrSuccessOption: none(),
        canLoadMore: true,
        nextPageIndex: 1,
      ),
      OrderHistoryListState.initial().copyWith(
        isFetching: false,
        orderHistoryList: orderHistoryListMock,
        failureOrSuccessOption:
            optionOf(const Left(ApiFailure.other('fake-error'))),
        canLoadMore: true,
        nextPageIndex: 1,
      ),
    ],
  );
}
