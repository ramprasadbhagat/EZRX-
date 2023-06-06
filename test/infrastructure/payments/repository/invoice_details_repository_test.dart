import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/invoice_details_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/invoice_details_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/invoice_details_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class InvoiceDetailsLocalDataSourceMock extends Mock
    implements InvoiceDetailsLocalDataSource {}

class InvoiceDetailsRemoteDataSourceMock extends Mock
    implements InvoiceDetailsRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late InvoiceDetailsLocalDataSource allCreditsAndInvoicesLocalDataSourceMock;
  late InvoiceDetailsRemoteDataSource allCreditsAndInvoicesRemoteDataSourceMock;
  late Config configMock;
  late InvoiceDetailsRepository allCreditsAndInvoicesRepository;
  late CreditAndInvoiceItem fakeInvoice;
  late List<CustomerDocumentDetail> fakeInvoiceDetails;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configMock = ConfigMock();
    allCreditsAndInvoicesLocalDataSourceMock =
        InvoiceDetailsLocalDataSourceMock();
    allCreditsAndInvoicesRemoteDataSourceMock =
        InvoiceDetailsRemoteDataSourceMock();
    allCreditsAndInvoicesRepository = InvoiceDetailsRepository(
      config: configMock,
      localDataSource: allCreditsAndInvoicesLocalDataSourceMock,
      remoteDataSource: allCreditsAndInvoicesRemoteDataSourceMock,
    );

    fakeInvoice = CreditAndInvoiceItem.empty().copyWith(
      bpCustomerNumber: '0030032223',
      fiscalYear: '2023',
      accountingDocument: '1080005528',
      accountingDocumentItem: '001',
    );
    fakeInvoiceDetails = <CustomerDocumentDetail>[
      CustomerDocumentDetail.empty(),
    ];
  });

  group('Invoice Details Repository Test', () {
    group('getInvoiceDetails Test', () {
      test('=> getInvoiceDetails locally success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(() => allCreditsAndInvoicesLocalDataSourceMock.getInvoiceDetails())
            .thenAnswer(
          (invocation) async => fakeInvoiceDetails,
        );

        final result = await allCreditsAndInvoicesRepository.getInvoiceDetails(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          invoiceItem: fakeInvoice,
        );
        expect(result.isRight(), true);
      });

      test('=> getInvoiceDetails locally failed', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(() => allCreditsAndInvoicesLocalDataSourceMock.getInvoiceDetails())
            .thenThrow((invocation) async => MockException());

        final result = await allCreditsAndInvoicesRepository.getInvoiceDetails(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          invoiceItem: fakeInvoice,
        );
        expect(result.isLeft(), true);
      });
      test('=> getInvoiceDetails remote success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(() => allCreditsAndInvoicesRemoteDataSourceMock.getInvoiceDetails(
              customerCode: 'mock_soldTo',
              salesOrg: 'mock_salesOrg',
              bpCustomerNumber: fakeInvoice.bpCustomerNumber,
              fiscalYear: fakeInvoice.fiscalYear,
              accountingDocument: fakeInvoice.accountingDocument,
              accountingDocumentItem: fakeInvoice.accountingDocumentItem,
            )).thenAnswer(
          (invocation) async => fakeInvoiceDetails,
        );

        final result = await allCreditsAndInvoicesRepository.getInvoiceDetails(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: 'mock_soldTo'),
          salesOrganisation: SalesOrganisation.empty()
              .copyWith(salesOrg: SalesOrg('mock_salesOrg')),
          invoiceItem: fakeInvoice,
        );
        expect(result.isRight(), true);
      });

      test('=> getInvoiceDetails remote failed', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.uat);
        when(() => allCreditsAndInvoicesRemoteDataSourceMock.getInvoiceDetails(
              customerCode: 'mock_soldTo',
              salesOrg: 'mock_salesOrg',
              bpCustomerNumber: fakeInvoice.bpCustomerNumber,
              fiscalYear: fakeInvoice.fiscalYear,
              accountingDocument: fakeInvoice.accountingDocument,
              accountingDocumentItem: fakeInvoice.accountingDocumentItem,
            )).thenThrow((invocation) async => MockException());

        final result = await allCreditsAndInvoicesRepository.getInvoiceDetails(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3500')),
          invoiceItem: fakeInvoice,
        );
        expect(result.isLeft(), true);
      });
    });
  });
}
