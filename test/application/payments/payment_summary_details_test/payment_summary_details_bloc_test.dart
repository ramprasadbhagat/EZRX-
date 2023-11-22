import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/bank_instruction.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/device/repository/device_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/bank_instruction_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/bank_instruction_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_details_repository.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/create_payment_invoice_pdf.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class PaymentSummaryDetailsRepositoryMock extends Mock
    implements PaymentSummaryDetailsRepository {}

class NewPaymentRepositoryMock extends Mock implements NewPaymentRepository {}

class DeviceRepositoryMock extends Mock implements DeviceRepository {}

class BankInstructionRepositoryMock extends Mock
    implements BankInstructionRepository {}

class CreatePaymentInvoicePdfMock extends Mock
    implements CreatePaymentInvoicePdf {}

void main() {
  late PaymentSummaryDetailsRepository paymentSummaryDetailsMockRepository;
  late NewPaymentRepository newPaymentRepository;
  late DeviceRepository deviceRepository;
  late BankInstructionRepository bankInstructionRepository;
  late PaymentSummaryDetails details;
  late List<PaymentItem> paymentList;
  late BankInstruction bankInstruction;
  late CustomerPaymentInfo customerPaymentInfo;
  late CreatePaymentInvoicePdf createPaymentInvoice;
  late Uint8List fakeRawFile;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    paymentSummaryDetailsMockRepository = PaymentSummaryDetailsRepositoryMock();
    newPaymentRepository = NewPaymentRepositoryMock();
    deviceRepository = DeviceRepositoryMock();
    bankInstructionRepository = BankInstructionRepositoryMock();
    createPaymentInvoice = CreatePaymentInvoicePdfMock();
    details = await PaymentItemLocalDataSource().getPaymentSummaryDetails();
    paymentList = await PaymentItemLocalDataSource().getPaymentItems();
    bankInstruction = await BankInstructionLocalDataSource()
        .getBankInstruction(details.bankIdentification);
    fakeRawFile = Uint8List.fromList([1, 2, 3, 4, 5]);
    customerPaymentInfo = CustomerPaymentInfo.empty().copyWith(
      paymentBatchAdditionalInfo: details.paymentBatchAdditionalInfo.getValue(),
      paymentID: details.paymentID.getValue(),
      accountingDocExternalReference: details.accountingDocExternalReference,
    );
  });
  group('Payment Summary Details Bloc Test', () {
    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> initialized',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.initialized(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          shipToInfo: fakeShipToInfo,
        ),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          shipToInfo: fakeShipToInfo,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event success when market is Indonesia',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeIDSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: customerPaymentInfo,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeIDSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            paymentId: details.paymentID,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
        when(
          () => bankInstructionRepository.getBankInstruction(
            bankIdentification: details.bankIdentification,
          ),
        ).thenAnswer(
          (invocation) async => Right(bankInstruction),
        );
      },
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details: details,
        ),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          isDetailFetching: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          details: details,
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          bankInstruction: bankInstruction,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event success when market is not Indonesia',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      setUp: () {
        final customerPaymentInfo = CustomerPaymentInfo.empty().copyWith(
          paymentBatchAdditionalInfo:
              details.paymentBatchAdditionalInfo.getValue(),
          paymentID: details.paymentID.getValue(),
          accountingDocExternalReference:
              details.accountingDocExternalReference,
        );
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: customerPaymentInfo,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            paymentId: details.paymentID,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
        );
      },
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details: details,
        ),
      ),
      skip: 4,
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          details: details.copyWith(
            paymentItems: paymentList,
          ),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event success when payment batch aditional info is valid',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      setUp: () {
        final customerPaymentInfo = CustomerPaymentInfo.empty().copyWith(
          paymentBatchAdditionalInfo:
              details.paymentBatchAdditionalInfo.getValue(),
          paymentID: details.paymentID.getValue(),
          accountingDocExternalReference:
              details.accountingDocExternalReference,
        );
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: customerPaymentInfo,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            paymentId: details.paymentID,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
        );
      },
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
        ),
      ),
      skip: 5,
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          details: details.copyWith(
            paymentItems: paymentList,
          ),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event success when payment batch aditional info is invalid',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      setUp: () {
        final customerPaymentInfo = CustomerPaymentInfo.empty().copyWith(
          paymentBatchAdditionalInfo:
              details.paymentBatchAdditionalInfo.getValue(),
          paymentID: details.paymentID.getValue(),
          accountingDocExternalReference:
              details.accountingDocExternalReference,
        );
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: customerPaymentInfo,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            paymentId: details.paymentID,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          ),
        );
        when(
          () => bankInstructionRepository.getBankInstruction(
            bankIdentification: details.bankIdentification,
          ),
        ).thenAnswer(
          (invocation) async => Right(bankInstruction),
        );
      },
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
        ),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          isDetailFetching: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          isDetailFetching: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
          bankInstruction: bankInstruction,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryDetailsInfo event failed when payment batch aditional info is invalid',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository
              .fetchPaymentSummaryDetailsInfo(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            paymentId: details.paymentID,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: CustomerPaymentInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
      },
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          details:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
        ),
      ),
      skip: 1,
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryList event success',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
        );
        final customerPaymentInfo = CustomerPaymentInfo.empty().copyWith(
          paymentBatchAdditionalInfo:
              details.paymentBatchAdditionalInfo.getValue(),
          paymentID: details.paymentID.getValue(),
          accountingDocExternalReference:
              details.accountingDocExternalReference,
        );
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: customerPaymentInfo,
          ),
        ).thenAnswer(
          (invocation) async => Right(PaymentInvoiceInfoPdf.empty()),
        );
      },
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.fetchPaymentSummaryList(),
      ),
      skip: 3,
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details.copyWith(paymentItems: paymentList),
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchPaymentSummaryList event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.fetchPaymentSummaryList(),
      ),
      skip: 1,
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          details: details,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchBankInstruction event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      setUp: () {
        when(
          () => bankInstructionRepository.getBankInstruction(
            bankIdentification: details.bankIdentification,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.fetchBankInstruction(),
      ),
      skip: 1,
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          details: details,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> fetchAdvice event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getPaymentInvoiceInfoPdf(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeClientUser,
            paymentInfo: customerPaymentInfo,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.fetchAdvice(),
      ),
      skip: 1,
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          details: details,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> saveAdvice event success',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => deviceRepository.getSavePermission(),
        ).thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => createPaymentInvoice.createInvoicePdf(
            salesOrganisation: fakeSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
            shipToInfo: fakeShipToInfo,
            createdDate: DateTimeStringValue(''),
            adviceExpiry: AdviceExpiryValue(''),
          ),
        ).thenAnswer(
          (_) => Future.value(fakeRawFile),
        );

        when(
          () => newPaymentRepository.saveFile(
            pdfData: fakeRawFile,
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.saveAdvice(),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          isSavingAdvice: true,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> saveAdvice event failed when getSavePermission error',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => deviceRepository.getSavePermission(),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.saveAdvice(),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          isSavingAdvice: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> saveAdvice event failed when saveFile error',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeIDSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => deviceRepository.getSavePermission(),
        ).thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => createPaymentInvoice.createInvoicePdf(
            salesOrganisation: fakeSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
            shipToInfo: fakeShipToInfo,
            createdDate: DateTimeStringValue(''),
            adviceExpiry: AdviceExpiryValue(''),
          ),
        ).thenAnswer(
          (_) => Future.value(fakeRawFile),
        );

        when(
          () => newPaymentRepository.saveFile(
            pdfData: fakeRawFile,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.saveAdvice(),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
          details: details,
          isSavingAdvice: true,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> deleteAdvice event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.deletePaymentAdvice(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            paymentSummaryDetails: details,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.deleteAdvice(),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
          isDeletingPayment: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> deleteAdvice Event success ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.deletePaymentAdvice(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            paymentSummaryDetails: details,
          ),
        ).thenAnswer(
          (invocation) async => const Right(true),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.deleteAdvice(),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
          isDeletingPayment: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> cancelAdvice event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.cancelPaymentAdvice(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeSalesOrganisation,
            referenceId: details.paymentID.getValue(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.cancelAdvice(),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
          isCancelingAdvice: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      '=> cancelAdvice Event success ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
        newPaymentRepository: newPaymentRepository,
        deviceRepository: deviceRepository,
        bankInstructionRepository: bankInstructionRepository,
      ),
      seed: () => PaymentSummaryDetailsState.initial().copyWith(
        salesOrganization: fakeSalesOrganisation,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        user: fakeClientUser,
        details: details,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.cancelPaymentAdvice(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeSalesOrganisation,
            referenceId: details.paymentID.getValue(),
          ),
        ).thenAnswer(
          (invocation) async => const Right('success'),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.cancelAdvice(),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
          isCancelingAdvice: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          details: details,
        ),
      ],
    );
  });
}
