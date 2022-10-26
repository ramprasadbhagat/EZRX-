part of 'material_price_detail_bloc.dart';

@freezed
class MaterialPriceDetailState with _$MaterialPriceDetailState {
  const factory MaterialPriceDetailState({
    required Map<MaterialQueryInfo, MaterialPriceDetail> materialDetails,
    required bool isFetching,
  }) = _MaterialPriceDetailState;

  factory MaterialPriceDetailState.initial() => const MaterialPriceDetailState(
        isFetching: false,
        materialDetails: {},
      );
}
