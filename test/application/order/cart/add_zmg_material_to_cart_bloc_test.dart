import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  final cartRepositoryMock = CartRepositoryMock();

  group('Testing Add zmgMaterial', () {
    blocTest<CartBloc, CartState>(
      'zmgMaterial increment material in cart',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockZmgMaterialCartItemFirst.copyWith(
            materials: [mockZmgCartItemList.last.copyWith(quantity: 1)],
          )
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
            mockZmgMaterialCartItemFirst.copyWith(
              materials: [
                mockZmgCartItemList.last
                    .copyWith(quantity: 5, discountedMaterialCount: 5),
              ],
            )
          ]),
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.updateMaterialQtyInCartItem(
          currentItem: mockZmgMaterialCartItemFirst.copyWith(
            materials: [mockZmgCartItemList.last.copyWith(quantity: 1)],
          ),
          updatedQtyItem: mockZmgCartItemList.last.copyWith(quantity: 5),
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
            mockZmgMaterialCartItemFirst.copyWith(
              materials: [mockZmgCartItemList.last.copyWith(quantity: 1)],
            )
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(
              materials: [
                mockZmgCartItemList.last
                    .copyWith(quantity: 5, discountedMaterialCount: 5)
              ],
            )
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
          5,
        );
      },
    );

    blocTest<CartBloc, CartState>(
      'zmgMaterial decrement material in cart',
      seed: () => CartState.initial().copyWith(
        cartItems: [
          mockZmgMaterialCartItemFirst.copyWith(
            materials: [mockZmgCartItemList.last.copyWith(quantity: 5)],
          )
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
            mockZmgMaterialCartItemFirst.copyWith(
              materials: [
                mockZmgCartItemList.last
                    .copyWith(quantity: 2, discountedMaterialCount: 2),
              ],
            )
          ]),
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.updateMaterialQtyInCartItem(
          currentItem: mockZmgMaterialCartItemFirst.copyWith(
            materials: [mockZmgCartItemList.last.copyWith(quantity: 5)],
          ),
          updatedQtyItem: mockZmgCartItemList.last.copyWith(quantity: 2),
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
            mockZmgMaterialCartItemFirst.copyWith(
              materials: [mockZmgCartItemList.last.copyWith(quantity: 5)],
            )
          ],
          isFetching: true,
        ),
        CartState.initial().copyWith(
          cartItems: [
            mockZmgMaterialCartItemFirst.copyWith(
              materials: [
                mockZmgCartItemList.last
                    .copyWith(quantity: 2, discountedMaterialCount: 2)
              ],
            )
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
          2,
        );
      },
    );
  });
}
