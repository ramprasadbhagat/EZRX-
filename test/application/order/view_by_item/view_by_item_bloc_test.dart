import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_history_filter.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/repository/product_images_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ViewByItemRepositoryMock extends Mock implements ViewByItemRepository {}

class ProductImagesRepositoryMock extends Mock
    implements ProductImagesRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ViewByItemRepository viewByItemRepository;
  late ProductImagesRepository productImagesRepository;
  late OrderHistory orderHistoryMockData;

  final salesOrgConfig = SalesOrganisationConfigs.empty()
      .copyWith(salesOrg: SalesOrg('fake-salesOrg'));
  final customerCodeInfo = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: 'fake-customerCode');
  final shipToInfo = ShipToInfo.empty().copyWith(
    shipToCustomerCode: 'fake-shipto',
  );
  final user = User.empty().copyWith(
      username: Username('fake-name'),
      role: Role(
          description: 'fake-desc',
          id: 'id',
          name: 'fake-name',
          type: RoleType('fake-type')),
      preferredLanguage: 'EN');
  final searchKey = SearchKey('search-key');
  final dateTimeRange = DateTimeRange(
      end: DateTime.parse('2023-07-14 18:34:09.177884'),
      start: DateTime.parse('2023-07-07 18:34:09.181722'));
  final viewByItemHistoryFilter =
      ViewByItemHistoryFilter.empty().copyWith(dateRange: dateTimeRange);

  const offSet = 0;
  const pageSize = 24;
  group('Orders View By Item', () {
    setUp(() async {
      viewByItemRepository = ViewByItemRepositoryMock();
      productImagesRepository = ProductImagesRepositoryMock();
      orderHistoryMockData =
          await OrderHistoryLocalDataSource().getOrderHistory();
      WidgetsFlutterBinding.ensureInitialized();
    });

    blocTest<ViewByItemsBloc, ViewByItemsState>(
      'Orders view by item fetch fail',
      build: () => ViewByItemsBloc(
        viewByItemRepository: viewByItemRepository,
        productImagesRepository: productImagesRepository,
      ),
      setUp: () {
        when(() => viewByItemRepository.getOrderHistory(
              offset: offSet,
              pageSize: pageSize,
              salesOrgConfig: salesOrgConfig,
              searchKey: searchKey,
              shipTo: shipToInfo,
              soldTo: customerCodeInfo,
              user: user,
              viewByItemHistoryFilter: viewByItemHistoryFilter,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(ViewByItemsEvent.fetch(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          viewByItemHistoryFilter: viewByItemHistoryFilter,
          searchKey: searchKey)),
      expect: () => [
        ViewByItemsState.initial().copyWith(
          isFetching: true,
          orderHistoryList: OrderHistory.empty(),
          nextPageIndex: 0,
          failureOrSuccessOption: none(),
          appliedFilter: viewByItemHistoryFilter,
          searchKey: searchKey,
        ),
        ViewByItemsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            appliedFilter: viewByItemHistoryFilter,
            isFetching: false,
            searchKey: searchKey)
      ],
    );

    blocTest<ViewByItemsBloc, ViewByItemsState>(
      'Orders view by item fetch Success',
      build: () => ViewByItemsBloc(
        viewByItemRepository: viewByItemRepository,
        productImagesRepository: productImagesRepository,
      ),
      setUp: () {
        when(() => viewByItemRepository.getOrderHistory(
              offset: offSet,
              pageSize: pageSize,
              salesOrgConfig: salesOrgConfig,
              searchKey: searchKey,
              shipTo: shipToInfo,
              soldTo: customerCodeInfo,
              user: user,
              viewByItemHistoryFilter: viewByItemHistoryFilter,
            )).thenAnswer(
          (invocation) async => Right(
            orderHistoryMockData,
          ),
        );
      },
      act: (bloc) => bloc.add(ViewByItemsEvent.fetch(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          viewByItemHistoryFilter: viewByItemHistoryFilter,
          searchKey: searchKey)),
      expect: () => [
        ViewByItemsState.initial().copyWith(
          isFetching: true,
          orderHistoryList: OrderHistory.empty(),
          nextPageIndex: 0,
          canLoadMore: true,
          failureOrSuccessOption: none(),
          appliedFilter: viewByItemHistoryFilter,
          searchKey: searchKey,
        ),
        ViewByItemsState.initial().copyWith(
            failureOrSuccessOption: optionOf(Right(
              orderHistoryMockData,
            )),
            appliedFilter: viewByItemHistoryFilter,
            isFetching: false,
            nextPageIndex: 1,
            canLoadMore: false,
            orderHistoryList: orderHistoryMockData,
            searchKey: searchKey),
      ],
    );

    blocTest<ViewByItemsBloc, ViewByItemsState>(
      'Orders view by item loadMore',
      build: () => ViewByItemsBloc(
        viewByItemRepository: viewByItemRepository,
        productImagesRepository: productImagesRepository,
      ),
      seed: () => ViewByItemsState.initial().copyWith(
        appliedFilter: viewByItemHistoryFilter,
        orderHistoryList: orderHistoryMockData,
        searchKey: searchKey,
      ),
      setUp: () {
        when(() => viewByItemRepository.getOrderHistory(
              offset: orderHistoryMockData.orderHistoryItems.length,
              pageSize: pageSize,
              salesOrgConfig: salesOrgConfig,
              searchKey: searchKey,
              shipTo: shipToInfo,
              soldTo: customerCodeInfo,
              user: user,
              viewByItemHistoryFilter: viewByItemHistoryFilter,
            )).thenAnswer(
          (invocation) async => Right(
            orderHistoryMockData,
          ),
        );
        when(() => productImagesRepository.getProductImages(list: [
              ...orderHistoryMockData.orderHistoryItems,
              ...orderHistoryMockData.orderHistoryItems
            ])).thenAnswer(
          (invocation) async => Right(
            [
              ...orderHistoryMockData.orderHistoryItems,
              ...orderHistoryMockData.orderHistoryItems
            ],
          ),
        );
      },
      act: (bloc) => bloc.add(ViewByItemsEvent.loadMore(
        salesOrgConfigs: salesOrgConfig,
        customerCodeInfo: customerCodeInfo,
        shipToInfo: shipToInfo,
        user: user,
      )),
      expect: () => [
        ViewByItemsState.initial().copyWith(
          isFetching: true,
          nextPageIndex: 0,
          canLoadMore: true,
          orderHistoryList: orderHistoryMockData,
          failureOrSuccessOption: none(),
          appliedFilter: viewByItemHistoryFilter,
          searchKey: searchKey,
        ),
        ViewByItemsState.initial().copyWith(
            failureOrSuccessOption: optionOf(Right(
              orderHistoryMockData,
            )),
            appliedFilter: viewByItemHistoryFilter,
            isFetching: false,
            nextPageIndex: 1,
            canLoadMore: false,
            orderHistoryList: orderHistoryMockData.copyWith(orderHistoryItems: [
              ...orderHistoryMockData.orderHistoryItems,
              ...orderHistoryMockData.orderHistoryItems
            ]),
            searchKey: searchKey),
      ],
    );

    blocTest<ViewByItemsBloc, ViewByItemsState>(
      'Orders view by item loadMore failure',
      build: () => ViewByItemsBloc(
        viewByItemRepository: viewByItemRepository,
        productImagesRepository: productImagesRepository,
      ),
      seed: () => ViewByItemsState.initial().copyWith(
        appliedFilter: viewByItemHistoryFilter,
        orderHistoryList: orderHistoryMockData,
        searchKey: searchKey,
      ),
      setUp: () {
        when(() => viewByItemRepository.getOrderHistory(
              offset: orderHistoryMockData.orderHistoryItems.length,
              pageSize: pageSize,
              salesOrgConfig: salesOrgConfig,
              searchKey: searchKey,
              shipTo: shipToInfo,
              soldTo: customerCodeInfo,
              user: user,
              viewByItemHistoryFilter: viewByItemHistoryFilter,
            )).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (bloc) => bloc.add(ViewByItemsEvent.loadMore(
        salesOrgConfigs: salesOrgConfig,
        customerCodeInfo: customerCodeInfo,
        shipToInfo: shipToInfo,
        user: user,
      )),
      expect: () => [
        ViewByItemsState.initial().copyWith(
          isFetching: true,
          nextPageIndex: 0,
          canLoadMore: true,
          orderHistoryList: orderHistoryMockData,
          failureOrSuccessOption: none(),
          appliedFilter: viewByItemHistoryFilter,
          searchKey: searchKey,
        ),
        ViewByItemsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            orderHistoryList: orderHistoryMockData,
            appliedFilter: viewByItemHistoryFilter,
            isFetching: false,
            searchKey: searchKey)
      ],
    );
  });
}
