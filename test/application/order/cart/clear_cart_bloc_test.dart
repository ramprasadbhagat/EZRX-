import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
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

  group('Testing Clear Cart Only Selected Items', () {
    late CartItem cartItem1;
    late CartItem cartItem2;
    setUp(() {
      cartItem1 = CartItem(
        materials: [
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('0000012345678'),
            ),
          ),
        ],
        itemType: CartItemType.material,
      );

      cartItem2 = CartItem(
        materials: [
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('0000012345679'),
            ),
          ),
        ],
        itemType: CartItemType.material,
        isSelected: false,
      );
    });
    blocTest<CartBloc, CartState>(
      'Clear Selected Item from cart Success',
      build: () => CartBloc(cartRepositoryMock),
      seed: () => CartState.initial().copyWith(cartItems: [
        cartItem1,
        cartItem2,
      ]),
      setUp: () {
        when(() => cartRepositoryMock.clearCartOnlySelectedItems(
            selectedItemIds: ['0000012345678'])).thenAnswer(
          (invocation) async => Right([cartItem2]),
        );
      },
      act: (bloc) => bloc.add(
        const CartEvent.clearSelectedItemsFromCart(
            selectedItemIds: ['0000012345678']),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isClearing: true,
          cartItems: [
            cartItem1,
            cartItem2,
          ],
        ),
        CartState.initial().copyWith(
          isClearing: false,
          cartItems: [
            CartItem(
              materials: [
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('0000012345679'),
                  ),
                ),
              ],
              itemType: CartItemType.material,
              isSelected: false,
            ),
          ],
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Clear cart for selected items Fail',
      build: () => CartBloc(cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        cartItems: [
          cartItem1,
          cartItem2,
        ],
      ),
      setUp: () {
        when(() => cartRepositoryMock.clearCartOnlySelectedItems(
            selectedItemIds: ['0000012345678'])).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-Error')),
        );
      },
      act: (bloc) => bloc.add(
        const CartEvent.clearSelectedItemsFromCart(
            selectedItemIds: ['0000012345678']),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isClearing: true,
          cartItems: [
            cartItem1,
            cartItem2,
          ],
        ),
        CartState.initial().copyWith(
            isClearing: false,
            cartItems: [
              cartItem1,
              cartItem2,
            ],
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-Error')))),
      ],
    );
  });
}
