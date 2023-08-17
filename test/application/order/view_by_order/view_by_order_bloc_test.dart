import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_history_filter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ViewByOrderRepositoryMock extends Mock implements ViewByOrderRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ViewByOrderRepository viewByOrderRepository;
  late ViewByOrder viewByOrderMockData;

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
        type: RoleType('fake-type'),
      ),
    preferredLanguage: LanguageValue('EN'),
    mobileNumber: MobileNumber(''),
  );
  final searchKey = SearchKey('fake-key');
  final fakeFromDate = DateTime.parse('2023-07-12 15:56:56.01');
  final fakeToDate = DateTime.parse('2023-07-19 15:56:56.02');
  final dateTimeRange = DateTimeRange(
    start: fakeFromDate,
    end: fakeToDate,
  );
  final viewByOrderHistoryFilter =
      ViewByOrderHistoryFilter.empty().copyWith(dateRange: dateTimeRange);

  const offSet = 0;
  const pageSize = 24;
  group('Orders View By Order', () {
    setUp(() async {
      viewByOrderRepository = ViewByOrderRepositoryMock();
      viewByOrderMockData =
          await ViewByOrderLocalDataSource().getViewByOrderHistory();
      WidgetsFlutterBinding.ensureInitialized();
    });

    blocTest<ViewByOrderBloc, ViewByOrderState>(
      ' -> Initialized Event',
      build: () => ViewByOrderBloc(
        viewByOrderRepository: viewByOrderRepository,
      ),
      act: (bloc) => bloc.add(const ViewByOrderEvent.initialized()),
    );

    blocTest<ViewByOrderBloc, ViewByOrderState>(
      ' -> Orders view by order fetch fail',
      build: () => ViewByOrderBloc(
        viewByOrderRepository: viewByOrderRepository,
      ),
      setUp: () {
        when(
          () => viewByOrderRepository.getViewByOrderHistory(
            orderBy: 'datetime',
            salesOrgConfig: salesOrgConfig,
            soldTo: customerCodeInfo,
            shipTo: shipToInfo,
            user: user,
            pageSize: pageSize,
            offset: offSet,
            sort: 'desc',
            searchKey: searchKey,
            creatingOrderIds: <String>[],
            viewByOrder: ViewByOrder.empty(),
            viewByOrderHistoryFilter: viewByOrderHistoryFilter,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        ViewByOrderEvent.fetch(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
          filter: viewByOrderHistoryFilter,
          searchKey: SearchKey.searchFilter('fake-key'),
        ),
      ),
      expect: () => [
        ViewByOrderState.initial().copyWith(
          isFetching: true,
          searchKey: searchKey,
          appliedFilter: viewByOrderHistoryFilter,
        ),
        ViewByOrderState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          appliedFilter: viewByOrderHistoryFilter,
          isFetching: false,
          searchKey: searchKey,
        )
      ],
    );

    blocTest<ViewByOrderBloc, ViewByOrderState>(
      ' -> Orders view by order fetch Success',
      build: () => ViewByOrderBloc(
        viewByOrderRepository: viewByOrderRepository,
      ),
      setUp: () {
        when(
          () => viewByOrderRepository.getViewByOrderHistory(
            orderBy: 'datetime',
            salesOrgConfig: salesOrgConfig,
            soldTo: customerCodeInfo,
            shipTo: shipToInfo,
            user: user,
            pageSize: pageSize,
            offset: offSet,
            sort: 'desc',
            searchKey: searchKey,
            creatingOrderIds: <String>[],
            viewByOrder: ViewByOrder.empty(),
            viewByOrderHistoryFilter: viewByOrderHistoryFilter,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            viewByOrderMockData,
          ),
        );
      },
      act: (bloc) => bloc.add(
        ViewByOrderEvent.fetch(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
          filter: viewByOrderHistoryFilter,
          searchKey: SearchKey.searchFilter('fake-key'),
        ),
      ),
      expect: () => [
        ViewByOrderState.initial().copyWith(
          isFetching: true,
          appliedFilter: viewByOrderHistoryFilter,
          searchKey: searchKey,
        ),
        ViewByOrderState.initial().copyWith(
          appliedFilter: viewByOrderHistoryFilter,
          isFetching: false,
          nextPageIndex: 0,
          viewByOrderList: viewByOrderMockData,
          searchKey: searchKey,
        ),
      ],
    );

    blocTest<ViewByOrderBloc, ViewByOrderState>(
      ' -> Orders view by order loadMore',
      build: () => ViewByOrderBloc(
        viewByOrderRepository: viewByOrderRepository,
      ),
      seed: () => ViewByOrderState.initial().copyWith(
        appliedFilter: viewByOrderHistoryFilter,
        viewByOrderList: viewByOrderMockData,
        searchKey: searchKey,
      ),
      setUp: () {
        when(
          () => viewByOrderRepository.getViewByOrderHistory(
            orderBy: 'datetime',
            salesOrgConfig: salesOrgConfig,
            soldTo: customerCodeInfo,
            shipTo: shipToInfo,
            user: user,
            pageSize: pageSize,
            offset: offSet,
            sort: 'desc',
            searchKey: searchKey,
            creatingOrderIds: <String>[],
            viewByOrder: ViewByOrder.empty(),
            viewByOrderHistoryFilter: viewByOrderHistoryFilter,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            viewByOrderMockData,
          ),
        );
      },
      act: (bloc) => bloc.add(
        ViewByOrderEvent.loadMore(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
        ),
      ),
      expect: () => [
        ViewByOrderState.initial().copyWith(
          isFetching: true,
          nextPageIndex: 0,
          canLoadMore: true,
          viewByOrderList: viewByOrderMockData,
          appliedFilter: viewByOrderHistoryFilter,
          searchKey: searchKey,
        ),
        ViewByOrderState.initial().copyWith(
          appliedFilter: viewByOrderHistoryFilter,
          nextPageIndex: 1,
          canLoadMore: false,
          viewByOrderList: viewByOrderMockData.copyWith(
            orderHeaders: [
              ...viewByOrderMockData.orderHeaders,
              ...viewByOrderMockData.orderHeaders
            ],
          ),
          searchKey: searchKey,
        ),
      ],
    );

    blocTest<ViewByOrderBloc, ViewByOrderState>(
      ' -> Orders view by order loadMore failure',
      build: () => ViewByOrderBloc(
        viewByOrderRepository: viewByOrderRepository,
      ),
      seed: () => ViewByOrderState.initial().copyWith(
        appliedFilter: viewByOrderHistoryFilter,
        viewByOrderList: viewByOrderMockData,
        searchKey: searchKey,
      ),
      setUp: () {
        when(
          () => viewByOrderRepository.getViewByOrderHistory(
            orderBy: 'datetime',
            salesOrgConfig: salesOrgConfig,
            soldTo: customerCodeInfo,
            shipTo: shipToInfo,
            user: user,
            pageSize: pageSize,
            offset: offSet,
            sort: 'desc',
            searchKey: searchKey,
            creatingOrderIds: <String>[],
            viewByOrder: ViewByOrder.empty(),
            viewByOrderHistoryFilter: viewByOrderHistoryFilter,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (bloc) => bloc.add(
        ViewByOrderEvent.loadMore(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
        ),
      ),
      expect: () => [
        ViewByOrderState.initial().copyWith(
          isFetching: true,
          nextPageIndex: 0,
          viewByOrderList: viewByOrderMockData,
          appliedFilter: viewByOrderHistoryFilter,
          searchKey: searchKey,
        ),
        ViewByOrderState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          viewByOrderList: viewByOrderMockData,
          appliedFilter: viewByOrderHistoryFilter,
          searchKey: searchKey,
        )
      ],
    );
  });
}
