import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_invoice_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class NewPaymentLocalDataSourceMock extends Mock
    implements NewPaymentLocalDataSource {}

class NewPaymentRemoteDataSourceMock extends Mock
    implements NewPaymentRemoteDataSource {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

void main() {
  late NewPaymentRepository nawPaymentsRepository;
  late Config mockConfig;
  late NewPaymentLocalDataSource newPaymentLocalDataSource;
  late NewPaymentRemoteDataSource newPaymentRemoteDataSource;
  late FileSystemHelper fileSystemHelper;

  final customerOpenItemsList = [
    CustomerOpenItem.empty().copyWith(
      documentReferenceID: 'fake-id',
    )
  ];
  final paymentInfo = PaymentInfo.empty();
  final customerOpenItems = [
    CustomerOpenItem.empty().copyWith(
      amountInTransactionCurrency: 5,
    )
  ];
  const fakeUserName = 'fakeUser';
  final fakeSalesOrg = SalesOrg('fake-salesOrg');
  const fakeCustomerCode = 'fake-customer-code';
  const fakeDebitCreditCode = 'S';
  const fakeDebitCreditType = 'debit';
  const fakeOrderBy = 'netDueDate';
  const offset = 0;
  const pageSize = 24;
  final fakeFilterList = <Map<String, String>>[
    {
      'field': 'accountingDocument',
      'value': 'fake',
    }
  ];

  setUpAll(() {
    mockConfig = MockConfig();
    newPaymentLocalDataSource = NewPaymentLocalDataSourceMock();
    newPaymentRemoteDataSource = NewPaymentRemoteDataSourceMock();
    fileSystemHelper = FileSystemHelperMock();

    nawPaymentsRepository = NewPaymentRepository(
      config: mockConfig,
      localDataSource: newPaymentLocalDataSource,
      remoteDataSource: newPaymentRemoteDataSource,
      fileSystemHelper: fileSystemHelper,
    );
  });

  group(
    'New Payments repository test',
    () {
      //***************************** MOCK ***********************
      test('Fetch outstanding invoices success - Mock ', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getCustomerOpenItems(),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getOutstandingInvoices(
          appliedFilter: OutstandingInvoiceFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
            dueDateFrom: DateTimeStringValue('-'),
            dueDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey(''),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch outstanding invoices failure - Mock ', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getCustomerOpenItems(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getOutstandingInvoices(
          appliedFilter: OutstandingInvoiceFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
            dueDateFrom: DateTimeStringValue('-'),
            dueDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey(''),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch available credit success - Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getCustomerOpenItems(),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        when(
          () => newPaymentRemoteDataSource.getCustomerOpenItems(
            customerCode: fakeCustomerCode,
            filterList: <Map<String, String>>[],
            offset: offset,
            pageSize: pageSize,
            salesOrg: fakeSalesOrg.getOrCrash(),
            debitCreditType: fakeDebitCreditType,
            debitCreditCode: fakeDebitCreditCode,
            orderBy: fakeOrderBy,
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getAvailableCreditNotes(
          appliedFilter: AvailableCreditFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey(''),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch available credit failure - Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getCustomerOpenItems(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getAvailableCreditNotes(
          appliedFilter: AvailableCreditFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey(''),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch available pay success- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.pay(
            salesOrg: fakeSalesOrg,
          ),
        ).thenAnswer((invocation) async => paymentInfo);

        when(
          () => newPaymentRemoteDataSource.getCustomerOpenItems(
            customerCode: fakeCustomerCode,
            filterList: <Map<String, String>>[],
            offset: offset,
            pageSize: pageSize,
            salesOrg: fakeSalesOrg.getOrCrash(),
            debitCreditType: fakeDebitCreditType,
            debitCreditCode: fakeDebitCreditCode,
            orderBy: fakeOrderBy,
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.pay(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          user: User.empty().copyWith(username: Username(fakeUserName)),
          customerOpenItems: customerOpenItems,
          paymentMethod: '',
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch available pay failure - Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.pay(
            salesOrg: fakeSalesOrg,
          ),
        ).thenThrow((invocation) => MockException());

        when(
          () => newPaymentRemoteDataSource.getCustomerOpenItems(
            customerCode: fakeCustomerCode,
            filterList: <Map<String, String>>[],
            offset: offset,
            pageSize: pageSize,
            salesOrg: fakeSalesOrg.getOrCrash(),
            debitCreditType: fakeDebitCreditType,
            debitCreditCode: fakeDebitCreditCode,
            orderBy: fakeOrderBy,
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.pay(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          user: User.empty().copyWith(username: Username(fakeUserName)),
          customerOpenItems: customerOpenItems,
          paymentMethod: '',
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Update Payment Gateway Method success- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.updatePaymentGateway(),
        ).thenAnswer((invocation) async {
          return;
        });

        final result = await nawPaymentsRepository.updatePaymentGateway(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          uri: Uri(
            queryParameters: {
              'salesOrg': 'fake-salesOrg',
              'txnStatus': 'success',
              'paymentId': '1A2B3C4D',
              'transactionRef': '1A2B3C4D',
            },
          ),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Update Payment Gateway Method failure- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.updatePaymentGateway(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.updatePaymentGateway(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          uri: Uri(
            queryParameters: {
              'salesOrg': 'fake-salesOrg',
              'txnStatus': 'success',
              'paymentId': '1A2B3C4D',
              'transactionRef': '1A2B3C4D',
            },
          ),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('payment info invoice pdf success- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getPaymentInvoiceInfoPdf(),
        ).thenAnswer((invocation) async => PaymentInvoiceInfoPdf.empty());

        final result = await nawPaymentsRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          user: User.empty().copyWith(username: Username(fakeUserName)),
          paymentInfo: CustomerPaymentInfo.empty().copyWith(
            paymentID: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('payment info invoice pdf failure- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.getPaymentInvoiceInfoPdf(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          user: User.empty().copyWith(username: Username(fakeUserName)),
          paymentInfo: CustomerPaymentInfo.empty().copyWith(
            paymentID: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch Payment methods success- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.fetchPaymentMethods(),
        ).thenAnswer((invocation) async => [PaymentMethodValue('')]);

        final result = await nawPaymentsRepository.fetchPaymentMethods(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch Payment methods failure- Mock', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () => newPaymentLocalDataSource.fetchPaymentMethods(),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.fetchPaymentMethods(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      //***************************** UAT ***********************
      test(
          'Fetch outstanding invoices success for ID market when filter by Document date - Uat ',
          () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getOutstandingInvoices(
            salesOrg: fakeIDSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            pageSize: pageSize,
            offset: offset,
            filterList: [
              {
                'field': 'documentDate',
                'value': '2023-12-01',
                'type': 'ge',
              },
              {
                'field': 'documentDate',
                'value': '2023-12-28',
                'type': 'le',
              },
            ],
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getOutstandingInvoices(
          appliedFilter: OutstandingInvoiceFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue('2023-12-01'),
            documentDateTo: DateTimeStringValue('2023-12-28'),
          ),
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: offset,
          pageSize: pageSize,
          salesOrganisation: fakeIDSalesOrganisation,
          searchKey: SearchKey(''),
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('Fetch outstanding invoices success for other markets - Uat ',
          () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getOutstandingInvoices(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCode,
            pageSize: pageSize,
            offset: offset,
            filterList: fakeFilterList,
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
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey('fake'),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch outstanding invoices failure - Uat ', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getOutstandingInvoices(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCode,
            pageSize: pageSize,
            offset: offset,
            filterList: fakeFilterList,
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getOutstandingInvoices(
          appliedFilter: OutstandingInvoiceFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
            dueDateFrom: DateTimeStringValue('-'),
            dueDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey('fake'),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch available credit success - UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getAvailableCreditNotes(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCode,
            pageSize: pageSize,
            offset: offset,
            filterList: fakeFilterList,
          ),
        ).thenAnswer((invocation) async => customerOpenItemsList);

        final result = await nawPaymentsRepository.getAvailableCreditNotes(
          appliedFilter: AvailableCreditFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey('fake'),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch available credit failure - UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getAvailableCreditNotes(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCode,
            pageSize: pageSize,
            offset: offset,
            filterList: fakeFilterList,
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getAvailableCreditNotes(
          appliedFilter: AvailableCreditFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue('-'),
            documentDateTo: DateTimeStringValue('-'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          offset: offset,
          pageSize: pageSize,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
          searchKey: SearchKey('fake'),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch available pay success- UaT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.pay(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCode,
            customerInvoices: customerOpenItems
                .map(
                  (customerOpenItem) => CustomerInvoiceDto.fromDomain(
                    customerOpenItem,
                  ).toJson(),
                )
                .toList(),
            paymentMethod: '',
            transactionCurrency: '',
            userName: fakeUserName,
          ),
        ).thenAnswer((invocation) async => paymentInfo);

        final result = await nawPaymentsRepository.pay(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          user: User.empty().copyWith(username: Username(fakeUserName)),
          customerOpenItems: customerOpenItems,
          paymentMethod: '',
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch available pay failure- UaT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.pay(
            salesOrg: fakeSalesOrg.getOrCrash(),
            customerCode: fakeCustomerCode,
            customerInvoices: customerOpenItems
                .map(
                  (customerOpenItem) => CustomerInvoiceDto.fromDomain(
                    customerOpenItem,
                  ).toJson(),
                )
                .toList(),
            paymentMethod: '',
            transactionCurrency: '',
            userName: fakeUserName,
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.pay(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          user: User.empty().copyWith(username: Username(fakeUserName)),
          customerOpenItems: customerOpenItems,
          paymentMethod: '',
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Update Payment Gateway Method failure- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.updatePaymentGateway(
            salesOrg: fakeSalesOrg.getOrCrash(),
            txnStatus: 'success',
            paymentID: '1A2B3C4D',
            transactionRef: '1A2B3C4D',
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.updatePaymentGateway(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          uri: Uri(
            queryParameters: {
              'salesOrg': 'fake-salesOrg',
              'txnStatus': 'success',
              'paymentId': '1A2B3C4D',
              'transactionRef': '1A2B3C4D',
            },
          ),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('payment info invoice pdf success- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getPaymentInvoiceInfoPdf(
            salesOrg: fakeSalesOrg.getValue(),
            customerCode: fakeCustomerCode,
            customerName: fakeUserName,
            paymentId: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
          ),
        ).thenAnswer((invocation) async => PaymentInvoiceInfoPdf.empty());

        final result = await nawPaymentsRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          user: User.empty().copyWith(username: Username(fakeUserName)),
          paymentInfo: CustomerPaymentInfo.empty().copyWith(
            paymentID: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('payment info invoice pdf failure- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.getPaymentInvoiceInfoPdf(
            salesOrg: fakeSalesOrg.getValue(),
            customerCode: fakeCustomerCode,
            customerName: fakeUserName,
            paymentId: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: fakeCustomerCode),
          user: User.empty().copyWith(username: Username(fakeUserName)),
          paymentInfo: CustomerPaymentInfo.empty().copyWith(
            paymentID: '123',
            accountingDocExternalReference: '123',
            paymentBatchAdditionalInfo: '123',
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Fetch Payment methods success- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.fetchPaymentMethods(
            salesOrg: fakeSalesOrg.getValue(),
          ),
        ).thenAnswer((invocation) async => [PaymentMethodValue('')]);

        final result = await nawPaymentsRepository.fetchPaymentMethods(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Fetch Payment methods failure- UAT', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => newPaymentRemoteDataSource.fetchPaymentMethods(
            salesOrg: fakeSalesOrg.getValue(),
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.fetchPaymentMethods(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Save File success- UAT', () async {
        final buffer = Uint8List.fromList([1, 2, 3, 4, 5]);
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => fileSystemHelper.getDownloadedFile(
            AttachmentFileBuffer(
              buffer: buffer,
              name: 'invoice_${DateTime.now().millisecondsSinceEpoch}.pdf',
            ),
          ),
        ).thenThrow((invocation) => MockException());

        final result = await nawPaymentsRepository.saveFile(
          pdfData: buffer,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    },
  );
}
