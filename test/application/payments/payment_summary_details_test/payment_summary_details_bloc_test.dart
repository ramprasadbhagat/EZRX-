import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class PaymentSummaryDetailsRepositoryMock extends Mock
    implements PaymentSummaryDetailsRepository {}

void main() {
  late PaymentSummaryDetailsRepository paymentSummaryDetailsMockRepository;
  late PaymentSummaryDetails details;
  late List<PaymentItem> paymentList;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    paymentSummaryDetailsMockRepository = PaymentSummaryDetailsRepositoryMock();
    details = await PaymentItemLocalDataSource().getPaymentSummaryDetails();
    paymentList = await PaymentItemLocalDataSource().getPaymentItems();
  });
  group('Payment Summary Details Bloc Test', () {
    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      'initialized',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
      ),
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        const PaymentSummaryDetailsEvent.initialized(),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial(),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      'fetchPaymentSummaryDetailsInfo Event Success when payment batch aditional info is valid',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
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
          (invocation) async => Right(details),
        );
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            paymentSummaryDetails: details,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          paymentSummaryDetails: details,
        ),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          paymentSummaryDetails: details,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          isListLoading: true,
          paymentSummaryDetails: details,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          paymentSummaryDetails: details,
          paymentItemList: paymentList,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      'fetchPaymentSummaryDetailsInfo Event Success when payment batch aditional info is invalid',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
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
          (invocation) async => Right(details),
        );
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            paymentSummaryDetails: details,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          paymentSummaryDetails:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
        ),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          paymentSummaryDetails: details,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          isListLoading: true,
          paymentSummaryDetails: details,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          paymentSummaryDetails: details,
          paymentItemList: paymentList,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      'fetchPaymentSummaryList Event Success',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            paymentSummaryDetails: details,
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentList),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryList(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          paymentSummaryDetails: details,
        ),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          isListLoading: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          paymentItemList: paymentList,
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      'fetchPaymentSummaryDetailsInfo Event failed when payment batch aditional info is invalid',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
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
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          paymentSummaryDetails:
              details.copyWith(paymentBatchAdditionalInfo: StringValue('')),
        ),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
      ],
    );

    blocTest<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      'fetchPaymentSummaryList Event failed ',
      build: () => PaymentSummaryDetailsBloc(
        paymentItemRepository: paymentSummaryDetailsMockRepository,
      ),
      setUp: () {
        when(
          () => paymentSummaryDetailsMockRepository.fetchPaymentList(
            salesOrganization: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            paymentSummaryDetails: details,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      act: (PaymentSummaryDetailsBloc bloc) => bloc.add(
        PaymentSummaryDetailsEvent.fetchPaymentSummaryList(
          salesOrganization: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          paymentSummaryDetails: details,
        ),
      ),
      expect: () => [
        PaymentSummaryDetailsState.initial().copyWith(
          isListLoading: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
      ],
    );
  });
}
