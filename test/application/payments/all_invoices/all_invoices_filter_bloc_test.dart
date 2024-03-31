import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'all_invoices_bloc_test.dart';

void main() {
  late AllCreditsAndInvoicesRepository repository;
  late AllInvoicesFilter allInvoicesFilter;
  late DateTime fakeToDate;
  late DateTime fakeFromDate;
  late DateTimeRange dateTimeRange;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AllCreditsAndInvoicesRepositoryMock();
  });

  setUp(() {
    allInvoicesFilter = AllInvoicesFilter.defaultFilter();
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

  group('All invoices Filter Bloc', () {
    blocTest(
      'initialized',
      build: () =>
          AllInvoicesFilterBloc(allCreditsAndInvoicesRepository: repository),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          const AllInvoicesFilterEvent.initialized(),
        );
      },
      expect: () => [
        isA<AllInvoicesFilterState>(),
      ],
    );

    blocTest(
      'Due Date Range Changed',
      build: () =>
          AllInvoicesFilterBloc(allCreditsAndInvoicesRepository: repository),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          AllInvoicesFilterEvent.setDueDate(
            dateTimeRange,
          ),
        );
      },
      expect: () => [
        AllInvoicesFilterState.initial().copyWith(
          filter: allInvoicesFilter.copyWith(
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Document Date Range Changed',
      build: () =>
          AllInvoicesFilterBloc(allCreditsAndInvoicesRepository: repository),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          AllInvoicesFilterEvent.setDocumentDate(
            dateTimeRange,
          ),
        );
      },
      expect: () => [
        AllInvoicesFilterState.initial().copyWith(
          filter: allInvoicesFilter.copyWith(
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
          AllInvoicesFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllInvoicesFilterState.initial().copyWith(
        filter: allInvoicesFilter,
      ),
      act: (AllInvoicesFilterBloc bloc) =>
          bloc.add(const AllInvoicesFilterEvent.amountValueToChanged('1000')),
      expect: () => [
        AllInvoicesFilterState.initial().copyWith(
          filter: allInvoicesFilter.copyWith(
            amountValueTo: RangeValue('1000'),
          ),
          showErrorMessages: false,
        ),
      ],
    );

    blocTest(
      'AmountValueFromChanged',
      build: () =>
          AllInvoicesFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllInvoicesFilterState.initial().copyWith(
        filter: allInvoicesFilter,
      ),
      act: (AllInvoicesFilterBloc bloc) =>
          bloc.add(const AllInvoicesFilterEvent.amountValueFromChanged('100')),
      expect: () => [
        AllInvoicesFilterState.initial().copyWith(
          filter: allInvoicesFilter.copyWith(
            amountValueFrom: RangeValue('100'),
          ),
          showErrorMessages: false,
        ),
      ],
    );

    blocTest(
      'Status Changed',
      build: () =>
          AllInvoicesFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllInvoicesFilterState.initial().copyWith(
        filter: allInvoicesFilter.copyWith(
          dueDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          dueDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          const AllInvoicesFilterEvent.statusChanged(
            'Cleared',
            true,
          ),
        );
      },
      expect: () => [
        AllInvoicesFilterState.initial().copyWith(
          filter: allInvoicesFilter.copyWith(
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            filterStatuses: ['Cleared'],
          ),
        ),
      ],
    );

    blocTest(
      'validateFilters with all valid filters',
      build: () =>
          AllInvoicesFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllInvoicesFilterState.initial().copyWith(
        filter: allInvoicesFilter.copyWith(
          dueDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          dueDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
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
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          const AllInvoicesFilterEvent.validateFilters(),
        );
      },
      expect: () => [],
    );

    blocTest(
      'validateFilters with invalid filters',
      build: () =>
          AllInvoicesFilterBloc(allCreditsAndInvoicesRepository: repository),
      seed: () => AllInvoicesFilterState.initial().copyWith(
        filter: allInvoicesFilter.copyWith(
          dueDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          dueDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
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
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          const AllInvoicesFilterEvent.validateFilters(),
        );
      },
      expect: () => [
        AllInvoicesFilterState.initial().copyWith(
          showErrorMessages: true,
          filter: allInvoicesFilter.copyWith(
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
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
  });
}
