import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/domain/payments/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAllCreditsRepository extends Mock
    implements AllCreditsAndInvoicesRepository {}

const _pageSize = 24;

void main() {
  late MockAllCreditsRepository mockAllCreditsRepository;
  late AllCreditsFilter allCreditsFilter;
  late CustomerDocumentHeader credits;
  late List<CreditAndInvoiceItem> creditItems;
  final fakeToDate = DateTime.now();
  final fakeFromDate = DateTime.now().subtract(
    const Duration(days: 28),
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    mockAllCreditsRepository = MockAllCreditsRepository();
    credits = await AllCreditsAndInvoicesLocalDataSource()
        .getCustomerDocumentHeader();
    creditItems = [credits.invoices.first];
    allCreditsFilter = AllCreditsFilter.empty().copyWith(
      documentDateTo: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
      documentDateFrom: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
      sortBy: 'All',
      documentNumber: DocumentNumber('mock_documentNumber'),
      creditAmountTo: RangeValue('100'),
      creditAmountFrom: RangeValue('1000'),
    );
  });

  group(
    'All Credits Bloc',
    () {
      blocTest(
        'Initialize',
        build: () => AllCreditsBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        act: (AllCreditsBloc bloc) =>
            bloc.add(const AllCreditsEvent.initialized()),
        expect: () => [AllCreditsState.initial()],
      );

      blocTest(
        'Fetch success',
        build: () => AllCreditsBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        setUp: () {
          when(() => mockAllCreditsRepository.getAllCredits(
                pageSize: _pageSize,
                offset: 0,
                customerCodeInfo: CustomerCodeInfo.empty()
                    .copyWith(customerCodeSoldTo: '0030032223'),
                salesOrganisation: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2601')),
                allCreditsFilter: allCreditsFilter,
              )).thenAnswer(
            (invocation) async => Right(
                CustomerDocumentHeader(invoices: creditItems, totalCount: 0)),
          );
        },
        act: (AllCreditsBloc bloc) =>
            bloc.add(AllCreditsEvent.fetchAllCreditsList(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: '0030032223'),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          allCreditsFilter: allCreditsFilter,
        )),
        expect: () => [
          AllCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AllCreditsState.initial().copyWith(
              isLoading: false, credits: creditItems, canLoadMore: false),
        ],
      );
      blocTest(
        'Fetch failure',
        build: () => AllCreditsBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        setUp: () {
          when(() => mockAllCreditsRepository.getAllCredits(
                pageSize: _pageSize,
                offset: 0,
                customerCodeInfo: CustomerCodeInfo.empty()
                    .copyWith(customerCodeSoldTo: '0030032223'),
                salesOrganisation: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2601')),
                allCreditsFilter: allCreditsFilter,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('mock-error'),
            ),
          );
        },
        act: (AllCreditsBloc bloc) =>
            bloc.add(AllCreditsEvent.fetchAllCreditsList(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: '0030032223'),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          allCreditsFilter: allCreditsFilter,
        )),
        expect: () => [
          AllCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AllCreditsState.initial().copyWith(
            isLoading: false,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          ),
        ],
      );
      blocTest(
        'Load More success',
        build: () => AllCreditsBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        setUp: () {
          when(() => mockAllCreditsRepository.getAllCredits(
                pageSize: _pageSize,
                offset: 0,
                customerCodeInfo: CustomerCodeInfo.empty()
                    .copyWith(customerCodeSoldTo: '0030032223'),
                salesOrganisation: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2601')),
                allCreditsFilter: allCreditsFilter,
              )).thenAnswer(
            (invocation) async => Right(
                CustomerDocumentHeader(invoices: creditItems, totalCount: 0)),
          );
        },
        act: (AllCreditsBloc bloc) =>
            bloc.add(AllCreditsEvent.loadMoreAllCreditsList(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: '0030032223'),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          allCreditsFilter: allCreditsFilter,
        )),
        expect: () => [
          AllCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AllCreditsState.initial().copyWith(
            isLoading: false,
            canLoadMore: false,
            credits: creditItems,
          ),
        ],
      );
      blocTest(
        'Load More success',
        build: () => AllCreditsBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        setUp: () {
          when(() => mockAllCreditsRepository.getAllCredits(
                pageSize: _pageSize,
                offset: 0,
                customerCodeInfo: CustomerCodeInfo.empty()
                    .copyWith(customerCodeSoldTo: '0030032223'),
                salesOrganisation: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2601')),
                allCreditsFilter: allCreditsFilter,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('mock-error'),
            ),
          );
        },
        act: (AllCreditsBloc bloc) =>
            bloc.add(AllCreditsEvent.loadMoreAllCreditsList(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: '0030032223'),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          allCreditsFilter: allCreditsFilter,
        )),
        expect: () => [
          AllCreditsState.initial().copyWith(
            isLoading: true,
          ),
          AllCreditsState.initial().copyWith(
            isLoading: false,
            canLoadMore: true,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          ),
        ],
      );
    },
  );
}
