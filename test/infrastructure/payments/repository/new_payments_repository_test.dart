import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class NewPaymentLocalDataSourceMock extends Mock
    implements NewPaymentLocalDataSource {}

class NewPaymentRemoteDataSourceMock extends Mock
    implements NewPaymentRemoteDataSource {}

void main() {
  late NewPaymentRepository nawPaymentsRepository;
  late Config mockConfig;
  late NewPaymentLocalDataSource newPaymentLocalDataSource;
  late NewPaymentRemoteDataSource newPaymentRemoteDataSource;

  final customerOpenItemsList = [CustomerOpenItem.empty()];

  setUpAll(() {
    mockConfig = MockConfig();
    newPaymentLocalDataSource = NewPaymentLocalDataSourceMock();
    newPaymentRemoteDataSource = NewPaymentRemoteDataSourceMock();

    nawPaymentsRepository = NewPaymentRepository(
      config: mockConfig,
      localDataSource: newPaymentLocalDataSource,
      remoteDataSource: newPaymentRemoteDataSource,
    );
  });

  group(
    'New Payments repository test',
    () {
      test('Fetch Outstanding Invoices With No filters Applied', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getOutstandingInvoices(
            salesOrg: 'fake-salesOrg',
            customerCode: 'fake-customer-code',
            pageSize: 24,
            offset: 0,
            filterList: <Map<String, String>>[],
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        when(
          () => newPaymentRemoteDataSource.getCustomerOpenItems(
            customerCode: 'fake-customer-code',
            filterList: <Map<String, String>>[],
            offset: 0,
            pageSize: 24,
            salesOrg: 'fake-salesOrg',
            debitCreditType: 'debit',
            debitCreditCode: 'S',
            orderBy: 'netDueDate',
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getOutstandingInvoices(
          appliedFilter: OutstandingInvoiceFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
            dueDateFrom: DateTimeStringValue('-'),
            dueDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: 'fake-customer-code'),
          offset: 0,
          pageSize: 24,
          salesOrganisation: SalesOrganisation.empty()
              .copyWith(salesOrg: SalesOrg('fake-salesOrg')),
          searchKey: SearchKey(''),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch Available Credit With No filters Applied', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getAvailableCreditNotes(
            salesOrg: 'fake-salesOrg',
            customerCode: 'fake-customer-code',
            pageSize: 24,
            offset: 0,
            filterList: <Map<String, String>>[],
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        when(
          () => newPaymentRemoteDataSource.getCustomerOpenItems(
            customerCode: 'fake-customer-code',
            filterList: <Map<String, String>>[],
            offset: 0,
            pageSize: 24,
            salesOrg: 'fake-salesOrg',
            debitCreditType: 'debit',
            debitCreditCode: 'S',
            orderBy: 'netDueDate',
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getAvailableCreditNotes(
          appliedFilter: AvailableCreditFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: 'fake-customer-code'),
          offset: 0,
          pageSize: 24,
          salesOrganisation: SalesOrganisation.empty()
              .copyWith(salesOrg: SalesOrg('fake-salesOrg')),
        );
        expect(
          result.isRight(),
          true,
        );
      });
    },
  );
}
