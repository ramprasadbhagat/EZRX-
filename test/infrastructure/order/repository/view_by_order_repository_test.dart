import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_repository.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class MockConfig extends Mock implements Config {}

class ViewByOrderLocalDataSourceMock extends Mock
    implements ViewByOrderLocalDataSource {}

class ViewByOrderRemoteDataSourceMock extends Mock
    implements ViewByOrderRemoteDataSource {}

void main() {
  late Config mockConfig;
  late ViewByOrderRepository viewByOrderRepository;
  late ViewByOrderLocalDataSource viewByOrderLocalDataSource;
  late ViewByOrder fakeViewByOrder;
  late ViewByOrderRemoteDataSource viewByOrderRemoteDataSource;

  const fakeSort = 'desc';
  const fakeOrderBy = 'datetime';
  final fakeSearchKey = SearchKey('');
  final fakeFilter = ViewByOrdersFilter.empty();
  const fakePageSize = 10;
  const fakeOffSet = 0;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    mockConfig = MockConfig();
    viewByOrderLocalDataSource = ViewByOrderLocalDataSourceMock();
    viewByOrderRemoteDataSource = ViewByOrderRemoteDataSourceMock();
    viewByOrderRepository = ViewByOrderRepository(
      config: mockConfig,
      localDataSource: viewByOrderLocalDataSource,
      remoteDataSource: viewByOrderRemoteDataSource,
    );
    fakeViewByOrder = await ViewByOrderLocalDataSource().getViewByOrders();
  });

  group('=> get View By Orders Test', () {
    test('=> get locally fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => viewByOrderLocalDataSource.getViewByOrders())
          .thenThrow((invocation) async => MockException());

      final result = await viewByOrderRepository.getViewByOrders(
        salesOrgConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        soldTo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        pageSize: fakePageSize,
        offset: fakeOffSet,
        viewByOrdersFilter: fakeFilter,
        orderBy: fakeOrderBy,
        sort: fakeSort,
        searchKey: fakeSearchKey,
        viewByOrder: fakeViewByOrder,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> get locally success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => viewByOrderLocalDataSource.getViewByOrders()).thenAnswer(
        (invocation) async => fakeViewByOrder,
      );

      final result = await viewByOrderRepository.getViewByOrders(
        salesOrgConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        soldTo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        pageSize: fakePageSize,
        offset: fakeOffSet,
        viewByOrdersFilter: fakeFilter,
        orderBy: fakeOrderBy,
        sort: fakeSort,
        searchKey: fakeSearchKey,
        viewByOrder: fakeViewByOrder,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> get remotely fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => viewByOrderRemoteDataSource.getViewByOrders(
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          pageSize: fakePageSize,
          offset: fakeOffSet,
          language: fakeClientUser.preferredLanguage.languageCode,
          searchKey: fakeSearchKey.getOrCrash(),
          orderBy: fakeOrderBy,
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          filterQuery: ViewByOrdersFilterDto.fromDomain(fakeFilter).toJson(),
          sort: fakeSort,
          shipTo: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await viewByOrderRepository.getViewByOrders(
        salesOrgConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        soldTo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        pageSize: fakePageSize,
        offset: fakeOffSet,
        viewByOrdersFilter: fakeFilter,
        orderBy: fakeOrderBy,
        sort: fakeSort,
        searchKey: fakeSearchKey,
        viewByOrder: fakeViewByOrder,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> get remotely success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => viewByOrderRemoteDataSource.getViewByOrders(
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          pageSize: fakePageSize,
          offset: fakeOffSet,
          language: fakeClientUser.preferredLanguage.languageCode,
          searchKey: fakeSearchKey.getOrCrash(),
          orderBy: fakeOrderBy,
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          filterQuery: ViewByOrdersFilterDto.fromDomain(fakeFilter).toJson(),
          sort: fakeSort,
          shipTo: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenAnswer(
        (invocation) async => fakeViewByOrder,
      );

      final result = await viewByOrderRepository.getViewByOrders(
        salesOrgConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        soldTo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        pageSize: fakePageSize,
        offset: fakeOffSet,
        viewByOrdersFilter: fakeFilter,
        orderBy: fakeOrderBy,
        sort: fakeSort,
        searchKey: fakeSearchKey,
        viewByOrder: fakeViewByOrder,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result.isRight(),
        true,
      );
    });
  });
}
