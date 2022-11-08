part of 'material_price_detail_bloc.dart';

@freezed
class MaterialPriceDetailState with _$MaterialPriceDetailState {
  const MaterialPriceDetailState._();
  const factory MaterialPriceDetailState({
    required Map<MaterialQueryInfo, MaterialPriceDetail> materialDetails,
    required bool isFetching,
    required bool isValidating,
  }) = _MaterialPriceDetailState;

  factory MaterialPriceDetailState.initial() => const MaterialPriceDetailState(
        isFetching: false,
        isValidating: false,
        materialDetails: {},
      );

  bool isValidMaterial({required MaterialQueryInfo query}) {
    final itemDetail = materialDetails[query];
    if (itemDetail != null && itemDetail.price.isValid) {
      return true;
    }

    return false;
  }
}
