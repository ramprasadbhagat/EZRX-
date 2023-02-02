import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
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
          () => cartRepositoryMock.getStockInfo(
            material: mockMaterialList.first.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer((invocation) async => Right(mockStockInfo));
        when(() => cartRepositoryMock.addBonusToCartItem(
              newBonus: MaterialItemBonus.empty().copyWith(
                qty: 2,
                inStock: mockStockInfo.inStock.getOrCrash(),
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
            )).thenAnswer(
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
            mockMaterialCartItemFirst.copyWith(materials: [
              mockMaterialList.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    qty: 1,
                    materialInfo: mockMaterialList.first.materialInfo,
                  )
                ],
              )
            ]),
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [
            mockMaterialCartItemFirst.copyWith(materials: [
              mockMaterialList.first.copyWith(addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                    qty: 2,
                    bonusOverrideFlag: false,
                    materialInfo: mockMaterialList.first.materialInfo)
              ])
            ])
          ],
          isFetching: false,
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
          () => cartRepositoryMock.getStockInfo(
            material: mockMaterialList.first.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer((invocation) async => Right(mockStockInfo));
        when(() => cartRepositoryMock.addBonusToCartItem(
                  newBonus: MaterialItemBonus.empty().copyWith(
                    qty: 2,
                    inStock: mockStockInfo.inStock.getOrCrash(),
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
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('fake-Error')));
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
            mockMaterialCartItemFirst.copyWith(materials: [
              mockMaterialList.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    qty: 1,
                    materialInfo: mockMaterialList.first.materialInfo,
                  )
                ],
              )
            ]),
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-Error'))),
          cartItems: [
            mockMaterialCartItemFirst.copyWith(materials: [
              mockMaterialList.first.copyWith(addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                    qty: 1, materialInfo: mockMaterialList.first.materialInfo)
              ])
            ])
          ],
          isFetching: false,
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
        when(() => cartRepositoryMock.getStockInfo(
                  material: MaterialInfo.empty(),
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('Product Not Available')));
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
            overrideQty: true),
      ),
      expect: () => [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [
            mockMaterialCartItemFirst
                .copyWith(materials: [PriceAggregate.empty()])
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(const Left(
            ApiFailure.other('Product Not Available'),
          )),
          cartItems: [
            mockMaterialCartItemFirst
                .copyWith(materials: [PriceAggregate.empty()])
          ],
          isFetching: false,
        ),
      ],
    );
  });

  group('Test Bonus CartBloc', () {
    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with no quantity Bonus',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus913MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ])
            ],
          ),
        );

        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    quantity: 2,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 2,
              ),
            ])
          ],
        );

        when(() => cartRepositoryMock.updateMaterialDealBonus(
                  material: bonus913MockCartItem,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                ))
            .thenAnswer((invocation) async => Right(bonus913mockMaterialList));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus913MockCartItem.copyWith(quantity: 2),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 2,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        )
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 2,
        );
        expect(
          // ignore: invalid_use_of_protected_member
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isEmpty,
          true,
        );
      },
    );

    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 1 quantity Bonus fail',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus913MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
              ),
            ])
          ],
        );

        when(() => cartRepositoryMock.updateMaterialDealBonus(
                  material: bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                  ),
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('fake-Error')));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus913MockCartItem.copyWith(
            quantity: bonus913MockCartItem
                .price.priceBonusItem.last.qualifyingQuantity,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-Error'),
            ),
          ),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
        );
        expect(
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isEmpty,
          true,
        );
      },
    );
    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 1 quantity Bonus for 911',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus911MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus911mockMaterialList.first.copyWith(materials: [
                bonus911MockCartItem.copyWith(
                  quantity: bonus911MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus911mockMaterialList.first.copyWith(materials: [
                bonus911MockCartItem.copyWith(
                  quantity: bonus911MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus911mockMaterialList.first.copyWith(materials: [
                  bonus911MockCartItem.copyWith(
                    quantity: bonus911MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus911mockMaterialList.first.copyWith(materials: [
              bonus911MockCartItem.copyWith(
                quantity: bonus911MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ])
          ],
        );
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: bonus911MockCartItem.copyWith(
                quantity: bonus911MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(
              [
                bonus911mockMaterialList.first.copyWith(materials: [
                  bonus911MockCartItem.copyWith(
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                          additionalBonusFlag: false, bonusOverrideFlag: true)
                    ],
                    quantity: bonus911MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            ));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus911MockCartItem.copyWith(
            quantity: bonus911MockCartItem
                .price.priceBonusItem.last.qualifyingQuantity,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus911mockMaterialList.first.copyWith(materials: [
              bonus911MockCartItem.copyWith(
                quantity: bonus911MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus911mockMaterialList.first.copyWith(materials: [
              bonus911MockCartItem.copyWith(
                quantity: bonus911MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus911mockMaterialList.first.copyWith(materials: [
              bonus911MockCartItem.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                      additionalBonusFlag: false, bonusOverrideFlag: true)
                ],
                quantity: bonus911MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus911MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus911MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
        );
        expect(
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isNotEmpty,
          true,
        );
      },
    );

    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 1 quantity Bonus for 914',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus914MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus914mockMaterialList.first.copyWith(materials: [
                bonus914MockCartItem.copyWith(
                  quantity: bonus914MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus914mockMaterialList.first.copyWith(materials: [
                bonus914MockCartItem.copyWith(
                  quantity: bonus914MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus914mockMaterialList.first.copyWith(materials: [
                  bonus914MockCartItem.copyWith(
                    quantity: bonus914MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus914mockMaterialList.first.copyWith(materials: [
              bonus914MockCartItem.copyWith(
                quantity: bonus914MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ])
          ],
        );
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: bonus914MockCartItem.copyWith(
                quantity: bonus914MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(
              [
                bonus914mockMaterialList.first.copyWith(materials: [
                  bonus914MockCartItem.copyWith(
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                          additionalBonusFlag: false, bonusOverrideFlag: true)
                    ],
                    quantity: bonus914MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            ));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus914MockCartItem.copyWith(
            quantity: bonus914MockCartItem
                .price.priceBonusItem.last.qualifyingQuantity,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus914mockMaterialList.first.copyWith(materials: [
              bonus914MockCartItem.copyWith(
                quantity: bonus914MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus914mockMaterialList.first.copyWith(materials: [
              bonus914MockCartItem.copyWith(
                quantity: bonus914MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus914mockMaterialList.first.copyWith(materials: [
              bonus914MockCartItem.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                      additionalBonusFlag: false, bonusOverrideFlag: true)
                ],
                quantity: bonus914MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus914MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus914MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
        );
        expect(
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isNotEmpty,
          true,
        );
      },
    );
    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 1 quantity Bonus for 915',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus915MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus915mockMaterialList.first.copyWith(materials: [
                bonus915MockCartItem.copyWith(
                  quantity: bonus915MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus915mockMaterialList.first.copyWith(materials: [
                bonus915MockCartItem.copyWith(
                  quantity: bonus915MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus915mockMaterialList.first.copyWith(materials: [
                  bonus915MockCartItem.copyWith(
                    quantity: bonus915MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus915mockMaterialList.first.copyWith(materials: [
              bonus915MockCartItem.copyWith(
                quantity: bonus915MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ])
          ],
        );
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: bonus915MockCartItem.copyWith(
                quantity: bonus915MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(
              [
                bonus915mockMaterialList.first.copyWith(materials: [
                  bonus915MockCartItem.copyWith(
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                          additionalBonusFlag: false, bonusOverrideFlag: true)
                    ],
                    quantity: bonus915MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            ));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus915MockCartItem.copyWith(
            quantity: bonus915MockCartItem
                .price.priceBonusItem.last.qualifyingQuantity,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus915mockMaterialList.first.copyWith(materials: [
              bonus915MockCartItem.copyWith(
                quantity: bonus915MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus915mockMaterialList.first.copyWith(materials: [
              bonus915MockCartItem.copyWith(
                quantity: bonus915MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus915mockMaterialList.first.copyWith(materials: [
              bonus915MockCartItem.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                      additionalBonusFlag: false, bonusOverrideFlag: true)
                ],
                quantity: bonus915MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus915MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus915MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
        );
        expect(
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isNotEmpty,
          true,
        );
      },
    );
    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 1 quantity Bonus for 913',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus913MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ])
          ],
        );
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(
              [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                          additionalBonusFlag: false, bonusOverrideFlag: true)
                    ],
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            ));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus913MockCartItem.copyWith(
            quantity: bonus913MockCartItem
                .price.priceBonusItem.last.qualifyingQuantity,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                      additionalBonusFlag: false, bonusOverrideFlag: true)
                ],
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
        );
        expect(
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isNotEmpty,
          true,
        );
      },
    );

    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 2 quantity Bonus',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus913MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );

        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ])
          ],
        );
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(
              [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                          additionalBonusFlag: false, bonusOverrideFlag: true)
                    ],
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            ));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus913MockCartItem.copyWith(
            quantity: bonus913MockCartItem.price.priceBonusItem
                .elementAt(1)
                .qualifyingQuantity,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                      additionalBonusFlag: false, bonusOverrideFlag: true)
                ],
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 5,
        );
        expect(
          // ignore: invalid_use_of_protected_member
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isNotEmpty,
          true,
        );
      },
    );

    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 3 quantity Bonus',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus913MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );

        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.first.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ])
          ],
        );
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(
              [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                          additionalBonusFlag: false, bonusOverrideFlag: true)
                    ],
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.first.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            ));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus913MockCartItem.copyWith(
            quantity: bonus913MockCartItem
                .price.priceBonusItem.first.qualifyingQuantity,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                      additionalBonusFlag: false, bonusOverrideFlag: true)
                ],
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 10,
        );
        expect(
          // ignore: invalid_use_of_protected_member
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isNotEmpty,
          true,
        );
      },
    );

    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 1 and Tire 2 quantity Bonus',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus913MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );

        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: 8,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: 8,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    quantity: 8,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 8,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ])
          ],
        );
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: bonus913MockCartItem.copyWith(
                quantity: 8,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(
              [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                          additionalBonusFlag: false, bonusOverrideFlag: true)
                    ],
                    quantity: 8,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            ));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus913MockCartItem.copyWith(
            quantity: 8,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 8,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 8,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                      additionalBonusFlag: false, bonusOverrideFlag: true)
                ],
                quantity: 8,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 8,
        );
        expect(
          // ignore: invalid_use_of_protected_member
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isNotEmpty,
          true,
        );
      },
    );
    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 1 and Tire 3 quantity Bonus',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus913MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );

        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: 13,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: 13,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    quantity: 13,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 13,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ])
          ],
        );
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: bonus913MockCartItem.copyWith(
                quantity: 13,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(
              [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                          additionalBonusFlag: false, bonusOverrideFlag: true)
                    ],
                    quantity: 13,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            ));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus913MockCartItem.copyWith(
            quantity: 13,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 13,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 13,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                      additionalBonusFlag: false, bonusOverrideFlag: true)
                ],
                quantity: 13,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 13,
        );
        expect(
          // ignore: invalid_use_of_protected_member
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isNotEmpty,
          true,
        );
      },
    );

    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 2 and Tire 3 quantity Bonus',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus913MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );

        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: 15,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: 15,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    quantity: 15,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 15,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ])
          ],
        );
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: bonus913MockCartItem.copyWith(
                quantity: 15,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(
              [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                          additionalBonusFlag: false, bonusOverrideFlag: true)
                    ],
                    quantity: 15,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            ));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus913MockCartItem.copyWith(
            quantity: 15,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 15,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 15,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                      additionalBonusFlag: false, bonusOverrideFlag: true)
                ],
                quantity: 15,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 15,
        );
        expect(
          // ignore: invalid_use_of_protected_member
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isNotEmpty,
          true,
        );
      },
    );

    blocTest<CartBloc, CartState>(
      'Bonus item added to cart with Tire 1, Tire 2 and Tire 3 quantity Bonus',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfo(
            material: bonus913MockCartItem.materialInfo,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockStockInfo.copyWith(
              materialNumber: bonusMaterialNumber,
            ),
          ),
        );

        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: 18,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
              override: false),
        ).thenAnswer(
          (invocation) async => Right(
            [
              bonus913mockMaterialList.first.copyWith(materials: [
                bonus913MockCartItem.copyWith(
                  quantity: 18,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ]),
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(
              items: [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    quantity: 18,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            )).thenAnswer(
          (invocation) => [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 18,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ])
          ],
        );
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: bonus913MockCartItem.copyWith(
                quantity: 18,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(
              [
                bonus913mockMaterialList.first.copyWith(materials: [
                  bonus913MockCartItem.copyWith(
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                          additionalBonusFlag: false, bonusOverrideFlag: true)
                    ],
                    quantity: 18,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  ),
                ])
              ],
            ));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: bonus913MockCartItem.copyWith(
            quantity: 18,
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 18,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                quantity: 18,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          cartItems: [
            bonus913mockMaterialList.first.copyWith(materials: [
              bonus913MockCartItem.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                      additionalBonusFlag: false, bonusOverrideFlag: true)
                ],
                quantity: 18,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ])
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
        );
        expect(
          bloc.state.cartItems.first.materials.first.finalPriceTotal,
          bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 18,
        );
        expect(
          // ignore: invalid_use_of_protected_member
          bloc.state.cartItems.first.materials.first.addedDealBonusMaterial
              .isNotEmpty,
          true,
        );
      },
    );
  });
}
