import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing Override cart item Price', () {
    blocTest<CartBloc, CartState>(
      'Override cart item price Success',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                  price: Price.empty().copyWith(finalPrice: MaterialPrice(200)))
            ],
          ),
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.overrideCartItemPrice(
              item: mockMaterialCartItemFirst
                  .copyWith(materials: [mockMaterialList.first]),
              overridePriceList: [
                Price.empty().copyWith(finalPrice: MaterialPrice(300))
              ]),
        ).thenAnswer((invocation) async => Right([
              mockMaterialCartItemFirst.copyWith(materials: [
                mockMaterialList.first.copyWith(
                    price:
                        Price.empty().copyWith(finalPrice: MaterialPrice(300)))
              ]),
            ]));
      },
      act: (bloc) => bloc.add(CartEvent.overrideCartItemPrice(
          cartItem: mockMaterialCartItemFirst
              .copyWith(materials: [mockMaterialList.first]),
          overridenPrice: [
            Price.empty().copyWith(finalPrice: MaterialPrice(300))
          ])),
      expect: () => [
        CartState.initial().copyWith(cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                  price: Price.empty().copyWith(finalPrice: MaterialPrice(200)))
            ],
          ),
        ], isFetching: true, apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                  price: Price.empty().copyWith(finalPrice: MaterialPrice(300)))
            ],
          ),
        ], isFetching: false, apiFailureOrSuccessOption: none()),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Override cart item price Fail',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                  price: Price.empty().copyWith(finalPrice: MaterialPrice(200)))
            ],
          ),
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.overrideCartItemPrice(
              item: mockMaterialCartItemFirst
                  .copyWith(materials: [mockMaterialList.first]),
              overridePriceList: [
                Price.empty().copyWith(finalPrice: MaterialPrice(300))
              ]),
        ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-Error')));
      },
      act: (bloc) => bloc.add(CartEvent.overrideCartItemPrice(
          cartItem: mockMaterialCartItemFirst
              .copyWith(materials: [mockMaterialList.first]),
          overridenPrice: [
            Price.empty().copyWith(finalPrice: MaterialPrice(300))
          ])),
      expect: () => [
        CartState.initial().copyWith(cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                  price: Price.empty().copyWith(finalPrice: MaterialPrice(200)))
            ],
          ),
        ], isFetching: true, apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(
            cartItems: [
              mockMaterialCartItemFirst.copyWith(
                materials: [
                  mockMaterialList.first.copyWith(
                      price: Price.empty()
                          .copyWith(finalPrice: MaterialPrice(200)))
                ],
              ),
            ],
            isFetching: false,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-Error')))),
      ],
    );
  });
}
