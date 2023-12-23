import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class CartRepositoryMock extends Mock implements CartRepository {}

class ProductDetailRepositoryMock extends Mock
    implements ProductDetailRepository {}

void main() {
  late List<Price> prices;

  late ApiFailure fakeError;
  late ShipToInfo shipToInfo;
  late PriceAggregate bundleItem;
  late List<PriceBonusItem> priceBonus;
  late List<BonusMaterial> bonusMaterial;
  late List<CartState> expectedCartState;
  late CartRepository cartRepositoryMock;
  late ProductDetailRepository productDetailRepository;
  late List<PriceAggregate> priceAggregates;
  late List<BonusSampleItem> bonusSampleItem;
  late List<PriceTier> priceTiers;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    fakeError = const ApiFailure.other('fake-error');
    shipToInfo = fakeCustomerCodeInfo.shipToInfos.first;
    final materialListResponse =
        await MaterialListLocalDataSource().getProductList();
    bonusSampleItem = [
      BonusSampleItem.empty().copyWith(
        materialNumber: MaterialNumber('fake-bonus-sample-item-1'),
        itemId: StringValue('fake-item-id'),
        qty: MaterialQty(1),
      ),
    ];
    priceTiers = [
      PriceTier.empty().copyWith(
        tier: 'C',
        items: [
          PriceTierItem.empty().copyWith(
            rate: 41,
            quantity: 5,
          ),
          PriceTierItem.empty().copyWith(
            rate: 20,
            quantity: 10,
          )
        ],
      )
    ];
    priceAggregates = materialListResponse.products
        .map(
          (e) => PriceAggregate.empty().copyWith(
            materialInfo: e,
            salesOrgConfig: fakeSalesOrganisationConfigs,
            quantity: 1,
            bundle: e.bundle.copyWith(
              materials: e.bundle.materials
                  .map((e) => e.copyWith(quantity: MaterialQty(1)))
                  .toList(),
            ),
          ),
        )
        .toList();
    final bundleFromPriceAggregateList = priceAggregates.firstWhere(
      (element) => element.materialInfo.type.typeBundle,
      orElse: () => PriceAggregate.empty(),
    );
    bundleItem = bundleFromPriceAggregateList.copyWith(
      bundle: bundleFromPriceAggregateList.bundle.copyWith(
        materials: bundleFromPriceAggregateList.materialInfo.data
            .map((e) => e.toMaterialInfo.copyWith(quantity: MaterialQty(5)))
            .toList(),
      ),
    );
    bonusMaterial = <BonusMaterial>[
      BonusMaterial.empty().copyWith(
        qualifyingQuantity: 2,
        materialNumber: MaterialNumber('bonus-material-1'),
        bonusRatio: 1,
        bonusQuantity: 1,
      )
    ];
    priceBonus = <PriceBonusItem>[
      PriceBonusItem.empty().copyWith(
        calculation: BonusMaterialCalculation('913'),
        qualifyingQuantity: 2,
        bonusMaterials: bonusMaterial,
      ),
    ];

    prices = await MaterialPriceLocalDataSource().getPriceList();
  });
  setUp(() {
    cartRepositoryMock = CartRepositoryMock();
    productDetailRepository = ProductDetailRepositoryMock();
  });

  List<MaterialInfo> allMaterial(List<PriceAggregate> priceAggregates) =>
      priceAggregates
          .expand(
            (e) => e.materialInfo.type.typeBundle
                ? e.bundleMaterialsPriceAggregate
                : [e],
          )
          .map((e) => e.materialInfo)
          .toList();

  group(
    'Testing CartBloc initialized',
    () {
      blocTest<CartBloc, CartState>(
        'Cart initialized-emit fetchProductsAddedToCart-error emit',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        setUp: () {
          when(
            () => cartRepositoryMock.getAddedToCartProductList(),
          ).thenAnswer(
            (invocation) async => Left(
              fakeError,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            isFetching: true,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Cart initialized fetchProductsAddedToCart-emit => fetch product empty',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        setUp: () {
          when(
            () => cartRepositoryMock.getAddedToCartProductList(),
          ).thenAnswer(
            (invocation) async => const Right(
              <PriceAggregate>[],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            isFetching: true,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            cartProducts: [],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Cart initialized fetchProductsAddedToCart-emit => getDetailsProductsAddedToCart-emit error',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        setUp: () {
          final updatedPriceAggregates = priceAggregates
              .map(
                (e) => e.materialInfo.type.typeBundle
                    ? PriceAggregate.empty().copyWith(
                        materialInfo: e.materialInfo,
                        bundle: e.bundle,
                        salesOrgConfig: e.salesOrgConfig,
                      )
                    : PriceAggregate.empty().copyWith(
                        materialInfo: e.materialInfo,
                        quantity: e.materialInfo.quantity.intValue,
                        salesOrgConfig: e.salesOrgConfig,
                        bonusSampleItems: e.bonusSampleItems,
                      ),
              )
              .toList();
          expectedCartState = [
            CartState.initial().copyWith(
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetching: true,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetchingCartProductDetail: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              apiFailureOrSuccessOption: optionOf(Left(fakeError)),
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
          ];
          when(
            () => cartRepositoryMock.getProducts(
              materialNumbers: allMaterial(priceAggregates)
                  .map((e) => e.materialNumber)
                  .toList(),
            ),
          ).thenAnswer(
            (invocation) async => Left(
              fakeError,
            ),
          );
          when(
            () => cartRepositoryMock.getAddedToCartProductList(),
          ).thenAnswer(
            (invocation) async => Right(
              priceAggregates,
            ),
          );
        },
        tearDown: () {
          expectedCartState = [];
        },
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => expectedCartState,
      );

      blocTest<CartBloc, CartState>(
        'Cart initialized fetchProductsAddedToCart-emit => getDetailsProductsAddedToCart-emit => updateProductStock-emit error',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        setUp: () {
          final priceAggregateAllMaterial = allMaterial(priceAggregates);
          final allAdditionInfo = {
            for (MaterialInfo i in priceAggregateAllMaterial)
              i.materialNumber: ProductMetaData.empty()
          };
          final updatedPriceAggregates = priceAggregates
              .map(
                (e) => e.materialInfo.type.typeBundle
                    ? PriceAggregate.empty().copyWith(
                        materialInfo: e.materialInfo,
                        bundle: e.bundle,
                        salesOrgConfig: e.salesOrgConfig,
                      )
                    : PriceAggregate.empty().copyWith(
                        materialInfo: e.materialInfo,
                        quantity: e.materialInfo.quantity.intValue,
                        salesOrgConfig: e.salesOrgConfig,
                        bonusSampleItems: e.bonusSampleItems,
                      ),
              )
              .toList();
          expectedCartState = [
            CartState.initial().copyWith(
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetching: true,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetchingCartProductDetail: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              isUpdatingStock: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              apiFailureOrSuccessOption: optionOf(Left(fakeError)),
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
          ];
          when(
            () => cartRepositoryMock.getStockInfoList(
              items: priceAggregateAllMaterial,
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
          when(
            () => cartRepositoryMock.getProducts(
              materialNumbers: allMaterial(priceAggregates)
                  .map((e) => e.materialNumber)
                  .toList(),
            ),
          ).thenAnswer(
            (invocation) async => Right(allAdditionInfo),
          );
          when(
            () => cartRepositoryMock.getAddedToCartProductList(),
          ).thenAnswer(
            (invocation) async => Right(
              priceAggregates,
            ),
          );
        },
        tearDown: () {
          expectedCartState = [];
        },
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => expectedCartState,
      );

      blocTest<CartBloc, CartState>(
        'Cart initialized fetchProductsAddedToCart-emit => getDetailsProductsAddedToCart-emit => updateProductStock-emit',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        setUp: () {
          final priceAggregateAllMaterial = allMaterial(priceAggregates);
          final allAdditionInfo = {
            for (MaterialInfo i in priceAggregateAllMaterial)
              i.materialNumber: ProductMetaData.empty()
          };
          final stockInfo = {
            for (MaterialInfo i in priceAggregateAllMaterial)
              i.materialNumber: [
                StockInfo.empty().copyWith(
                  inStock: MaterialInStock('Yes'),
                )
              ]
          };
          final updatedPriceAggregates = priceAggregates
              .map(
                (e) => e.materialInfo.type.typeBundle
                    ? PriceAggregate.empty().copyWith(
                        materialInfo: e.materialInfo,
                        bundle: e.bundle,
                        salesOrgConfig: e.salesOrgConfig,
                      )
                    : PriceAggregate.empty().copyWith(
                        materialInfo: e.materialInfo,
                        quantity: e.materialInfo.quantity.intValue,
                        salesOrgConfig: e.salesOrgConfig,
                        bonusSampleItems: e.bonusSampleItems,
                      ),
              )
              .toList();
          final updatedCartStockList = updatedPriceAggregates
              .map(
                (e) => e.materialInfo.type.typeMaterial
                    ? e.copyWith(
                        stockInfoList: stockInfo[e.getMaterialNumber] ?? [],
                      )
                    : e.copyWith(
                        bundle: e.bundle.copyWith(
                          materials: e.bundle.materials
                              .map(
                                (e) => e.copyWith(
                                  stockInfos: stockInfo[e.materialNumber] ?? [],
                                ),
                              )
                              .toList(),
                        ),
                      ),
              )
              .toList();

          expectedCartState = [
            CartState.initial().copyWith(
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetching: true,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetchingCartProductDetail: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              isUpdatingStock: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              cartProducts: updatedCartStockList,
              salesOrganisation: fakeSalesOrganisation,
              config: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
          ];
          when(
            () => cartRepositoryMock.getStockInfoList(
              items: priceAggregateAllMaterial,
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Right(stockInfo),
          );
          when(
            () => cartRepositoryMock.getProducts(
              materialNumbers: allMaterial(priceAggregates)
                  .map((e) => e.materialNumber)
                  .toList(),
            ),
          ).thenAnswer(
            (invocation) async => Right(allAdditionInfo),
          );
          when(
            () => cartRepositoryMock.getAddedToCartProductList(),
          ).thenAnswer(
            (invocation) async => Right(
              priceAggregates,
            ),
          );
        },
        tearDown: () {
          expectedCartState = [];
        },
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => expectedCartState,
      );
    },
  );

  group(
    'Testing CartBloc verifyMaterialDealBonus',
    () {
      blocTest<CartBloc, CartState>(
        'Cart verifyMaterialDealBonus with no bonus item in cart',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        act: (bloc) => bloc.add(
          CartEvent.verifyMaterialDealBonus(
            item: priceAggregates.first,
            items: priceAggregates.map((e) => e.copyWith(quantity: 1)).toList(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            cartProducts: priceAggregates,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart verifyMaterialDealBonus refresh bonus fail',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updateMaterialDealBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials:
                  priceAggregates.map((e) => e.copyWith(quantity: 1)).toList(),
            ),
          ).thenAnswer(
            (invocation) async => Left(
              fakeError,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.verifyMaterialDealBonus(
            item: priceAggregates.first.copyWith(
              quantity: 2,
              price: Price.empty().copyWith(
                bonuses: <PriceBonus>[
                  PriceBonus(
                    items: priceBonus,
                  ),
                ],
              ),
            ),
            items: priceAggregates.map((e) => e.copyWith(quantity: 1)).toList(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            cartProducts: priceAggregates,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: priceAggregates,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: priceAggregates,
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart verifyMaterialDealBonus refresh bonus',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updateMaterialDealBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials:
                  priceAggregates.map((e) => e.copyWith(quantity: 1)).toList(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              priceAggregates,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.verifyMaterialDealBonus(
            item: priceAggregates.first.copyWith(
              quantity: 2,
              price: Price.empty().copyWith(
                bonuses: <PriceBonus>[
                  PriceBonus(
                    items: priceBonus,
                  ),
                ],
              ),
            ),
            items: priceAggregates.map((e) => e.copyWith(quantity: 1)).toList(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            cartProducts: priceAggregates,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: priceAggregates,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: priceAggregates,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
    },
  );

  group(
    'Testing CartBloc addBonusToCartItem',
    () {
      blocTest<CartBloc, CartState>(
        'Cart addBonusToCartItem fail',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCart(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: StringValue('fake-bonus-item-id').getValue(),
              language: fakeClientUser.settings.languagePreference,
              materialInfo: priceAggregates.first.materialInfo
                  .copyWith(quantity: MaterialQty(1)),
              quantity: 1,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addBonusToCartItem(
            bonusItemId: StringValue('fake-bonus-item-id'),
            bonusMaterial: priceAggregates.first.materialInfo
                .copyWith(quantity: MaterialQty(1)),
            counterOfferDetails: RequestCounterOfferDetails.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            upsertBonusItemInProgressHashCode: [
              priceAggregates.first.materialInfo
                  .copyWith(quantity: MaterialQty(1))
                  .hashCode
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            upsertBonusItemInProgressHashCode: [],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart addBonusToCartItem',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [priceAggregates.first],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCart(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: StringValue('fake-bonus-item-id').getValue(),
              language: fakeClientUser.settings.languagePreference,
              materialInfo: priceAggregates.first.materialInfo.copyWith(
                quantity: MaterialQty(1),
              ),
              quantity: 1,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                priceAggregates.first.copyWith(
                  bonusSampleItems: bonusSampleItem,
                )
              ],
            ),
          );
          when(
            () => cartRepositoryMock.updateMaterialDealBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [
                priceAggregates.first.copyWith(
                  bonusSampleItems: bonusSampleItem,
                )
              ],
            ),
          ).thenAnswer(
            (invocation) async => Left(
              fakeError,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addBonusToCartItem(
            bonusItemId: StringValue('fake-bonus-item-id'),
            bonusMaterial: priceAggregates.first.materialInfo.copyWith(
              quantity: MaterialQty(1),
            ),
            counterOfferDetails: RequestCounterOfferDetails.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            upsertBonusItemInProgressHashCode: [
              priceAggregates.first.materialInfo
                  .copyWith(
                    quantity: MaterialQty(1),
                  )
                  .hashCode
            ],
            cartProducts: [
              priceAggregates.first,
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(bonusSampleItems: bonusSampleItem),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            upsertBonusItemInProgressHashCode: [],
            isFetchingBonus: true,
            cartProducts: [
              priceAggregates.first.copyWith(bonusSampleItems: bonusSampleItem),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            upsertBonusItemInProgressHashCode: [],
            cartProducts: [
              priceAggregates.first.copyWith(bonusSampleItems: bonusSampleItem),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            isFetchingBonus: false,
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
          ),
        ],
      );
    },
  );

  group(
    'Testing CartBloc upsertCart',
    () {
      blocTest<CartBloc, CartState>(
        'Cart upsertCart new Item fail',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              language: Language.english(),
              product: priceAggregates.first.copyWith(
                quantity: 2,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.upsertCart(
            priceAggregate: priceAggregates.first.copyWith(
              quantity: 2,
            ),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart upsertCart update old Item',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [priceAggregates.first.copyWith(quantity: 1)],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        act: (bloc) => bloc.add(
          CartEvent.upsertCart(
            priceAggregate: priceAggregates.first.copyWith(
              quantity: 1,
            ),
          ),
        ),
        expect: () => [],
      );

      blocTest<CartBloc, CartState>(
        'Cart upsertCart old Item',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [priceAggregates.elementAt(1)],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              language: Language.english(),
              product: priceAggregates.first.copyWith(
                quantity: 2,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [priceAggregates.first.copyWith(quantity: 2)],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.upsertCart(
            priceAggregate: priceAggregates.first.copyWith(
              quantity: 2,
            ),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            cartProducts: [priceAggregates.elementAt(1)],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart upsertCart new Item',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              language: Language.english(),
              product: priceAggregates.first.copyWith(
                quantity: 2,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [priceAggregates.first.copyWith(quantity: 2)],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.upsertCart(
            priceAggregate: priceAggregates.first.copyWith(
              quantity: 2,
            ),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Should add fetch total price event for ID market after upsert success',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeIDSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              language: Language.english(),
              product: priceAggregates.first.copyWith(
                quantity: 2,
              ),
            ),
          ).thenAnswer((_) async => Right([priceAggregates.first]));
          when(
            () => cartRepositoryMock.fetchGrandTotalPriceForIdMarket(
              totalPrice: priceAggregates.first.finalPriceTotal,
              materialNumbers: [priceAggregates.first.getMaterialNumber],
              salesOrganisation: fakeIDSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer((_) async => const Left(ApiFailure.other('fake')));
        },
        act: (bloc) => bloc.add(
          CartEvent.upsertCart(
            priceAggregate: priceAggregates.first.copyWith(
              quantity: 2,
            ),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first],
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isAplProductLoading: true,
            cartProducts: [priceAggregates.first],
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
            cartProducts: [priceAggregates.first],
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Should not add verify bonus and fetch total price after upsert success and cart is empty',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeIDSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              language: Language.english(),
              product: priceAggregates.first.copyWith(
                quantity: 2,
              ),
            ),
          ).thenAnswer((_) async => const Right([]));
        },
        act: (bloc) => bloc.add(
          CartEvent.upsertCart(
            priceAggregate: priceAggregates.first.copyWith(
              quantity: 2,
            ),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [],
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
    },
  );

  group(
    'Testing CartBloc upsertCartItems',
    () {
      blocTest<CartBloc, CartState>(
        'Cart upsertCartItems new Item fail',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartItems(
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language:
                  fakeSalesOrganisationConfigs.getConfigLanguageDefaultEnglish,
              product: priceAggregates.elementAt(1),
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.upsertCartItems(
            priceAggregate: priceAggregates.elementAt(1),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart upsertCartItems new Item fail same bundle',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.elementAt(1),
          ],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartItems(
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language:
                  fakeSalesOrganisationConfigs.getConfigLanguageDefaultEnglish,
              product: priceAggregates.elementAt(1),
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.upsertCartItems(
            priceAggregate: priceAggregates.elementAt(1),
          ),
        ),
        expect: () => [],
      );
      blocTest<CartBloc, CartState>(
        'Cart upsertCartItems update existing bundle',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            bundleItem.copyWith(
              bundle: bundleItem.bundle.copyWith(
                materials: bundleItem.bundle.materials
                    .map((e) => e.copyWith(quantity: MaterialQty(5)))
                    .toList(),
              ),
            ),
          ],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartItems(
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language:
                  fakeSalesOrganisationConfigs.getConfigLanguageDefaultEnglish,
              product: bundleItem.copyWith(
                bundle: bundleItem.bundle.copyWith(
                  materials: bundleItem.bundle.materials
                      .map((e) => e.copyWith(quantity: MaterialQty(10)))
                      .toList(),
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right([
              bundleItem.copyWith(
                bundle: bundleItem.bundle.copyWith(
                  materials: bundleItem.bundle.materials
                      .map((e) => e.copyWith(quantity: MaterialQty(10)))
                      .toList(),
                ),
              ),
            ]),
          );
          when(
            () => cartRepositoryMock.getStockInfoList(
              items: bundleItem.bundle.materials
                  .map((e) => e.copyWith(quantity: MaterialQty(10)))
                  .toList(),
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.upsertCartItems(
            priceAggregate: bundleItem.copyWith(
              bundle: bundleItem.bundle.copyWith(
                materials: bundleItem.bundle.materials
                    .map((e) => e.copyWith(quantity: MaterialQty(10)))
                    .toList(),
              ),
            ),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            cartProducts: [
              bundleItem.copyWith(
                bundle: bundleItem.bundle.copyWith(
                  materials: bundleItem.bundle.materials
                      .map((e) => e.copyWith(quantity: MaterialQty(5)))
                      .toList(),
                ),
              ),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              bundleItem.copyWith(
                bundle: bundleItem.bundle.copyWith(
                  materials: bundleItem.bundle.materials
                      .map((e) => e.copyWith(quantity: MaterialQty(10)))
                      .toList(),
                ),
              ),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isUpdatingStock: true,
            cartProducts: [
              bundleItem.copyWith(
                bundle: bundleItem.bundle.copyWith(
                  materials: bundleItem.bundle.materials
                      .map((e) => e.copyWith(quantity: MaterialQty(10)))
                      .toList(),
                ),
              ),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            cartProducts: [
              bundleItem.copyWith(
                bundle: bundleItem.bundle.copyWith(
                  materials: bundleItem.bundle.materials
                      .map((e) => e.copyWith(quantity: MaterialQty(10)))
                      .toList(),
                ),
              ),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart upsertCartItems new Item',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartItems(
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language:
                  fakeSalesOrganisationConfigs.getConfigLanguageDefaultEnglish,
              product: bundleItem,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [bundleItem],
            ),
          );
          when(
            () => cartRepositoryMock.getStockInfoList(
              items: bundleItem.bundle.materials.map((e) => e).toList(),
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.upsertCartItems(
            priceAggregate: bundleItem,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [bundleItem],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isUpdatingStock: true,
            cartProducts: [bundleItem],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            cartProducts: [bundleItem],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
    },
  );

  group(
    'Testing CartBloc addHistoryItemsToCart',
    () {
      blocTest<CartBloc, CartState>(
        'Cart addHistoryItemsToCart fail',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.addHistoryItemsToCart(
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClientUser.settings.languagePreference,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: '',
              materialInfo: [priceAggregates.first.materialInfo],
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addHistoryItemsToCart(
            items: [priceAggregates.first.materialInfo],
            counterOfferDetails: RequestCounterOfferDetails.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isBuyAgain: true,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart addHistoryItemsToCart',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfoList(
              items: [priceAggregates.first.materialInfo],
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
          when(
            () => cartRepositoryMock.addHistoryItemsToCart(
              salesOrganisation: fakeSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClientUser.settings.languagePreference,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: '',
              materialInfo: [priceAggregates.first.materialInfo],
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
            ),
          ).thenAnswer(
            (invocation) async =>
                Right([priceAggregates.first.copyWith(quantity: 2)]),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addHistoryItemsToCart(
            items: [priceAggregates.first.materialInfo],
            counterOfferDetails: RequestCounterOfferDetails.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isBuyAgain: true,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isUpdatingStock: true,
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
    },
  );

  group(
    'Testing CartBloc updatePriceProduct',
    () {
      blocTest<CartBloc, CartState>(
        'Cart updatePriceProduct',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              price: prices.first.copyWith(
                materialNumber: priceAggregates.first.getMaterialNumber,
              ),
            )
          ],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updateMaterialDealBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [
                priceAggregates.first.copyWith(
                  price: prices.first,
                )
              ],
            ),
          ).thenAnswer(
            (invocation) async => Left(
              fakeError,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updatePriceProduct(
            priceProducts: {
              priceAggregates.first.getMaterialNumber: prices.first
            },
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isMappingPrice: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first.copyWith(
                  materialNumber: priceAggregates.first.getMaterialNumber,
                ),
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            apiFailureOrSuccessOption: optionOf(
              Left(
                fakeError,
              ),
            ),
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart updatePriceProduct fail',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              price: prices.first,
            )
          ],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updateMaterialDealBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [
                priceAggregates.first.copyWith(
                  price: prices.first,
                )
              ],
            ),
          ).thenAnswer(
            (invocation) async => Left(
              fakeError,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updatePriceProduct(
            priceProducts: {
              priceAggregates.first.getMaterialNumber: prices.first
            },
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isMappingPrice: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            apiFailureOrSuccessOption: optionOf(
              Left(
                fakeError,
              ),
            ),
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Cart updatePriceProduct without override available',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              price: prices.elementAt(1),
            )
          ],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updateMaterialDealBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [priceAggregates.first.copyWith(price: prices.first)],
            ),
          ).thenAnswer(
            (invocation) async => Left(
              fakeError,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updatePriceProduct(
            priceProducts: {
              priceAggregates.first.getMaterialNumber: prices.first
            },
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isMappingPrice: true,
            cartProducts: [
              priceAggregates.first.copyWith(price: prices.elementAt(1))
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            apiFailureOrSuccessOption: optionOf(
              Left(
                fakeError,
              ),
            ),
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart updatePriceProduct with tiered pricing',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              price: prices.first,
            )
          ],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updateMaterialDealBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfigs: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [
                priceAggregates.first.copyWith(
                  discountedMaterialCount: 1,
                  price: prices.first.copyWith(
                    tiers: priceTiers,
                  ),
                )
              ],
            ),
          ).thenAnswer(
            (invocation) async => Left(
              fakeError,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updatePriceProduct(
            priceProducts: {
              priceAggregates.first.getMaterialNumber: prices.first.copyWith(
                tiers: priceTiers,
              )
            },
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isMappingPrice: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                discountedMaterialCount: 1,
                price: prices.first.copyWith(
                  tiers: priceTiers,
                ),
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                discountedMaterialCount: 1,
                price: prices.first.copyWith(
                  tiers: priceTiers,
                ),
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                discountedMaterialCount: 1,
                price: prices.first.copyWith(
                  tiers: priceTiers,
                ),
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            apiFailureOrSuccessOption: optionOf(
              Left(
                fakeError,
              ),
            ),
          ),
        ],
      );
    },
  );

  group(
    'Testing CartBloc removeInvalidProducts',
    () {
      blocTest<CartBloc, CartState>(
        'Cart removeInvalidProducts bundle in cart',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [priceAggregates.first, bundleItem],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.removeSelectedProducts(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              products: [priceAggregates.first.materialInfo],
              language: fakeSalesOrganisationConfigs.languageValue,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [bundleItem],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.removeInvalidProducts(
            invalidCartItems: [priceAggregates.first.materialInfo],
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isClearing: true,
            cartProducts: [priceAggregates.first, bundleItem],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [bundleItem],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Cart removeInvalidProducts',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: priceAggregates,
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.removeSelectedProducts(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              products: [priceAggregates.first.materialInfo],
              language: fakeSalesOrganisationConfigs.languageValue,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [priceAggregates.elementAt(1)],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.removeInvalidProducts(
            invalidCartItems: [priceAggregates.first.materialInfo],
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isClearing: true,
            cartProducts: priceAggregates,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.elementAt(1)],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart removeInvalidProducts fail',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: priceAggregates,
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.removeSelectedProducts(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              products: [priceAggregates.first.materialInfo],
              language: fakeSalesOrganisationConfigs.languageValue,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.removeInvalidProducts(
            invalidCartItems: [priceAggregates.first.materialInfo],
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isClearing: true,
            cartProducts: priceAggregates,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            cartProducts: priceAggregates,
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
    },
  );

  group(
    'Testing CartBloc removeSampleBonusFromCartConfig',
    () {
      blocTest<CartBloc, CartState>(
        'Cart removeSampleBonusFromCartConfig',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              bonusSampleItems: bonusSampleItem,
            )
          ],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.removeSelectedProducts(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              products: [
                MaterialInfo.empty().copyWith(
                  materialNumber: bonusSampleItem.first.materialNumber,
                  parentID: priceAggregates.first.getMaterialNumber.getValue(),
                  quantity: MaterialQty(0),
                  sampleBonusItemId: 'fake-item-id',
                )
              ],
              language: fakeSalesOrganisationConfigs.languageValue,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [priceAggregates.first.copyWith(bonusSampleItems: [])],
            ),
          );
        },
        act: (bloc) => bloc.add(
          const CartEvent.removeSampleBonusFromCartConfig(),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isClearing: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                bonusSampleItems: bonusSampleItem,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Cart removeSampleBonusFromCartConfig fail',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              bonusSampleItems: bonusSampleItem,
            )
          ],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.removeSelectedProducts(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfig: fakeSalesOrganisationConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              products: [
                MaterialInfo.empty().copyWith(
                  materialNumber: bonusSampleItem.first.materialNumber,
                  parentID: priceAggregates.first.getMaterialNumber.getValue(),
                  quantity: MaterialQty(0),
                  sampleBonusItemId: 'fake-item-id',
                )
              ],
              language: fakeSalesOrganisationConfigs.languageValue,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          const CartEvent.removeSampleBonusFromCartConfig(),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isClearing: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                bonusSampleItems: bonusSampleItem,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            cartProducts: [
              priceAggregates.first.copyWith(
                bonusSampleItems: bonusSampleItem,
              )
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
    },
  );

  ///TODO: will be used while implementing batch selection

  // group(
  //   'Testing CartBloc updateBatchInCartItem',
  //   () {
  //     blocTest<CartBloc, CartState>(
  //       'Cart updateBatchInCartItem',
  //       build: () => CartBloc(cartRepositoryMock, productDetailRepository),
  //       seed: () => CartState.initial().copyWith(
  //         cartProducts: priceAggregates,
  //         salesOrganisation: fakeSalesOrganisation,
  //         config: fakeSalesOrganisationConfigs,
  //         shipToInfo: shipToInfo,
  //         customerCodeInfo: fakeCustomerCodeInfo,
  //       ),
  //       act: (bloc) => bloc.add(
  //         CartEvent.updateBatchInCartItem(
  //           item: CartItem.material(PriceAggregate.empty()),
  //           stockInfo: StockInfo.empty(),
  //         ),
  //       ),
  //       expect: () => [
  //         CartState.initial().copyWith(
  //           isFetching: true,
  //           cartProducts: priceAggregates,
  //           salesOrganisation: fakeSalesOrganisation,
  //           config: fakeSalesOrganisationConfigs,
  //           shipToInfo: shipToInfo,
  //           customerCodeInfo: fakeCustomerCodeInfo,
  //         ),
  //       ],
  //     );
  //   },
  // );

  group(
    'CartBloc clearCart',
    () {
      blocTest<CartBloc, CartState>(
        'clearCart failure',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        setUp: () {
          when(
            () => cartRepositoryMock.clearCart(),
          ).thenAnswer(
            (invocation) async => const Right(
              unit,
            ),
          );
        },
        seed: () => CartState.initial().copyWith(
          cartProducts: [PriceAggregate.empty()],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        act: (bloc) => bloc.add(
          const CartEvent.clearCart(),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isClearing: true,
            cartProducts: [PriceAggregate.empty()],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'clearCart Success',
        build: () => CartBloc(cartRepositoryMock, productDetailRepository),
        setUp: () {
          when(
            () => cartRepositoryMock.clearCart(),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        seed: () => CartState.initial().copyWith(
          cartProducts: [PriceAggregate.empty()],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeSalesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        act: (bloc) => bloc.add(
          const CartEvent.clearCart(),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isClearing: true,
            cartProducts: [PriceAggregate.empty()],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [PriceAggregate.empty()],
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeSalesOrganisation,
            config: fakeSalesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
    },
  );

  group(
    'Testing CartBloc state test',
    () {
      test(
        'Testing CartBloc state containCovidMaterial',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty()
                        .copyWith(materialGroup4: MaterialGroup.four('6A1')),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containCovidMaterial, true);
        },
      );
      test(
        'Testing CartBloc state containFocMaterial',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo:
                        MaterialInfo.empty().copyWith(isFOCMaterial: true),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containFocMaterial, true);
        },
      );
      test(
        'Testing CartBloc state containFocMaterialInCartProduct',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo:
                        MaterialInfo.empty().copyWith(isFOCMaterial: true),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containFocMaterialInCartProduct, true);
        },
      );

      test(
        'Testing CartBloc state containNonCovidMaterial',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates,
          );
          expect(cartBlocState.containNonCovidMaterial, true);
        },
      );
      test(
        'Testing CartBloc state containNonFocMaterial',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty(),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containNonFocMaterial, true);
        },
      );
      test(
        'Testing CartBloc state containNonFocMaterialOT',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty(),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containNonFocMaterialOT, true);
        },
      );
      test(
        'Testing CartBloc state containSampleMaterial',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      isSampleMaterial: true,
                    ),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containSampleMaterial, true);
        },
      );
      test(
        'Testing CartBloc state containNonRegularMaterial isSampleMaterial',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty(),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containNonRegularMaterial, true);
        },
      );
      test(
        'Testing CartBloc state containNonRegularMaterial isFOCMaterial',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      isFOCMaterial: true,
                      isSampleMaterial: false,
                    ),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containNonRegularMaterial, true);
        },
      );
      test(
        'Testing CartBloc state containsSampleBonus',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map((e) => e)
                .map(
                  (e) => e.copyWith(
                    bonusSampleItems: bonusSampleItem,
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containsSampleBonus, true);
        },
      );
      test(
        'Testing CartBloc state containNonSampleMaterial',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty(),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containNonSampleMaterial, true);
        },
      );
      test(
        'Testing CartBloc state containsSpecialOrderTypeMaterials',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      isSampleMaterial: true,
                    ),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.containsSpecialOrderTypeMaterials, true);
        },
      );
      test(
        'Testing CartBloc state isBonusRestricted',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      isSampleMaterial: true,
                    ),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.isBonusRestricted, true);
        },
      );

      test(
        'Testing CartBloc state isBonusRestricted empty cart',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [],
          );
          expect(cartBlocState.isBonusRestricted, true);
        },
      );
      test(
        'Testing CartBloc state totalQty',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      isSampleMaterial: true,
                    ),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.totalQty, 14);
        },
      );

      test(
        'Testing CartBloc state zmgMaterialsQty',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      isSampleMaterial: true,
                    ),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.zmgMaterialsQty(MaterialGroup.two('')), 0);
        },
      );

      test(
        'Testing CartBloc state totalMaterialsPrice',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      isSampleMaterial: true,
                    ),
                    price: prices.first,
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.totalMaterialsPrice, 3830.399999999999);
        },
      );

      test(
        'Testing CartBloc state priceUnderLoadingShimmer isFetchingCartProductDetail',
        () {
          final cartBlocState = CartState.initial().copyWith(
            isFetchingCartProductDetail: true,
          );
          expect(cartBlocState.priceUnderLoadingShimmer, true);
        },
      );
      test(
        'Testing CartBloc state priceUnderLoadingShimmer isUpserting',
        () {
          final cartBlocState = CartState.initial().copyWith(
            isUpserting: true,
          );
          expect(cartBlocState.priceUnderLoadingShimmer, true);
        },
      );

      test(
        'Testing CartBloc state priceUnderLoadingShimmer isUpdatingStock',
        () {
          final cartBlocState = CartState.initial().copyWith(
            isUpdatingStock: true,
          );
          expect(cartBlocState.priceUnderLoadingShimmer, true);
        },
      );

      test(
        'Testing CartBloc state priceUnderLoadingShimmer isMappingPrice',
        () {
          final cartBlocState = CartState.initial().copyWith(
            isMappingPrice: true,
          );
          expect(cartBlocState.priceUnderLoadingShimmer, true);
        },
      );

      test(
        'Testing CartBloc state isHavingMoreThanOnePreOrderInCart',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      isSampleMaterial: true,
                    ),
                    price: prices.first,
                    salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
                      addOosMaterials: OosMaterial(true),
                    ),
                  ),
                )
                .toList(),
          );
          expect(cartBlocState.isHavingMoreThanOnePreOrderInCart, true);
        },
      );
      test(
        'Testing CartBloc state allMaterial',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates,
          );
          expect(
            cartBlocState.allMaterial,
            priceAggregates
                .expand(
                  (e) => e.materialInfo.type.typeBundle
                      ? e.bundleMaterialsPriceAggregate
                      : [e],
                )
                .toList(),
          );
        },
      );

      test(
        'Testing CartBloc state totalMaterialPriceWithTax',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
          );
          expect(
            cartBlocState.totalMaterialsPriceWithTax,
            273.6,
          );
        },
      );

      test(
        'Testing CartBloc state totalBundlesPrice',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates,
          );
          expect(
            cartBlocState.totalBundlesPrice,
            0,
          );
        },
      );

      test(
        'Testing CartBloc state grandTotal',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
          );
          expect(
            cartBlocState.grandTotalHidePriceMaterial,
            273.6,
          );
        },
      );

      test(
        'Testing CartBloc state subTotal',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
          );
          expect(
            cartBlocState.subTotalHidePriceMaterial,
            273.6,
          );
        },
      );

      test(
        'Testing CartBloc state getQuantityOfProduct',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
          );
          expect(
            cartBlocState.getQuantityOfProduct(
              productNumber: priceAggregates.first.getMaterialNumber,
            ),
            1,
          );
        },
      );

      test(
        'Testing CartBloc state getQuantityOfBundle',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              bundleItem.copyWith(
                bundle: bundleItem.bundle.copyWith(
                  materials: bundleItem.bundle.materials
                      .map((e) => e.copyWith(quantity: MaterialQty(10)))
                      .toList(),
                ),
              )
            ],
          );
          expect(
            cartBlocState.getQuantityOfBundle(
              bundleCode: bundleItem.bundle.bundleCode,
              materialNumber: bundleItem.bundle.materials.first.materialNumber,
            ),
            10,
          );
        },
      );
      test(
        'Testing CartBloc state isBundleQuantitySatisfies',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [bundleItem],
          );
          expect(
            cartBlocState.isBundleQuantitySatisfies,
            true,
          );
        },
      );

      test(
        'Testing CartBloc state materialLevelFinalPriceWithTaxForFullTax',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
                materialInfo: priceAggregates.first.materialInfo.copyWith(
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 1,
                ),
              )
            ],
          );
          expect(
            cartBlocState.materialLevelFinalPriceWithTaxForFullTax,
            273.6,
          );
        },
      );
      test(
        'Testing CartBloc state zmgMaterialQuantityForGroupDiscount',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
          );
          expect(
            cartBlocState.zmgMaterialQuantityForGroupDiscount(
              priceAggregates.first,
            ),
            -1,
          );
        },
      );

      test(
        'Testing CartBloc state dialogContent FOC and/or sample',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty(),
                  ),
                )
                .toList(),
          );
          expect(
            cartBlocState.dialogContent(
              OrderDocumentType.empty(),
            ),
            'FOC and/or sample',
          );
        },
      );

      test(
        'Testing CartBloc state dialogContent non-sample',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty(),
                  ),
                )
                .toList(),
          );
          expect(
            cartBlocState.dialogContent(
              OrderDocumentType.empty().copyWith(
                documentType: DocumentType('ZPFB'),
              ),
            ),
            'non-sample',
          );
        },
      );

      test(
        'Testing CartBloc state dialogContent non-FOC',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty(),
                  ),
                )
                .toList(),
          );
          expect(
            cartBlocState.dialogContent(
              OrderDocumentType.empty().copyWith(
                documentType: DocumentType('ZPFC'),
              ),
            ),
            'non-FOC',
          );
        },
      );

      test(
        'Testing CartBloc state showDialog ZPFB',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty(),
                  ),
                )
                .toList(),
          );
          expect(
            cartBlocState.showDialog(
              OrderDocumentType.empty().copyWith(
                documentType: DocumentType('ZPFB'),
              ),
            ),
            true,
          );
        },
      );

      test(
        'Testing CartBloc state showDialog ZPFC',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty(),
                  ),
                )
                .toList(),
          );
          expect(
            cartBlocState.showDialog(
              OrderDocumentType.empty().copyWith(
                documentType: DocumentType('ZPFC'),
              ),
            ),
            true,
          );
        },
      );

      test(
        'Testing CartBloc state showDialog ZPOR',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates
                .map(
                  (e) => e.copyWith(
                    materialInfo: MaterialInfo.empty(),
                  ),
                )
                .toList(),
          );
          expect(
            cartBlocState.showDialog(
              OrderDocumentType.empty().copyWith(
                documentType: DocumentType('ZPOR'),
              ),
            ),
            true,
          );
        },
      );

      test(
        'Testing CartBloc state showDialog showManufacturerName at 0 index',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates,
          );
          expect(
            cartBlocState.showManufacturerName(0),
            true,
          );
        },
      );

      test(
        'Testing CartBloc state showDialog showManufacturerName at 1 index',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first,
              priceAggregates.elementAt(1).copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      principalData: PrincipalData.empty().copyWith(
                        principalName: PrincipalName('fake-principal-name'),
                      ),
                    ),
                  )
            ],
          );
          expect(
            cartBlocState.showManufacturerName(1),
            true,
          );
        },
      );

      test(
        'Testing CartBloc state showDialog isOOSOrderPresent ',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first,
            ],
          );
          expect(
            cartBlocState.isOOSOrderPresent,
            true,
          );
        },
      );

      test(
        'Testing CartBloc state showDialog itemPrice ',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(price: prices.first),
              priceAggregates.elementAt(1).copyWith(price: prices.elementAt(1)),
            ],
          );
          expect(
            cartBlocState.itemPrice(index: 0),
            273.6,
          );
        },
      );

      test(
        'Testing CartBloc state showDialog currentBundleOffer ',
        () {
          final cartBlocState = CartState.initial();
          expect(
            cartBlocState.currentBundleOffer(bundleCode: ''),
            BundleInfo.empty(),
          );
        },
      );
      test(
        'Testing CartBloc state showDialog updatedCartProduct ',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(price: prices.first),
            ],
          );
          expect(
            cartBlocState
                .updatedCartProduct(priceAggregates.first.getMaterialNumber),
            priceAggregates.first.copyWith(price: prices.first),
          );
        },
      );

      test(
        'Testing CartBloc state showDialog updatedCartProduct empty',
        () {
          final cartBlocState = CartState.initial();
          expect(
            cartBlocState
                .updatedCartProduct(priceAggregates.first.getMaterialNumber),
            PriceAggregate.empty(),
          );
        },
      );

      test(
        'Testing CartBloc state showDialog isEligibleForCheckout bundle',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              bundleItem.copyWith(
                bundle: bundleItem.bundle.copyWith(
                  materials: bundleItem.bundle.materials
                      .map((e) => e.copyWith(quantity: MaterialQty(5)))
                      .toList(),
                ),
              )
            ],
          );
          expect(
            cartBlocState.isEligibleForCheckout(true),
            true,
          );
        },
      );

      test(
        'Testing CartBloc state showDialog isEligibleForCheckout bundle in stock',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              bundleItem.copyWith(
                bundle: bundleItem.bundle.copyWith(
                  materials: bundleItem.bundle.materials
                      .map(
                        (e) => e.copyWith(
                          quantity: MaterialQty(5),
                          stockInfos: [
                            StockInfo.empty().copyWith(
                              inStock: MaterialInStock('Yes'),
                            )
                          ],
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          );
          expect(
            cartBlocState.isEligibleForCheckout(true),
            true,
          );
        },
      );
      test(
        'Testing CartBloc state showDialog totalTaxPercent',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
                materialInfo: priceAggregates.first.materialInfo.copyWith(
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 1,
                ),
              ),
            ],
            config: fakeSalesOrganisationConfigs.copyWith(
              currency: Currency('thb'),
              vatValue: 6,
            ),
          );
          expect(
            cartBlocState.totalTaxPercent,
            '6',
          );
        },
      );

      test(
        'Testing CartBloc state showDialog totalTaxPercent vatValue',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
                materialInfo: priceAggregates.first.materialInfo.copyWith(
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 1,
                ),
              ),
            ],
            config: fakeSalesOrganisationConfigs.copyWith(vatValue: 2),
          );
          expect(
            cartBlocState.totalTaxPercent,
            '2',
          );
        },
      );

      test(
        'Testing CartBloc state taxMaterial',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
                materialInfo: priceAggregates.first.materialInfo.copyWith(
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 1,
                ),
              )
            ],
            config: fakeSalesOrganisationConfigs.copyWith(
              displaySubtotalTaxBreakdown: true,
            ),
          );
          expect(
            cartBlocState.taxMaterial,
            0.0,
          );
        },
      );

      test(
        'Testing CartBloc state taxMaterial full tax applied of non vn market',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
                materialInfo: priceAggregates.first.materialInfo.copyWith(
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 1,
                ),
              )
            ],
            config: fakeSalesOrganisationConfigs.copyWith(
              displaySubtotalTaxBreakdown: true,
              vatValue: 10,
            ),
          );
          expect(
            cartBlocState.taxMaterial,
            27.36,
          );
        },
      );

      test(
        'Testing CartBloc state taxMaterial full tax applied of vn market',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
                materialInfo: priceAggregates.first.materialInfo.copyWith(
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 1,
                ),
              )
            ],
            config: fakeSalesOrganisationConfigs.copyWith(
              displaySubtotalTaxBreakdown: true,
              vatValue: 10,
              salesOrg: fakeVNSalesOrg,
            ),
          );
          expect(
            cartBlocState.taxMaterial,
            2.736,
          );
        },
      );

      test(
        'Testing CartBloc state taxMaterial full tax Exempt',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
                materialInfo: priceAggregates.first.materialInfo.copyWith(
                  tax: 1,
                ),
              )
            ],
            config: fakeSalesOrganisationConfigs.copyWith(
              displaySubtotalTaxBreakdown: true,
              vatValue: 10,
            ),
          );
          expect(
            cartBlocState.taxMaterial,
            0.0,
          );
        },
      );

      test(
        'Testing CartBloc state taxMaterial full tax Exempt for vn market',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
                materialInfo: priceAggregates.first.materialInfo.copyWith(
                  tax: 1,
                ),
              )
            ],
            config: fakeSalesOrganisationConfigs.copyWith(
              displaySubtotalTaxBreakdown: true,
              vatValue: 10,
              currency: Currency('vnd'),
            ),
          );
          expect(
            cartBlocState.taxMaterial,
            0.0,
          );
        },
      );

      test(
        'Testing CartBloc state taxMaterial tax for offer material on KH market',
        () {
          final priceOnOfferMaterial = prices.firstWhere(
            (element) =>
                element.materialNumber.getOrDefaultValue('') ==
                '000000000021221523',
          );

          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: priceOnOfferMaterial,
                materialInfo: priceAggregates.first.materialInfo.copyWith(
                  tax: 10,
                  hidePrice: false,
                  type: MaterialInfoType.material(),
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                ),
                discountedMaterialCount: 50,
                quantity: 50,
              )
            ],
            config: fakeSalesOrganisationConfigs.copyWith(
              displaySubtotalTaxBreakdown: true,
              vatValue: 10,
              currency: Currency('khr'),
            ),
          );
          expect(
            cartBlocState.taxMaterial,
            16.5,
          );
        },
      );

      test(
        'Testing CartBloc state taxBundle',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              bundleItem.copyWith(
                salesOrgConfig:
                    fakeSalesOrganisationConfigs.copyWith(vatValue: 10),
              )
            ],
          );
          expect(
            cartBlocState.taxBundle,
            145.0,
          );
        },
      );

      test(
        'Testing CartBloc state showDialog totalPriceWithTax ',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(price: prices.first),
            ],
          );
          expect(
            cartBlocState.grandTotalHidePriceMaterial,
            273.6,
          );
        },
      );

      test(
        'Testing CartBloc state showDialog totalItems ',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates,
          );
          expect(
            cartBlocState.totalItems,
            12,
          );
        },
      );
      test(
        'Testing CartBloc state isCartDetailsFetching => isUpdatingStock',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates,
            isUpdatingStock: true,
          );
          expect(
            cartBlocState.isCartDetailsFetching,
            true,
          );
        },
      );

      test(
        'Testing CartBloc state isCartDetailsFetching => isUpserting',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates,
            isUpserting: true,
          );
          expect(
            cartBlocState.isCartDetailsFetching,
            true,
          );
        },
      );
      test(
        'Testing CartBloc state isCartDetailsFetching => isFetchingCartProductDetail',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates,
            isFetchingCartProductDetail: true,
          );
          expect(
            cartBlocState.isCartDetailsFetching,
            true,
          );
        },
      );
      test(
        'Testing CartBloc state isCartDetailsFetching => isMappingPrice',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: priceAggregates,
            isMappingPrice: true,
          );
          expect(
            cartBlocState.isCartDetailsFetching,
            true,
          );
        },
      );
    },
  );
}
