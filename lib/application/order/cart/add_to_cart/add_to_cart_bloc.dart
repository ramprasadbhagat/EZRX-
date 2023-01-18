import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';
part 'add_to_cart_bloc.freezed.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc() : super(AddToCartState.initial()) {
    on<AddToCartEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AddToCartEvent event,
    Emitter<AddToCartState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(AddToCartState.initial()),
      fetch: (e) async {},
      setCartItem: (e) async {
        emit(state.copyWith(cartItem: e.cartItem));
      },
      updateQuantity: (e) async {
        final newDiscountedMaterialCount = _calculateDiscountedMaterialCount(
          state: state,
          event: e,
        );

        emit(
          state.copyWith(
            cartItem: state.cartItem.copyWith(
              quantity: e.quantity,
              discountedMaterialCount: newDiscountedMaterialCount,
            ),
            quantity: e.quantity,
          ),
        );
      },
    );
  }

  int _calculateDiscountedMaterialCount({
    required AddToCartState state,
    required _UpdateQuantity event,
  }) {
    if (state.cartItem.price.zmgDiscount) {
      return event.quantity + event.cartZmgQtyExcludeCurrent;
    } else if (state.cartItem.price.isTireDiscountEligible) {
      return event.quantity;
    }

    return 0;
  }
}
