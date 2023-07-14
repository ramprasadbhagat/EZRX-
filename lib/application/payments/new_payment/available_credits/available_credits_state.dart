part of 'available_credits_bloc.dart';

@freezed
class AvailableCreditsState with _$AvailableCreditsState {
  const AvailableCreditsState._();
  const factory AvailableCreditsState({
    required List<CustomerOpenItem> items,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
    required AvailableCreditFilter appliedFilter,
  }) = _AvailableCreditsState;

  factory AvailableCreditsState.initial() => AvailableCreditsState(
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        items: <CustomerOpenItem>[],
        appliedFilter: AvailableCreditFilter.empty(),
      );
}
