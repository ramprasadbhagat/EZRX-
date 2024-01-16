part of 'product_detail_bloc.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const ProductDetailState._();
  const factory ProductDetailState({
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required ProductDetailAggregate productDetailAggregate,
    required bool isDetailFetching,
    required bool isStockFetching,
    required bool isRelatedProductsFetching,
    required bool isMetadataFetching,
    required int inputQty,
    @Default(0) int selectedImageIndex,
  }) = _ProductDetailState;

  factory ProductDetailState.initial() => ProductDetailState(
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        isDetailFetching: false,
        isStockFetching: false,
        isRelatedProductsFetching: false,
        isMetadataFetching: false,
        failureOrSuccessOption: none(),
        productDetailAggregate: ProductDetailAggregate.empty(),
        inputQty: 1,
        user: User.empty(),
      );

  StringValue get selectedImage {
    final images = productDetailAggregate.materialInfo.images;

    return images.isNotEmpty
        ? StringValue(images.elementAt(selectedImageIndex))
        : StringValue('');
  }

  bool get showRelatedItemsSection =>
      isRelatedProductsFetching ||
      isDetailFetching ||
      (!isRelatedProductsFetching &&
          productDetailAggregate.similarProduct.isNotEmpty);

  bool get showRelatedItemsLoading =>
      isDetailFetching || isRelatedProductsFetching;

  bool get _isHidePrice => productDetailAggregate.materialInfo.hidePrice;

  bool get isDetailAndStockFetching => isDetailFetching || isStockFetching;
  bool get eligibleForStockError =>
      !isDetailAndStockFetching &&
      productDetailAggregate.stockInfo.stockQuantity != 0 &&
      inputQty > productDetailAggregate.stockInfo.stockQuantity;
  bool _isPnGPrinciple({required bool isMYExternalSalesRepUser}) =>
      productDetailAggregate.materialInfo.isPnGPrinciple &&
      isMYExternalSalesRepUser;

  bool showTierPrice({required bool isMYExternalSalesRepUser}) =>
      !_isHidePrice ||
      !_isPnGPrinciple(isMYExternalSalesRepUser: isMYExternalSalesRepUser);

  bool displayOffers({
    required bool isMYExternalSalesRepUser,
    required List<BonusMaterial> bonusMaterialList,
  }) =>
      !_isHidePrice ||
      (_isPnGPrinciple(isMYExternalSalesRepUser: isMYExternalSalesRepUser) &&
          bonusMaterialList.isNotEmpty);

  DateTimeStringValue get expiryDate {
    /// If the sales organization is  PH MDI (2501) and
    /// the product is not an Abbot material, the expiry date is not available,
    /// and an empty DateTimeStringValue is returned.
    /// Otherwise, the expiry date from the product's stock information is returned.

    if (salesOrganisation.salesOrg.isPhMdi &&
        !productDetailAggregate
            .materialInfo.principalData.principalCode.isAbbot) {
      return DateTimeStringValue('');
    }

    return productDetailAggregate.stockInfo.expiryDate;
  }
}
