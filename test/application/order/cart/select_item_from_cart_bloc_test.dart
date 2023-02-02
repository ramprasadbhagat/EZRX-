import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing select/deSelect Item from cart', () {
    blocTest<CartBloc, CartState>(
      'Select Item from cart Success',
      build: () => CartBloc(cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.first.copyWith(quantity: 1)])
        ],
        isFetching: true,
      ),
      setUp: () {
        when(
          () => cartRepositoryMock.updateSelectionInCart(
            updatedItem: mockMaterialCartItemFirst.copyWith(
                materials: [mockMaterialList.first.copyWith(quantity: 1)]),
          ),
        ).thenAnswer((invocation) async => Right([mockMaterialCartItemFirst]));
      },
      act: (bloc) => bloc.add(CartEvent.selectButtonTapped(
        cartItem: mockMaterialCartItemFirst.copyWith(
            materials: [mockMaterialList.first.copyWith(quantity: 1)]),
      )),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [mockMaterialCartItemFirst],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Select Item from cart Fail',
      build: () => CartBloc(cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.first.copyWith(quantity: 1)])
        ],
        isFetching: true,
      ),
      setUp: () {
        when(
          () => cartRepositoryMock.updateSelectionInCart(
            updatedItem: mockMaterialCartItemFirst.copyWith(
                materials: [mockMaterialList.first.copyWith(quantity: 1)]),
          ),
        ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-Error')));
      },
      act: (bloc) => bloc.add(CartEvent.selectButtonTapped(
        cartItem: mockMaterialCartItemFirst.copyWith(
            materials: [mockMaterialList.first.copyWith(quantity: 1)]),
      )),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockMaterialCartItemFirst.copyWith(
                materials: [mockMaterialList.first.copyWith(quantity: 1)])
          ],
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-Error'))),
          isFetching: false,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Select/De-Select all Item from cart Success',
      build: () => CartBloc(cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [mockMaterialList.first.copyWith(quantity: 1)],
          ),
          mockMaterialCartItemFirst.copyWith(
            materials: [mockMaterialList.last.copyWith(quantity: 1)],
          ),
        ],
        isFetching: true,
      ),
      setUp: () {
        when(
          () => cartRepositoryMock.updateAllSelectionInCart(
            currentCart: [
              mockMaterialCartItemFirst.copyWith(
                  materials: [mockMaterialList.first.copyWith(quantity: 1)]),
              mockMaterialCartItemFirst.copyWith(
                  materials: [mockMaterialList.last.copyWith(quantity: 1)]),
            ],
          ),
        ).thenAnswer((invocation) async => Right([mockMaterialCartItemFirst]));
      },
      act: (bloc) => bloc.add(
        const CartEvent.selectAllButtonTapped(),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [mockMaterialCartItemFirst],
          isFetching: false,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Select/De-Select all Item from cart Fail',
      build: () => CartBloc(cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [mockMaterialList.first.copyWith(quantity: 1)],
          ),
          mockMaterialCartItemFirst.copyWith(
            materials: [mockMaterialList.last.copyWith(quantity: 1)],
          ),
        ],
        isFetching: true,
      ),
      setUp: () {
        when(
          () => cartRepositoryMock.updateAllSelectionInCart(
            currentCart: [
              mockMaterialCartItemFirst.copyWith(
                  materials: [mockMaterialList.first.copyWith(quantity: 1)]),
              mockMaterialCartItemFirst.copyWith(
                  materials: [mockMaterialList.last.copyWith(quantity: 1)]),
            ],
          ),
        ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-Error')));
      },
      act: (bloc) => bloc.add(
        const CartEvent.selectAllButtonTapped(),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.first.copyWith(quantity: 1)],
            ),
            mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.last.copyWith(quantity: 1)],
            ),
          ],
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-Error'))),
          isFetching: false,
        ),
      ],
    );
  });
}
