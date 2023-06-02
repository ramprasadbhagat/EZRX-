import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/domain/payments/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/all_credits_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AllCreditsAndInvoicesLocalDataSourceMock extends Mock
    implements AllCreditsAndInvoicesLocalDataSource {}

class AllCreditsAndInvoicesRemoteDataSourceMock extends Mock
    implements AllCreditsAndInvoicesRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late AllCreditsAndInvoicesLocalDataSource
      allCreditsAndInvoicesLocalDataSourceMock;
  late AllCreditsAndInvoicesRemoteDataSource
      allCreditsAndInvoicesRemoteDataSourceMock;
  late Config configMock;
  late AllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;
  late CustomerDocumentHeader mockCustomerDocumentHeader;
  late AllCreditsFilter allCreditsFilter;

  final fakeToDate = DateTime.now();
  final fakeFromDate = DateTime.now().subtract(
    const Duration(days: 28),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    allCreditsAndInvoicesLocalDataSourceMock =
        AllCreditsAndInvoicesLocalDataSourceMock();
    allCreditsAndInvoicesRemoteDataSourceMock =
        AllCreditsAndInvoicesRemoteDataSourceMock();
    allCreditsAndInvoicesRepository = AllCreditsAndInvoicesRepository(
      config: configMock,
      localDataSource: allCreditsAndInvoicesLocalDataSourceMock,
      remoteDataSource: allCreditsAndInvoicesRemoteDataSourceMock,
    );
    mockCustomerDocumentHeader = CustomerDocumentHeader.empty();
    allCreditsFilter = AllCreditsFilter.empty().copyWith(
      documentDateTo: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
      documentDateFrom: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
      sortBy: 'All',
      documentNumber: DocumentNumber('mock_documentNumber'),
      creditAmountTo: RangeValue('100'),
      creditAmountFrom: RangeValue('1000'),
    );
  });

  group('All Credits Repository Test', () {
    test('=> getAllCredits locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() => allCreditsAndInvoicesLocalDataSourceMock
          .getCustomerDocumentHeader()).thenAnswer(
        (invocation) async => mockCustomerDocumentHeader,
      );

      final result = await allCreditsAndInvoicesRepository.getAllCredits(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        pageSize: 1,
        offset: 0,
        allCreditsFilter: allCreditsFilter,
      );
      expect(result.isRight(), true);
    });

    test('=> getAllCredits locally failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() => allCreditsAndInvoicesLocalDataSourceMock
              .getCustomerDocumentHeader())
          .thenThrow((invocation) async => MockException());

      final result = await allCreditsAndInvoicesRepository.getAllCredits(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
        pageSize: 1,
        offset: 0,
        allCreditsFilter: allCreditsFilter,
      );
      expect(result.isLeft(), true);
    });
    test('=> getAllCredits remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() => allCreditsAndInvoicesRemoteDataSourceMock.getAllCredits(
            customerCode: 'mock_soldTo',
            salesOrg: 'mock_salesOrg',
            pageSize: 1,
            offset: 0,
            filterQuery: AllCreditsFilterDto.fromDomain(
                AllCreditsFilter.empty().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
              sortBy: 'All',
              documentNumber: DocumentNumber('mock_documentNumber'),
              creditAmountTo: RangeValue('100'),
              creditAmountFrom: RangeValue('1000'),
            )).toFilterByMapList,
          )).thenAnswer(
        (invocation) async => mockCustomerDocumentHeader,
      );

      final result = await allCreditsAndInvoicesRepository.getAllCredits(
        customerCodeInfo: CustomerCodeInfo.empty()
            .copyWith(customerCodeSoldTo: 'mock_soldTo'),
        salesOrganisation: SalesOrganisation.empty()
            .copyWith(salesOrg: SalesOrg('mock_salesOrg')),
        pageSize: 1,
        offset: 0,
        allCreditsFilter: allCreditsFilter,
      );
      expect(result.isRight(), true);
    });

    test('=> getAllCredits remote failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() => allCreditsAndInvoicesRemoteDataSourceMock.getAllCredits(
            customerCode: 'mock_soldTo',
            salesOrg: 'mock_salesOrg',
            pageSize: 1,
            offset: 0,
            filterQuery: AllCreditsFilterDto.fromDomain(
                AllCreditsFilter.empty().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
              sortBy: 'All',
              documentNumber: DocumentNumber('mock_documentNumber'),
              creditAmountTo: RangeValue('100'),
              creditAmountFrom: RangeValue('1000'),
            )).toFilterByMapList,
          )).thenThrow((invocation) async => MockException());

      final result = await allCreditsAndInvoicesRepository.getAllCredits(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
          pageSize: 1,
          offset: 0,
          allCreditsFilter: allCreditsFilter);
      expect(result.isLeft(), true);
    });
  });
}
