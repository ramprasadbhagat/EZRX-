import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_detail_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialPriceDetailRepositoryMock extends Mock
    implements MaterialPriceDetailRepository {}

void main() {
  late MaterialPriceDetailRepository mockRepository;
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
          principalName: PrincipalName('台灣拜耳股份有限公司'),
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
  setUp(() {
    mockRepository = MaterialPriceDetailRepositoryMock();
  });
  group(
    'Testing CartBloc',
    () {
      blocTest<AddToCartBloc, AddToCartState>(
        'Initialize AddToCartBloc',
        build: () =>
            AddToCartBloc(materialPriceDetailRepository: mockRepository),
        act: (bloc) => bloc.add(const AddToCartEvent.initialized()),
        expect: () => [
          AddToCartState.initial(),
        ],
      );

      blocTest<AddToCartBloc, AddToCartState>(
        'Fetch failure',
        build: () =>
            AddToCartBloc(materialPriceDetailRepository: mockRepository),
        setUp: () {
          when(
            () => mockRepository.getMaterialDetail(
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToCodeInfo: ShipToInfo.empty(),
              materialNumber: MaterialNumber('fake-number'),
            ),
          ).thenAnswer(
            (_) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (bloc) => bloc.add(
          AddToCartEvent.fetch(
            customerCode: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToCode: ShipToInfo.empty(),
            cartZmgQtyExcludeCurrent: 0,
            isSpecialOrderType: true,
            materialNumber: MaterialNumber('fake-number'),
          ),
        ),
        expect: () => [
          AddToCartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItem: PriceAggregate.empty(),
            isFetching: true,
          ),
          AddToCartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            isFetching: false,
          ),
        ],
      );

      blocTest<AddToCartBloc, AddToCartState>(
        'Fetch success',
        build: () =>
            AddToCartBloc(materialPriceDetailRepository: mockRepository),
        setUp: () {
          when(
            () => mockRepository.getMaterialDetail(
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToCodeInfo: ShipToInfo.empty(),
              materialNumber: MaterialNumber('fake-number'),
            ),
          ).thenAnswer(
            (_) async => Right(
              MaterialPriceDetail.empty().copyWith(
                info: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-number'),
                ),
                price: Price.empty().copyWith(
                  materialNumber: MaterialNumber('fake-number'),
                ),
              ),
            ),
          );
        },
        act: (bloc) => bloc.add(
          AddToCartEvent.fetch(
            customerCode: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToCode: ShipToInfo.empty(),
            cartZmgQtyExcludeCurrent: 0,
            isSpecialOrderType: true,
            materialNumber: MaterialNumber('fake-number'),
          ),
        ),
        expect: () => [
          AddToCartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItem: PriceAggregate.empty(),
            isFetching: true,
          ),
          AddToCartState.initial().copyWith(
            cartItem: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-number'),
              ),
              price: Price.empty().copyWith(
                materialNumber: MaterialNumber('fake-number'),
              ),
              salesOrgConfig: SalesOrganisationConfigs.empty(),
              isSpecialOrderType: true,
            ),
            isFetching: false,
          ),
        ],
      );

      blocTest<AddToCartBloc, AddToCartState>(
        'SetCartItem AddToCartBloc',
        build: () =>
            AddToCartBloc(materialPriceDetailRepository: mockRepository),
        act: (bloc) =>
            bloc.add(AddToCartEvent.setCartItem(mockCartItemList.first)),
        expect: () => [
          AddToCartState.initial().copyWith(
            cartItem: mockCartItemList.first,
            isFetching: false,
          )
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
        build: () =>
            AddToCartBloc(materialPriceDetailRepository: mockRepository),
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
        build: () =>
            AddToCartBloc(materialPriceDetailRepository: mockRepository),
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
        build: () =>
            AddToCartBloc(materialPriceDetailRepository: mockRepository),
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
          addToCartQuantity = 3;
          onCartDiscountProductQuantity = 2;
        },
        build: () =>
            AddToCartBloc(materialPriceDetailRepository: mockRepository),
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
          ),
        ],
        verify: (AddToCartBloc bloc) {
          expect(
            bloc.state.cartItem.finalPrice,
            mockCartItemList.first.price
                .copyWith(zmgDiscount: true)
                .priceTireItem[1]
                .rate,
          );
          expect(
            bloc.state.cartItem.finalPriceTotal,
            mockCartItemList.first.price
                    .copyWith(zmgDiscount: true)
                    .priceTireItem[1]
                    .rate *
                addToCartQuantity,
          );
        },
      );
    },
  );
}
