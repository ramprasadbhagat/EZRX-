import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing add bonus to cart', () {
    blocTest<CartBloc, CartState>(
      'add a bonus to cart item',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: mockMaterialList.first.materialInfo,
                    qty: 1,
                  ),
                ],
              )
            ],
          ),
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.addBonusToCartItem(
            newBonus: MaterialItemBonus.empty().copyWith(
              qty: 2,
              materialInfo: mockMaterialList.first.materialInfo,
            ),
            item: mockMaterialCartItemFirst.copyWith(
              materials: [
                mockMaterialList.first.copyWith(
                  materialInfo: mockMaterialList.first.materialInfo,
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: mockMaterialList.first.materialInfo,
                      qty: 1,
                    ),
                  ],
                )
              ],
            ),
            overrideQty: true,
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            [
              mockMaterialCartItemFirst.copyWith(
                materials: [
                  mockMaterialList.first.copyWith(
                    materialInfo: mockMaterialList.first.materialInfo,
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                        qty: 2,
                        materialInfo: mockMaterialList.first.materialInfo,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.addBonusToCartItem(
          bonusItem: MaterialItemBonus.empty().copyWith(
            qty: 2,
            materialInfo: mockMaterialList.first.materialInfo,
          ),
          item: mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                materialInfo: mockMaterialList.first.materialInfo,
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: mockMaterialList.first.materialInfo,
                    qty: 1,
                  ),
                ],
              )
            ],
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          overrideQty: true,
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockMaterialCartItemFirst.copyWith(
              materials: [
                mockMaterialList.first.copyWith(
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      qty: 1,
                      materialInfo: mockMaterialList.first.materialInfo,
                    )
                  ],
                )
              ],
            ),
          ],
          isFetchingBonus: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [
            mockMaterialCartItemFirst.copyWith(
              materials: [
                mockMaterialList.first.copyWith(
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      qty: 2,
                      bonusOverrideFlag: false,
                      materialInfo: mockMaterialList.first.materialInfo,
                    )
                  ],
                )
              ],
            )
          ],
          isFetchingBonus: false,
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'add a bonus to cart item fail',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: mockMaterialList.first.materialInfo,
                    qty: 1,
                  ),
                ],
              )
            ],
          ),
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.addBonusToCartItem(
            newBonus: MaterialItemBonus.empty().copyWith(
              qty: 2,
              materialInfo: mockMaterialList.first.materialInfo,
            ),
            item: mockMaterialCartItemFirst.copyWith(
              materials: [
                mockMaterialList.first.copyWith(
                  materialInfo: mockMaterialList.first.materialInfo,
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: mockMaterialList.first.materialInfo,
                      qty: 1,
                    ),
                  ],
                )
              ],
            ),
            overrideQty: true,
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-Error')),
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.addBonusToCartItem(
          bonusItem: MaterialItemBonus.empty().copyWith(
            qty: 2,
            materialInfo: mockMaterialList.first.materialInfo,
          ),
          item: mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                materialInfo: mockMaterialList.first.materialInfo,
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: mockMaterialList.first.materialInfo,
                    qty: 1,
                  ),
                ],
              )
            ],
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          overrideQty: true,
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockMaterialCartItemFirst.copyWith(
              materials: [
                mockMaterialList.first.copyWith(
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      qty: 1,
                      materialInfo: mockMaterialList.first.materialInfo,
                    )
                  ],
                )
              ],
            ),
          ],
          isFetchingBonus: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-Error'))),
          cartItems: [
            mockMaterialCartItemFirst.copyWith(
              materials: [
                mockMaterialList.first.copyWith(
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      qty: 1,
                      materialInfo: mockMaterialList.first.materialInfo,
                    )
                  ],
                )
              ],
            )
          ],
          isFetchingBonus: false,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'add a bonus to cart item with no stock',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst
              .copyWith(materials: [PriceAggregate.empty()]),
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.addBonusToCartItem(
            item: mockMaterialCartItemFirst
                .copyWith(materials: [PriceAggregate.empty()]),
            newBonus: MaterialItemBonus.empty(),
            overrideQty: true,
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.productOutOfStock()),
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.addBonusToCartItem(
          bonusItem: MaterialItemBonus.empty(),
          item: mockMaterialCartItemFirst
              .copyWith(materials: [PriceAggregate.empty()]),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          overrideQty: true,
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [
            mockMaterialCartItemFirst
                .copyWith(materials: [PriceAggregate.empty()])
          ],
          isFetchingBonus: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.productOutOfStock(),
            ),
          ),
          cartItems: [
            mockMaterialCartItemFirst
                .copyWith(materials: [PriceAggregate.empty()])
          ],
          isFetchingBonus: false,
        ),
      ],
    );
  });

  ///Todo: Write bonus cartbloc
}
