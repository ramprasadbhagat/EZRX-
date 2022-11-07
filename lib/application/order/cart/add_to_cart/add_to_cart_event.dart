part of 'add_to_cart_bloc.dart';

@freezed
class AddToCartEvent with _$AddToCartEvent {
  const factory AddToCartEvent.initialized() = _Initialized;
  const factory AddToCartEvent.fetch() = _Fetch;
  const factory AddToCartEvent.setCartItem(PriceAggregate cartItem) =
      _SetCartItem;
  const factory AddToCartEvent.updateQuantity(int quantity) = _UpdateQuantity;
}
