part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    required List<CartItem> cartItemList,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
  }) = _CartState;

  factory CartState.initial() => CartState(
        cartItemList: <CartItem>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
      );
}
