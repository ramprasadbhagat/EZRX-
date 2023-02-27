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

  group('Testing update bundle to cart', () {
    blocTest<CartBloc, CartState>(
      'Add Bundle to Cart Success CartBloc',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
                  cartItem: mockCartBundleList.first.copyWith(
                    materials: [mockMaterialList.first],
                  ),
                  override: false,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                  doNotAllowOutOfStockMaterials: true,
                ))
            .thenAnswer((invocation) async =>
                Right(<CartItem>[mockCartBundleList.first]));
      },
      act: (bloc) => bloc.add(CartEvent.addBundleToCart(
        bundleItems: [mockMaterialList.first],
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
      'Add Bundle to Cart Fail CartBloc',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
                  cartItem: mockCartBundleList.first.copyWith(
                    materials: [mockMaterialList.first],
                  ),
                  override: false,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                  doNotAllowOutOfStockMaterials: true,
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.other('Fake-Error')));
      },
      act: (bloc) => bloc.add(CartEvent.addBundleToCart(
        bundleItems: [mockMaterialList.first],
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
      'Add Bundle to Cart Fail for No Stock',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(() => cartRepositoryMock.addItemToCart(
                  cartItem: mockCartBundleList.first.copyWith(
                    materials: [mockMaterialList.first],
                  ),
                  override: false,
                  customerCodeInfo: CustomerCodeInfo.empty(),
                  salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                  salesOrganisation: SalesOrganisation.empty(),
                  shipToInfo: ShipToInfo.empty(),
                  doNotAllowOutOfStockMaterials: true,
                ))
            .thenAnswer((invocation) async =>
                const Left(ApiFailure.productOutOfStock()));
      },
      act: (bloc) => bloc.add(CartEvent.addBundleToCart(
        bundleItems: [mockMaterialList.first],
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
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.productOutOfStock(),
            ),
          ),
          isFetching: false,
        ),
      ],
    );
  });
}
