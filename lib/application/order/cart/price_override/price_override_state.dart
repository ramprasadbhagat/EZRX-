part of 'price_override_bloc.dart';

@freezed
class PriceOverrideState with _$PriceOverrideState {
  const PriceOverrideState._();

  const factory PriceOverrideState({
    required List<Price> cartItemList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required PriceOverrideValue priceOverrideValue,
    required bool showErrorMessages,
  }) = _PriceOverrideState;

  factory PriceOverrideState.initial() => PriceOverrideState(
        cartItemList: <Price>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        priceOverrideValue: PriceOverrideValue(0.0),
        showErrorMessages: false,
      );
}
