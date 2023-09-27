part of 'payment_summary_bloc.dart';

@freezed
class PaymentSummaryState with _$PaymentSummaryState {
  const PaymentSummaryState._();
  const factory PaymentSummaryState({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required final List<PaymentSummaryDetails> details,
    required bool isFetching,
    required bool canLoadMore,
    required PaymentSummaryFilter appliedFilter,
    required SearchKey searchKey,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PaymentSummaryState;

  factory PaymentSummaryState.initial() => PaymentSummaryState(
        salesOrganization: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        failureOrSuccessOption: none(),
        appliedFilter: PaymentSummaryFilter.empty(),
        searchKey: SearchKey.searchFilter(''),
        isFetching: false,
        canLoadMore: true,
        details: <PaymentSummaryDetails>[],
      );
}
