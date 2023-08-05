import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing update remarks to cart', () {
    blocTest<CartBloc, CartState>(
      'update Remarks Success CartBloc',
      build: () => CartBloc(cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        cartItems: mockMaterialCartItemList,
      ),
      setUp: () {
        when(
          () => cartRepositoryMock.addRemarkToCartItem(
            item: mockCartItemWithRemarks,
            remarkMessage: remarkText,
          ),
        ).thenAnswer((invocation) async => Right([mockCartItemWithRemarks]));
      },
      act: (bloc) {
        bloc.add(
          CartEvent.addRemarkToCartItem(
            item: mockCartItemWithRemarks,
            message: remarkText,
          ),
        );
      },
      expect: () => [
        CartState.initial().copyWith(
          cartItems: mockMaterialCartItemList,
          isFetching: true,
        ),
        CartState.initial().copyWith(
          isFetching: false,
          cartItems: [mockCartItemWithRemarks],
          apiFailureOrSuccessOption: none(),
        ),
      ],
    );
  });
}
