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

  group('Testing replace with order Items', () {
    blocTest<CartBloc, CartState>(
      'Replace with orderItems Success',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.replaceCartWithItems(
              items: mockCartBundleList,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotAllowOutOfStockMaterials: true,
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            )).thenAnswer((invocation) async => Right(mockCartBundleList));

        when(() =>
                cartRepositoryMock.updateDiscountQty(items: mockCartBundleList))
            .thenAnswer((invocation) => mockCartBundleList);
      },
      act: (bloc) => bloc.add(CartEvent.replaceWithOrderItems(
        items: mockCartBundleList,
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
          cartItems: mockCartBundleList,
          isFetching: false,
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'Replace with orderItems Fail',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.replaceCartWithItems(
                  items: mockCartBundleList,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                  doNotAllowOutOfStockMaterials: true,
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('fake-Error')));
      },
      act: (bloc) => bloc.add(CartEvent.replaceWithOrderItems(
        items: mockCartBundleList,
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
              optionOf(const Left(ApiFailure.other('fake-Error'))),
          isFetching: false,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Replace with orderItems no Stock',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.replaceCartWithItems(
                  items: [
                    mockCartBundleList.first
                        .copyWith(materials: [PriceAggregate.empty()])
                  ],
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                  doNotAllowOutOfStockMaterials: true,
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.productOutOfStock()));
      },
      act: (bloc) => bloc.add(CartEvent.replaceWithOrderItems(
        items: [
          mockCartBundleList.first.copyWith(materials: [PriceAggregate.empty()])
        ],
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
          cartItems: [],
          isFetching: false,
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'Replace with orderItems with bonus',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.replaceCartWithItems(
              items: cartItemListWithBonus,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotAllowOutOfStockMaterials: true,
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            )).thenAnswer((invocation) async => Right(cartItemListWithBonus));
        when(() => cartRepositoryMock
                .updateDiscountQty(items: cartItemListWithBonus))
            .thenAnswer((invocation) => [
                  CartItem(
                      itemType: CartItemType.material,
                      materials: cartItemListWithBonus.first.materials)
                ]);
        when(() => cartRepositoryMock.updateMaterialDealBonus(
                  materials: cartItemListWithBonus.first.materials,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                ))
            .thenAnswer((invocation) async => Right([
                  mockMaterialCartItemList.first.materials.first
                      .copyWith(quantity: 10)
                ]));
      },
      act: (bloc) => bloc.add(CartEvent.replaceWithOrderItems(
        items: cartItemListWithBonus,
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
          cartItems: [
            CartItem(
                itemType: CartItemType.material,
                materials: cartItemListWithBonus.first.materials)
          ],
          isFetching: false,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [
            CartItem(materials: [
              mockMaterialCartItemList.first.materials.first.copyWith(
                  price: cartItemListWithBonus.first.materials.first.price)
            ], itemType: CartItemType.material)
          ],
          cartProducts: [
            mockMaterialCartItemList.first.materials.first
                .copyWith(quantity: 10)
          ],
          isFetching: false,
        ),
      ],
    );
  });
}
