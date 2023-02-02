import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing update material to cart', () {
    blocTest<CartBloc, CartState>(
      'Update Cart Successful With No Stock',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                quantity: 1,
              )
            ],
          ),
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.getStockInfo(
                  material: mockMaterialList.first.materialInfo,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('Fake-Error')));
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: mockMaterialCartItemFirst.copyWith(
                materials: [
                  mockMaterialList.first
                      .copyWith(quantity: 4, stockInfo: StockInfo.empty())
                ],
              ),
              override: true),
        ).thenAnswer(
          (invocation) async => Right([
            mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.first.copyWith(quantity: 4)],
            ),
          ]),
        );
      },
      act: (bloc) => bloc.add(CartEvent.updateBundleItemQty(
        currentBundle: mockMaterialCartItemFirst.copyWith(
          materials: [mockMaterialList.first.copyWith(quantity: 1)],
        ),
        updatedQtyItem: mockMaterialList.first.copyWith(quantity: 4),
        customerCodeInfo: CustomerCodeInfo.empty(),
        doNotallowOutOfStockMaterial: false,
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToInfo: ShipToInfo.empty(),
      )),
      expect: () => [
        CartState.initial().copyWith(cartItems: [
          mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.first.copyWith(quantity: 1)]),
        ], isFetching: true, apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(cartItems: [
          mockMaterialCartItemFirst.copyWith(materials: [
            mockMaterialList.first.copyWith(
              quantity: 4,
            )
          ]),
        ], isFetching: false, apiFailureOrSuccessOption: none()),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Update Cart Successful with Stock',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                quantity: 1,
              )
            ],
          ),
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.getStockInfo(
              material: mockMaterialList.first.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(mockStockInfo));
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: mockMaterialCartItemFirst.copyWith(
                materials: [
                  mockMaterialList.first
                      .copyWith(quantity: 4, stockInfo: mockStockInfo)
                ],
              ),
              override: true),
        ).thenAnswer(
          (invocation) async => Right([
            mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.first.copyWith(quantity: 4)],
            ),
          ]),
        );
      },
      act: (bloc) => bloc.add(CartEvent.updateBundleItemQty(
        currentBundle: mockMaterialCartItemFirst.copyWith(
          materials: [mockMaterialList.first.copyWith(quantity: 1)],
        ),
        updatedQtyItem: mockMaterialList.first.copyWith(quantity: 4),
        customerCodeInfo: CustomerCodeInfo.empty(),
        doNotallowOutOfStockMaterial: true,
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToInfo: ShipToInfo.empty(),
      )),
      expect: () => [
        CartState.initial().copyWith(cartItems: [
          mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.first.copyWith(quantity: 1)]),
        ], isFetching: true, apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(cartItems: [
          mockMaterialCartItemFirst.copyWith(materials: [
            mockMaterialList.first.copyWith(
              quantity: 4,
            )
          ]),
        ], isFetching: false, apiFailureOrSuccessOption: none()),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Update Cart Fail with Stock',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                quantity: 1,
              )
            ],
          ),
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.getStockInfo(
              material: mockMaterialList.first.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(mockStockInfo));
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: mockMaterialCartItemFirst.copyWith(
                materials: [
                  mockMaterialList.first
                      .copyWith(quantity: 4, stockInfo: mockStockInfo)
                ],
              ),
              override: true),
        ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-Error')));
      },
      act: (bloc) => bloc.add(CartEvent.updateBundleItemQty(
        currentBundle: mockMaterialCartItemFirst.copyWith(
          materials: [mockMaterialList.first.copyWith(quantity: 1)],
        ),
        updatedQtyItem: mockMaterialList.first.copyWith(quantity: 4),
        customerCodeInfo: CustomerCodeInfo.empty(),
        doNotallowOutOfStockMaterial: true,
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToInfo: ShipToInfo.empty(),
      )),
      expect: () => [
        CartState.initial().copyWith(cartItems: [
          mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.first.copyWith(quantity: 1)]),
        ], isFetching: true, apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(
            cartItems: [
              mockMaterialCartItemFirst.copyWith(materials: [
                mockMaterialList.first.copyWith(
                  quantity: 1,
                )
              ]),
            ],
            isFetching: false,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-Error')))),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Update Cart fail for No Stock',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                quantity: 1,
              )
            ],
          ),
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.getStockInfo(
                  material: mockMaterialList.first.materialInfo,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('Product Not Available')));
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: mockMaterialCartItemFirst.copyWith(
                materials: [
                  mockMaterialList.first
                      .copyWith(quantity: 4, stockInfo: StockInfo.empty())
                ],
              ),
              override: true),
        ).thenAnswer((invocation) async =>
            const Left(ApiFailure.other('Product Not Available')));
      },
      act: (bloc) => bloc.add(CartEvent.updateBundleItemQty(
        currentBundle: mockMaterialCartItemFirst.copyWith(
          materials: [mockMaterialList.first.copyWith(quantity: 1)],
        ),
        updatedQtyItem: mockMaterialList.first.copyWith(quantity: 4),
        customerCodeInfo: CustomerCodeInfo.empty(),
        doNotallowOutOfStockMaterial: false,
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToInfo: ShipToInfo.empty(),
      )),
      expect: () => [
        CartState.initial().copyWith(cartItems: [
          mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.first.copyWith(quantity: 1)]),
        ], isFetching: true, apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(
            cartItems: [
              mockMaterialCartItemFirst.copyWith(
                  materials: [mockMaterialList.first.copyWith(quantity: 1)])
            ],
            isFetching: false,
            apiFailureOrSuccessOption: optionOf(
                const Left(ApiFailure.other('Product Not Available')))),
      ],
    );

    blocTest<CartBloc, CartState>(
      'zmgMaterial cart Item update failure',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockZmgMaterialCartItemFirst.copyWith(materials: [
            mockZmgCartItemList.first.copyWith(
              quantity: 1,
            ),
          ])
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.getStockInfo(
              material: mockZmgCartItemList.first.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(mockStockInfo));
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first
                    .copyWith(quantity: 4, stockInfo: mockStockInfo)
              ]),
              override: true),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (bloc) => bloc.add(CartEvent.updateBundleItemQty(
        currentBundle: mockZmgMaterialCartItemFirst.copyWith(
          materials: [mockZmgCartItemList.first.copyWith(quantity: 1)],
        ),
        updatedQtyItem: mockZmgCartItemList.first.copyWith(quantity: 4),
        customerCodeInfo: CustomerCodeInfo.empty(),
        doNotallowOutOfStockMaterial: true,
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToInfo: ShipToInfo.empty(),
      )),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(quantity: 1),
            ])
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(quantity: 1),
            ])
          ],
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake-Error'),
            ),
          ),
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
    blocTest<CartBloc, CartState>(
      'Tire update Tire material in cart',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockZmgMaterialCartItemFirst.copyWith(materials: [
            mockZmgCartItemList.first.copyWith(
              price:
                  mockZmgCartItemList.first.price.copyWith(zmgDiscount: false),
            ),
            mockZmgCartItemList.last.copyWith(
              price:
                  mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
            ),
          ])
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.getStockInfo(
              material: mockZmgCartItemList.first.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(mockStockInfo));
        when(
          () => cartRepositoryMock.addItemToCart(
              cartItem: mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                  quantity: 4,
                  price: mockZmgCartItemList.first.price
                      .copyWith(zmgDiscount: false),
                  stockInfo: mockStockInfo,
                ),
              ]),
              override: true),
        ).thenAnswer(
          (invocation) async => Right(
            [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                  quantity: 5,
                  discountedMaterialCount: 5,
                  price: mockZmgCartItemList.first.price
                      .copyWith(zmgDiscount: false),
                ),
                mockZmgCartItemList.last.copyWith(
                  discountedMaterialCount: 1,
                  price: mockZmgCartItemList.last.price
                      .copyWith(zmgDiscount: false),
                ),
              ])
            ],
          ),
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.updateBundleItemQty(
          currentBundle: mockZmgMaterialCartItemFirst.copyWith(materials: [
            mockZmgCartItemList.first.copyWith(
              quantity: 1,
              price:
                  mockZmgCartItemList.first.price.copyWith(zmgDiscount: false),
            ),
          ]),
          updatedQtyItem: mockZmgCartItemList.first.copyWith(
            quantity: 4,
            price: mockZmgCartItemList.first.price.copyWith(zmgDiscount: false),
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
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
              ),
              mockZmgCartItemList.last.copyWith(
                price:
                    mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
              ),
            ])
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(
                quantity: 5,
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
                discountedMaterialCount: 5,
              ),
              mockZmgCartItemList.last.copyWith(
                price:
                    mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
                discountedMaterialCount: 1,
              ),
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
          mockZmgCartItemList.last.price.priceTireItem.last.rate,
        );
      },
    );
    blocTest<CartBloc, CartState>(
      'Update BundleItem Quantity Fail for No Stock',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockMaterialCartItemFirst.copyWith(
            materials: [
              mockMaterialList.first.copyWith(
                quantity: 1,
              )
            ],
          ),
        ],
        isFetching: false,
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.getStockInfo(
                  material: mockMaterialList.first.materialInfo,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('Product Not Available')));
      },
      act: (bloc) => bloc.add(CartEvent.updateBundleItemQty(
        currentBundle: mockMaterialCartItemFirst.copyWith(
          materials: [mockMaterialList.first.copyWith(quantity: 1)],
        ),
        updatedQtyItem: mockMaterialList.first.copyWith(quantity: 4),
        customerCodeInfo: CustomerCodeInfo.empty(),
        doNotallowOutOfStockMaterial: true,
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToInfo: ShipToInfo.empty(),
      )),
      expect: () => [
        CartState.initial().copyWith(cartItems: [
          mockMaterialCartItemFirst.copyWith(
              materials: [mockMaterialList.first.copyWith(quantity: 1)]),
        ], isFetching: true, apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(
            cartItems: [
              mockMaterialCartItemFirst.copyWith(
                  materials: [mockMaterialList.first.copyWith(quantity: 1)])
            ],
            isFetching: false,
            apiFailureOrSuccessOption: optionOf(
                const Left(ApiFailure.other('Product Not Available')))),
      ],
    );
  });
}
