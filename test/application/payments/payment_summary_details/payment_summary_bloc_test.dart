import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class PaymentSummaryRepositoryMock extends Mock
    implements PaymentSummaryRepository {}

void main() {
  late PaymentSummaryRepository paymentSummaryMockRepository;
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockSalesOrganisation = SalesOrganisation.empty();
  late List<PaymentSummaryDetails> details;
  late Config config;
  const offSet = 0;
  const pageSize = 24;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    paymentSummaryMockRepository = PaymentSummaryRepositoryMock();
    details = <PaymentSummaryDetails>[];
    config = Config()..appFlavor = Flavor.mock;
  });
  group('Payment Summary Bloc Test', () {
    blocTest<PaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "fetchPaymentSummaryList" Event Success',
      build: () => PaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      seed: () => PaymentSummaryState.initial().copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            filter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            offset: offSet,
            pageSize: pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
      },
      act: (PaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.fetch(
          appliedFilter: PaymentSummaryFilter.empty(),
          searchKey: SearchKey.searchFilter(''),
        ),
      ),
      expect: () => [
        PaymentSummaryState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        PaymentSummaryState.initial().copyWith(
          details: details,
          canLoadMore: false,
        ),
      ],
    );
    blocTest<PaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "fetchPaymentSummaryList" Event failure',
      build: () => PaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      seed: () => PaymentSummaryState.initial().copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            filter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            offset: offSet,
            pageSize: pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (PaymentSummaryBloc bloc) => bloc.add(
        PaymentSummaryEvent.fetch(
          appliedFilter: PaymentSummaryFilter.empty(),
          searchKey: SearchKey.searchFilter(''),
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
        config: config,
      ),
      seed: () => PaymentSummaryState.initial().copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            filter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            offset: offSet,
            pageSize: pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(details),
        );
      },
      act: (PaymentSummaryBloc bloc) => bloc.add(
        const PaymentSummaryEvent.loadMore(),
      ),
      expect: () => [
        PaymentSummaryState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
          canLoadMore: true,
        ),
        PaymentSummaryState.initial().copyWith(
          failureOrSuccessOption: none(),
          isFetching: false,
          canLoadMore: false,
          details: [...details, ...details],
        ),
      ],
    );
    blocTest<PaymentSummaryBloc, PaymentSummaryState>(
      'Payment Summary "loadMorePaymentSummary" Event failure',
      build: () => PaymentSummaryBloc(
        paymentSummaryRepository: paymentSummaryMockRepository,
        config: config,
      ),
      seed: () => PaymentSummaryState.initial().copyWith(
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganization: mockSalesOrganisation,
      ),
      setUp: () {
        when(
          () => paymentSummaryMockRepository.fetchPaymentSummaryList(
            filter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
            customerCodeInfo: mockCustomerCodeInfo,
            salesOrganization: mockSalesOrganisation,
            offset: offSet,
            pageSize: pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (PaymentSummaryBloc bloc) => bloc.add(
        const PaymentSummaryEvent.loadMore(),
      ),
      expect: () => [
        PaymentSummaryState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
          canLoadMore: true,
        ),
        PaymentSummaryState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
          isFetching: false,
        ),
      ],
    );
  });
}
