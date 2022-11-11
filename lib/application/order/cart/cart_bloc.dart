import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
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
                      (e) => e.copyWith(
                        zmgMaterialCountOnCart: state.zmgMaterialCount,
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
            emit(
              state.copyWith(
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
            if (e.item.price.zmgDiscount) {
              emit(
                state.copyWith(
                  cartItemList: cartItemList
                      .map(
                        (PriceAggregate element) => element.copyWith(
                          zmgMaterialCountOnCart: state.zmgMaterialCount,
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
            if (e.item.price.zmgDiscount) {
              emit(
                state.copyWith(
                  cartItemList: cartItemList
                      .map(
                        (PriceAggregate element) => element.copyWith(
                          zmgMaterialCountOnCart: state.zmgMaterialCount,
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
    );
  }
}
