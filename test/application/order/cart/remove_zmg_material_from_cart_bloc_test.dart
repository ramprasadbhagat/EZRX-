import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing remove zmgMaterial from cart', () {
    blocTest<CartBloc, CartState>(
      'zmgMaterial remove from cart',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockZmgMaterialCartItemFirst.copyWith(materials: [
            mockZmgCartItemList.first.copyWith(quantity: 1),
            mockZmgCartItemList.last.copyWith(quantity: 5)
          ])
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.deleteFromCart(
            item: mockZmgMaterialCartItemFirst
                .copyWith(materials: [mockZmgCartItemList.last]),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(quantity: 1),
              ])
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(items: [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(quantity: 1),
              ], itemType: CartItemType.material)
            ])).thenAnswer((invocation) => [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first
                    .copyWith(quantity: 1, discountedMaterialCount: 1),
              ])
            ]);
      },
      act: (bloc) => bloc.add(CartEvent.removeFromCart(
          item: mockZmgMaterialCartItemFirst
              .copyWith(materials: [mockZmgCartItemList.last]))),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(quantity: 1),
              mockZmgCartItemList.last.copyWith(quantity: 5),
            ])
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first
                  .copyWith(quantity: 1, discountedMaterialCount: 1),
            ])
          ],
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          mockZmgCartItemList.first.price.priceTireItem.last.rate,
        );
      },
    );
  });
}
