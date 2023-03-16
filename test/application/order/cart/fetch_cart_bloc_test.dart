import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing Initialize and FetchCart', () {
    blocTest<CartBloc, CartState>(
      '=> Initialize CartBloc and fetch',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.fetchCart())
            .thenAnswer((invocation) => Right(mockMaterialCartItemList));
        when(() => cartRepositoryMock.saveToCartWithUpdatedStockInfo(
                  cartItem: mockMaterialCartItemList,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                ))
            .thenAnswer((invocation) async => Right(mockMaterialCartItemList));
        when(() => cartRepositoryMock.updateDiscountQty(
                items: mockMaterialCartItemList))
            .thenAnswer((invocation) => mockMaterialCartItemList);
      },
      act: (bloc) => bloc
        ..add(CartEvent.fetch(
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotAllowOutOfStockMaterials: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          comboDealEligible: true,
        )),
      expect: () => [
        CartState.initial().copyWith(isFetching: true),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: mockMaterialCartItemList,
          isFetching: false,
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      '=> Fetch and receive all item out of stock',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.fetchCart())
            .thenAnswer((invocation) => const Right(<CartItem>[]));
        when(() => cartRepositoryMock.clearCart()).thenAnswer(
          (invocation) async => const Right(unit),
        );
        when(() => cartRepositoryMock.saveToCartWithUpdatedStockInfo(
              cartItem: <CartItem>[],
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => const Right(<CartItem>[]));
      },
      act: (bloc) => bloc
        ..add(CartEvent.fetch(
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotAllowOutOfStockMaterials: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          comboDealEligible: true,
        )),
      expect: () => [
        CartState.initial().copyWith(isFetching: true),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [],
          isFetching: false,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [],
          isClearing: true,
          isFetching: false,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [],
          isClearing: false,
          isFetching: false,
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      '=> Initialize CartBloc and fetch Stock Fail',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.fetchCart())
            .thenAnswer((invocation) => const Left(
                  ApiFailure.other('Fake-Error'),
                ));
      },
      act: (bloc) => bloc.add(CartEvent.fetch(
        customerCodeInfo: CustomerCodeInfo.empty(),
        doNotAllowOutOfStockMaterials: true,
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        shipToInfo: ShipToInfo.empty(),
        comboDealEligible: false,
      )),
      expect: () => [
        CartState.initial().copyWith(isFetching: true),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('Fake-Error')),
          ),
          cartItems: <CartItem>[],
          isFetching: false,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      '=> CartBloc Fetch with Mock Data',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.fetchCart())
            .thenAnswer((invocation) => Right(mockMaterialCartItemList));
        when(() => cartRepositoryMock.saveToCartWithUpdatedStockInfo(
                  cartItem: mockMaterialCartItemList,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                ))
            .thenAnswer((invocation) async => Right(mockMaterialCartItemList));
        when(() => cartRepositoryMock.updateDiscountQty(
                items: mockMaterialCartItemList))
            .thenAnswer((invocation) => mockMaterialCartItemList);
      },
      act: (bloc) => bloc
        ..add(CartEvent.fetch(
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotAllowOutOfStockMaterials: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          comboDealEligible: true,
        )),
      expect: () => [
        CartState.initial().copyWith(isFetching: true, cartItems: <CartItem>[]),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: mockMaterialCartItemList,
          isFetching: false,
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      '=> CartBloc Fetch when combo deal is disabled in sales configs',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        final comboItem = CartItem.comboDeal(mockMaterialList);
        final materialItem = CartItem.material(mockMaterialList.first);
        final mockCartItems = [materialItem, comboItem];

        when(() => cartRepositoryMock.fetchCart()).thenAnswer(
          (invocation) => Right(mockCartItems),
        );
        when(() => cartRepositoryMock.saveToCartWithUpdatedStockInfo(
              cartItem: mockCartItems,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer(
          (invocation) async => Right(mockCartItems),
        );
        when(
          () => cartRepositoryMock.clearCartOnlySelectedItems(
            selectedItemIds: [comboItem.id],
          ),
        ).thenAnswer(
          (invocation) async => Right([materialItem]),
        );
      },
      act: (bloc) => bloc
        ..add(CartEvent.fetch(
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotAllowOutOfStockMaterials: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          comboDealEligible: false,
        )),
      expect: () => [
        CartState.initial().copyWith(isFetching: true),
        CartState.initial().copyWith(isFetching: false),
        CartState.initial().copyWith(isClearing: true),
        CartState.initial().copyWith(
            isClearing: false,
            cartItems: [CartItem.material(mockMaterialList.first)]),
      ],
    );
  });
}
