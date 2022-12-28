import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddToCartBlocMock extends Mock implements AddToCartBloc {}

void main() {
  final priceTierItem1 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 1,
    rate: 5230,
  );
  final priceTierItem2 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 3,
    rate: 5530,
  );
  final priceTierItem3 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 5,
    rate: 5730,
  );

  final mockCartItemList = [
    PriceAggregate.empty().copyWith(
      quantity: 1,
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168451'),
        materialDescription: ' Triglyceride Mosys D',
        principalData: PrincipalData.empty().copyWith(
          principalName: '台灣拜耳股份有限公司',
        ),
      ),
      price: Price.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168451'),
        tiers: [
          PriceTier.empty().copyWith(
            tier: '',
            items: [
              priceTierItem1,
              priceTierItem2,
              priceTierItem3,
            ],
          )
        ],
        zmgDiscount: false,
        finalPrice: MaterialPrice(5200),
      ),
    ),
  ];

  var addToCartQuantity = 0;
  var onCartDiscountProductQuantity = 0;

  group(
    'Testing CartBloc',
    () {
      blocTest<AddToCartBloc, AddToCartState>(
        'Initialize AddToCartBloc',
        build: () => AddToCartBloc(),
        act: (bloc) => bloc.add(const AddToCartEvent.initialized()),
        expect: () => [
          AddToCartState.initial(),
        ],
      );

      blocTest<AddToCartBloc, AddToCartState>(
        'Fetch AddToCartBloc',
        build: () => AddToCartBloc(),
        act: (bloc) => bloc.add(const AddToCartEvent.fetch()),
        expect: () => [],
      );

      blocTest<AddToCartBloc, AddToCartState>(
        'SetCartItem AddToCartBloc',
        build: () => AddToCartBloc(),
        act: (bloc) =>
            bloc.add(AddToCartEvent.setCartItem(mockCartItemList.first)),
        expect: () => [
          AddToCartState.initial().copyWith(cartItem: mockCartItemList.first)
        ],
        verify: (AddToCartBloc bloc) {
          expect(
            bloc.state.cartItem.finalPrice,
            mockCartItemList.first.price.priceTireItem.last.rate,
          );
        },
      );

      blocTest<AddToCartBloc, AddToCartState>(
        'UpdateQuantity AddToCartBloc for Material',
        setUp: () {
          addToCartQuantity = 2;
          onCartDiscountProductQuantity = 0;
        },
        build: () => AddToCartBloc(),
        seed: () =>
            AddToCartState.initial().copyWith(cartItem: mockCartItemList.first),
        act: (bloc) => bloc.add(AddToCartEvent.updateQuantity(
          addToCartQuantity,
          onCartDiscountProductQuantity,
        )),
        expect: () => [
          AddToCartState.initial().copyWith(
            cartItem: mockCartItemList.first.copyWith(
              discountedMaterialCount:
                  onCartDiscountProductQuantity + addToCartQuantity,
              quantity: addToCartQuantity,
            ),
            quantity: addToCartQuantity,
          ),
        ],
        verify: (AddToCartBloc bloc) {
          expect(
            bloc.state.cartItem.finalPrice,
            mockCartItemList.first.price.priceTireItem.last.rate,
          );
          expect(
            bloc.state.cartItem.finalPriceTotal,
            (mockCartItemList.first
                    .copyWith(quantity: 2)
                    .price
                    .priceTireItem
                    .last
                    .rate *
                2),
          );
        },
      );

      blocTest<AddToCartBloc, AddToCartState>(
        'UpdateQuantity AddToCartBloc for Material with zmg discount enable with empty cart',
        setUp: () {
          addToCartQuantity = 5;
          onCartDiscountProductQuantity = 0;
        },
        build: () => AddToCartBloc(),
        seed: () => AddToCartState.initial().copyWith(
          cartItem: mockCartItemList.first.copyWith(
            price: mockCartItemList.first.price.copyWith(
              zmgDiscount: true,
            ),
          ),
        ),
        act: (bloc) => bloc.add(AddToCartEvent.updateQuantity(
          addToCartQuantity,
          onCartDiscountProductQuantity,
        )),
        expect: () => [
          AddToCartState.initial().copyWith(
            cartItem: mockCartItemList.first.copyWith(
              discountedMaterialCount: addToCartQuantity,
              quantity: addToCartQuantity,
              price: mockCartItemList.first.price.copyWith(
                zmgDiscount: true,
              ),
            ),
            quantity: addToCartQuantity,
          ),
        ],
        verify: (AddToCartBloc bloc) {
          expect(
            bloc.state.cartItem.finalPrice,
            mockCartItemList.first.price
                .copyWith(zmgDiscount: true)
                .priceTireItem
                .first
                .rate,
          );
          expect(
            bloc.state.cartItem.finalPriceTotal,
            mockCartItemList.first.price
                    .copyWith(zmgDiscount: true)
                    .priceTireItem
                    .first
                    .rate *
                addToCartQuantity,
          );
        },
      );

      blocTest<AddToCartBloc, AddToCartState>(
        'UpdateQuantity AddToCartBloc for Material with zmg discount enable with zmg discount Material on cart',
        setUp: () {
          addToCartQuantity = 2;
          onCartDiscountProductQuantity = 3;
        },
        build: () => AddToCartBloc(),
        seed: () => AddToCartState.initial().copyWith(
          cartItem: mockCartItemList.first.copyWith(
            price: mockCartItemList.first.price.copyWith(
              zmgDiscount: true,
            ),
          ),
        ),
        act: (bloc) => bloc.add(AddToCartEvent.updateQuantity(
            addToCartQuantity, onCartDiscountProductQuantity)),
        expect: () => [
          AddToCartState.initial().copyWith(
            cartItem: mockCartItemList.first.copyWith(
              discountedMaterialCount:
                  (addToCartQuantity + onCartDiscountProductQuantity),
              quantity: addToCartQuantity,
              price: mockCartItemList.first.price.copyWith(
                zmgDiscount: true,
              ),
            ),
            quantity: addToCartQuantity,
          ),
        ],
        verify: (AddToCartBloc bloc) {
          expect(
            bloc.state.cartItem.finalPrice,
            mockCartItemList.first.price
                .copyWith(zmgDiscount: true)
                .priceTireItem
                .first
                .rate,
          );
          expect(
            bloc.state.cartItem.finalPriceTotal,
            mockCartItemList.first
                    .copyWith(
                      discountedMaterialCount:
                          (addToCartQuantity + onCartDiscountProductQuantity),
                      quantity: addToCartQuantity,
                    )
                    .price
                    .copyWith(zmgDiscount: true)
                    .priceTireItem
                    .first
                    .rate *
                addToCartQuantity,
          );
        },
      );

      blocTest<AddToCartBloc, AddToCartState>(
        'Tire Material UpdateQuantity AddToCartBloc for Material with Trie discount enable in cart',
        setUp: () {
          addToCartQuantity = 5;
          onCartDiscountProductQuantity = 0;
        },
        build: () => AddToCartBloc(),
        seed: () => AddToCartState.initial().copyWith(
          cartItem: mockCartItemList.first,
        ),
        act: (bloc) => bloc.add(AddToCartEvent.updateQuantity(
          addToCartQuantity,
          onCartDiscountProductQuantity,
        )),
        expect: () => [
          AddToCartState.initial().copyWith(
            cartItem: mockCartItemList.first.copyWith(
              discountedMaterialCount: addToCartQuantity,
              quantity: addToCartQuantity,
              price: mockCartItemList.first.price.copyWith(),
            ),
            quantity: addToCartQuantity,
          ),
        ],
        verify: (AddToCartBloc bloc) {
          expect(
            bloc.state.cartItem.finalPrice,
            mockCartItemList.first.price
                .copyWith(zmgDiscount: true)
                .priceTireItem
                .first
                .rate,
          );
          expect(
            bloc.state.cartItem.finalPriceTotal,
            mockCartItemList.first.price
                    .copyWith(zmgDiscount: true)
                    .priceTireItem
                    .first
                    .rate *
                addToCartQuantity,
          );
        },
      );

      blocTest<AddToCartBloc, AddToCartState>(
        'Tire Material UpdateQuantity AddToCartBloc for Material with Trie discount enable in cart',
        setUp: () {
          addToCartQuantity = 3;
          onCartDiscountProductQuantity = 2;
        },
        build: () => AddToCartBloc(),
        seed: () => AddToCartState.initial().copyWith(
          cartItem: mockCartItemList.first,
        ),
        act: (bloc) => bloc.add(AddToCartEvent.updateQuantity(
          addToCartQuantity,
          onCartDiscountProductQuantity,
        )),
        expect: () => [
          AddToCartState.initial().copyWith(
            cartItem: mockCartItemList.first.copyWith(
              discountedMaterialCount:
                  addToCartQuantity + onCartDiscountProductQuantity,
              quantity: addToCartQuantity,
              price: mockCartItemList.first.price.copyWith(),
            ),
            quantity: addToCartQuantity,
          ),
        ],
        verify: (AddToCartBloc bloc) {
          expect(
            bloc.state.cartItem.finalPrice,
            mockCartItemList.first.price
                .copyWith(zmgDiscount: true)
                .priceTireItem
                .first
                .rate,
          );
          expect(
            bloc.state.cartItem.finalPriceTotal,
            mockCartItemList.first.price
                    .copyWith(zmgDiscount: true)
                    .priceTireItem
                    .first
                    .rate *
                addToCartQuantity,
          );
        },
      );
    },
  );
}
