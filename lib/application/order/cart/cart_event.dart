part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.initialized({
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required bool comboDealEligible,
  }) = _Initialized;

  const factory CartEvent.addComboDealToCart({
    required List<PriceAggregate> comboDealItems,
    required bool doNotallowOutOfStockMaterial,
    @Default(false) bool overrideQty,
  }) = _AddComboDealToCart;

  const factory CartEvent.verifyMaterialDealBonus({
    ///Todo: consider to remove it
    required PriceAggregate item,
    required List<PriceAggregate> items,
  }) = _VerifyMaterialDealBonus;

  const factory CartEvent.addRemarkToCartItem({
    required CartItem item,
    required String message,
  }) = _AddRemarkToCartItem;

  const factory CartEvent.addBonusToCartItem({
    required MaterialInfo bonusMaterial,
    required StringValue bonusItemId,
    required RequestCounterOfferDetails counterOfferDetails,
    required User user,
  }) = _AddBonusToCartItem;

  const factory CartEvent.removeSampleBonusFromCartConfig() =
      _RemoveSampleBonusFromCartConfig;

  const factory CartEvent.addRemarkToBonusItem({
    required CartItem item,
    required MaterialItemBonus bonusItem,
    required String message,
  }) = _AddRemarkToBonusItem;

  const factory CartEvent.overrideCartItemPrice({
    required List<Price> overridenPrice,
    required CartItem cartItem,
  }) = _OverrideCartItemPrice;

  const factory CartEvent.clearCart() = _ClearCart;

  const factory CartEvent.replaceWithOrderItems({
    required List<CartItem> items,
    required bool doNotAllowOutOfStockMaterial,
  }) = _ReplaceWithOrderItems;

  const factory CartEvent.updateBatchInCartItem({
    required CartItem item,
    required StockInfo stockInfo,
  }) = _UpdateBatchInCartItem;

  const factory CartEvent.fetchProductsAddedToCart() =
      _FetchProductsAddedToCart;

  const factory CartEvent.upsertCart({
    required PriceAggregate priceAggregate,
    required int quantity,
  }) = _UpsertCart;

  const factory CartEvent.addHistoryItemsToCart({
    required List<PriceAggregate> priceAggregate,
    required List<int> quantity,
    required RequestCounterOfferDetails counterOfferDetails,
    required User user,
  }) = _addHistoryItemsToCart;

  const factory CartEvent.upsertCartItems({
    required PriceAggregate priceAggregate,
  }) = _UpsertCartItems;

  const factory CartEvent.getDetailsProductsAddedToCart({
    required List<PriceAggregate> cartProducts,
  }) = _GetDetailsProductsAddedToCart;

  const factory CartEvent.updatePriceProduct({
    required Map<MaterialNumber, Price> priceProducts,
    required Price overriddenProductPrice,
  }) = _UpdatePriceProduct;

  const factory CartEvent.updateProductStock() = _UpdateProductStock;

  const factory CartEvent.removeInvalidProducts({
    required List<MaterialInfo> invalidCartItems,
  }) = _RemoveInvalidProducts;
}
