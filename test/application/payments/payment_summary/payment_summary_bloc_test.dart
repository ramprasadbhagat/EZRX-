import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details_response.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PaymentSummaryRepositoryMock extends Mock
    implements PaymentSummaryRepository {}

void main() {
  late PaymentSummaryRepository paymentSummaryMockRepository;
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockSalesOrganisation = SalesOrganisation.empty();
  late PaymentSummaryDetailsResponse paymentSummaryDetailsResponse;
  const offSet = 0;
  const pageSize = 24;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    paymentSummaryMockRepository = PaymentSummaryRepositoryMock();
    paymentSummaryDetailsResponse =
        await PaymentSummaryLocalDataSource().getPaymentSummary();
  });
  group('Payment Summary Bloc Test', () {
    blocTest<PaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "fetchPaymentSummaryList" Event Success',
      build: () => PaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            offset: offSet,
            pageSize: pageSize,
            paymentSummaryDetails: PaymentSummaryDetailsResponse.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentSummaryDetailsResponse),
        );
      },
      act: (PaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.fetchPaymentSummaryList(
          salesOrganization: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
        ),
      ),
      expect: () => [
        PaymentSummaryState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        PaymentSummaryState.initial().copyWith(
          paymentSummaryDetailsResponse: paymentSummaryDetailsResponse,
          isFetching: false,
        ),
      ],
    );
    blocTest<PaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "fetchPaymentSummaryList" Event failure',
      build: () => PaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            offset: offSet,
            pageSize: pageSize,
            paymentSummaryDetails: PaymentSummaryDetailsResponse.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (PaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.fetchPaymentSummaryList(
          salesOrganization: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
        ),
      ),
      expect: () => [
        PaymentSummaryState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        PaymentSummaryState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
          isFetching: false,
        ),
      ],
    );
    blocTest<PaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "loadMorePaymentSummary" Event Success',
      build: () => PaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            offset: offSet,
            pageSize: pageSize,
            paymentSummaryDetails: PaymentSummaryDetailsResponse.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(paymentSummaryDetailsResponse),
        );
      },
      act: (PaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.loadMorePaymentSummary(
          salesOrganization: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
        ),
      ),
      expect: () => [
        PaymentSummaryState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
          canLoadMorePaymentSummary: true,
          paymentSummaryDetailsResponse: paymentSummaryDetailsResponse,
        ),
        PaymentSummaryState.initial().copyWith(
          failureOrSuccessOption: none(),
          isFetching: false,
          canLoadMorePaymentSummary: false,
          paymentSummaryDetailsResponse: paymentSummaryDetailsResponse.copyWith(
            paymentSummaryList: [
              ...paymentSummaryDetailsResponse.paymentSummaryList,
              ...paymentSummaryDetailsResponse.paymentSummaryList
            ],
          ),
        ),
      ],
    );
    blocTest<PaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "loadMorePaymentSummary" Event failure',
      build: () => PaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            offset: offSet,
            pageSize: pageSize,
            paymentSummaryDetails: PaymentSummaryDetailsResponse.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (PaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.loadMorePaymentSummary(
          salesOrganization: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
        ),
      ),
      expect: () => [
        PaymentSummaryState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
          canLoadMorePaymentSummary: true,
          paymentSummaryDetailsResponse: paymentSummaryDetailsResponse,
        ),
        PaymentSummaryState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
          isFetching: false,
          paymentSummaryDetailsResponse: paymentSummaryDetailsResponse,
        ),
      ],
    );
  });
}
