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

  group('Testing remove bonus from cart', () {
    blocTest<CartBloc, CartState>(
      'remove  bonus from cart Item Success',
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
        when(() => cartRepositoryMock.deleteBonusFromCartItem(
              deletedBonus: MaterialItemBonus.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: mockMaterialList.first.getMaterialNumber,
                ),
                additionalBonusFlag: false,
                qty: 1,
              ),
              item: mockMaterialCartItemFirst.copyWith(materials: [
                mockMaterialList.first.copyWith(
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber:
                            mockMaterialList.first.getMaterialNumber,
                      ),
                      additionalBonusFlag: false,
                      qty: 1,
                    ),
                  ],
                )
              ]),
            )).thenAnswer(
          (invocation) async => Right(
            [
              mockMaterialCartItemFirst
                  .copyWith(materials: [mockMaterialList.first])
            ],
          ),
        );
      },
      act: (bloc) => bloc.add(CartEvent.removeBonusFromCartItem(
        item: mockMaterialCartItemFirst.copyWith(materials: [
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
        bonusItem: MaterialItemBonus.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: mockMaterialList.first.getMaterialNumber,
          ),
          additionalBonusFlag: false,
          qty: 1,
        ),
      )),
      expect: () => [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
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
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [
            mockMaterialCartItemFirst
                .copyWith(materials: [mockMaterialList.first])
          ],
          isFetching: false,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'remove  bonus from cart Item Fail',
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
        when(() => cartRepositoryMock.deleteBonusFromCartItem(
                  deletedBonus: MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: mockMaterialList.first.getMaterialNumber,
                    ),
                    additionalBonusFlag: false,
                    qty: 1,
                  ),
                  item: mockMaterialCartItemFirst.copyWith(materials: [
                    mockMaterialList.first.copyWith(
                      addedBonusList: [
                        MaterialItemBonus.empty().copyWith(
                          materialInfo: MaterialInfo.empty().copyWith(
                            materialNumber:
                                mockMaterialList.first.getMaterialNumber,
                          ),
                          additionalBonusFlag: false,
                          qty: 1,
                        ),
                      ],
                    )
                  ]),
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('fake-Error')));
      },
      act: (bloc) => bloc.add(CartEvent.removeBonusFromCartItem(
        item: mockMaterialCartItemFirst.copyWith(materials: [
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
        bonusItem: MaterialItemBonus.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: mockMaterialList.first.getMaterialNumber,
          ),
          additionalBonusFlag: false,
          qty: 1,
        ),
      )),
      expect: () => [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
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
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-Error'))),
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
      ],
    );
  });
}
