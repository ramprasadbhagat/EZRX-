import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().subtract(
        const Duration(days: 28),
      ),
    ),
  );

  final dateTimeRange = DateTimeRange(
    start: fakeFromDate,
    end: fakeToDate,
  );

  group(' return approver Filter Bloc', () {
    blocTest(
      'initialized',
      build: (() => ReturnApproverFilterBloc()),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          const ReturnApproverFilterEvent.initialized(),
        );
      },
      expect: () => [
        isA<ReturnApproverFilterState>(),
      ],
    );
    blocTest(
      'createdBy Changed',
      seed: () => ReturnApproverFilterState.initial().copyWith(
        approverReturnFilter: ReturnApproverFilter.empty().copyWith(
          toInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          fromInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      build: (() => ReturnApproverFilterBloc()),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          const ReturnApproverFilterEvent.createdByChanged(
            'test-user',
          ),
        );
      },
      expect: () => [
        ReturnApproverFilterState.initial().copyWith(
          approverReturnFilter: ReturnApproverFilter.empty().copyWith(
            createdBy: SearchKey.search('test-user'),
            toInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            fromInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'returnId Change',
      build: (() => ReturnApproverFilterBloc()),
      seed: () => ReturnApproverFilterState.initial().copyWith(
        approverReturnFilter: ReturnApproverFilter.empty().copyWith(
          toInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          fromInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          const ReturnApproverFilterEvent.returnIdChanged(
            'fake-id',
          ),
        );
      },
      expect: () => [
        ReturnApproverFilterState.initial().copyWith(
          approverReturnFilter: ReturnApproverFilter.empty().copyWith(
            returnId: SearchKey.search('fake-id'),
            toInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            fromInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'shipTo Changed',
      build: (() => ReturnApproverFilterBloc()),
      seed: () => ReturnApproverFilterState.initial().copyWith(
        approverReturnFilter: ReturnApproverFilter.empty().copyWith(
          toInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          fromInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          const ReturnApproverFilterEvent.shipToChanged(
            'fake-shipTo',
          ),
        );
      },
      expect: () => [
        ReturnApproverFilterState.initial().copyWith(
          approverReturnFilter: ReturnApproverFilter.empty().copyWith(
            shipTo: SearchKey.search('fake-shipTo'),
            toInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            fromInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'soldTo Changed',
      build: (() => ReturnApproverFilterBloc()),
      seed: () => ReturnApproverFilterState.initial().copyWith(
        approverReturnFilter: ReturnApproverFilter.empty().copyWith(
          toInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          fromInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          const ReturnApproverFilterEvent.soldToChanged(
            'fake-soldTo',
          ),
        );
      },
      expect: () => [
        ReturnApproverFilterState.initial().copyWith(
          approverReturnFilter: ReturnApproverFilter.empty().copyWith(
            soldTo: SearchKey.search('fake-soldTo'),
            toInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            fromInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'fromInvoiceDate Changed',
      build: (() => ReturnApproverFilterBloc()),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          ReturnApproverFilterEvent.setInvoiceDate(
            dateTimeRange,
          ),
        );
      },
      expect: () => [
        ReturnApproverFilterState.initial().copyWith(
          approverReturnFilter: ReturnApproverFilter.empty().copyWith(
            toInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            fromInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'sortby Changed',
      build: (() => ReturnApproverFilterBloc()),
      seed: () => ReturnApproverFilterState.initial().copyWith(
        approverReturnFilter: ReturnApproverFilter.empty().copyWith(
          toInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          fromInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          ReturnApproverFilterEvent.sortByChanged(
            FilterStatus('ALL'),
          ),
        );
      },
      expect: () => [
        ReturnApproverFilterState.initial().copyWith(
          approverReturnFilter: ReturnApproverFilter.empty().copyWith(
            sortBy: FilterStatus('ALL'),
            toInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            fromInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'applyFilters with one valid filter',
      build: (() => ReturnApproverFilterBloc()),
      seed: () => ReturnApproverFilterState.initial().copyWith(
        approverReturnFilter: ReturnApproverFilter.empty().copyWith(
          returnId: SearchKey.search('searchtext'),
          toInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          fromInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          const ReturnApproverFilterEvent.applyFilters(),
        );
      },
      expect: () => [
        ReturnApproverFilterState.initial().copyWith(
          isSubmitting: true,
          approverReturnFilter: ReturnApproverFilter.empty().copyWith(
            returnId: SearchKey.search('searchtext'),
            toInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            fromInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'applyFilters with no valid filter',
      build: (() => ReturnApproverFilterBloc()),
      seed: () => ReturnApproverFilterState.initial().copyWith(
        approverReturnFilter: ReturnApproverFilter.empty().copyWith(
          returnId: SearchKey.search('2'),
          toInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          fromInvoiceDate: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          const ReturnApproverFilterEvent.applyFilters(),
        );
      },
      expect: () => [
        ReturnApproverFilterState.initial().copyWith(
          showErrorMessages: true,
          approverReturnFilter: ReturnApproverFilter.empty().copyWith(
            returnId: SearchKey.search('2'),
            toInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            fromInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );
  });
}
