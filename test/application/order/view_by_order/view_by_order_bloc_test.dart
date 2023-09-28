import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class ViewByOrderRepositoryMock extends Mock implements ViewByOrderRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ViewByOrderRepository viewByOrderRepository;
  late ViewByOrder viewByOrderMockData;
  late Config config;
  final mockSalesOrg =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2100'));
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
    preferredLanguage: const Locale(ApiLanguageCode.english),
    mobileNumber: MobileNumber(''),
  );
  final searchKey = SearchKey('fake-key');
  final fakeFromDate = DateTime.parse('2023-07-12 15:56:56.01');
  final fakeToDate = DateTime.parse('2023-07-19 15:56:56.02');
  final viewByOrdersFilter = ViewByOrdersFilter.empty().copyWith(
    orderDateFrom: DateTimeStringValue(
      getDateStringByDateTime(fakeFromDate),
    ),
    orderDateTo: DateTimeStringValue(
      getDateStringByDateTime(fakeToDate),
    ),
  );

  const offSet = 0;
  group('Orders View By Order', () {
    setUp(() async {
      viewByOrderRepository = ViewByOrderRepositoryMock();
      viewByOrderMockData =
          await ViewByOrderLocalDataSource().getViewByOrders();
      config = Config()..appFlavor = Flavor.mock;
      WidgetsFlutterBinding.ensureInitialized();
    });

    blocTest<ViewByOrderBloc, ViewByOrderState>(
      ' -> Orders view by order fetch fail',
      build: () => ViewByOrderBloc(
        viewByOrderRepository: viewByOrderRepository,
        config: config,
      ),
      seed: () => ViewByOrderState.initial().copyWith(
        salesOrgConfigs: salesOrgConfig,
        customerCodeInfo: customerCodeInfo,
        shipToInfo: shipToInfo,
        user: user,
        sortDirection: 'desc',
        salesOrganisation: mockSalesOrg,
      ),
      setUp: () {
        when(
          () => viewByOrderRepository.getViewByOrders(
            orderBy: 'datetime',
            salesOrgConfig: salesOrgConfig,
            soldTo: customerCodeInfo,
            shipTo: shipToInfo,
            user: user,
            pageSize: config.pageSize,
            offset: offSet,
            sort: 'desc',
            searchKey: searchKey,
            viewByOrder: ViewByOrder.empty(),
            viewByOrdersFilter: viewByOrdersFilter,
            salesOrganisation: mockSalesOrg,
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
          searchKey: SearchKey.searchFilter('fake-key'),
        ),
      ),
      expect: () => [
        ViewByOrderState.initial().copyWith(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
          isFetching: true,
          searchKey: searchKey,
          appliedFilter: viewByOrdersFilter,
          salesOrganisation: mockSalesOrg,
        ),
        ViewByOrderState.initial().copyWith(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          appliedFilter: viewByOrdersFilter,
          isFetching: false,
          searchKey: searchKey,
          salesOrganisation: mockSalesOrg,
        )
      ],
    );

    blocTest<ViewByOrderBloc, ViewByOrderState>(
      ' -> Orders view by order fetch Success',
      build: () => ViewByOrderBloc(
        viewByOrderRepository: viewByOrderRepository,
        config: config,
      ),
      seed: () => ViewByOrderState.initial().copyWith(
        salesOrgConfigs: salesOrgConfig,
        customerCodeInfo: customerCodeInfo,
        shipToInfo: shipToInfo,
        user: user,
        sortDirection: 'desc',
        salesOrganisation: mockSalesOrg,
      ),
      setUp: () {
        when(
          () => viewByOrderRepository.getViewByOrders(
            orderBy: 'datetime',
            salesOrgConfig: salesOrgConfig,
            soldTo: customerCodeInfo,
            shipTo: shipToInfo,
            user: user,
            pageSize: config.pageSize,
            offset: offSet,
            sort: 'desc',
            searchKey: searchKey,
            viewByOrder: ViewByOrder.empty(),
            viewByOrdersFilter: viewByOrdersFilter,
            salesOrganisation: mockSalesOrg,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            viewByOrderMockData,
          ),
        );
      },
      act: (bloc) => bloc.add(
        ViewByOrderEvent.fetch(
          filter: viewByOrdersFilter,
          searchKey: SearchKey.searchFilter('fake-key'),
        ),
      ),
      expect: () => [
        ViewByOrderState.initial().copyWith(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
          isFetching: true,
          appliedFilter: viewByOrdersFilter,
          searchKey: searchKey,
          salesOrganisation: mockSalesOrg,
        ),
        ViewByOrderState.initial().copyWith(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
          appliedFilter: viewByOrdersFilter,
          isFetching: false,
          nextPageIndex: 0,
          viewByOrderList: viewByOrderMockData,
          searchKey: searchKey,
          salesOrganisation: mockSalesOrg,
        ),
      ],
    );
    blocTest<ViewByOrderBloc, ViewByOrderState>(
      ' -> Orders view by order loadMore',
      build: () => ViewByOrderBloc(
        viewByOrderRepository: viewByOrderRepository,
        config: config,
      ),
      seed: () => ViewByOrderState.initial().copyWith(
        appliedFilter: viewByOrdersFilter,
        viewByOrderList: viewByOrderMockData,
        searchKey: searchKey,
        salesOrgConfigs: salesOrgConfig,
        customerCodeInfo: customerCodeInfo,
        shipToInfo: shipToInfo,
        user: user,
        sortDirection: 'desc',
        salesOrganisation: mockSalesOrg,
      ),
      setUp: () {
        when(
          () => viewByOrderRepository.getViewByOrders(
            salesOrgConfig: salesOrgConfig,
            soldTo: customerCodeInfo,
            shipTo: shipToInfo,
            user: user,
            pageSize: config.pageSize,
            offset: viewByOrderMockData.orderHeaders.length,
            viewByOrdersFilter: viewByOrdersFilter,
            orderBy: 'datetime',
            sort: 'desc',
            searchKey: searchKey,
            viewByOrder: viewByOrderMockData,
            salesOrganisation: mockSalesOrg,
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
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
          isFetching: true,
          nextPageIndex: 0,
          canLoadMore: true,
          viewByOrderList: viewByOrderMockData,
          appliedFilter: viewByOrdersFilter,
          searchKey: searchKey,
          salesOrganisation: mockSalesOrg,
        ),
        ViewByOrderState.initial().copyWith(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
          appliedFilter: viewByOrdersFilter,
          nextPageIndex: 1,
          canLoadMore: false,
          salesOrganisation: mockSalesOrg,
          viewByOrderList: viewByOrderMockData.copyWith(
            orderHeaders: [
              ...viewByOrderMockData.orderHeaders,
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
        config: config,
      ),
      seed: () => ViewByOrderState.initial().copyWith(
        appliedFilter: viewByOrdersFilter,
        viewByOrderList: viewByOrderMockData,
        searchKey: searchKey,
        salesOrgConfigs: salesOrgConfig,
        customerCodeInfo: customerCodeInfo,
        shipToInfo: shipToInfo,
        user: user,
        sortDirection: 'desc',
        salesOrganisation: mockSalesOrg,
      ),
      setUp: () {
        when(
          () => viewByOrderRepository.getViewByOrders(
            orderBy: 'datetime',
            salesOrgConfig: salesOrgConfig,
            soldTo: customerCodeInfo,
            shipTo: shipToInfo,
            user: user,
            pageSize: config.pageSize,
            offset: viewByOrderMockData.orderHeaders.length,
            sort: 'desc',
            searchKey: searchKey,
            viewByOrder: viewByOrderMockData,
            viewByOrdersFilter: viewByOrdersFilter,
            salesOrganisation: mockSalesOrg,
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
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
          isFetching: true,
          nextPageIndex: 0,
          viewByOrderList: viewByOrderMockData,
          appliedFilter: viewByOrdersFilter,
          searchKey: searchKey,
          salesOrganisation: mockSalesOrg,
        ),
        ViewByOrderState.initial().copyWith(
          salesOrgConfigs: salesOrgConfig,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          user: user,
          sortDirection: 'desc',
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          viewByOrderList: viewByOrderMockData,
          appliedFilter: viewByOrdersFilter,
          searchKey: searchKey,
          salesOrganisation: mockSalesOrg,
        )
      ],
    );
  });
}
