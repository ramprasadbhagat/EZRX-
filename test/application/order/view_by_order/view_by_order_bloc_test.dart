import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ViewByOrderRepositoryMock extends Mock implements ViewByOrderRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ViewByOrderRepository viewByOrderRepository;
  late ViewByOrder viewByOrderMockData;
  late Config config;

  const fakeSort = 'desc';
  const fakeOrderBy = 'datetime';
  final searchKey = SearchKey('');
  final viewByOrdersFilter = ViewByOrdersFilter.empty();
  const offSet = 0;
  group(
    'Orders View By Order',
    () {
      setUp(() async {
        viewByOrderRepository = ViewByOrderRepositoryMock();
        viewByOrderMockData =
            await ViewByOrderLocalDataSource().getViewByOrders();
        config = Config()..appFlavor = Flavor.mock;
        WidgetsFlutterBinding.ensureInitialized();
      });

      blocTest<ViewByOrderBloc, ViewByOrderState>(
        ' -> Orders view by order initialize success happy case',
        build: () => ViewByOrderBloc(
          viewByOrderRepository: viewByOrderRepository,
          config: config,
        ),
        setUp: () {
          when(
            () => viewByOrderRepository.getViewByOrders(
              salesOrganisation: fakeSalesOrganisation,
              salesOrgConfig: fakeEmptySalesConfigs,
              soldTo: fakeCustomerCodeInfo,
              user: fakeClient,
              pageSize: config.pageSize,
              offset: offSet,
              viewByOrdersFilter: viewByOrdersFilter,
              orderBy: fakeOrderBy,
              sort: fakeSort,
              searchKey: searchKey,
              viewByOrder: ViewByOrder.empty(),
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              viewByOrderMockData,
            ),
          );
        },
        act: (bloc) => bloc.add(
          ViewByOrderEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeEmptySalesConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClient,
            sortDirection: fakeSort,
            shipToInfo: fakeShipToInfo,
          ),
        ),
        expect: () => [
          ViewByOrderState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeEmptySalesConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClient,
            sortDirection: fakeSort,
            shipToInfo: fakeShipToInfo,
          ),
          ViewByOrderState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeEmptySalesConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClient,
            sortDirection: fakeSort,
            isFetching: true,
            appliedFilter: viewByOrdersFilter,
            searchKey: searchKey,
            shipToInfo: fakeShipToInfo,
          ),
          ViewByOrderState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeEmptySalesConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClient,
            sortDirection: fakeSort,
            appliedFilter: viewByOrdersFilter,
            searchKey: searchKey,
            viewByOrderList: viewByOrderMockData,
            shipToInfo: fakeShipToInfo,
            failureOrSuccessOption: optionOf(
              Right(
                viewByOrderMockData,
              ),
            ),
          ),
        ],
      );

      blocTest<ViewByOrderBloc, ViewByOrderState>(
        ' -> Orders view by order fetch fail',
        build: () => ViewByOrderBloc(
          viewByOrderRepository: viewByOrderRepository,
          config: config,
        ),
        seed: () => ViewByOrderState.initial().copyWith(
          salesOrgConfigs: fakeEmptySalesConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClient,
          sortDirection: fakeSort,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        ),
        setUp: () {
          when(
            () => viewByOrderRepository.getViewByOrders(
              orderBy: fakeOrderBy,
              salesOrgConfig: fakeEmptySalesConfigs,
              soldTo: fakeCustomerCodeInfo,
              user: fakeClient,
              pageSize: config.pageSize,
              offset: offSet,
              sort: fakeSort,
              searchKey: searchKey,
              viewByOrder: ViewByOrder.empty(),
              viewByOrdersFilter: viewByOrdersFilter,
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (bloc) => bloc.add(
          ViewByOrderEvent.fetch(
            filter: viewByOrdersFilter,
            searchKey: searchKey,
          ),
        ),
        expect: () => [
          ViewByOrderState.initial().copyWith(
            salesOrgConfigs: fakeEmptySalesConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClient,
            sortDirection: fakeSort,
            isFetching: true,
            searchKey: searchKey,
            appliedFilter: viewByOrdersFilter,
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: fakeShipToInfo,
          ),
          ViewByOrderState.initial().copyWith(
            salesOrgConfigs: fakeEmptySalesConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClient,
            sortDirection: fakeSort,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            appliedFilter: viewByOrdersFilter,
            isFetching: false,
            searchKey: searchKey,
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: fakeShipToInfo,
          )
        ],
      );

      blocTest<ViewByOrderBloc, ViewByOrderState>(
        ' -> Orders view by order loadMore',
        build: () => ViewByOrderBloc(
          viewByOrderRepository: viewByOrderRepository,
          config: config,
        ),
        seed: () => ViewByOrderState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfigs: fakeEmptySalesConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClient,
          sortDirection: fakeSort,
          appliedFilter: viewByOrdersFilter,
          searchKey: searchKey,
          viewByOrderList: viewByOrderMockData,
          shipToInfo: fakeShipToInfo,
        ),
        setUp: () {
          when(
            () => viewByOrderRepository.getViewByOrders(
              salesOrgConfig: fakeEmptySalesConfigs,
              soldTo: fakeCustomerCodeInfo,
              user: fakeClient,
              pageSize: config.pageSize,
              offset: viewByOrderMockData.orderHeaders.length,
              viewByOrdersFilter: viewByOrdersFilter,
              orderBy: fakeOrderBy,
              sort: fakeSort,
              searchKey: searchKey,
              viewByOrder: viewByOrderMockData,
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              viewByOrderMockData,
            ),
          );
        },
        act: (bloc) => bloc.add(
          const ViewByOrderEvent.loadMore(),
        ),
        expect: () => [
          ViewByOrderState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeEmptySalesConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClient,
            sortDirection: fakeSort,
            appliedFilter: viewByOrdersFilter,
            searchKey: searchKey,
            viewByOrderList: viewByOrderMockData,
            isFetching: true,
            shipToInfo: fakeShipToInfo,
          ),
          ViewByOrderState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeEmptySalesConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            user: fakeClient,
            sortDirection: fakeSort,
            appliedFilter: viewByOrdersFilter,
            searchKey: searchKey,
            viewByOrderList: viewByOrderMockData.copyWith(
              orderHeaders: [
                ...viewByOrderMockData.orderHeaders,
              ],
            ),
            canLoadMore: false,
            nextPageIndex: 1,
          ),
        ],
      );
      blocTest<ViewByOrderBloc, ViewByOrderState>(
        ' -> Orders view by order loadMore failure',
        build: () => ViewByOrderBloc(
          viewByOrderRepository: viewByOrderRepository,
          config: config,
        ),
        seed: () => ViewByOrderState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfigs: fakeEmptySalesConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClient,
          sortDirection: fakeSort,
          appliedFilter: viewByOrdersFilter,
          searchKey: searchKey,
          viewByOrderList: viewByOrderMockData,
          shipToInfo: fakeShipToInfo,
        ),
        setUp: () {
          when(
            () => viewByOrderRepository.getViewByOrders(
              salesOrgConfig: fakeEmptySalesConfigs,
              soldTo: fakeCustomerCodeInfo,
              user: fakeClient,
              pageSize: config.pageSize,
              offset: viewByOrderMockData.orderHeaders.length,
              viewByOrdersFilter: viewByOrdersFilter,
              orderBy: fakeOrderBy,
              sort: fakeSort,
              searchKey: searchKey,
              viewByOrder: viewByOrderMockData,
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: fakeShipToInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')),
          );
        },
        act: (bloc) => bloc.add(
          const ViewByOrderEvent.loadMore(),
        ),
        expect: () => [
          ViewByOrderState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeEmptySalesConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            user: fakeClient,
            sortDirection: fakeSort,
            appliedFilter: viewByOrdersFilter,
            searchKey: searchKey,
            viewByOrderList: viewByOrderMockData,
            isFetching: true,
          ),
          ViewByOrderState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeEmptySalesConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            user: fakeClient,
            sortDirection: fakeSort,
            appliedFilter: viewByOrdersFilter,
            searchKey: searchKey,
            viewByOrderList: viewByOrderMockData,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );
    },
  );
}
