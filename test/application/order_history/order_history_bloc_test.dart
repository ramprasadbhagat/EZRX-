import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/repository/product_images_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryRepoMock extends Mock implements ViewByItemRepository {}
class ProductImagesRepositoryMock extends Mock implements ProductImagesRepository {}

// const _defaultPageSize = 20;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final orderHistoryRepository = OrderHistoryRepoMock();
  final productImagesRepository = ProductImagesRepositoryMock();
  // final mockUser = User.empty();
  // final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  // final mockCustomerCodeInfo = CustomerCodeInfo.empty()
  //     .copyWith(customerCodeSoldTo: 'fake-customer-code');
  // final mockShipToInfo = ShipToInfo.empty().copyWith(
  //     building: 'fakeBuilding',
  //     shipToCustomerCode: 'fake-ship-to-customer-code');
  // final mockOrderHistoryFilter = OrderHistoryFilter.empty();
  // late final OrderHistory orderHistoryListMock;
  // const fakeSort = 'desc';
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // orderHistoryListMock =
    //     await OrderHistoryLocalDataSource().getOrderHistory();
  });
  group(' Order History Bloc', () {
    blocTest('Initialize',
        build: () =>
            ViewByItemsBloc(viewByItemRepository: orderHistoryRepository, productImagesRepository: productImagesRepository,),
        act: (ViewByItemsBloc bloc) =>
            bloc.add(const ViewByItemsEvent.initialized()),
        expect: () => [ViewByItemsState.initial()]);
  });
  //TODO : will enhance
  /*
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
            sort: fakeSort,
            orderHistoryFilter: mockOrderHistoryFilter, orderStatus: '',
          )).thenAnswer(
        (invocation) async => const Left(
          ApiFailure.other('fake-error'),
        ),
      );
    },
    act: (OrderHistoryListBloc bloc) => bloc.add(
      OrderHistoryListEvent.fetch(
        user: mockUser,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrgConfigs: mockSalesOrganisationConfigs,
        shipToInfo: mockShipToInfo,
        orderHistoryFilter: mockOrderHistoryFilter,
        sortDirection: 'desc',
      ),
    ),
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
            sort: fakeSort,
            orderHistoryFilter: mockOrderHistoryFilter, orderStatus: '',
          )).thenAnswer(
        (invocation) async => Right(orderHistoryListMock),
      );
    },
    act: (OrderHistoryListBloc bloc) => bloc.add(OrderHistoryListEvent.fetch(
      user: mockUser,
      customerCodeInfo: mockCustomerCodeInfo,
      salesOrgConfigs: mockSalesOrganisationConfigs,
      shipToInfo: mockShipToInfo,
      orderHistoryFilter: mockOrderHistoryFilter,
      sortDirection: 'desc',
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
            sort: fakeSort,
            orderBy: 'orderDate',
            orderHistoryFilter: mockOrderHistoryFilter,
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
            sort: fakeSort,
            orderBy: 'orderDate',
            orderHistoryFilter: mockOrderHistoryFilter,
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
        orderHistoryFilter: mockOrderHistoryFilter,
        sortDirection: 'desc',
      ))
      ..add(OrderHistoryListEvent.loadMore(
        user: mockUser,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrgConfigs: mockSalesOrganisationConfigs,
        shipToInfo: mockShipToInfo,
        orderHistoryFilter: mockOrderHistoryFilter,
        sortDirection: 'desc',
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
  );*/

  /*blocTest(
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
            sort: fakeSort,
            orderBy: 'orderDate',
            orderHistoryFilter: mockOrderHistoryFilter,
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
            sort: fakeSort,
            orderBy: 'orderDate',
            orderHistoryFilter: mockOrderHistoryFilter,
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
        orderHistoryFilter: mockOrderHistoryFilter,
        sortDirection: 'desc',
      ))
      ..add(OrderHistoryListEvent.loadMore(
        user: mockUser,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrgConfigs: mockSalesOrganisationConfigs,
        shipToInfo: mockShipToInfo,
        orderHistoryFilter: mockOrderHistoryFilter,
        sortDirection: 'desc',
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
  );*/
}
