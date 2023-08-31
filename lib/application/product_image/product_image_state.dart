part of 'product_image_bloc.dart';

@freezed
class ProductImageState with _$ProductImageState {
  const ProductImageState._();

  const factory ProductImageState({
    required Map<MaterialNumber, ProductImages> productImageMap,
    required bool isFetching,
  }) = _ProductImageState;

  factory ProductImageState.initial() => const ProductImageState(
        productImageMap: <MaterialNumber, ProductImages>{},
        isFetching: false,
      );

  ProductImages getMaterialImage(MaterialNumber materialNumber) =>
      productImageMap[materialNumber] ?? ProductImages.empty();
}
