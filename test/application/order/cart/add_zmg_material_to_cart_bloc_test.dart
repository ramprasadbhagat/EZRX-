import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing Add zmgMaterial', () {
    blocTest<CartBloc, CartState>(
      'zmgMaterial 1 add to cart with empty cart',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
              cartItem: mockZmgMaterialCartItemFirst
                  .copyWith(materials: [mockZmgCartItemList.first]),
              override: false,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotAllowOutOfStockMaterials: true,
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            )).thenAnswer((invocation) async => Right(<CartItem>[
              mockZmgMaterialCartItemFirst
                  .copyWith(materials: [mockZmgCartItemList.first])
            ]));
        when(() => cartRepositoryMock.updateDiscountQty(items: [
              mockZmgMaterialCartItemFirst.copyWith(
                  materials: [mockZmgCartItemList.first],
                  itemType: CartItemType.material)
            ])).thenAnswer((invocation) => [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(discountedMaterialCount: 1)
              ])
            ]);

        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: PriceAggregate.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right([
              mockZmgMaterialCartItemFirst
                  .copyWith(materials: [mockZmgCartItemList.first])
            ]));
      },
      act: (bloc) => bloc.add(CartEvent.addMaterialToCart(
          item: mockZmgCartItemList.first,
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty())),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(discountedMaterialCount: 1)
            ])
          ],
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          mockZmgCartItemList.first.price
              .copyWith(zmgDiscount: true)
              .priceTireItem
              .last
              .rate,
        );

        expect(
          bloc.state
              .zmgMaterialCount(itemMaterialGroup: MaterialGroup.two('004')),
          1,
        );
      },
    );
    blocTest<CartBloc, CartState>(
      'zmgMaterial 1 add to cart with empty cart and MaterialGroup4 is FOC',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
              cartItem: mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo: MaterialInfo.empty()
                        .copyWith(materialGroup4: MaterialGroup.four('6A1')))
              ]),
              override: false,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotAllowOutOfStockMaterials: true,
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            )).thenAnswer((invocation) async => Right(<CartItem>[
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo: MaterialInfo.empty()
                        .copyWith(materialGroup4: MaterialGroup.four('6A1')))
              ])
            ]));
        when(() => cartRepositoryMock.updateDiscountQty(items: [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo: MaterialInfo.empty()
                        .copyWith(materialGroup4: MaterialGroup.four('6A1')))
              ], itemType: CartItemType.material)
            ])).thenAnswer((invocation) => [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    discountedMaterialCount: 1,
                    materialInfo: MaterialInfo.empty()
                        .copyWith(materialGroup4: MaterialGroup.four('6A1')))
              ])
            ]);

        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: PriceAggregate.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right([
              mockZmgMaterialCartItemFirst
                  .copyWith(materials: [mockZmgCartItemList.first])
            ]));
      },
      act: (bloc) => bloc.add(CartEvent.addMaterialToCart(
          item: mockZmgCartItemList.first.copyWith(
              materialInfo: MaterialInfo.empty()
                  .copyWith(materialGroup4: MaterialGroup.four('6A1'))),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty())),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(
                  discountedMaterialCount: 1,
                  materialInfo: MaterialInfo.empty()
                      .copyWith(materialGroup4: MaterialGroup.four('6A1')))
            ])
          ],
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          mockZmgCartItemList.first.price
              .copyWith(zmgDiscount: true)
              .priceTireItem
              .last
              .rate,
        );

        expect(
          bloc.state
              .zmgMaterialCount(itemMaterialGroup: MaterialGroup.two('004')),
          0,
        );
        expect(bloc.state.containCovidMaterial, true);
      },
    );
    blocTest<CartBloc, CartState>(
      'zmgMaterial 1 add to cart with empty cart and MaterialGroup4 is not FOC',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
              cartItem: mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo: MaterialInfo.empty()
                        .copyWith(materialGroup4: MaterialGroup.four('OTH')))
              ]),
              override: false,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotAllowOutOfStockMaterials: true,
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            )).thenAnswer((invocation) async => Right(<CartItem>[
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo: MaterialInfo.empty()
                        .copyWith(materialGroup4: MaterialGroup.four('OTH')))
              ])
            ]));
        when(() => cartRepositoryMock.updateDiscountQty(items: [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo: MaterialInfo.empty()
                        .copyWith(materialGroup4: MaterialGroup.four('OTH')))
              ], itemType: CartItemType.material)
            ])).thenAnswer((invocation) => [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    discountedMaterialCount: 1,
                    materialInfo: MaterialInfo.empty()
                        .copyWith(materialGroup4: MaterialGroup.four('OTH')))
              ])
            ]);

        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: PriceAggregate.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right([
              mockZmgMaterialCartItemFirst
                  .copyWith(materials: [mockZmgCartItemList.first])
            ]));
      },
      act: (bloc) => bloc.add(CartEvent.addMaterialToCart(
          item: mockZmgCartItemList.first.copyWith(
              materialInfo: MaterialInfo.empty()
                  .copyWith(materialGroup4: MaterialGroup.four('OTH'))),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty())),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(
                  discountedMaterialCount: 1,
                  materialInfo: MaterialInfo.empty()
                      .copyWith(materialGroup4: MaterialGroup.four('OTH')))
            ])
          ],
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          mockZmgCartItemList.first.price
              .copyWith(zmgDiscount: true)
              .priceTireItem
              .last
              .rate,
        );

        expect(
          bloc.state
              .zmgMaterialCount(itemMaterialGroup: MaterialGroup.two('004')),
          0,
        );
        expect(bloc.state.containNonCovidMaterial, true);
      },
    );
    blocTest<CartBloc, CartState>(
      'zmgMaterial 1 add to cart with empty cart and MaterialInfo is SampleMaterial',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
              cartItem: mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo:
                        MaterialInfo.empty().copyWith(isSampleMaterial: true))
              ]),
              override: false,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotAllowOutOfStockMaterials: true,
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            )).thenAnswer((invocation) async => Right(<CartItem>[
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo:
                        MaterialInfo.empty().copyWith(isSampleMaterial: true))
              ])
            ]));
        when(() => cartRepositoryMock.updateDiscountQty(items: [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo:
                        MaterialInfo.empty().copyWith(isSampleMaterial: true))
              ], itemType: CartItemType.material)
            ])).thenAnswer((invocation) => [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    discountedMaterialCount: 1,
                    materialInfo:
                        MaterialInfo.empty().copyWith(isSampleMaterial: true))
              ])
            ]);

        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: PriceAggregate.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right([
              mockZmgMaterialCartItemFirst
                  .copyWith(materials: [mockZmgCartItemList.first])
            ]));
      },
      act: (bloc) => bloc.add(CartEvent.addMaterialToCart(
          item: mockZmgCartItemList.first.copyWith(
              materialInfo:
                  MaterialInfo.empty().copyWith(isSampleMaterial: true)),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty())),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(
                  discountedMaterialCount: 1,
                  materialInfo:
                      MaterialInfo.empty().copyWith(isSampleMaterial: true))
            ])
          ],
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          mockZmgCartItemList.first.price
              .copyWith(zmgDiscount: true)
              .priceTireItem
              .last
              .rate,
        );

        expect(
          bloc.state
              .zmgMaterialCount(itemMaterialGroup: MaterialGroup.two('004')),
          0,
        );
        expect(bloc.state.containSampleMaterial, true);
      },
    );
    blocTest<CartBloc, CartState>(
      'zmgMaterial 1 add to cart with empty cart and MaterialInfo is FOC and not SampleMaterial',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
              cartItem: mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo: MaterialInfo.empty()
                        .copyWith(isSampleMaterial: false, isFOCMaterial: true))
              ]),
              override: false,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotAllowOutOfStockMaterials: true,
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            )).thenAnswer((invocation) async => Right(<CartItem>[
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo: MaterialInfo.empty()
                        .copyWith(isSampleMaterial: false, isFOCMaterial: true))
              ])
            ]));
        when(() => cartRepositoryMock.updateDiscountQty(items: [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo: MaterialInfo.empty()
                        .copyWith(isSampleMaterial: false, isFOCMaterial: true))
              ], itemType: CartItemType.material)
            ])).thenAnswer((invocation) => [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    discountedMaterialCount: 1,
                    materialInfo: MaterialInfo.empty()
                        .copyWith(isSampleMaterial: false, isFOCMaterial: true))
              ])
            ]);

        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: PriceAggregate.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right([
              mockZmgMaterialCartItemFirst
                  .copyWith(materials: [mockZmgCartItemList.first])
            ]));
      },
      act: (bloc) => bloc.add(CartEvent.addMaterialToCart(
          item: mockZmgCartItemList.first.copyWith(
              materialInfo: MaterialInfo.empty()
                  .copyWith(isSampleMaterial: false, isFOCMaterial: true)),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty())),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(
                  discountedMaterialCount: 1,
                  materialInfo: MaterialInfo.empty()
                      .copyWith(isSampleMaterial: false, isFOCMaterial: true))
            ])
          ],
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          mockZmgCartItemList.first.price
              .copyWith(zmgDiscount: true)
              .priceTireItem
              .last
              .rate,
        );

        expect(
          bloc.state
              .zmgMaterialCount(itemMaterialGroup: MaterialGroup.two('004')),
          0,
        );
        expect(bloc.state.containNonRegularMaterial, true);
      },
    );
    blocTest<CartBloc, CartState>(
      'zmgMaterial 1 add to cart with empty cart and MaterialInfo is not FOC',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
              cartItem: mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo:
                        MaterialInfo.empty().copyWith(isFOCMaterial: false))
              ]),
              override: false,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotAllowOutOfStockMaterials: true,
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            )).thenAnswer((invocation) async => Right(<CartItem>[
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo:
                        MaterialInfo.empty().copyWith(isFOCMaterial: false))
              ])
            ]));
        when(() => cartRepositoryMock.updateDiscountQty(items: [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    materialInfo:
                        MaterialInfo.empty().copyWith(isFOCMaterial: false))
              ], itemType: CartItemType.material)
            ])).thenAnswer((invocation) => [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                    discountedMaterialCount: 1,
                    materialInfo:
                        MaterialInfo.empty().copyWith(isFOCMaterial: false))
              ])
            ]);

        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: PriceAggregate.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right([
              mockZmgMaterialCartItemFirst
                  .copyWith(materials: [mockZmgCartItemList.first])
            ]));
      },
      act: (bloc) => bloc.add(CartEvent.addMaterialToCart(
          item: mockZmgCartItemList.first.copyWith(
              materialInfo:
                  MaterialInfo.empty().copyWith(isFOCMaterial: false)),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty())),
      expect: () => [
        CartState.initial().copyWith(
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(
                  discountedMaterialCount: 1,
                  materialInfo:
                      MaterialInfo.empty().copyWith(isFOCMaterial: false))
            ])
          ],
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          mockZmgCartItemList.first.price
              .copyWith(zmgDiscount: true)
              .priceTireItem
              .last
              .rate,
        );

        expect(
          bloc.state
              .zmgMaterialCount(itemMaterialGroup: MaterialGroup.two('004')),
          0,
        );
        expect(bloc.state.containNonRegularMaterial, true);
      },
    );
    blocTest<CartBloc, CartState>(
      'zmgMaterial add to cart with material in cart',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockZmgMaterialCartItemFirst.copyWith(
              materials: [mockZmgCartItemList.first.copyWith(quantity: 2)])
        ],
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.addItemToCart(
            cartItem: mockZmgMaterialCartItemFirst.copyWith(
                materials: [mockZmgCartItemList.last.copyWith(quantity: 3)]),
            override: false,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(quantity: 2),
                mockZmgCartItemList.last.copyWith(quantity: 3)
              ]),
            ],
          ),
        );

        when(() => cartRepositoryMock.updateDiscountQty(items: [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(quantity: 2),
                mockZmgCartItemList.last.copyWith(quantity: 3)
              ], itemType: CartItemType.material)
            ])).thenAnswer((invocation) => [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first
                    .copyWith(quantity: 2, discountedMaterialCount: 5),
                mockZmgCartItemList.last
                    .copyWith(quantity: 3, discountedMaterialCount: 5)
              ])
            ]);
        when(() => cartRepositoryMock.updateMaterialDealBonus(
              material: PriceAggregate.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right([
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(quantity: 2),
                mockZmgCartItemList.last.copyWith(quantity: 3)
              ]),
            ]));
      },
      act: (bloc) => bloc.add(CartEvent.addMaterialToCart(
        item: mockZmgCartItemList.last.copyWith(quantity: 3),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToInfo: ShipToInfo.empty(),
        doNotallowOutOfStockMaterial: true,
      )),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(quantity: 2),
            ])
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first
                  .copyWith(quantity: 2, discountedMaterialCount: 5),
              mockZmgCartItemList.last
                  .copyWith(quantity: 3, discountedMaterialCount: 5)
            ])
          ],
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.first.finalPrice,
          mockZmgCartItemList.first.price.priceTireItem.first.rate,
        );
        expect(
          bloc.state.cartItems.first.materials.last.finalPrice,
          mockZmgCartItemList.last.price.priceTireItem.first.rate,
        );
      },
    );

    blocTest<CartBloc, CartState>(
      'zmgMaterial increment material in cart',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockZmgMaterialCartItemFirst.copyWith(
              materials: [mockZmgCartItemList.last.copyWith(quantity: 1)])
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.updateMaterialQtyInCartItem(
            cartItem: mockZmgMaterialCartItemFirst.copyWith(
              materials: [mockZmgCartItemList.last.copyWith(quantity: 1)],
            ),
            updatedQtyItem: mockZmgCartItemList.last.copyWith(quantity: 5),
            override: true,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right([
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.last
                  .copyWith(quantity: 5, discountedMaterialCount: 5),
            ])
          ]),
        );
      },
      act: (bloc) => bloc.add(CartEvent.updateMaterialQtyInCartItem(
        currentItem: mockZmgMaterialCartItemFirst.copyWith(
          materials: [mockZmgCartItemList.last.copyWith(quantity: 1)],
        ),
        updatedQtyItem: mockZmgCartItemList.last.copyWith(quantity: 5),
        customerCodeInfo: CustomerCodeInfo.empty(),
        doNotallowOutOfStockMaterial: true,
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToInfo: ShipToInfo.empty(),
      )),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(
                materials: [mockZmgCartItemList.last.copyWith(quantity: 1)])
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.last
                  .copyWith(quantity: 5, discountedMaterialCount: 5)
            ])
          ],
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.last.finalPrice,
          mockZmgCartItemList.last.price
              .copyWith(zmgDiscount: true)
              .priceTireItem
              .first
              .rate,
        );
        expect(
          bloc.state.cartItems.first.materials.last.discountedMaterialCount,
          5,
        );
        expect(
            bloc.state
                .zmgMaterialCount(itemMaterialGroup: MaterialGroup.two('004')),
            5);
      },
    );

    blocTest<CartBloc, CartState>(
      'zmgMaterial decrement material in cart',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockZmgMaterialCartItemFirst.copyWith(
              materials: [mockZmgCartItemList.last.copyWith(quantity: 5)])
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.updateMaterialQtyInCartItem(
            cartItem: mockZmgMaterialCartItemFirst.copyWith(
              materials: [mockZmgCartItemList.last.copyWith(quantity: 5)],
            ),
            updatedQtyItem: mockZmgCartItemList.last.copyWith(quantity: 2),
            override: true,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right([
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.last
                  .copyWith(quantity: 2, discountedMaterialCount: 2),
            ])
          ]),
        );
      },
      act: (bloc) => bloc.add(CartEvent.updateMaterialQtyInCartItem(
        currentItem: mockZmgMaterialCartItemFirst.copyWith(
          materials: [mockZmgCartItemList.last.copyWith(quantity: 5)],
        ),
        updatedQtyItem: mockZmgCartItemList.last.copyWith(quantity: 2),
        customerCodeInfo: CustomerCodeInfo.empty(),
        doNotallowOutOfStockMaterial: true,
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToInfo: ShipToInfo.empty(),
      )),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(
                materials: [mockZmgCartItemList.last.copyWith(quantity: 5)])
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.last
                  .copyWith(quantity: 2, discountedMaterialCount: 2)
            ])
          ],
          isFetching: false,
        ),
      ],
      verify: (CartBloc bloc) {
        expect(
          bloc.state.cartItems.first.materials.last.finalPrice,
          mockZmgCartItemList.last.price
              .copyWith(zmgDiscount: true)
              .priceTireItem
              .last
              .rate,
        );
        expect(
          bloc.state.cartItems.first.materials.last.discountedMaterialCount,
          2,
        );
        expect(
            bloc.state
                .zmgMaterialCount(itemMaterialGroup: MaterialGroup.two('004')),
            2);
      },
    );
  });
}
