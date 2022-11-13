part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.initialized() = _Initialized;
  const factory CartEvent.fetch() = _Fetch;
  const factory CartEvent.addToCart({
    required PriceAggregate item,
  }) = _AddToCart;
  const factory CartEvent.updateCart({
    required List<Price> item,
    required String materialNumber,
  }) = _UpdateCart;
  const factory CartEvent.removeFromCart({
    required PriceAggregate item,
  }) = _RemoveFromCart;
}
