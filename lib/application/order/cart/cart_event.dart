part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.initialized() = _Initialized;
  const factory CartEvent.fetch({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
  }) = _Fetch;
  const factory CartEvent.addToCart({
    required PriceAggregate item,
    required bool doNotallowOutOfStockMaterial,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) = _AddToCart;
  const factory CartEvent.addToCartFromList({
    required List<PriceAggregate> items,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
  }) = _AddToCartFromList;
  const factory CartEvent.updateCartItem({
    required PriceAggregate item,
    required bool doNotallowOutOfStockMaterial,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) = _UpdateCartItem;
  const factory CartEvent.updateCart({
    required List<Price> item,
    required String materialNumber,
  }) = _UpdateCart;
  const factory CartEvent.updateStockInfo({
    required User user,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) = _UpdateStockInfo;
  const factory CartEvent.removeFromCart({
    required PriceAggregate item,
  }) = _RemoveFromCart;
  const factory CartEvent.clearCart() = _ClearCart;
  const factory CartEvent.updateSelectedItem({
    required PriceAggregate item,
  }) = _updateSelectedItem;
  const factory CartEvent.updateSelectAllItems() = _updateSelectAllItems;
  const factory CartEvent.updateBonusItem({
    required int bonusItemCount,
    required PriceAggregate cartItem,
    required MaterialInfo bonusItem,
    required bool isUpdateFromCart,
  }) = _updateBonusItem;
  const factory CartEvent.deleteBonusItem({
    required PriceAggregate cartItem,
    required MaterialInfo bonusItem,
    required bool isUpdateFromCart,
  }) = _deleteBonusItem;

  const factory CartEvent.remarksChanged(String remarks) = _RemarksChanged;
  const factory CartEvent.addRemarksToCartItem({
    required PriceAggregate item,
    required bool isDelete,
  }) = _AddRemarksToCartItem;
  const factory CartEvent.addRemarksToBonusItem({
    required PriceAggregate item,
    required MaterialInfo bonusItem,
    required bool isDelete,
  }) = _AddRemarksToBonusItem;
}
