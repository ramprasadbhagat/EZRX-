import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NewPaymentRepositoryMock extends Mock implements NewPaymentRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late NewPaymentRepository newPaymentRepositoryMock;
  late List<CustomerOpenItem> openItems;

  group(
    'Available_Credit_Bloc Test => ',
    () {
      setUp(() async {
        newPaymentRepositoryMock = NewPaymentRepositoryMock();
        openItems = await NewPaymentLocalDataSource().getCustomerOpenItems();
      });

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "initialized" Event',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
        ),
        act: (bloc) => bloc.add(const AvailableCreditsEvent.initialized()),
        expect: () => [AvailableCreditsState.initial()],
      );

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "fetch" Event with failure',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
        ),
        setUp: () {
          when(
            () => newPaymentRepositoryMock.getAvailableCreditNotes(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              pageSize: 24,
              offset: 0,
              appliedFilter: AvailableCreditFilter.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (bloc) => bloc.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          AvailableCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AvailableCreditsState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          )
        ],
      );

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "fetch" Event with success',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
        ),
        setUp: () {
          when(
            () => newPaymentRepositoryMock.getAvailableCreditNotes(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              pageSize: 24,
              offset: 0,
              appliedFilter: AvailableCreditFilter.empty(),
            ),
          ).thenAnswer((invocation) async => Right(openItems));
        },
        act: (bloc) => bloc.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          AvailableCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AvailableCreditsState.initial().copyWith(
            items: openItems,
            canLoadMore: false,
          )
        ],
      );

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "loadMore" Event with failure',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
        ),
        seed: () => AvailableCreditsState.initial().copyWith(
          appliedFilter: AvailableCreditFilter.empty(),
          items: openItems,
        ),
        setUp: () {
          when(
            () => newPaymentRepositoryMock.getAvailableCreditNotes(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              pageSize: 24,
              offset: openItems.length,
              appliedFilter: AvailableCreditFilter.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (bloc) => bloc.add(
          AvailableCreditsEvent.loadMore(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          AvailableCreditsState.initial().copyWith(
            items: openItems,
            isLoading: true,
          ),
          AvailableCreditsState.initial().copyWith(
            items: openItems,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          )
        ],
      );

      blocTest<AvailableCreditsBloc, AvailableCreditsState>(
        'For "loadMore" Event with success',
        build: () => AvailableCreditsBloc(
          newPaymentRepository: newPaymentRepositoryMock,
        ),
        seed: () => AvailableCreditsState.initial().copyWith(
          appliedFilter: AvailableCreditFilter.empty(),
          items: openItems,
        ),
        setUp: () {
          when(
            () => newPaymentRepositoryMock.getAvailableCreditNotes(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              pageSize: 24,
              offset: openItems.length,
              appliedFilter: AvailableCreditFilter.empty(),
            ),
          ).thenAnswer((invocation) async => Right(openItems));
        },
        act: (bloc) => bloc.add(
          AvailableCreditsEvent.loadMore(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          AvailableCreditsState.initial().copyWith(
            items: openItems,
            isLoading: true,
          ),
          AvailableCreditsState.initial().copyWith(
            canLoadMore: false,
            items: List<CustomerOpenItem>.from(openItems)..addAll(openItems),
          )
        ],
      );
    },
  );
}
