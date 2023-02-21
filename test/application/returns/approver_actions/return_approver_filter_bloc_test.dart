
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final fakeToDate =
      DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().add(
        const Duration(days: 1),
      ),
    ),
  );

  final fakeFormDate =
      DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
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
            createdBy: SearchKey.searchFilter('test-user'),
          ),
        ),
      ],
    );

    blocTest(
      'returnId Change',
      build: (() => ReturnApproverFilterBloc()),
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
            returnId: SearchKey.searchFilter('fake-id'),
          ),
        ),
      ],
    );

    blocTest(
      'shipTo Changed',
      build: (() => ReturnApproverFilterBloc()),
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
            shipTo: SearchKey.searchFilter('fake-shipTo'),
          ),
        ),
      ],
    );

    blocTest(
      'soldTo Changed',
      build: (() => ReturnApproverFilterBloc()),
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
            soldTo: SearchKey.searchFilter('fake-soldTo'),
          ),
        ),
      ],
    );

    blocTest(
      'fromInvoiceDate Changed',
      build: (() => ReturnApproverFilterBloc()),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          ReturnApproverFilterEvent.setfromInvoiceDate(
            fromDate: fakeFormDate,
          ),
        );
      },
      expect: () => [
        ReturnApproverFilterState.initial().copyWith(
          approverReturnFilter: ReturnApproverFilter.empty().copyWith(
            fromInvoiceDate: InvoiceDate(
              fakeFormDate.toIso8601String(),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'toInvoiceDate Changed',
      build: (() => ReturnApproverFilterBloc()),
      act: (ReturnApproverFilterBloc bloc) {
        bloc.add(
          ReturnApproverFilterEvent.setToInvoiceDate(
            toDate: fakeToDate,
          ),
        );
      },
      expect: () => [
        ReturnApproverFilterState.initial().copyWith(
          approverReturnFilter: ReturnApproverFilter.empty().copyWith(
            toInvoiceDate: InvoiceDate(
              fakeToDate.toIso8601String(),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'sortby Changed',
      build: (() => ReturnApproverFilterBloc()),
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
          ),
        ),
      ],
    );

    blocTest(
      'applyFilters with one valid filter',
      build: (() => ReturnApproverFilterBloc()),
      seed: () => ReturnApproverFilterState.initial().copyWith(
        approverReturnFilter: ReturnApproverFilter.empty().copyWith(
          returnId: SearchKey.searchFilter('searchtext'),
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
            returnId: SearchKey.searchFilter('searchtext'),
          ),
        ),
      ],
    );

    blocTest(
      'applyFilters with no valid filter',
      build: (() => ReturnApproverFilterBloc()),
      seed: () => ReturnApproverFilterState.initial().copyWith(
        approverReturnFilter: ReturnApproverFilter.empty().copyWith(
          returnId: SearchKey.searchFilter('12'),
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
            returnId: SearchKey.searchFilter('12'),
          ),
        ),
      ],
    );
  });
}
