import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AllCreditsAndInvoicesRepositoryMock extends Mock
    implements AllCreditsAndInvoicesRepository {}

void main() {
  late AllCreditsAndInvoicesRepository repository;
  late List<CreditAndInvoiceItem> fakeResult;
  late AllInvoicesFilter allInvoicesFilter;
  late Config config;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AllCreditsAndInvoicesRepositoryMock();
    config = Config()..appFlavor = Flavor.mock;
  });

  setUp(() {
    fakeResult = [
      CreditAndInvoiceItem.empty(),
    ];
    allInvoicesFilter = AllInvoicesFilter.empty();
  });

  group(
    'All Invoices Bloc Initialize',
    () {
      blocTest(
        'Initialize',
        build: () => AllInvoicesBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        act: (AllInvoicesBloc bloc) => bloc.add(
          AllInvoicesEvent.initialized(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
          ),
        ),
        expect: () => [
          AllInvoicesState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
          )
        ],
      );
    },
  );

  group(
    'All Invoices Bloc Fetch',
    () {
      blocTest(
        'fetch -> credits fetch fail',
        build: () => AllInvoicesBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        setUp: () {
          when(
            () => repository.filterInvoices(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allInvoicesFilter,
              offset: 0,
              pageSize: config.pageSize,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (AllInvoicesBloc bloc) => bloc.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.empty(),
          ),
        ),
        expect: () => [
          AllInvoicesState.initial().copyWith(
            isLoading: true,
          ),
          AllInvoicesState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest(
        'fetch -> invoices fetch success',
        build: () => AllInvoicesBloc(
          allCreditsAndInvoicesRepository: repository,
          config: config,
        ),
        setUp: () {
          when(
            () => repository.filterInvoices(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allInvoicesFilter,
              offset: 0,
              pageSize: config.pageSize,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeResult),
          );
        },
        act: (AllInvoicesBloc bloc) => bloc.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.empty(),
          ),
        ),
        expect: () => [
          AllInvoicesState.initial().copyWith(
            isLoading: true,
          ),
          AllInvoicesState.initial().copyWith(
            items: fakeResult,
            failureOrSuccessOption: optionOf(
              Right(
                fakeResult,
              ),
            ),
            canLoadMore: false,
          ),
        ],
      );
    },
  );

  group('All Invoices Bloc load more', () {
    blocTest(
      'fetch -> invoices load more fail',
      build: () => AllInvoicesBloc(
        allCreditsAndInvoicesRepository: repository,
        config: config,
      ),
      seed: () => AllInvoicesState.initial().copyWith(
        isLoading: false,
        items: List.filled(
          config.pageSize,
          fakeResult.first,
        ),
      ),
      setUp: () {
        when(
          () => repository.filterInvoices(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allInvoicesFilter,
            offset: config.pageSize,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AllInvoicesBloc bloc) => bloc.add(
        const AllInvoicesEvent.loadMore(),
      ),
      expect: () => [
        AllInvoicesState.initial().copyWith(
          items: List.filled(
            config.pageSize,
            CreditAndInvoiceItem.empty(),
          ),
          isLoading: true,
        ),
        AllInvoicesState.initial().copyWith(
          items: List.filled(
            config.pageSize,
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
      'fetch -> invoices load more success',
      build: () => AllInvoicesBloc(
        allCreditsAndInvoicesRepository: repository,
        config: config,
      ),
      seed: () => AllInvoicesState.initial().copyWith(
        isLoading: false,
        items: List.filled(
          config.pageSize,
          fakeResult.first,
        ),
      ),
      setUp: () {
        when(
          () => repository.filterInvoices(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allInvoicesFilter,
            offset: config.pageSize,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            List.filled(
              config.pageSize,
              fakeResult.first,
            ),
          ),
        );
      },
      act: (AllInvoicesBloc bloc) => bloc.add(
        const AllInvoicesEvent.loadMore(),
      ),
      expect: () => [
        AllInvoicesState.initial().copyWith(
          items: List.filled(
            config.pageSize,
            fakeResult.first,
          ),
          isLoading: true,
        ),
        AllInvoicesState.initial().copyWith(
          items: List.filled(
            config.pageSize * 2,
            fakeResult.first,
          ),
        ),
      ],
    );
  });
}
