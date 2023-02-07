part of 'request_return_filter_bloc.dart';

@freezed
class RequestReturnFilterState with _$RequestReturnFilterState {
  const factory RequestReturnFilterState({
    required RequestReturnFilter requestReturnFilter,
    required bool isSubmitting,
    required bool showErrorMessages,
  }) = _RequestReturnFilterState;

  factory RequestReturnFilterState.initial() => RequestReturnFilterState(
        isSubmitting: false,
        requestReturnFilter: RequestReturnFilter.empty(),
        showErrorMessages: false,
      );
}
