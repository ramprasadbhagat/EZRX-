import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/available_statuses.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_remote.dart';
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
  late AvailableStatuses mockAvailableStatuses;
  late CustomerDocumentHeader mockCustomerDocumentHeader;
  const fakeFromDate = '2023-05-01';
  const fakeToDate = '2023-05-28';
  final filterMap = [
    {'field': 'debitCreditCode', 'value': 'S'},
    {'field': 'netDueDate', 'value': fakeFromDate, 'type': 'ge'},
    {'field': 'netDueDate', 'value': fakeToDate, 'type': 'le'},
    {'field': 'postingDate', 'value': fakeFromDate, 'type': 'ge'},
    {'field': 'postingDate', 'value': fakeToDate, 'type': 'le'},
  ];

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
    mockAvailableStatuses = AvailableStatuses.empty();
  });

  group('All Credits and Invoices Repository Test', () {
    group('getAvailableStatuses Test', () {
      test('=> getAvailableStatuses locally success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(() => allCreditsAndInvoicesLocalDataSourceMock
            .getAvailableStatuses()).thenAnswer(
          (invocation) async => mockAvailableStatuses,
        );

        final result = await allCreditsAndInvoicesRepository.getAvailableStatuses(
          salesOrganisation: SalesOrganisation.empty(),
        );
        expect(result.isRight(), true);
      });

      test('=> getAvailableStatuses locally failed', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(() => allCreditsAndInvoicesLocalDataSourceMock
                .getAvailableStatuses())
            .thenThrow((invocation) async => MockException());

        final result = await allCreditsAndInvoicesRepository.getAvailableStatuses(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
        );
        expect(result.isLeft(), true);
      });
      test('=> getAvailableStatuses remote success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(() => allCreditsAndInvoicesRemoteDataSourceMock.getAvailableStatuses(
              salesOrg: 'mock_salesOrg',
            )).thenAnswer(
          (invocation) async => mockAvailableStatuses,
        );

        final result = await allCreditsAndInvoicesRepository.getAvailableStatuses(
          salesOrganisation: SalesOrganisation.empty()
              .copyWith(salesOrg: SalesOrg('mock_salesOrg')),
          
        );
        expect(result.isRight(), true);
      });

      test('=> getAvailableStatuses remote failed', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(() => allCreditsAndInvoicesRemoteDataSourceMock.getAvailableStatuses(
              salesOrg: 'mock_salesOrg',
            )).thenThrow((invocation) async => MockException());

        final result = await allCreditsAndInvoicesRepository.getAvailableStatuses(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
        );
        expect(result.isLeft(), true);
      });
    });
    group('filterInvoices Test', () {
      test('=> filterInvoices locally success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(() => allCreditsAndInvoicesLocalDataSourceMock
            .getCustomerDocumentHeader()).thenAnswer(
          (invocation) async => mockCustomerDocumentHeader,
        );

        final result = await allCreditsAndInvoicesRepository.filterInvoices(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          filter: AllInvoicesFilter.empty(),
          pageSize: 1,
          offset: 0,
        );
        expect(result.isRight(), true);
      });

      test('=> filterInvoices locally failed', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(() => allCreditsAndInvoicesLocalDataSourceMock
                .getCustomerDocumentHeader())
            .thenThrow((invocation) async => MockException());

        final result = await allCreditsAndInvoicesRepository.filterInvoices(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
          filter: AllInvoicesFilter.empty(),
          pageSize: 1,
          offset: 0,
        );
        expect(result.isLeft(), true);
      });
      test('=> filterInvoices remote success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(() => allCreditsAndInvoicesRemoteDataSourceMock.filterInvoices(
              customerCode: 'mock_soldTo',
              salesOrg: 'mock_salesOrg',
              filterMap: filterMap,
              pageSize: 1,
              offset: 0,
            )).thenAnswer(
          (invocation) async => mockCustomerDocumentHeader,
        );

        final result = await allCreditsAndInvoicesRepository.filterInvoices(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: 'mock_soldTo'),
          salesOrganisation: SalesOrganisation.empty()
              .copyWith(salesOrg: SalesOrg('mock_salesOrg')),
          filter: AllInvoicesFilter.empty().copyWith(
            dueDateFrom: DateTimeStringValue(fakeFromDate),
            dueDateTo: DateTimeStringValue(fakeToDate),
            documentDateFrom: DateTimeStringValue(fakeFromDate),
            documentDateTo: DateTimeStringValue(fakeToDate),
          ),
          pageSize: 1,
          offset: 0,
        );
        expect(result.isRight(), true);
      });

      test('=> filterInvoices remote failed', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(() => allCreditsAndInvoicesRemoteDataSourceMock.filterInvoices(
              customerCode: 'mock_soldTo',
              salesOrg: 'mock_salesOrg',
              filterMap: filterMap,
              pageSize: 1,
              offset: 0,
            )).thenThrow((invocation) async => MockException());

        final result = await allCreditsAndInvoicesRepository.filterInvoices(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
          filter: AllInvoicesFilter.empty(),
          pageSize: 1,
          offset: 0,
        );
        expect(result.isLeft(), true);
      });
    });
  });
}
