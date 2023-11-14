part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.initialized({
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
  }) = _Initialized;

  const factory CartEvent.verifyMaterialDealBonus({
    ///Todo: consider to remove it
    required PriceAggregate item,
    required List<PriceAggregate> items,
  }) = _VerifyMaterialDealBonus;

  const factory CartEvent.addBonusToCartItem({
    required MaterialInfo bonusMaterial,
    required StringValue bonusItemId,
    required RequestCounterOfferDetails counterOfferDetails,
  }) = _AddBonusToCartItem;

  const factory CartEvent.removeSampleBonusFromCartConfig() =
      _RemoveSampleBonusFromCartConfig;

  const factory CartEvent.clearCart() = _ClearCart;

  ///TODO: will be used while implementing batch selection

  // const factory CartEvent.updateBatchInCartItem({
  //   required CartItem item,
  //   required StockInfo stockInfo,
  // }) = _UpdateBatchInCartItem;

  const factory CartEvent.fetchProductsAddedToCart() =
      _FetchProductsAddedToCart;

  const factory CartEvent.upsertCart({
    required PriceAggregate priceAggregate,
    required int quantity,
  }) = _UpsertCart;

  const factory CartEvent.addHistoryItemsToCart({
    required List<MaterialInfo> items,
    required RequestCounterOfferDetails counterOfferDetails,
  }) = _addHistoryItemsToCart;

  const factory CartEvent.upsertCartItems({
    required PriceAggregate priceAggregate,
  }) = _UpsertCartItems;

  const factory CartEvent.getDetailsProductsAddedToCart({
    required List<PriceAggregate> cartProducts,
  }) = _GetDetailsProductsAddedToCart;

  const factory CartEvent.updatePriceProduct({
    required Map<MaterialNumber, Price> priceProducts,
  }) = _UpdatePriceProduct;

  const factory CartEvent.updateProductStock() = _UpdateProductStock;

  const factory CartEvent.removeInvalidProducts({
    required List<MaterialInfo> invalidCartItems,
  }) = _RemoveInvalidProducts;

  const factory CartEvent.upsertCartItemsWithComboOffers({
    required List<PriceAggregate> priceAggregates,
    required bool isDeleteCombo,
  }) = _UpsertCartItemsWithComboOffers;

  const factory CartEvent.updateCartProductWithCounterOffer({
    required Price overriddenProductPrice,
  }) = _UpdateCartProductWithCounterOffer;

  const factory CartEvent.updatePriceForIdMarket({
    required List<MaterialInfo> product,
  }) = _UpdatePriceForIdMarket;

  const factory CartEvent.fetchGrandTotalPriceForIdMarket() =
      _FetchGrandTotalPriceForIdMarket;
}
