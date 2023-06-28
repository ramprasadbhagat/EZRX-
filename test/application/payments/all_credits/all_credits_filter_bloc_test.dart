import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'all_credits_bloc_test.dart';

void main() {
  late AllCreditsAndInvoicesRepository repository;
  late AllCreditsFilter allCreditsFilter;
  late DateTime fakeToDate;
  late DateTime fakeFromDate;
  late DateTimeRange dateTimeRange;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AllCreditsAndInvoicesRepositoryMock();
  });

  setUp(() {
    allCreditsFilter = AllCreditsFilter.empty();
    fakeToDate = DateTime.parse(
      DateFormat('yyyyMMdd').format(
        DateTime.now(),
      ),
    );
    fakeFromDate = DateTime.parse(
      DateFormat('yyyyMMdd').format(
        DateTime.now().subtract(
          const Duration(days: 60),
        ),
      ),
    );
    dateTimeRange = DateTimeRange(
      start: fakeFromDate,
      end: fakeToDate,
    );
  });

  group('All credits Filter Bloc', () {
    blocTest(
      'initialized',
      build: () =>
          AllCreditsFilterBloc(allCreditsAndInvoicesRepository: repository),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          const AllCreditsFilterEvent.initialized(),
        );
      },
      expect: () => [
        isA<AllCreditsFilterState>(),
      ],
    );

    blocTest(
      'Document Date Range Changed',
      build: () =>
          AllCreditsFilterBloc(allCreditsAndInvoicesRepository: repository),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          AllCreditsFilterEvent.setDocumentDate(
            dateTimeRange,
          ),
        );
      },
      expect: () => [
        AllCreditsFilterState.initial().copyWith(
          filter: allCreditsFilter.copyWith(
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'AmountValueToChanged',
      build: () =>
          AllCreditsFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllCreditsFilterState.initial().copyWith(
        filter: allCreditsFilter,
      ),
      act: (AllCreditsFilterBloc bloc) =>
          bloc.add(const AllCreditsFilterEvent.amountValueToChanged('1000')),
      expect: () => [
        AllCreditsFilterState.initial().copyWith(
          filter: allCreditsFilter.copyWith(
            amountValueTo: RangeValue('1000'),
          ),
          showErrorMessages: false,
        ),
      ],
    );

    blocTest(
      'AmountValueFromChanged',
      build: () =>
          AllCreditsFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllCreditsFilterState.initial().copyWith(
        filter: allCreditsFilter,
      ),
      act: (AllCreditsFilterBloc bloc) =>
          bloc.add(const AllCreditsFilterEvent.amountValueFromChanged('100')),
      expect: () => [
        AllCreditsFilterState.initial().copyWith(
          filter: allCreditsFilter.copyWith(
            amountValueFrom: RangeValue('100'),
          ),
          showErrorMessages: false,
        ),
      ],
    );

    blocTest(
      'Status Changed',
      build: () =>
          AllCreditsFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllCreditsFilterState.initial().copyWith(
        filter: allCreditsFilter.copyWith(
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          const AllCreditsFilterEvent.statusChanged(
            'Cleared',
            true,
          ),
        );
      },
      expect: () => [
        AllCreditsFilterState.initial().copyWith(
          filter: allCreditsFilter.copyWith(
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            filterStatuses: ['Cleared'],
          ),
        ),
      ],
    );

    blocTest(
      'applyFilters with all valid filters',
      build: () =>
          AllCreditsFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllCreditsFilterState.initial().copyWith(
        filter: allCreditsFilter.copyWith(
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          amountValueFrom: RangeValue('1'),
          amountValueTo: RangeValue('10'),
          filterStatuses: ['Cleared'],
        ),
      ),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          const AllCreditsFilterEvent.validateFilters(),
        );
      },
      expect: () => [
        AllCreditsFilterState.initial().copyWith(
          applied: true,
          filter: allCreditsFilter.copyWith(
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            amountValueFrom: RangeValue('1'),
            amountValueTo: RangeValue('10'),
            filterStatuses: ['Cleared'],
          ),
          // appliedFilter: allCreditsFilter.copyWith(
          //   documentDateTo: DateTimeStringValue(
          //     getDateStringByDateTime(fakeToDate),
          //   ),
          //   documentDateFrom: DateTimeStringValue(
          //     getDateStringByDateTime(fakeFromDate),
          //   ),
          //   amountValueFrom: RangeValue('1'),
          //   amountValueTo: RangeValue('10'),
          //   filterStatuses: ['Cleared'],
          // ),
        ),
      ],
    );

    blocTest(
      'applyFilters with invalid filters',
      build: () =>
          AllCreditsFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllCreditsFilterState.initial().copyWith(
        filter: allCreditsFilter.copyWith(
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          amountValueFrom: RangeValue('100'),
          amountValueTo: RangeValue('10'),
          filterStatuses: ['Cleared'],
        ),
      ),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          const AllCreditsFilterEvent.validateFilters(),
        );
      },
      expect: () => [
        AllCreditsFilterState.initial().copyWith(
          showErrorMessages: true,
          filter: allCreditsFilter.copyWith(
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            amountValueFrom: RangeValue('100'),
            amountValueTo: RangeValue('10'),
            filterStatuses: ['Cleared'],
          ),
        ),
      ],
    );

    blocTest(
      'resetFilters with all valid filters',
      build: () =>
          AllCreditsFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllCreditsFilterState.initial().copyWith(
        filter: allCreditsFilter.copyWith(
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          amountValueFrom: RangeValue('1'),
          amountValueTo: RangeValue('10'),
          filterStatuses: ['Cleared'],
        ),
      ),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          const AllCreditsFilterEvent.resetFilters(),
        );
      },
      expect: () => [
        AllCreditsFilterState.initial().copyWith(
          applied: true,
        ),
      ],
    );
  });
}
