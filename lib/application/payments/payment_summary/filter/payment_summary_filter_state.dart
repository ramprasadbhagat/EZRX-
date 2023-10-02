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

  List<StatusType> get statuses => salesOrg.isSg
      ? <StatusType>[
          StatusType('Pending'),
          StatusType('Processed'),
        ]
      : <StatusType>[
          StatusType('In Progress'),
          StatusType('Failed'),
          StatusType('Processed'),
          StatusType('Successful'),
        ];
}
