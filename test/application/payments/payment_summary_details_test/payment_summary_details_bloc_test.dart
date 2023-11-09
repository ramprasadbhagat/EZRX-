import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/core/device/repository/device_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/bank_instruction_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class PaymentSummaryDetailsRepositoryMock extends Mock
    implements PaymentSummaryDetailsRepository {}

class NewPaymentRepositoryMock extends Mock implements NewPaymentRepository {}

class DeviceRepositoryMock extends Mock implements DeviceRepository {}

class BankInstructionRepositoryMock extends Mock
    implements BankInstructionRepository {}

void main() {
  late PaymentSummaryDetailsRepository paymentSummaryDetailsMockRepository;
  late NewPaymentRepository newPaymentRepository;
  late DeviceRepository deviceRepository;
  late BankInstructionRepository bankInstructionRepository;
  late PaymentSummaryDetails details;
  late List<PaymentItem> paymentList;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    paymentSummaryDetailsMockRepository = PaymentSummaryDetailsRepositoryMock();
    newPaymentRepository = NewPaymentRepositoryMock();
    deviceRepository = DeviceRepositoryMock();
    bankInstructionRepository = BankInstructionRepositoryMock();
    details = await PaymentItemLocalDataSource().getPaymentSummaryDetails();
    paymentList = await PaymentItemLocalDataSource().getPaymentItems();
  });
  group('Payment Summary Details Bloc Test', () {
    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      'initialized',
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
      'fetchPaymentSummaryDetailsInfo Event Success when payment batch aditional info is valid',
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
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            details: details,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
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
      'fetchPaymentSummaryDetailsInfo Event Success when payment batch aditional info is invalid',
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
      'fetchPaymentSummaryList Event Success',
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
      'fetchPaymentSummaryDetailsInfo Event failed when payment batch aditional info is invalid',
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
      'fetchPaymentSummaryList Event failed ',
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
  });
}
