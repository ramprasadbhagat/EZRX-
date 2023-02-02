import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing remove from cart', () {
    blocTest<CartBloc, CartState>(
      'Remove from Cart Success CartBloc',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.deleteFromCart(item: mockCartItem))
            .thenAnswer((invocation) async => Right([mockCartItem]));
        when(() => cartRepositoryMock.updateDiscountQty(items: [mockCartItem]))
            .thenAnswer((invocation) => [mockCartItem]);
      },
      act: (bloc) => bloc.add(CartEvent.removeFromCart(item: mockCartItem)),
      expect: () => [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [mockCartItem],
          isFetching: false,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Remove from Cart Failure CartBloc',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.deleteFromCart(item: mockCartItem))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('Fake-Error')));
      },
      act: (bloc) => bloc.add(CartEvent.removeFromCart(item: mockCartItem)),
      expect: () => [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake-Error'),
            ),
          ),
          isFetching: false,
        ),
      ],
    );
  });
}
