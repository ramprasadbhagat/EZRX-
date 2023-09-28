import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/infrastructure/core/device/repository/device_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class NewPaymentRepositoryMock extends Mock implements NewPaymentRepository {}

class DeviceRepositoryMock extends Mock implements DeviceRepository {}

void main() {
  late NewPaymentRepository newPaymentRepository;
  late DeviceRepository deviceRepository;
  late CustomerOpenItem customerOpenItem;
  late PaymentInfo fakePaymentInfo;
  late List<CustomerOpenItem> fakeCustomerOpenItemSelected;
  late List<PaymentMethodValue> fakePaymentMethodValues;

  setUpAll(() {
    newPaymentRepository = NewPaymentRepositoryMock();
    deviceRepository = DeviceRepositoryMock();
    customerOpenItem = CustomerOpenItem.empty().copyWith(
      openAmountInTransCrcy: 100,
    );
  });
  setUp(() {
    fakePaymentInfo = PaymentInfo.empty();
    fakeCustomerOpenItemSelected = <CustomerOpenItem>[
      CustomerOpenItem.empty().copyWith(
        status: StatusType('Overdue'),
        accountingDocument: '1100001163',
        netDueDate: DateTimeStringValue('2023-07-31'),
        documentDate: DateTimeStringValue('2021-01-02'),
        amountInTransactionCurrency: 999,
        documentReferenceID: '0800072883',
        postingKeyName: 'Invoice',
        transactionCurrency: Currency('MYR'),
        accountingDocExternalReference: '200120231100001163001SD 1100001163',
        bpCustomerNumber: '30082707',
        debitCreditCode: 'S',
        cashDiscountAmountInDspCrcy: 0,
        cashDiscountDueDate: DateTimeStringValue('2023-06-30'),
        totalAmountInDisplayCrcy: 999,
        displayCurrency: 'MYR',
        openAmountInDisplayCrcy: 999,
        fiscalYear: '2023',
        isDisputed: '',
        accountingDocumentItem: '001',
        accountingDocumentItemRef: '001530',
        partialPaymentHistoryDesc: '200120231100001163001:',
        paymentAmountInDisplayCrcy: 999,
        companyCode: '2001',
        openAmountInTransCrcy: 999,
      ),
    ];

    fakePaymentMethodValues = <PaymentMethodValue>[
      PaymentMethodValue('Payment Gateway'),
      PaymentMethodValue('Qr Code'),
    ];
  });

  group(
    'New Payment Bloc Invoices ',
    () {
      blocTest(
        'Initialize',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.fetchPaymentMethods(
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [PaymentMethodValue('')],
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.initialized(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            user: User.empty(),
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            isFetchingPaymentMethod: true,
          ),
          NewPaymentState.initial().copyWith(
            isFetchingPaymentMethod: false,
            paymentMethods: [PaymentMethodValue('')],
            selectedPaymentMethod: PaymentMethodValue(''),
          ),
        ],
      );

      blocTest(
        'Initialize with Payment Method fail',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.fetchPaymentMethods(
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.initialized(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            user: User.empty(),
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            isFetchingPaymentMethod: true,
          ),
          NewPaymentState.initial().copyWith(
            isFetchingPaymentMethod: false,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            paymentMethods: [],
            selectedPaymentMethod: PaymentMethodValue(''),
          ),
        ],
      );

      blocTest(
        'UpdateAllInvoices',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updateAllInvoices(
            items: [
              CustomerOpenItem.empty(),
            ],
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedInvoices: [CustomerOpenItem.empty()],
          )
        ],
      );

      blocTest(
        'ToggleInvoice selected => deselect',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          selectedInvoices: [CustomerOpenItem.empty()],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleInvoice(
            item: CustomerOpenItem.empty(),
            selected: false,
          ),
        ),
        expect: () => [NewPaymentState.initial()],
      );

      blocTest(
        'ToggleInvoice deselect => select',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleInvoice(
            item: CustomerOpenItem.empty(),
            selected: true,
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedInvoices: [CustomerOpenItem.empty()],
          )
        ],
      );
    },
  );

  group(
    'New Payment Bloc Credits',
    () {
      blocTest(
        'UpdateAllCredits',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updateAllCredits(
            items: [
              CustomerOpenItem.empty(),
            ],
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedCredits: [CustomerOpenItem.empty()],
          )
        ],
      );

      blocTest(
        'ToggleCredit selected => deselect',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          selectedCredits: [CustomerOpenItem.empty()],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleCredit(
            item: CustomerOpenItem.empty(),
            selected: false,
          ),
        ),
        expect: () => [NewPaymentState.initial()],
      );

      blocTest(
        'ToggleCredit deselect => select',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          selectedInvoices: [
            customerOpenItem,
          ],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleCredit(
            item: customerOpenItem,
            selected: true,
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedInvoices: [
              customerOpenItem,
            ],
            selectedCredits: [
              customerOpenItem,
            ],
          ),
        ],
        verify: (NewPaymentBloc bloc) {
          expect(
            bloc.state.amountTotal,
            customerOpenItem.openAmountInTransCrcy * 2,
          );
        },
      );
    },
  );

  group(
    'New Payment Bloc Pay now',
    () {
      blocTest(
        'Pay fail',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.pay(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              user: User.empty(),
              paymentMethod: 'Payment Gateway',
              customerOpenItems: fakeCustomerOpenItemSelected,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(const NewPaymentEvent.pay()),
        expect: () => [
          NewPaymentState.initial().copyWith(
            isLoading: true,
            selectedInvoices: fakeCustomerOpenItemSelected,
            paymentMethods: fakePaymentMethodValues,
            selectedPaymentMethod: fakePaymentMethodValues.first,
          ),
          NewPaymentState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            selectedInvoices: fakeCustomerOpenItemSelected,
            paymentMethods: fakePaymentMethodValues,
            selectedPaymentMethod: fakePaymentMethodValues.first,
          ),
        ],
      );

      blocTest(
        'Pay success',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.pay(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              user: User.empty(),
              paymentMethod: 'Payment Gateway',
              customerOpenItems: fakeCustomerOpenItemSelected,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              fakePaymentInfo,
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(const NewPaymentEvent.pay()),
        expect: () => [
          NewPaymentState.initial().copyWith(
            isLoading: true,
            selectedInvoices: fakeCustomerOpenItemSelected,
            paymentMethods: fakePaymentMethodValues,
            selectedPaymentMethod: fakePaymentMethodValues.first,
          ),
          NewPaymentState.initial().copyWith(
            paymentInfo: fakePaymentInfo,
            selectedInvoices: fakeCustomerOpenItemSelected,
            paymentMethods: fakePaymentMethodValues,
            selectedPaymentMethod: fakePaymentMethodValues.first,
          ),
        ],
      );
    },
  );

  group(
    'New Payment Bloc Update Payment Gateway',
    () {
      blocTest(
        'Update Payment Gateway called on MY market',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('2001')),
              uri: Uri.parse('https://fake-uri'),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        seed: () => NewPaymentState.initial().copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001')),
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentGateway(
            paymentUrl: Uri.parse('https://fake-uri'),
          ),
        ),
        verify: (NewPaymentBloc newPaymentBloc) {
          verify(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('2001')),
              uri: Uri.parse('https://fake-uri'),
            ),
          ).called(1);
        },
      );

      blocTest(
        'Update Payment Gateway not called on PH market',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2500')),
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentGateway(
            paymentUrl: Uri.parse('https://fake-uri'),
          ),
        ),
        verify: (NewPaymentBloc newPaymentBloc) {
          verifyNever(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('2500')),
              uri: Uri.parse('https://fake-uri'),
            ),
          );
        },
      );

      blocTest(
        'Update Payment Gateway called on VN market',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('3070')),
              uri: Uri.parse('https://fake-uri'),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        seed: () => NewPaymentState.initial().copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3070')),
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentGateway(
            paymentUrl: Uri.parse('https://fake-uri'),
          ),
        ),
        verify: (NewPaymentBloc newPaymentBloc) {
          verify(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('3070')),
              uri: Uri.parse('https://fake-uri'),
            ),
          ).called(1);
        },
      );

      blocTest(
        'Update Payment Gateway not called on TH market',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          isLoading: false,
          selectedInvoices: fakeCustomerOpenItemSelected,
          paymentMethods: fakePaymentMethodValues,
          selectedPaymentMethod: fakePaymentMethodValues.first,
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2902')),
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentGateway(
            paymentUrl: Uri.parse('https://fake-uri'),
          ),
        ),
        verify: (NewPaymentBloc newPaymentBloc) {
          verifyNever(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('2902')),
              uri: Uri.parse('https://fake-uri'),
            ),
          );
        },
      );

      blocTest(
        'Update Payment Gateway not called on SG market',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentGateway(
            paymentUrl: Uri.parse('https://fake-uri'),
          ),
        ),
        verify: (NewPaymentBloc newPaymentBloc) {
          verifyNever(
            () => newPaymentRepository.updatePaymentGateway(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('2601')),
              uri: Uri.parse('https://fake-uri'),
            ),
          );
        },
      );
    },
  );

  group(
    'New Payment Bloc Fetch Invoice Pdf',
    () {
      blocTest(
        'Fetch Invoice Pdf fail',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          isLoading: false,
          paymentInfo: fakePaymentInfo,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.getPaymentInvoiceInfoPdf(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              paymentInfo: fakePaymentInfo,
              user: User.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          const NewPaymentEvent.fetchInvoiceInfoPdf(),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            isFetchingInvoiceInfoPdf: true,
          ),
          NewPaymentState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest(
        'Fetch Invoice Pdf success',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        seed: () => NewPaymentState.initial().copyWith(
          isLoading: false,
          paymentInfo: fakePaymentInfo,
        ),
        setUp: () {
          when(
            () => newPaymentRepository.getPaymentInvoiceInfoPdf(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              paymentInfo: fakePaymentInfo,
              user: User.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              PaymentInvoiceInfoPdf.empty(),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          const NewPaymentEvent.fetchInvoiceInfoPdf(),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            isFetchingInvoiceInfoPdf: true,
          ),
          NewPaymentState.initial().copyWith(
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
          ),
        ],
      );
    },
  );

  group(
    'New Payment Bloc Save Invoice Pdf',
    () {
      blocTest(
        'save Invoice Pdf fail because permission',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => deviceRepository.getSavePermission(),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.saveInvoicePdf(
            dataInvoicePdf: Uint8List.fromList([0, 1]),
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            isSavingInvoicePdf: true,
          ),
          NewPaymentState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest(
        'Save Invoice Pdf fail',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => deviceRepository.getSavePermission(),
          ).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(
            () => newPaymentRepository.saveFile(
              pdfData: Uint8List.fromList([0, 1]),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.saveInvoicePdf(
            dataInvoicePdf: Uint8List.fromList([0, 1]),
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            isSavingInvoicePdf: true,
          ),
          NewPaymentState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest(
        'Save Invoice Pdf success',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        setUp: () {
          when(
            () => deviceRepository.getSavePermission(),
          ).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(
            () => newPaymentRepository.saveFile(
              pdfData: Uint8List.fromList([0, 1]),
            ),
          ).thenAnswer(
            (invocation) async => const Right(
              unit,
            ),
          );
        },
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.saveInvoicePdf(
            dataInvoicePdf: Uint8List.fromList([0, 1]),
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            isSavingInvoicePdf: true,
          ),
          NewPaymentState.initial(),
        ],
      );
    },
  );

  group(
    'Update Payment Method Selected',
    () {
      blocTest(
        'Update Payment Method Selected',
        build: () => NewPaymentBloc(
          newPaymentRepository: newPaymentRepository,
          deviceRepository: deviceRepository,
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updatePaymentMethodSelected(
            paymentMethodSelected: fakePaymentMethodValues.last,
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: fakePaymentMethodValues.last,
          ),
        ],
      );
    },
  );
}
