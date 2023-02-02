import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing add remarks to cart', () {
    blocTest<CartBloc, CartState>(
      'Add Failure Remarks CartBloc',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addRemarkToCartItem(
                item: mockCartItem, remarkMessage: 'test-Message'))
            .thenAnswer((invocation) async => Right([mockCartItem]));
      },
      act: (bloc) {
        bloc.add(CartEvent.addRemarkToCartItem(
            item: mockCartItem, message: 'test-Message'));
      },
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          isFetching: false,
          cartItems: [mockCartItem],
          apiFailureOrSuccessOption: none(),
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'Add Failure Remarks Fail CartBloc',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() =>
            cartRepositoryMock.addRemarkToCartItem(
                item: mockCartItem, remarkMessage: 'test-Message')).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-message')));
      },
      act: (bloc) {
        bloc.add(CartEvent.addRemarkToCartItem(
            item: mockCartItem, message: 'test-Message'));
      },
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-message'))),
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'Add Remarks to bonus item Success',
      build: () => CartBloc(
        cartRepositoryMock,
      ),
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(materials: [
            mockMaterialList.first.copyWith(
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: mockMaterialList.first.getMaterialNumber,
                  ),
                  additionalBonusFlag: false,
                  qty: 1,
                ),
              ],
            )
          ]),
        ],
        isFetching: true,
      ),
      setUp: () {
        when(() => cartRepositoryMock.addRemarkToBonusItem(
                bonus: MaterialItemBonus.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: mockMaterialList.first.getMaterialNumber,
                  ),
                  additionalBonusFlag: false,
                  qty: 1,
                ),
                item: mockMaterialCartItemFirst
                    .copyWith(materials: [mockMaterialList.first]),
                remarkMessage: 'test-Message'))
            .thenAnswer((invocation) async => Right([
                  mockMaterialCartItemFirst.copyWith(materials: [
                    mockMaterialList.first.copyWith(addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                        materialInfo: MaterialInfo.empty().copyWith(
                            materialNumber:
                                mockMaterialList.first.getMaterialNumber,
                            remarks: 'test-Message'),
                        additionalBonusFlag: false,
                        qty: 1,
                      ),
                    ])
                  ])
                ]));
      },
      act: (bloc) {
        bloc.add(CartEvent.addRemarkToBonusItem(
            item: mockMaterialCartItemFirst
                .copyWith(materials: [mockMaterialList.first]),
            bonusItem: MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: mockMaterialList.first.getMaterialNumber,
              ),
              additionalBonusFlag: false,
              qty: 1,
            ),
            message: 'test-Message'));
      },
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockMaterialCartItemFirst.copyWith(materials: [
              mockMaterialList.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber:
                            mockMaterialList.first.getMaterialNumber,
                        remarks: 'test-Message'),
                    additionalBonusFlag: false,
                    qty: 1,
                  ),
                ],
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'Add Remarks to bonus item Fail',
      build: () => CartBloc(
        cartRepositoryMock,
      ),
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(materials: [
            mockMaterialList.first.copyWith(
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: mockMaterialList.first.getMaterialNumber,
                  ),
                  additionalBonusFlag: false,
                  qty: 1,
                ),
              ],
            )
          ]),
        ],
        isFetching: false,
      ),
      setUp: () {
        when(() => cartRepositoryMock.addRemarkToBonusItem(
            bonus: MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: mockMaterialList.first.getMaterialNumber,
              ),
              additionalBonusFlag: false,
              qty: 1,
            ),
            item: mockMaterialCartItemFirst
                .copyWith(materials: [mockMaterialList.first]),
            remarkMessage:
                'test-Message')).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-Error')));
      },
      act: (bloc) {
        bloc.add(CartEvent.addRemarkToBonusItem(
            item: mockMaterialCartItemFirst
                .copyWith(materials: [mockMaterialList.first]),
            bonusItem: MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: mockMaterialList.first.getMaterialNumber,
              ),
              additionalBonusFlag: false,
              qty: 1,
            ),
            message: 'test-Message'));
      },
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockMaterialCartItemFirst.copyWith(materials: [
              mockMaterialList.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: mockMaterialList.first.getMaterialNumber,
                    ),
                    additionalBonusFlag: false,
                    qty: 1,
                  ),
                ],
              )
            ]),
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockMaterialCartItemFirst.copyWith(materials: [
              mockMaterialList.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: mockMaterialList.first.getMaterialNumber,
                    ),
                    additionalBonusFlag: false,
                    qty: 1,
                  ),
                ],
              )
            ])
          ],
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-Error'))),
          isFetching: false,
        ),
      ],
    );
  });
}
