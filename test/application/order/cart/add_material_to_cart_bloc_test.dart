import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  final mockCartBloc = MockCartBloc();

  group('Testing addMaterialToCart', () {
    setUp(() {
      when(() => mockCartBloc.state).thenReturn(CartState.initial());
    });
    blocTest<CartBloc, CartState>(
      'Add Material to Cart Success CartBloc',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.addItemToCart(
            cartItem: CartItem.material(PriceAggregate.empty()),
            override: false,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          ),
        ).thenAnswer(
            (invocation) async => Right(<CartItem>[mockMaterialCartItemFirst]));

        when(() => cartRepositoryMock.updateDiscountQty(
                items: mockMaterialCartItemList))
            .thenAnswer((invocation) => mockMaterialCartItemList);

        when(() => cartRepositoryMock.updateMaterialDealBonus(
                  material: PriceAggregate.empty(),
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                ))
            .thenAnswer((invocation) async => Right(mockMaterialCartItemList));
      },
      act: (bloc) => bloc.add(CartEvent.addMaterialToCart(
        item: PriceAggregate.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        doNotallowOutOfStockMaterial: true,
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
      )),
      expect: () => [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: mockMaterialCartItemList,
          isFetching: false,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Add Material to Cart Failure CartBloc',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
                  cartItem: CartItem.material(PriceAggregate.empty()),
                  override: false,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                  doNotAllowOutOfStockMaterials: true,
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('Fake-Error')));
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: PriceAggregate.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake-Error'),
            ),
          ),
          isFetching: false,
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'Add to Cart fail for No Stock CartBloc',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
                  cartItem: CartItem.material(PriceAggregate.empty()),
                  override: false,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                  doNotAllowOutOfStockMaterials: true,
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.productOutOfStock()));
      },
      act: (bloc) => bloc.add(CartEvent.addMaterialToCart(
        item: PriceAggregate.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        doNotallowOutOfStockMaterial: true,
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
      )),
      expect: () => [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.productOutOfStock())),
          isFetching: false,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Tire add to cart with material in cart',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockZmgMaterialCartItemFirst.copyWith(materials: [
            mockZmgCartItemList.last.copyWith(
              price:
                  mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
            ),
          ])
        ],
      ),
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.addItemToCart(
            cartItem: mockZmgMaterialCartItemFirst.copyWith(materials: [
              mockZmgCartItemList.first.copyWith(
                quantity: 4,
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
              ),
            ]),
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
                mockZmgCartItemList.first.copyWith(
                  quantity: 5,
                  price: mockZmgCartItemList.first.price
                      .copyWith(zmgDiscount: false),
                ),
                mockZmgCartItemList.last.copyWith(
                  price: mockZmgCartItemList.last.price
                      .copyWith(zmgDiscount: false),
                ),
              ])
            ],
          ),
        );
        when(() => cartRepositoryMock.updateDiscountQty(items: [
              mockZmgMaterialCartItemFirst.copyWith(materials: [
                mockZmgCartItemList.first.copyWith(
                  quantity: 5,
                  price: mockZmgCartItemList.first.price
                      .copyWith(zmgDiscount: false),
                ),
                mockZmgCartItemList.last.copyWith(
                  price: mockZmgCartItemList.last.price
                      .copyWith(zmgDiscount: false),
                ),
              ])
            ])).thenAnswer((invocation) => [
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
            ]);
      },
      act: (bloc) => bloc.add(
        CartEvent.addMaterialToCart(
          item: mockZmgCartItemList.first.copyWith(
            quantity: 4,
            price: mockZmgCartItemList.first.price.copyWith(zmgDiscount: false),
          ),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(materials: [
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
  });
}
