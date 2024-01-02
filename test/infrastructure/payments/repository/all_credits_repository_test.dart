import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/payments/entities/invoice_order_item.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/all_credits_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class AllCreditsAndInvoicesLocalDataSourceMock extends Mock
    implements AllCreditsAndInvoicesLocalDataSource {}

class AllCreditsAndInvoicesRemoteDataSourceMock extends Mock
    implements AllCreditsAndInvoicesRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late Config configMock;
  late AllCreditsFilter allCreditsFilter;
  late List<CreditAndInvoiceItem> mockList;
  late AllCreditsAndInvoicesLocalDataSource
      allCreditsAndInvoicesLocalDataSourceMock;
  late AllCreditsAndInvoicesRemoteDataSource
      allCreditsAndInvoicesRemoteDataSourceMock;
  late AllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;
  late List<InvoiceOrderItem> invoiceOrderItems;
  final fakeToDate = DateTime.now();
  final fakeFromDate = DateTime.now().subtract(
    const Duration(days: 30),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    allCreditsAndInvoicesLocalDataSourceMock =
        AllCreditsAndInvoicesLocalDataSourceMock();
    allCreditsAndInvoicesRemoteDataSourceMock =
        AllCreditsAndInvoicesRemoteDataSourceMock();
    invoiceOrderItems =
        await AllCreditsAndInvoicesLocalDataSource().getOrderForInvoice();
    allCreditsAndInvoicesRepository = AllCreditsAndInvoicesRepository(
      config: configMock,
      localDataSource: allCreditsAndInvoicesLocalDataSourceMock,
      remoteDataSource: allCreditsAndInvoicesRemoteDataSourceMock,
    );
    mockList = List<CreditAndInvoiceItem>.empty();
    allCreditsFilter = AllCreditsFilter.empty().copyWith(
      documentDateTo: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
      documentDateFrom: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
      amountValueTo: RangeValue('100'),
      amountValueFrom: RangeValue('1000'),
    );
  });

  group('All Credits Repository Test', () {
    test('=> filterCredits locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => allCreditsAndInvoicesLocalDataSourceMock.getDocumentHeaderList(),
      ).thenAnswer(
        (invocation) async => mockList,
      );

      final result = await allCreditsAndInvoicesRepository.filterCredits(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        pageSize: 1,
        offset: 0,
        filter: allCreditsFilter,
      );
      expect(result.isRight(), true);
    });

    test('=> filterCredits locally failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => allCreditsAndInvoicesLocalDataSourceMock.getDocumentHeaderList(),
      ).thenThrow((invocation) async => MockException());

      final result = await allCreditsAndInvoicesRepository.filterCredits(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
        pageSize: 1,
        offset: 0,
        filter: allCreditsFilter,
      );
      expect(result.isLeft(), true);
    });
    test('=> filterCredits remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => allCreditsAndInvoicesRemoteDataSourceMock.filterCredits(
          customerCode: 'mock_soldTo',
          salesOrg: 'mock_salesOrg',
          pageSize: 1,
          offset: 0,
          filterMap: AllCreditsFilterDto.fromDomain(
            AllCreditsFilter.empty().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
              amountValueTo: RangeValue('100'),
              amountValueFrom: RangeValue('1000'),
            ),
          ).toMapList,
        ),
      ).thenAnswer(
        (invocation) async => mockList,
      );

      final result = await allCreditsAndInvoicesRepository.filterCredits(
        customerCodeInfo: CustomerCodeInfo.empty()
            .copyWith(customerCodeSoldTo: 'mock_soldTo'),
        salesOrganisation: SalesOrganisation.empty()
            .copyWith(salesOrg: SalesOrg('mock_salesOrg')),
        pageSize: 1,
        offset: 0,
        filter: allCreditsFilter,
      );
      expect(result.isRight(), true);
    });

    test('=> filterCredits remote success for ID market', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => allCreditsAndInvoicesRemoteDataSourceMock.filterCredits(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeIDSalesOrganisation.salesOrg.getValue(),
          pageSize: 1,
          offset: 0,
          filterMap: AllCreditsFilterDto.fromDomain(
            AllCreditsFilter.empty().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
              amountValueTo: RangeValue('100'),
              amountValueFrom: RangeValue('1000'),
            ),
          ).toIDCreditFilterMapList,
        ),
      ).thenAnswer(
        (invocation) async => mockList,
      );

      final result = await allCreditsAndInvoicesRepository.filterCredits(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeIDSalesOrganisation,
        pageSize: 1,
        offset: 0,
        filter: allCreditsFilter,
      );
      expect(result.isRight(), true);
    });

    test('=> filterCredits remote failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(
        () => allCreditsAndInvoicesRemoteDataSourceMock.filterCredits(
          customerCode: 'mock_soldTo',
          salesOrg: 'mock_salesOrg',
          pageSize: 1,
          offset: 0,
          filterMap: AllCreditsFilterDto.fromDomain(
            AllCreditsFilter.empty().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
              amountValueTo: RangeValue('100'),
              amountValueFrom: RangeValue('1000'),
            ),
          ).toMapList,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await allCreditsAndInvoicesRepository.filterCredits(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
        pageSize: 1,
        offset: 0,
        filter: allCreditsFilter,
      );
      expect(result.isLeft(), true);
    });
  });
  group('get orders for invoice Test', () {
    test('=> locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() => allCreditsAndInvoicesLocalDataSourceMock.getOrderForInvoice())
          .thenAnswer(
        (invocation) async => invoiceOrderItems,
      );
      final result = await allCreditsAndInvoicesRepository.fetchOrder(
        invoiceIds: invoiceOrderItems
            .map(
              (e) => e.invoiceId.getValue(),
            )
            .toList(),
      );
      expect(
        result.getOrElse(() => <String, StringValue>{}),
        invoiceOrderItems.toMap,
      );
    });

    test('=> locally fail', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() => allCreditsAndInvoicesLocalDataSourceMock.getOrderForInvoice())
          .thenThrow(
        (invocation) async => MockException(),
      );
      final result = await allCreditsAndInvoicesRepository.fetchOrder(
        invoiceIds: invoiceOrderItems
            .map(
              (e) => e.invoiceId.getValue(),
            )
            .toList(),
      );
      expect(result.isLeft(), true);
    });

    test('=> remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.dev);
      when(
        () => allCreditsAndInvoicesRemoteDataSourceMock.getOrderForInvoice(
          invoiceOrderItems.map((e) => e.invoiceId.getValue()).toList(),
        ),
      ).thenAnswer(
        (invocation) async => invoiceOrderItems,
      );
      final result = await allCreditsAndInvoicesRepository.fetchOrder(
        invoiceIds: invoiceOrderItems
            .map(
              (e) => e.invoiceId.getValue(),
            )
            .toList(),
      );
      expect(
        result.getOrElse(() => <String, StringValue>{}),
        invoiceOrderItems.toMap,
      );
    });
    test('=> remote fail', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => allCreditsAndInvoicesRemoteDataSourceMock.getOrderForInvoice(
          invoiceOrderItems.map((e) => e.invoiceId.getValue()).toList(),
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );
      final result = await allCreditsAndInvoicesRepository.fetchOrder(
        invoiceIds: invoiceOrderItems
            .map(
              (e) => e.invoiceId.getValue(),
            )
            .toList(),
      );
      expect(result.isLeft(), true);
    });
  });
}
