import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CartRepositoryMock extends Mock implements CartRepository {}

void main() {
  late CartRepository cartRepositoryMock;
  final mockCartItemList = [
    CartItem.empty().copyWith(
      quantity: 1,
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168451'),
        materialDescription: ' Triglyceride Mosys D',
        principalData: PrincipalData.empty().copyWith(
          principalName: '台灣拜耳股份有限公司',
        ),
      ),
    ),
  ];

  group(
    'Testing CartBloc',
    () {
      setUp(() {
        cartRepositoryMock = CartRepositoryMock();
        when(() => cartRepositoryMock.initCartStorage())
            .thenAnswer((invocation) async => const Right(unit));
      });
      blocTest<CartBloc, CartState>(
        'Initialize CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => const Right(<CartItem>[]));
        },
        act: (bloc) => bloc.add(const CartEvent.initialized()),
        expect: () => [
          CartState.initial(),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <CartItem>[],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <CartItem>[],
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Fetch with Data CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => Right(mockCartItemList));
        },
        act: (bloc) => bloc.add(const CartEvent.fetch()),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <CartItem>[],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: mockCartItemList,
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Fetch with APIError CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
        },
        act: (bloc) => bloc.add(const CartEvent.fetch()),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <CartItem>[],
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
      blocTest<CartBloc, CartState>(
        'Add to Cart Success CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.addToCart(cartItem: CartItem.empty()))
              .thenAnswer((invocation) async => Right(mockCartItemList));
          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => Right(mockCartItemList));
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(item: CartItem.empty())),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: mockCartItemList,
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Add to Cart Failure CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.addToCart(cartItem: CartItem.empty()))
              .thenAnswer((invocation) async =>
                  const Left(ApiFailure.other('Fake-Error')));
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(item: CartItem.empty())),
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
      blocTest<CartBloc, CartState>(
        'Remove from Cart Success CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() =>
                  cartRepositoryMock.deleteFromCart(cartItem: CartItem.empty()))
              .thenAnswer((invocation) async => Right([CartItem.empty()]));
          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => Right([CartItem.empty()]));
        },
        act: (bloc) =>
            bloc.add(CartEvent.removeFromCart(item: CartItem.empty())),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: [CartItem.empty()],
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Remove from Cart Failure CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() =>
                  cartRepositoryMock.deleteFromCart(cartItem: CartItem.empty()))
              .thenAnswer((invocation) async =>
                  const Left(ApiFailure.other('Fake-Error')));
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
        },
        act: (bloc) =>
            bloc.add(CartEvent.removeFromCart(item: CartItem.empty())),
        expect: () => [
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
    },
  );
}
