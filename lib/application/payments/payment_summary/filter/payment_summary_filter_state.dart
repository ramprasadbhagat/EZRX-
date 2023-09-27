part of 'payment_summary_filter_bloc.dart';

@freezed
class PaymentSummaryFilterState with _$PaymentSummaryFilterState {
  const PaymentSummaryFilterState._();
  const factory PaymentSummaryFilterState({
    required PaymentSummaryFilter filter,
    required List<StatusType> statuses,
    required bool showErrorMessages,
  }) = _PaymentSummaryFilterState;

  factory PaymentSummaryFilterState.initial() => PaymentSummaryFilterState(
        filter: PaymentSummaryFilter.empty(),
        showErrorMessages: false,
        statuses: <StatusType>[
          StatusType('In Progress'),
          StatusType('Failed'),
          StatusType('Processed'),
          StatusType('Successful'),
        ],
      );
}
