part of 'return_price_bloc.dart';

@freezed
class ReturnPriceState with _$ReturnPriceState {
  const ReturnPriceState._();
  const factory ReturnPriceState({
    required Map<String, ReturnPrice> returnPrice,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ReturnPriceState;

  factory ReturnPriceState.initial() => ReturnPriceState(
        failureOrSuccessOption: none(),
        isFetching: false,
        returnPrice: <String, ReturnPrice>{},
      );

  String displayPrice(String uniqueId) =>
      returnPrice[uniqueId]?.totalPrice.getOrDefaultValue(0).toString() ?? 'NA';
}
