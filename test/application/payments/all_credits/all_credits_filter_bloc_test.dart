import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/available_statuses.dart';
import 'package:ezrxmobile/domain/payments/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

class MockAllCreditsRepository extends Mock
    implements AllCreditsAndInvoicesRepository {}

void main() {
  late MockAllCreditsRepository mockAllCreditsRepository;

  late AllCreditsFilter allCreditsFilter;

  final fakeToDate = DateTime.parse(
    DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyy-MM-dd').format(
      DateTime.now().subtract(
        const Duration(days: 28),
      ),
    ),
  );
  final dateTimeRange = DateTimeRange(
    start: fakeFromDate,
    end: fakeToDate,
  );
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockAllCreditsRepository = MockAllCreditsRepository();

    allCreditsFilter = AllCreditsFilter.empty();
  });

  group(
    'All Credits Filter Bloc',
    () {
      blocTest(
        'Initialize',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        act: (AllCreditsFilterBloc bloc) =>
            bloc.add(const AllCreditsFilterEvent.initialized()),
        expect: () => [
          isA<AllCreditsFilterState>(),
        ],
      );
      blocTest(
        'Fetch success',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        setUp: () {
          when(() => mockAllCreditsRepository.getAvailableStatusesForAllCredits(
                salesOrganisation: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2601')),
              )).thenAnswer(
            (invocation) async => Right(AvailableStatuses(statuses: ['Open'])),
          );
        },
        act: (AllCreditsFilterBloc bloc) =>
            bloc.add(AllCreditsFilterEvent.fetch(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
        )),
        expect: () => [
          AllCreditsFilterState.initial()
              .copyWith(isFetching: true, allCreditsStatuses: <String>['All']),
          AllCreditsFilterState.initial().copyWith(
            isFetching: false,
            allCreditsStatuses: <String>['All', 'Open'],
          ),
        ],
      );
      blocTest(
        'Fetch failure',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        setUp: () {
          when(() => mockAllCreditsRepository.getAvailableStatusesForAllCredits(
                salesOrganisation: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2601')),
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('mock-error'),
            ),
          );
        },
        act: (AllCreditsFilterBloc bloc) =>
            bloc.add(AllCreditsFilterEvent.fetch(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
        )),
        expect: () => [
          AllCreditsFilterState.initial()
              .copyWith(isFetching: true, allCreditsStatuses: <String>['All']),
          AllCreditsFilterState.initial().copyWith(
            isFetching: false,
            allCreditsStatuses: <String>['All'],
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          ),
        ],
      );

      blocTest(
        'DocumentNumber Changed',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        seed: () => AllCreditsFilterState.initial()
            .copyWith(allCreditsFilter: allCreditsFilter),
        act: (AllCreditsFilterBloc bloc) => bloc.add(
            AllCreditsFilterEvent.documentNumberChanged(
                DocumentNumber('mock_documentNumber'))),
        expect: () => [
          AllCreditsFilterState.initial().copyWith(
            allCreditsFilter: allCreditsFilter.copyWith(
              documentNumber: DocumentNumber('mock_documentNumber'),
            ),
          ),
        ],
      );

      blocTest(
        'CreditAmountTo Changed',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        seed: () => AllCreditsFilterState.initial()
            .copyWith(allCreditsFilter: allCreditsFilter),
        act: (AllCreditsFilterBloc bloc) =>
            bloc.add(const AllCreditsFilterEvent.creditAmountToChanged('1000')),
        expect: () => [
          AllCreditsFilterState.initial().copyWith(
            allCreditsFilter: allCreditsFilter.copyWith(
              creditAmountTo: DoubleValue('1000'),
            ),
            showErrorMessages: false,
          ),
        ],
      );

      blocTest(
        'CreditAmountFrom Changed',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        seed: () => AllCreditsFilterState.initial()
            .copyWith(allCreditsFilter: allCreditsFilter),
        act: (AllCreditsFilterBloc bloc) => bloc
            .add(const AllCreditsFilterEvent.creditAmountFromChanged('100')),
        expect: () => [
          AllCreditsFilterState.initial().copyWith(
            allCreditsFilter: allCreditsFilter.copyWith(
              creditAmountFrom: DoubleValue('100'),
            ),
            showErrorMessages: false,
          ),
        ],
      );

      blocTest(
        'sortBy Filter',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        seed: () => AllCreditsFilterState.initial()
            .copyWith(allCreditsFilter: allCreditsFilter),
        act: (AllCreditsFilterBloc bloc) =>
            bloc.add(const AllCreditsFilterEvent.sortByChanged('Open')),
        expect: () => [
          AllCreditsFilterState.initial().copyWith(
            allCreditsFilter: allCreditsFilter.copyWith(
              sortBy: 'Open',
            ),
          ),
        ],
      );

      blocTest(
        'Set Document Date',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        act: (AllCreditsFilterBloc bloc) {
          bloc.add(
            AllCreditsFilterEvent.setDocumentDate(
              dateTimeRange,
            ),
          );
        },
        expect: () => [
          AllCreditsFilterState.initial().copyWith(
            allCreditsFilter: AllCreditsFilter.empty().copyWith(
              documentDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              documentDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
            ),
            showErrorMessages: false,
          ),
        ],
      );

      blocTest(
        'applyFilters with all valid filters',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        seed: () => AllCreditsFilterState.initial().copyWith(
          allCreditsFilter: allCreditsFilter.copyWith(
            documentNumber: DocumentNumber('mock_documentNumber'),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            creditAmountFrom: DoubleValue('10'),
            creditAmountTo: DoubleValue('100'),
            sortBy: 'Cleared',
          ),
        ),
        act: (AllCreditsFilterBloc bloc) {
          bloc.add(
            const AllCreditsFilterEvent.applyFilters(),
          );
        },
        expect: () => [
          AllCreditsFilterState.initial().copyWith(
            isSubmitting: true,
            allCreditsFilter: allCreditsFilter.copyWith(
              documentNumber: DocumentNumber('mock_documentNumber'),
              documentDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
              documentDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              creditAmountFrom: DoubleValue('10'),
              creditAmountTo: DoubleValue('100'),
              sortBy: 'Cleared',
            ),
          ),
        ],
      );

      blocTest(
        'applyFilters with invalid filters',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        seed: () => AllCreditsFilterState.initial().copyWith(
          allCreditsFilter: allCreditsFilter.copyWith(
            documentNumber: DocumentNumber('mock_documentNumber'),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            creditAmountFrom: DoubleValue('100'),
            creditAmountTo: DoubleValue('10'),
            sortBy: 'Cleared',
          ),
        ),
        act: (AllCreditsFilterBloc bloc) {
          bloc.add(
            const AllCreditsFilterEvent.applyFilters(),
          );
        },
        expect: () => [
          AllCreditsFilterState.initial().copyWith(
            showErrorMessages: true,
            allCreditsFilter: allCreditsFilter.copyWith(
              documentNumber: DocumentNumber('mock_documentNumber'),
              documentDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
              documentDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              creditAmountFrom: DoubleValue('100'),
              creditAmountTo: DoubleValue('10'),
              sortBy: 'Cleared',
            ),
          ),
        ],
      );
      blocTest(
        'clearFilters with all valid filters',
        build: () => AllCreditsFilterBloc(
            allCreditsAndInvoicesRepository: mockAllCreditsRepository),
        seed: () => AllCreditsFilterState.initial().copyWith(
          allCreditsFilter: allCreditsFilter.copyWith(
            documentNumber: DocumentNumber('mock_documentNumber'),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            sortBy: 'Cleared',
          ),
        ),
        act: (AllCreditsFilterBloc bloc) {
          bloc.add(
            const AllCreditsFilterEvent.clearFilters(),
          );
        },
        expect: () => [
          AllCreditsFilterState.initial().copyWith(
            isSubmitting: false,
          ),
        ],
      );
    },
  );
}
