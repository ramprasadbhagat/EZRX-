import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_item_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';

import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class MockConfig extends Mock implements Config {}

class ViewByItemLocalDataSourceMock extends Mock
    implements ViewByItemLocalDataSource {}

class ViewByItemRemoteDataSourceMock extends Mock
    implements ViewByItemRemoteDataSource {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final mockConfig = MockConfig();
  final viewByItemLocalDataSource = ViewByItemLocalDataSourceMock();
  final orderHistoryRemoteDataSource = ViewByItemRemoteDataSourceMock();

  final repository = ViewByItemRepository(
    config: mockConfig,
    viewByItemLocalDataSource: viewByItemLocalDataSource,
    viewByItemRemoteDataSource: orderHistoryRemoteDataSource,
  );

  const fakeException = 'fake-exception';
  final fakeSearchKey = SearchKey('fake');
  const fakePageSize = 10;
  const fakeOffset = 10;
  final fakeFilter = ViewByItemFilter.empty().copyWith(
    orderDateFrom: DateTimeStringValue(
      getDateStringByDateTime(DateTime(1900)),
    ),
    orderDateTo: DateTimeStringValue(
      getDateStringByDateTime(DateTime.now()),
    ),
  );
  final fakeOrderNumber = OrderNumber('fake-order-number');
  final fakeOrderHistory = await ViewByItemLocalDataSource().getViewByItems();
  final fakeInvoice =
      await ViewByItemLocalDataSource().getInvoiceDataForOrders();
  final fakeInvoiceMap = {
    for (final invoice in fakeInvoice) invoice.hashId: invoice,
  };

  group('View by item repository test', () {
    group('=> Get view by item test', () {
      test('=> Failure in local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => viewByItemLocalDataSource.getViewByItems())
            .thenThrow(fakeException);

        final result = await repository.getViewByItems(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          soldTo: fakeCustomerCodeInfo,
          shipTo: fakeShipToInfo,
          user: fakeClientUser,
          pageSize: fakePageSize,
          offset: fakeOffset,
          viewByItemFilter: fakeFilter,
          searchKey: fakeSearchKey,
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('=> Success in local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => viewByItemLocalDataSource.getViewByItems())
            .thenAnswer((_) async => fakeOrderHistory);

        final result = await repository.getViewByItems(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          soldTo: fakeCustomerCodeInfo,
          shipTo: fakeShipToInfo,
          user: fakeClientUser,
          pageSize: fakePageSize,
          offset: fakeOffset,
          viewByItemFilter: fakeFilter,
          searchKey: fakeSearchKey,
        );

        expect(result, Right(fakeOrderHistory));
      });

      test('=> Failure in remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => orderHistoryRemoteDataSource.getViewByItems(
            soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipTo: fakeShipToInfo.shipToCustomerCode,
            pageSize: fakePageSize,
            offset: fakeOffset,
            language: fakeClientUser.preferredLanguage.languageCode,
            searchKey: fakeSearchKey.getOrDefaultValue(''),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            filterQuery: ViewByItemFilterDto.fromDomain(fakeFilter).toJson(),
          ),
        ).thenThrow(fakeException);

        final result = await repository.getViewByItems(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          soldTo: fakeCustomerCodeInfo,
          shipTo: fakeShipToInfo,
          user: fakeClientUser,
          pageSize: fakePageSize,
          offset: fakeOffset,
          viewByItemFilter: fakeFilter,
          searchKey: fakeSearchKey,
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('=> Success in remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => orderHistoryRemoteDataSource.getViewByItems(
            soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipTo: fakeShipToInfo.shipToCustomerCode,
            pageSize: fakePageSize,
            offset: fakeOffset,
            language: fakeClientUser.preferredLanguage.languageCode,
            searchKey: fakeSearchKey.getOrDefaultValue(''),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            filterQuery: ViewByItemFilterDto.fromDomain(fakeFilter).toJson(),
          ),
        ).thenAnswer((_) async => fakeOrderHistory);

        final result = await repository.getViewByItems(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          soldTo: fakeCustomerCodeInfo,
          shipTo: fakeShipToInfo,
          user: fakeClientUser,
          pageSize: fakePageSize,
          offset: fakeOffset,
          viewByItemFilter: fakeFilter,
          searchKey: fakeSearchKey,
        );

        expect(result, Right(fakeOrderHistory));
      });

      test('=> Success in remote filter have date filter', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => orderHistoryRemoteDataSource.getViewByItems(
            soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipTo: fakeShipToInfo.shipToCustomerCode,
            pageSize: fakePageSize,
            offset: fakeOffset,
            language: fakeClientUser.preferredLanguage.languageCode,
            searchKey: fakeSearchKey.getOrDefaultValue(''),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            filterQuery: ViewByItemFilterDto.fromDomain(
              fakeFilter.copyWith(
                orderDateFrom: DateTimeStringValue(
                  getDateStringByDateTime(DateTime(2023, 12, 22)),
                ),
                orderDateTo: DateTimeStringValue(
                  getDateStringByDateTime(DateTime.now()),
                ),
              ),
            ).toJson(),
          ),
        ).thenAnswer((_) async => fakeOrderHistory);

        final result = await repository.getViewByItems(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          soldTo: fakeCustomerCodeInfo,
          shipTo: fakeShipToInfo,
          user: fakeClientUser,
          pageSize: fakePageSize,
          offset: fakeOffset,
          viewByItemFilter: fakeFilter.copyWith(
            orderDateFrom: DateTimeStringValue(
              getDateStringByDateTime(DateTime(2023, 12, 22)),
            ),
            orderDateTo: DateTimeStringValue(
              getDateStringByDateTime(DateTime.now()),
            ),
          ),
          searchKey: fakeSearchKey,
        );

        expect(result, Right(fakeOrderHistory));
      });

      test('=> Success in remote filter date empty', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => orderHistoryRemoteDataSource.getViewByItems(
            soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipTo: fakeShipToInfo.shipToCustomerCode,
            pageSize: fakePageSize,
            offset: fakeOffset,
            language: fakeClientUser.preferredLanguage.languageCode,
            searchKey: fakeSearchKey.getOrDefaultValue(''),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
            filterQuery: ViewByItemFilterDto.fromDomain(
              ViewByItemFilter.empty(),
            ).toJson(),
          ),
        ).thenAnswer((_) async => fakeOrderHistory);

        final result = await repository.getViewByItems(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          soldTo: fakeCustomerCodeInfo,
          shipTo: fakeShipToInfo,
          user: fakeClientUser,
          pageSize: fakePageSize,
          offset: fakeOffset,
          viewByItemFilter: fakeFilter.copyWith(
            orderDateFrom: DateTimeStringValue(
              getDateStringByDateTime(DateTime(1900)),
            ),
            orderDateTo: DateTimeStringValue(
              getDateStringByDateTime(DateTime.now()),
            ),
          ),
          searchKey: fakeSearchKey,
        );

        expect(result, Right(fakeOrderHistory));
      });

      test('=> test data', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => orderHistoryRemoteDataSource
              .getInvoiceDataForOrders(orderNumbers: ['0200261763']),
        ).thenAnswer((_) async => [fakeInvoice.first]);

        final result = await repository.getOrdersInvoiceData(
          orderNumbers: [OrderNumber('0200261763'), OrderNumber('')],
        );

        final hashId = StringValue(
          '${OrderNumber('0200261763').value.getOrElse(() => '')}${StringValue('000010').value.getOrElse(() => '')}',
        );
        expect(
          result.fold((l) => {}, (r) => r),
          {hashId: fakeInvoice.first},
        );
      });

      test('=> order ID same but different items', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => orderHistoryRemoteDataSource
              .getInvoiceDataForOrders(orderNumbers: ['0200262259']),
        ).thenAnswer(
          (_) async => [fakeInvoice[fakeInvoice.length - 2], fakeInvoice.last],
        );

        final result = await repository.getOrdersInvoiceData(
          orderNumbers: [OrderNumber('0200262259'), OrderNumber('')],
        );

        final hashIdFirst = StringValue(
          '${OrderNumber('0200262259').value.getOrElse(() => '')}${StringValue('000060').value.getOrElse(() => '')}',
        );

        final hashIdLast = StringValue(
          '${OrderNumber('0200262259').value.getOrElse(() => '')}${StringValue('000090').value.getOrElse(() => '')}',
        );

        expect(
          result.fold((l) => {}, (r) => r),
          {
            hashIdFirst: fakeInvoice[fakeInvoice.length - 2],
            hashIdLast: fakeInvoice.last
          },
        );
      });
    });

    group('=> Get invoice data test', () {
      test('=> Failure in local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => viewByItemLocalDataSource.getInvoiceDataForOrders())
            .thenThrow(fakeException);

        final result = await repository.getOrdersInvoiceData(
          orderNumbers: [fakeOrderNumber],
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('=> Success in local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => viewByItemLocalDataSource.getInvoiceDataForOrders())
            .thenAnswer((_) async => fakeInvoice);

        final result = await repository.getOrdersInvoiceData(
          orderNumbers: [fakeOrderNumber],
        );

        expect(result.fold((l) => {}, (r) => r), fakeInvoiceMap);
      });

      test('=> Failure in remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => orderHistoryRemoteDataSource.getInvoiceDataForOrders(
            orderNumbers: [fakeOrderNumber.getOrDefaultValue('')],
          ),
        ).thenThrow(fakeException);

        final result = await repository.getOrdersInvoiceData(
          orderNumbers: [fakeOrderNumber],
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('=> Success in remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => orderHistoryRemoteDataSource.getInvoiceDataForOrders(
            orderNumbers: [fakeOrderNumber.getOrDefaultValue('')],
          ),
        ).thenAnswer((_) async => fakeInvoice);

        final result = await repository.getOrdersInvoiceData(
          orderNumbers: [fakeOrderNumber],
        );

        expect(result.fold((l) => {}, (r) => r), fakeInvoiceMap);
      });
    });

    group('=> Search Order History test', () {
      test('=> Failure in local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => viewByItemLocalDataSource.getViewByItems())
            .thenThrow(fakeException);

        final result = await repository.searchOrderHistory(
          salesOrganisation: fakeSalesOrganisation,
          soldTo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          searchKey: fakeSearchKey,
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('=> Success in local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => viewByItemLocalDataSource.getViewByItems())
            .thenAnswer((_) async => fakeOrderHistory);

        final result = await repository.searchOrderHistory(
          salesOrganisation: fakeSalesOrganisation,
          soldTo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          searchKey: fakeSearchKey,
        );

        expect(result, Right(fakeOrderHistory));
      });

      test('=> Failure in remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => orderHistoryRemoteDataSource.searchOrderHistory(
            soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: fakeClientUser.preferredLanguage.languageCode,
            searchKey: fakeSearchKey.getOrDefaultValue(''),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
          ),
        ).thenThrow(fakeException);

        final result = await repository.searchOrderHistory(
          salesOrganisation: fakeSalesOrganisation,
          soldTo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          searchKey: fakeSearchKey,
        );

        expect(result, const Left(ApiFailure.other(fakeException)));
      });

      test('=> Success in remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => orderHistoryRemoteDataSource.searchOrderHistory(
            soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: fakeClientUser.preferredLanguage.languageCode,
            searchKey: fakeSearchKey.getOrDefaultValue(''),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrDefaultValue(''),
          ),
        ).thenAnswer((_) async => fakeOrderHistory);

        final result = await repository.searchOrderHistory(
          salesOrganisation: fakeSalesOrganisation,
          soldTo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          searchKey: fakeSearchKey,
        );

        expect(result, Right(fakeOrderHistory));
      });
    });
  });
}
