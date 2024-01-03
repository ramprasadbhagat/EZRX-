part of 'payment_summary_filter_bloc.dart';

@freezed
class PaymentSummaryFilterState with _$PaymentSummaryFilterState {
  const PaymentSummaryFilterState._();

  const factory PaymentSummaryFilterState({
    required SalesOrg salesOrg,
    required PaymentSummaryFilter filter,
    required bool showErrorMessages,
  }) = _PaymentSummaryFilterState;

  factory PaymentSummaryFilterState.initial() => PaymentSummaryFilterState(
        salesOrg: SalesOrg(''),
        filter: PaymentSummaryFilter.empty(),
        showErrorMessages: false,
      );

  List<FilterStatus> get statuses {
    var statusList = <FilterStatus>[
      FilterStatus('In Progress'),
      FilterStatus('Failed'),
      FilterStatus('Processed'),
      FilterStatus('Successful'),
    ];
    if (salesOrg.isSg) {
      statusList = <FilterStatus>[
        FilterStatus('Pending'),
        FilterStatus('Processed'),
      ];
    }
    if (salesOrg.isPH) {
      statusList = <FilterStatus>[
        ...statusList,
        FilterStatus('Pending'),
      ];
    }
    if (salesOrg.isID) {
      statusList = <FilterStatus>[
        FilterStatus('In progress'),
        FilterStatus('Expired'),
        FilterStatus('Successful'),
        FilterStatus('Cancelled'),
      ];
    }

    return statusList;
  }
}
