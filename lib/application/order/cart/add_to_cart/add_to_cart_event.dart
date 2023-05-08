part of 'add_to_cart_bloc.dart';

@freezed
class AddToCartEvent with _$AddToCartEvent {
  const factory AddToCartEvent.initialized() = _Initialized;
  const factory AddToCartEvent.fetch({
    required CustomerCodeInfo customerCode,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required ShipToInfo shipToCode,
    required MaterialNumber materialNumber,
    required int cartZmgQtyExcludeCurrent,
    required bool isSpecialOrderType,
  }) = _Fetch;
  const factory AddToCartEvent.setCartItem(
    PriceAggregate cartItem,
  ) = _SetCartItem;
  const factory AddToCartEvent.updateQuantity(
    int quantity,
    int cartZmgQtyExcludeCurrent,
  ) = _UpdateQuantity;
}
