import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AllCreditsAndInvoicesRepositoryMock extends Mock
    implements AllCreditsAndInvoicesRepository {}

void main() {
  late Config config;
  late ApiFailure exception;
  late AllInvoicesFilter allInvoicesFilter;
  late List<CreditAndInvoiceItem> fakeResult;
  late AllCreditsAndInvoicesRepository repository;
  late List<CreditAndInvoiceItem> creditAndInvoiceItemList;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AllCreditsAndInvoicesRepositoryMock();
    config = Config()..appFlavor = Flavor.mock;
  });

  setUp(() async {
    fakeResult = [
      CreditAndInvoiceItem.empty(),
    ];
    allInvoicesFilter = AllInvoicesFilter.defaultFilter();
    exception = const ApiFailure.other('fake-error');
    creditAndInvoiceItemList =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();
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
          ),
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
            (invocation) async => Left(exception),
          );
        },
        act: (AllInvoicesBloc bloc) => bloc.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        ),
        expect: () => [
          AllInvoicesState.initial().copyWith(
            isLoading: true,
          ),
          AllInvoicesState.initial().copyWith(
            failureOrSuccessOption: optionOf(Left(exception)),
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
            (invocation) async => Right(creditAndInvoiceItemList),
          );
        },
        act: (AllInvoicesBloc bloc) => bloc.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        ),
        expect: () => [
          AllInvoicesState.initial().copyWith(
            isLoading: true,
          ),
          AllInvoicesState.initial().copyWith(
            items: creditAndInvoiceItemList,
            failureOrSuccessOption: optionOf(
              Right(
                creditAndInvoiceItemList,
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
          (invocation) async => Left(exception),
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
          failureOrSuccessOption: optionOf(Left(exception)),
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
        items: creditAndInvoiceItemList,
        appliedFilter: allInvoicesFilter,
      ),
      setUp: () {
        when(
          () => repository.filterInvoices(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allInvoicesFilter,
            offset: creditAndInvoiceItemList.length,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(creditAndInvoiceItemList),
        );
      },
      act: (AllInvoicesBloc bloc) => bloc.add(
        const AllInvoicesEvent.loadMore(),
      ),
      expect: () {
        final newList = [
          ...creditAndInvoiceItemList,
          ...creditAndInvoiceItemList,
        ];
        return [
          AllInvoicesState.initial().copyWith(
            items: creditAndInvoiceItemList,
            appliedFilter: allInvoicesFilter,
            isLoading: true,
          ),
          AllInvoicesState.initial().copyWith(
            appliedFilter: allInvoicesFilter,
            items: newList,
            canLoadMore: false,
          ),
        ];
      },
    );
  });
}
