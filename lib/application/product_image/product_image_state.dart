part of 'product_image_bloc.dart';

@freezed
class ProductImageState with _$ProductImageState {
  const ProductImageState._();

  const factory ProductImageState({
    required Map<MaterialNumber, String> materialUrlMap,
    required bool isFetching,
  }) = _ProductImageState;

  factory ProductImageState.initial() => const ProductImageState(
        materialUrlMap: <MaterialNumber, String>{},
        isFetching: false,
      );

  String getMaterialImageUrl(MaterialNumber materialNumber) =>
      materialUrlMap[materialNumber] ?? '';
}
