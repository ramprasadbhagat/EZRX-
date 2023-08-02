part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.initialized() = _Initialized;
  const factory CartEvent.fetch({
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
    required bool comboDealEligible,
    @Default(false) bool isSpecialOrderType,
  }) = _Fetch;
  const factory CartEvent.discountOverride({
    required PriceAggregate item,
  }) = _DiscountOverride;

  const factory CartEvent.addBundleToCart({
    required List<PriceAggregate> bundleItems,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required bool doNotallowOutOfStockMaterial,
  }) = _AddBundleToCart;
  const factory CartEvent.addComboDealToCart({
    required List<PriceAggregate> comboDealItems,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required bool doNotallowOutOfStockMaterial,
    @Default(false) bool overrideQty,
  }) = _AddComboDealToCart;
  const factory CartEvent.updateMaterialQtyInCartItem({
    required CartItem currentItem,
    required PriceAggregate updatedQtyItem,
    @Default(true) bool overrideQty,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required bool doNotallowOutOfStockMaterial,
  }) = _UpdateMaterialQtyInCartItem;
  const factory CartEvent.verifyMaterialDealBonus({
    ///Todo: consider to remove it
    required PriceAggregate item,
    required List<PriceAggregate> items,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _VerifyMaterialDealBonus;
  const factory CartEvent.removeFromCart({
    required CartItem item,
  }) = _RemoveFromCart;
  const factory CartEvent.addRemarkToCartItem({
    required CartItem item,
    required String message,
  }) = _AddRemarkToCartItem;
  const factory CartEvent.addBonusToCartItem({
    required CartItem item,
    required MaterialItemBonus bonusItem,
    @Default(false) bool overrideQty,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required bool doNotallowOutOfStockMaterial,
  }) = _AddBonusToCartItem;
  const factory CartEvent.removeBonusFromCartItem({
    required CartItem item,
    required MaterialItemBonus bonusItem,
  }) = _RemoveBonusFromCartItem;
  const factory CartEvent.addRemarkToBonusItem({
    required CartItem item,
    required MaterialItemBonus bonusItem,
    required String message,
  }) = _AddRemarkToBonusItem;
  const factory CartEvent.overrideCartItemPrice({
    required List<Price> overridenPrice,
    required CartItem cartItem,
  }) = _OverrideCartItemPrice;
  const factory CartEvent.selectButtonTapped({
    required CartItem cartItem,
  }) = _SelectButtonTapped;
  const factory CartEvent.selectAllButtonTapped() = _SelectAllButtonTapped;
  const factory CartEvent.clearCart() = _ClearCart;
  const factory CartEvent.clearSelectedItemsFromCart({
    required List<String> selectedItemIds,
  }) = _ClearSelectedItemsFromCart;
  const factory CartEvent.replaceWithOrderItems({
    required List<CartItem> items,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required bool doNotallowOutOfStockMaterial,
  }) = _ReplaceWithOrderItems;

  const factory CartEvent.updateBatchInCartItem({
    required CartItem item,
    required StockInfo stockInfo,
  }) = _UpdateBatchInCartItem;

  const factory CartEvent.fetchProductsAddedToCart() =
      _FetchProductsAddedToCart;

  const factory CartEvent.upsertCart({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required PriceAggregate priceAggregate,
    required int quantity,
    required RequestCounterOfferDetails counterOfferDetails,
  }) = _UpsertCart;

  const factory CartEvent.getDetailsProductsAddedToCart({
    required List<PriceAggregate> cartProducts,
  }) = _GetDetailsProductsAddedToCart;

  const factory CartEvent.updatePriceProduct({
    required Map<MaterialNumber, Price> priceProducts,
    required Price overriddenProductPrice,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _UpdatePriceProduct;

  const factory CartEvent.updateProductStock({
    required List<PriceAggregate> products,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _UpdateProductStock;
}
