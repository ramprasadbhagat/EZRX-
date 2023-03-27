import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  late CartRepositoryMock cartRepositoryMock;
  late CartBloc cartBloc;

  setUp(() {
    cartRepositoryMock = CartRepositoryMock();
    cartBloc = CartBloc(cartRepositoryMock);
  });

  group(
    'Testing update batch of Item from cart',
    () {
      blocTest<CartBloc, CartState>(
        'Batch update for cart Item Success',
        build: () => cartBloc,
        seed: () => CartState.initial().copyWith(
          cartItems: [mockCartItemWithOutBatch],
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updatedBatchInCartItem(
              item: mockCartItemWithOutBatch,
              stockInfo: batchStockInfoMock.first,
            ),
          ).thenAnswer(
            (invocation) async => Right([mockCartItemWithBatch]),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateBatchInCartItem(
            item: mockCartItemWithOutBatch,
            stockInfo: batchStockInfoMock.first,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            cartItems: [mockCartItemWithOutBatch],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            cartItems: [mockCartItemWithBatch],
          )
        ],
      );

      blocTest<CartBloc, CartState>(
        'Batch update for cart Item fail',
        build: () => cartBloc,
        seed: () => CartState.initial().copyWith(
          cartItems: [mockCartItemWithOutBatch],
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updatedBatchInCartItem(
              item: mockCartItemWithOutBatch,
              stockInfo: batchStockInfoMock.first,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-Error')),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateBatchInCartItem(
            item: mockCartItemWithOutBatch,
            stockInfo: batchStockInfoMock.first,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            cartItems: [mockCartItemWithOutBatch],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            cartItems: [mockCartItemWithOutBatch],
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-Error'),
              ),
            ),
          )
        ],
      );
    },
  );
}
