part of 'material_price_bloc.dart';

@freezed
class MaterialPriceState with _$MaterialPriceState {
  const factory MaterialPriceState({
    required Map<MaterialNumber, Price> materialPrice,
    required bool isFetching,
  }) = _MaterialPriceState;

  factory MaterialPriceState.initial() => const MaterialPriceState(
        isFetching: false,
        materialPrice: {},
      );
}
