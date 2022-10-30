part of 'add_to_cart_bloc.dart';

@freezed
class AddToCartState with _$AddToCartState {
  const AddToCartState._();

  const factory AddToCartState({
    required CartItem cartItem,
    required int quantity,
  }) = _AddToCartState;

  factory AddToCartState.initial() => AddToCartState(
        cartItem: CartItem.empty(),
        quantity: 1,
      );
}
