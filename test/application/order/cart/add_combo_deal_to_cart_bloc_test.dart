import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_variables.dart';

void main() {
  late CartRepository cartRepositoryMock;
  final fakeComboDealDetail = ComboDeal.empty().copyWith(
    materialComboDeals: [
      const ComboDealMaterialSet(
        setNo: 'fake-set',
        materials: [],
      )
    ],
  );
  final fakeComboDealQuery = PriceComboDeal.empty().copyWith(
    salesDeal: SalesDealNumber('fake-deal'),
    flexibleGroup: FlexibleGroup('fake-group'),
  );

  final fakeMaterial = PriceAggregate.empty().copyWith(
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('fake-number'),
    ),
    price: Price.empty().copyWith(
      comboDeal: fakeComboDealQuery,
    ),
  );

  final fakeMaterialWithComboDeal = fakeMaterial.copyWith(
    comboDeal: fakeComboDealDetail,
  );
  setUp(() {
    cartRepositoryMock = CartRepositoryMock();
  });

  blocTest<CartBloc, CartState>('Add ComboDeal to cart success',
      build: () => CartBloc(cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.deleteFromCart(
            item: CartItem.material(fakeMaterialWithComboDeal),
          ),
        ).thenAnswer((invocation) async => const Right([]));
        when(
          () => cartRepositoryMock.addItemToCart(
            cartItem: CartItem.comboDeal([fakeMaterialWithComboDeal]),
            override: false,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          ),
        ).thenAnswer((invocation) async => Right(
              <CartItem>[
                CartItem.comboDeal([fakeMaterialWithComboDeal])
              ],
            ));
      },
      act: (bloc) => bloc.add(
            CartEvent.addComboDealToCart(
              comboDealItems: [fakeMaterialWithComboDeal],
              overrideQty: false,
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
              apiFailureOrSuccessOption: none(),
              cartItems: [
                CartItem.comboDeal([fakeMaterialWithComboDeal])
              ],
              isFetching: false,
            ),
          ],
      verify: (bloc) {
        expect(
          bloc.state.getComboDealCartItem(comboDealQuery: fakeComboDealQuery),
          CartItem.comboDeal([fakeMaterialWithComboDeal]),
        );
        expect(
          bloc.state
              .getComboDealCartItem(comboDealQuery: PriceComboDeal.empty()),
          CartItem.comboDeal([]),
        );
      });

  blocTest<CartBloc, CartState>(
    'Add ComboDeal to cart failure',
    build: () => CartBloc(cartRepositoryMock),
    setUp: () {
      when(
        () => cartRepositoryMock.deleteFromCart(
          item: CartItem.material(fakeMaterialWithComboDeal),
        ),
      ).thenAnswer((invocation) async => const Right([]));
      when(
        () => cartRepositoryMock.addItemToCart(
          cartItem: CartItem.comboDeal([fakeMaterialWithComboDeal]),
          override: false,
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotAllowOutOfStockMaterials: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        ),
      ).thenAnswer(
        (invocation) async => const Left(
          ApiFailure.other('fake-error'),
        ),
      );
    },
    act: (bloc) => bloc.add(
      CartEvent.addComboDealToCart(
        comboDealItems: [fakeMaterialWithComboDeal],
        overrideQty: false,
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
            ApiFailure.other('fake-error'),
          ),
        ),
        isFetching: false,
      ),
    ],
  );

  blocTest<CartBloc, CartState>(
    'Add Material to ComboDeal when have combo in cart',
    build: () => CartBloc(cartRepositoryMock),
    seed: () => CartState.initial().copyWith(cartItems: [
      CartItem.comboDeal(
        [
          fakeMaterialWithComboDeal.copyWith(
            quantity: 3,
          ),
        ],
      )
    ]),
    setUp: () {
      when(
        () => cartRepositoryMock.updateMaterialQtyInCartItem(
          updatedQtyItem: fakeMaterial.copyWith(quantity: 4),
          cartItem: CartItem.comboDeal(
            [
              fakeMaterialWithComboDeal.copyWith(
                quantity: 3,
              ),
            ],
          ),
          override: false,
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotAllowOutOfStockMaterials: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        ),
      ).thenAnswer(
          (invocation) async => Right(<CartItem>[mockMaterialCartItemFirst]));
    },
    act: (bloc) => bloc.add(
      CartEvent.addMaterialToCart(
        item: fakeMaterial.copyWith(quantity: 4),
        overrideQty: false,
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
        cartItems: [
          CartItem.comboDeal(
            [
              fakeMaterial.copyWith(
                comboDeal: fakeComboDealDetail,
                quantity: 3,
              ),
            ],
          )
        ],
      ),
      CartState.initial().copyWith(
        apiFailureOrSuccessOption: none(),
        cartItems: mockMaterialCartItemList,
        isFetching: false,
      ),
    ],
  );

  blocTest<CartBloc, CartState>(
      'Add ComboDeal when have material that stays in combo in cart',
      build: () => CartBloc(cartRepositoryMock),
      seed: () => CartState.initial().copyWith(cartItems: [
            CartItem.material(
              fakeMaterial.copyWith(quantity: 4),
            ),
          ]),
      setUp: () {
        when(
          () => cartRepositoryMock.deleteFromCart(
            item: CartItem.material(
                fakeMaterialWithComboDeal.copyWith(quantity: 5)),
          ),
        ).thenAnswer((invocation) async => const Right([]));
        when(
          () => cartRepositoryMock.addItemToCart(
            cartItem: CartItem.comboDeal(
              [
                fakeMaterialWithComboDeal.copyWith(quantity: 5),
              ],
            ),
            override: false,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          ),
        ).thenAnswer(
            (invocation) async => Right(<CartItem>[mockMaterialCartItemFirst]));
      },
      act: (bloc) => bloc.add(
            CartEvent.addComboDealToCart(
              comboDealItems: [fakeMaterialWithComboDeal],
              overrideQty: false,
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
              cartItems: [
                CartItem.material(fakeMaterial.copyWith(quantity: 4)),
              ],
            ),
            CartState.initial().copyWith(
              apiFailureOrSuccessOption: none(),
              cartItems: mockMaterialCartItemList,
              isFetching: false,
            ),
          ],
      verify: (bloc) {
        verify(
          () => cartRepositoryMock.deleteFromCart(
            item: CartItem.material(
              fakeMaterialWithComboDeal.copyWith(quantity: 5),
            ),
          ),
        ).called(1);
      });
}
