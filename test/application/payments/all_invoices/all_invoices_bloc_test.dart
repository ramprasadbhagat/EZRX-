import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/invoice_order_item.dart';
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
  late List<InvoiceOrderItem> invoiceOrderItems;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AllCreditsAndInvoicesRepositoryMock();
    config = Config()..appFlavor = Flavor.mock;
  });

  setUp(() async {
    fakeResult = [
      CreditAndInvoiceItem.empty(),
    ];
    allInvoicesFilter = AllInvoicesFilter.empty();
    exception = const ApiFailure.other('fake-error');
    creditAndInvoiceItemList =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();
    invoiceOrderItems =
        await AllCreditsAndInvoicesLocalDataSource().getOrderForInvoice();
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
            (invocation) async => Left(exception),
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
            failureOrSuccessOption: optionOf(Left(exception)),
          ),
        ],
      );

      blocTest(
        'fetch -> invoices fetch success fetch order fail',
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
          when(
            () => repository.fetchOrder(
              invoices: creditAndInvoiceItemList,
            ),
          ).thenAnswer(
            (invocation) async => Left(exception),
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
            items: creditAndInvoiceItemList,
            failureOrSuccessOption: optionOf(
              Right(
                creditAndInvoiceItemList,
              ),
            ),
            canLoadMore: false,
          ),
          AllInvoicesState.initial().copyWith(
            items: creditAndInvoiceItemList,
            canLoadMore: false,
          ),
          AllInvoicesState.initial().copyWith(
            items: creditAndInvoiceItemList
                .map((e) => e.copyWith(isLoadingOrder: false))
                .toList(),
            failureOrSuccessOption: optionOf(
              Left(exception),
            ),
            canLoadMore: false,
          ),
        ],
      );
      blocTest(
        'fetch -> invoices fetch success fetch order success',
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
          when(
            () => repository.fetchOrder(
              invoices: creditAndInvoiceItemList,
            ),
          ).thenAnswer(
            (invocation) async => Right(invoiceOrderItems),
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
            items: creditAndInvoiceItemList,
            failureOrSuccessOption: optionOf(
              Right(
                creditAndInvoiceItemList,
              ),
            ),
            canLoadMore: false,
          ),
          AllInvoicesState.initial().copyWith(
            items: creditAndInvoiceItemList,
            canLoadMore: false,
          ),
          AllInvoicesState.initial().copyWith(
            items: creditAndInvoiceItemList
                .map(
                  (e) => e.copyWith(
                    isLoadingOrder: false,
                    orderId: invoiceOrderItems
                        .firstWhere(
                          (element) => element.invoiceId == e.searchKey,
                          orElse: () => InvoiceOrderItem.empty(),
                        )
                        .orderId,
                  ),
                )
                .toList(),
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
          fakeResult.first.copyWith(isLoadingOrder: false),
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
            CreditAndInvoiceItem.empty().copyWith(isLoadingOrder: false),
          ),
          isLoading: true,
        ),
        AllInvoicesState.initial().copyWith(
          items: List.filled(
            config.pageSize,
            CreditAndInvoiceItem.empty(),
          ).map((e) => e.copyWith(isLoadingOrder: false)).toList(),
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
        when(
          () => repository.fetchOrder(
            invoices: List.filled(
              config.pageSize,
              fakeResult.first,
            ),
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
        AllInvoicesState.initial().copyWith(
          items: List.filled(
            config.pageSize * 2,
            fakeResult.first.copyWith(isLoadingOrder: false),
          ),
          failureOrSuccessOption: optionOf(
            Left(exception),
          ),
        ),
      ],
    );
  });
}
