import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AllCreditsAndInvoicesRepositoryMock extends Mock
    implements AllCreditsAndInvoicesRepository {}

const _pageSize = 24;
void main() {
  late AllCreditsAndInvoicesRepository repository;
  late List<CreditAndInvoiceItem> fakeResult;
  late AllCreditsFilter allCreditsFilter;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AllCreditsAndInvoicesRepositoryMock();
  });

  setUp(() {
    fakeResult = [
      CreditAndInvoiceItem.empty(),
    ];
    allCreditsFilter = AllCreditsFilter.empty();
  });

  group(
    'All Credits Bloc Initialize',
    () {
      blocTest(
        'Initialize',
        build: () =>
            AllCreditsBloc(allCreditsAndInvoicesRepository: repository),
        act: (AllCreditsBloc bloc) =>
            bloc.add(const AllCreditsEvent.initialized()),
        expect: () => [AllCreditsState.initial()],
      );
    },
  );

  group(
    'All Credits Bloc Fetch',
    () {
      blocTest(
        'fetch -> credits fetch fail',
        build: () => AllCreditsBloc(
          allCreditsAndInvoicesRepository: repository,
        ),
        setUp: () {
          when(
            () => repository.filterCredits(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allCreditsFilter,
              offset: 0,
              pageSize: _pageSize,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (AllCreditsBloc bloc) => bloc.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
          ),
        ),
        expect: () => [
          AllCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AllCreditsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );
      blocTest(
        'fetch -> credits fetch success',
        build: () => AllCreditsBloc(
          allCreditsAndInvoicesRepository: repository,
        ),
        setUp: () {
          when(
            () => repository.filterCredits(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allCreditsFilter,
              offset: 0,
              pageSize: _pageSize,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeResult),
          );
        },
        act: (AllCreditsBloc bloc) => bloc.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
          ),
        ),
        expect: () => [
          AllCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AllCreditsState.initial().copyWith(
            items: fakeResult,
            failureOrSuccessOption: none(),
            canLoadMore: false,
          ),
        ],
      );
    },
  );

  group('All Credits Bloc load more', () {
    blocTest(
      'fetch -> credits load more fail',
      build: () => AllCreditsBloc(
        allCreditsAndInvoicesRepository: repository,
      ),
      seed: () => AllCreditsState.initial().copyWith(
        isLoading: false,
        items: List.filled(
          _pageSize,
          fakeResult.first,
        ),
      ),
      setUp: () {
        when(
          () => repository.filterCredits(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allCreditsFilter,
            offset: _pageSize,
            pageSize: _pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AllCreditsBloc bloc) => bloc.add(
        AllCreditsEvent.loadMore(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
        ),
      ),
      expect: () => [
        AllCreditsState.initial().copyWith(
          items: List.filled(
            _pageSize,
            CreditAndInvoiceItem.empty(),
          ),
          isLoading: true,
        ),
        AllCreditsState.initial().copyWith(
          items: List.filled(
            _pageSize,
            CreditAndInvoiceItem.empty(),
          ),
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'fetch -> credits load more success',
      build: () => AllCreditsBloc(
        allCreditsAndInvoicesRepository: repository,
      ),
      seed: () => AllCreditsState.initial().copyWith(
        isLoading: false,
        items: List.filled(
          _pageSize,
          fakeResult.first,
        ),
      ),
      setUp: () {
        when(
          () => repository.filterCredits(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allCreditsFilter,
            offset: _pageSize,
            pageSize: _pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            List.filled(
              _pageSize,
              fakeResult.first,
            ),
          ),
        );
      },
      act: (AllCreditsBloc bloc) => bloc.add(
        AllCreditsEvent.loadMore(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
        ),
      ),
      expect: () => [
        AllCreditsState.initial().copyWith(
          items: List.filled(
            _pageSize,
            fakeResult.first,
          ),
          isLoading: true,
        ),
        AllCreditsState.initial().copyWith(
          items: List.filled(
            _pageSize * 2,
            fakeResult.first,
          ),
        ),
      ],
    );
  });
}
