import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AllCreditsAndInvoicesRepositoryMock extends Mock
    implements AllCreditsAndInvoicesRepository {}

const _pageSize = 20;
void main() {
  late AllCreditsAndInvoicesRepository repository;
  late CustomerDocumentHeader fakeResult;
  late List<CreditAndInvoiceItem> invoiceList;
  late AllInvoicesFilter allInvoicesFilter;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AllCreditsAndInvoicesRepositoryMock();
  });

  setUp(() {
    invoiceList = [
      CreditAndInvoiceItem.empty(),
    ];
    fakeResult = CustomerDocumentHeader.empty()
        .copyWith(invoices: invoiceList, totalCount: 1);
    allInvoicesFilter = AllInvoicesFilter.empty();
  });

  group(
    'All Invoices Bloc Initialize',
    () {
      blocTest('Initialize',
          build: () =>
              AllInvoicesBloc(allCreditsAndInvoicesRepository: repository),
          act: (AllInvoicesBloc bloc) =>
              bloc.add(const AllInvoicesEvent.initialized()),
          expect: () => [AllInvoicesState.initial()]);
    },
  );

  group(
    'All Invoices Bloc Fetch',
    () {
      blocTest(
        'fetch -> invoices fetch fail',
        build: () => AllInvoicesBloc(
          allCreditsAndInvoicesRepository: repository,
        ),
        setUp: () {
          when(
            () => repository.filterInvoices(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allInvoicesFilter,
              offset: 0,
              pageSize: 20,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (AllInvoicesBloc bloc) => bloc.add(
          AllInvoicesEvent.fetch(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allInvoicesFilter,
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
        ),
        setUp: () {
          when(
            () => repository.filterInvoices(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allInvoicesFilter,
              offset: 0,
              pageSize: 20,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeResult),
          );
        },
        act: (AllInvoicesBloc bloc) => bloc.add(
          AllInvoicesEvent.fetch(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allInvoicesFilter,
          ),
        ),
        expect: () => [
          AllInvoicesState.initial().copyWith(
            isLoading: true,
          ),
          AllInvoicesState.initial().copyWith(
            invoices: invoiceList,
            failureOrSuccessOption: none(),
            canLoadMore: false,
            totalCount: 1,
          ),
        ],
      );
    },
  );

  group(
    'All Invoices Bloc load more',
    () {
      blocTest(
        'fetch -> invoices load more fail',
        build: () => AllInvoicesBloc(
          allCreditsAndInvoicesRepository: repository,
        ),
        seed: () => AllInvoicesState.initial().copyWith(
          isLoading: false,
          invoices: List.filled(
            _pageSize,
            CreditAndInvoiceItem.empty(),
          ),
          totalCount: 1,
        ),
        setUp: () {
          when(
            () => repository.filterInvoices(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allInvoicesFilter,
              offset: _pageSize,
              pageSize: _pageSize,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (AllInvoicesBloc bloc) => bloc.add(
          AllInvoicesEvent.loadMore(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allInvoicesFilter,
          ),
        ),
        expect: () => [
          AllInvoicesState.initial().copyWith(
              invoices: List.filled(
                _pageSize,
                CreditAndInvoiceItem.empty(),
              ),
              isLoading: true,
              totalCount: 1),
          AllInvoicesState.initial().copyWith(
              invoices: List.filled(
                _pageSize,
                CreditAndInvoiceItem.empty(),
              ),
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-error'),
                ),
              ),
              totalCount: 1),
        ],
      );

      blocTest(
        'fetch -> invoices load more success',
        build: () => AllInvoicesBloc(
          allCreditsAndInvoicesRepository: repository,
        ),
        seed: () => AllInvoicesState.initial().copyWith(
          isLoading: false,
          invoices: List.filled(
            _pageSize,
            CreditAndInvoiceItem.empty(),
          ),
          totalCount: _pageSize * 2,
        ),
        setUp: () {
          when(
            () => repository.filterInvoices(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              filter: allInvoicesFilter,
              offset: _pageSize,
              pageSize: _pageSize,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              CustomerDocumentHeader.empty().copyWith(
                invoices: List.filled(
                  _pageSize,
                  invoiceList.first,
                ),
                totalCount: _pageSize * 2,
              ),
            ),
          );
        },
        act: (AllInvoicesBloc bloc) => bloc.add(
          AllInvoicesEvent.loadMore(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            filter: allInvoicesFilter,
          ),
        ),
        expect: () => [
          AllInvoicesState.initial().copyWith(
            invoices: List.filled(
              _pageSize,
              CreditAndInvoiceItem.empty(),
            ),
            isLoading: true,
            totalCount: _pageSize * 2,
          ),
          AllInvoicesState.initial().copyWith(
            invoices: List.filled(
              _pageSize * 2,
              CreditAndInvoiceItem.empty(),
            ),
            totalCount: _pageSize * 2,
          ),
        ],
      );
    },
  );
}
