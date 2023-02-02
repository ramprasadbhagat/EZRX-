import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing Clear Cart', () {
    blocTest<CartBloc, CartState>(
      'Clear cart Success',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.clearCart()).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (bloc) => bloc.add(
        const CartEvent.clearCart(),
      ),
      expect: () => [
        CartState.initial().copyWith(isClearing: true),
        CartState.initial().copyWith(isClearing: false),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Clear cart Fail',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.clearCart()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-Error')),
        );
      },
      act: (bloc) => bloc.add(
        const CartEvent.clearCart(),
      ),
      expect: () => [
        CartState.initial().copyWith(isClearing: true),
        CartState.initial().copyWith(
            isClearing: false,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-Error')))),
      ],
    );
  });
}
