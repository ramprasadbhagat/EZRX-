part of 'product_detail_bloc.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const ProductDetailState._();
  const factory ProductDetailState({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required ProductDetailAggregate productDetailAggregate,
    required bool isFetching,
    @Default(0) int selectedImageIndex,
  }) = _ProductDetailState;

  factory ProductDetailState.initial() => ProductDetailState(
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        isFetching: false,
        failureOrSuccessOption: none(),
        productDetailAggregate: ProductDetailAggregate.empty(),
      );

  StringValue get selectedImage {
    final images = productDetailAggregate.materialInfo.images;

    return images.isNotEmpty
        ? StringValue(images.elementAt(selectedImageIndex))
        : StringValue('');
  }

  bool get showRelatedItems =>
      isFetching ||
      (!isFetching && productDetailAggregate.similarProduct.isNotEmpty);
}
