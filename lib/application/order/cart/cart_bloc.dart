import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_view_model.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository cartRepository;
  CartBloc({
    required this.cartRepository,
  }) : super(CartState.initial()) {
    on<CartEvent>(_onEvent);
  }

  Future<void> _onEvent(
    CartEvent event,
    Emitter<CartState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(CartState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
            cartItemList: <PriceAggregate>[],
          ),
        );
        final failureOrSuccess = await cartRepository.fetchCartItems();
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cartItemList) {
            emit(
              state.copyWith(
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
            emit(
              state.copyWith(
                cartItemList: cartItemList
                    .map(
                      (element) => element.copyWith(
                        discountedMaterialCount:
                            state.onAddCartDiscountMaterialCount(element),
                      ),
                    )
                    .toList(),
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      addToCart: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );
        final failureOrSuccess = await cartRepository.addToCart(
          cartItem: e.item,
        );
      
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cartItemList) {
            final updatedMaterialList = cartRepository.getUpdatedMaterialList(
              cartItemList: state.cartItemList,
              selectedItemsMaterialNumber: state.selectedItemsMaterialNumber,
              item: e.item,
            );
            
            emit(
              state.copyWith(
                selectedItemsMaterialNumber: updatedMaterialList,
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
            emit(
              state.copyWith(
                cartItemList: cartItemList
                    .map(
                      (PriceAggregate element) => element.copyWith(
                        discountedMaterialCount:
                            state.onAddCartDiscountMaterialCount(element),
                      ),
                    )
                    .toList(),
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      updateCartItem: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );
        final failureOrSuccess = await cartRepository.updateCartItem(
          cartItem: e.item,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cartItemList) {
            emit(
              state.copyWith(
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
            if (e.item.price.isDiscountEligible) {
              emit(
                state.copyWith(
                  cartItemList: cartItemList
                      .map(
                        (PriceAggregate element) => element.copyWith(
                          discountedMaterialCount:
                              state.onAddCartDiscountMaterialCount(element),
                        ),
                      )
                      .toList(),
                  apiFailureOrSuccessOption: none(),
                  isFetching: false,
                ),
              );
            }
          },
        );
      },
      removeFromCart: (e) async {
        final failureOrSuccess = await cartRepository.deleteFromCart(
          cartItem: e.item,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cartItemList) {
            emit(
              state.copyWith(
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
            if (e.item.price.isDiscountEligible) {
              emit(
                state.copyWith(
                  cartItemList: cartItemList
                      .map(
                        (PriceAggregate element) => element.copyWith(
                          discountedMaterialCount:
                              state.onAddCartDiscountMaterialCount(element),
                        ),
                      )
                      .toList(),
                  apiFailureOrSuccessOption: none(),
                  isFetching: false,
                ),
              );
            }
          },
        );
      },
      updateCart: (_UpdateCart e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess = await cartRepository.updateCart(
          cartItem: e.item,
          materialNumber: e.materialNumber,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cartItemList) {
            emit(
              state.copyWith(
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      clearCart: (_ClearCart value) async {
        await cartRepository.clear();
        emit(CartState.initial());
      },
      addToCartFromList: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        );

        final failureOrSuccess =
            await cartRepository.addToCartList(items: e.items);
        failureOrSuccess.fold(
          (apiFailure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cartItemList) {
            emit(
              state.copyWith(
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      updateSelectedItem: (e) {
        emit(
          state.copyWith(
            selectedItemsMaterialNumber: cartRepository.updateSelectedItem(
              cartItem: e.item,
              selectedMaterialList: state.selectedItemsMaterialNumber,
            ),
          ),
        );
      },
      updateSelectAllItems: (e) {
        emit(
          state.copyWith(
            selectedItemsMaterialNumber:
                state.selectedItemsMaterialNumber.length ==
                        state.cartItemList.length
                    ? []
                    : cartRepository.updateSelectAll(
                        cartItemList: state.cartItemList,
                      ),
          ),
        );
      },
      updateBonusItem: (_updateBonusItem e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        );

        final failureOrSuccess = await cartRepository.updateBonusItem(
          bonusItem: e.bonusItem,
          quantity: e.bonusItemCount,
          cartItem: e.cartItem,
          isUpdatedFromCart: e.isUpdateFromCart,
        );
        failureOrSuccess.fold(
          (apiFailure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cartItemList) {
            emit(
              state.copyWith(
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      deleteBonusItem: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        );

        final failureOrSuccess = await cartRepository.deleteBonusItem(
          bonusItem: e.bonusItem,
          cartItem: e.cartItem,
          isUpdateFromCart: e.isUpdateFromCart,
        );
        failureOrSuccess.fold(
          (apiFailure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cartItemList) {
            emit(
              state.copyWith(
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
    );
  }
}
