import 'package:dartz/dartz.dart';

import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/apl_product.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:ezrxmobile/domain/order/entities/price_rule.dart';

import 'package:ezrxmobile/domain/order/entities/cart.dart';
import 'package:ezrxmobile/infrastructure/order/repository/stock_info_repository.dart';
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
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_mm_sales_org_config.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';

class CartRepositoryMock extends Mock implements CartRepository {}

class ProductDetailRepositoryMock extends Mock
    implements ProductDetailRepository {}

class StockInfoRepositoryMock extends Mock implements StockInfoRepository {}

void main() {
  late List<Price> prices;
  late ApiFailure fakeError;
  late ApiFailure fakeErrorWithDifferentDeliveryAddress;
  late ShipToInfo shipToInfo;
  late PriceAggregate bundleItem;
  late List<PriceTierItem> priceTiers;
  late List<PriceBonusItem> priceBonus;
  late List<BonusMaterial> bonusMaterial;
  late List<CartState> expectedCartState;
  late CartRepository cartRepositoryMock;
  late List<PriceAggregate> priceAggregates;
  late List<BonusSampleItem> bonusSampleItem;
  late List<PriceRule> priceRules;
  late List<PriceAggregate> priceAggregatesWithBothTierAndDealBonus;
  late List<PriceAggregate> priceAggregatesForID;
  late ProductDetailRepository productDetailRepository;
  late RequestCounterOfferDetails fakeCounterOfferDetails;
  late AplSimulatorOrder aplSimulatorOrder;
  late final Cart cartProducts;
  late StockInfoRepository stockInfoRepositoryMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    fakeError = const ApiFailure.other('fake-error');
    fakeErrorWithDifferentDeliveryAddress =
        const ApiFailure.cartHasDifferentAddress();
    shipToInfo = fakeCustomerCodeInfo.shipToInfos.first;
    final materialListResponse =
        await MaterialListLocalDataSource().getProductList();
    aplSimulatorOrder = await CartLocalDataSource().aplSimulateOrder();

    priceTiers = [
      PriceTierItem.empty().copyWith(
        rate: 41,
        quantity: 5,
      ),
      PriceTierItem.empty().copyWith(
        rate: 20,
        quantity: 10,
      ),
    ];

    priceRules = [
      PriceRule.empty().copyWith(
        tieredRules: TieredRules.empty().copyWith(
          tier: 'C',
          ruleTier: [
            RuleTier.empty().copyWith(
              quantity: 20,
              rate: 200,
            ),
          ],
        ),
      ),
    ];

    priceAggregates = materialListResponse.products
        .map(
          (e) => PriceAggregate.empty().copyWith(
            materialInfo: e,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            quantity: 1,
            bundle: e.bundle.copyWith(
              materials: e.bundle.materials
                  .map((e) => e.copyWith(quantity: MaterialQty(1)))
                  .toList(),
            ),
          ),
        )
        .toList();
    priceAggregatesForID = materialListResponse.products
        .map(
          (e) => PriceAggregate.empty().copyWith(
            materialInfo: e,
            salesOrgConfig: fakeIDSalesOrgConfigs,
            quantity: 1,
            bundle: e.bundle.copyWith(
              materials: e.bundle.materials
                  .map((e) => e.copyWith(quantity: MaterialQty(1)))
                  .toList(),
            ),
          ),
        )
        .toList();
    fakeCounterOfferDetails =
        priceAggregates.first.materialInfo.counterOfferDetails.copyWith(
      counterOfferCurrency: fakeMYSalesOrgConfigs.currency,
    );
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
    bonusSampleItem = [
      BonusSampleItem.empty().copyWith(
        materialNumber: MaterialNumber('fake-bonus-sample-item-1'),
        itemId: StringValue('fake-item-id'),
        qty: MaterialQty(1),
      ),
    ];
    bonusMaterial = <BonusMaterial>[
      BonusMaterial.empty().copyWith(
        qualifyingQuantity: 2,
        materialNumber: priceAggregates.first.getMaterialNumber,
        bonusRatio: 1,
        bonusQuantity: 1,
      ),
    ];
    priceBonus = <PriceBonusItem>[
      PriceBonusItem.empty().copyWith(
        calculation: BonusMaterialCalculation('913'),
        qualifyingQuantity: 2,
        bonusMaterials: bonusMaterial,
      ),
    ];

    prices = await MaterialPriceLocalDataSource().getPriceList();

    priceAggregatesWithBothTierAndDealBonus = [
      priceAggregates.first.copyWith(
        price: prices.first.copyWith(
          tiers: priceTiers,
          rules: priceRules,
        ),
        quantity: 20,
      ),
    ];
    cartProducts = await CartLocalDataSource().getAddedToCartProductList();
  });
  setUp(() {
    cartRepositoryMock = CartRepositoryMock();
    productDetailRepository = ProductDetailRepositoryMock();
    stockInfoRepositoryMock = StockInfoRepositoryMock();
  });

  List<MaterialInfo> allMaterial(List<PriceAggregate> priceAggregates) =>
      priceAggregates
          .expand(
            (e) => e.materialInfo.type.typeBundle
                ? e.bundle.materials
                : [e.materialInfo],
          )
          .toList();

  group(
    'Testing CartBloc initialized',
    () {
      blocTest<CartBloc, CartState>(
        'Cart initialized-emit fetchProductsAddedToCart-error emit',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getAddedToCartProductList(
              language: fakeClientUser.preferredLanguage,
            ),
          ).thenAnswer(
            (invocation) async => Left(
              fakeError,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            isFetching: true,
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Cart initialized fetchProductsAddedToCart-emit => fetch product empty',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getAddedToCartProductList(
              language: fakeClientUser.preferredLanguage,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              Cart.empty().copyWith(
                cartCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
                cartShipToCustomerCode: shipToInfo.shipToCustomerCode,
              ),
            ),
          );
        },
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            isFetching: true,
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            cartProducts: [],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Cart initialized fetchProductsAddedToCart-emit => getDetailsProductsAddedToCart-emit error',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
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
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetching: true,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetchingCartProductDetail: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              apiFailureOrSuccessOption: optionOf(Left(fakeError)),
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              apiFailureOrSuccessOption: optionOf(Left(fakeError)),
              isUpdatingStock: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              apiFailureOrSuccessOption: optionOf(Left(fakeError)),
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
          ];
          when(
            () => stockInfoRepositoryMock.getMappedStockInfoList(
              items: priceAggregates
                  .map((e) => e.toStockListMaterials)
                  .expand((e) => e)
                  .toList(),
              salesOrganisation: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
            ),
          ).thenAnswer((_) async => Left(fakeError));
          when(
            () => productDetailRepository.getProductsMetaData(
              materialNumbers: allMaterial(priceAggregates)
                  .map((e) => e.materialNumber)
                  .toList(),
              salesOrganisation: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => Left(
              fakeError,
            ),
          );
          when(
            () => cartRepositoryMock.getAddedToCartProductList(
              language: fakeClientUser.preferredLanguage,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              Cart.empty().copyWith(
                cartProducts: priceAggregates,
                cartCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
                cartShipToCustomerCode: shipToInfo.shipToCustomerCode,
              ),
            ),
          );
        },
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        tearDown: () {
          expectedCartState = [];
        },
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => expectedCartState,
      );

      blocTest<CartBloc, CartState>(
        'Cart initialized fetchProductsAddedToCart-emit => getDetailsProductsAddedToCart-emit => updateProductStock-emit error',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        setUp: () {
          final priceAggregateAllMaterial = allMaterial(priceAggregates);
          final metaDataResponse = ProductMetaData(
            productImages: priceAggregateAllMaterial
                .map(
                  (e) => ProductImages.empty()
                      .copyWith(materialNumber: e.materialNumber),
                )
                .toList(),
            items: priceAggregateAllMaterial
                .map(
                  (e) => ProductItem.empty()
                      .copyWith(materialNumber: e.materialNumber),
                )
                .toList(),
          );
          final allAdditionInfo = metaDataResponse.metaDataMap;
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
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetching: true,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetchingCartProductDetail: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              isUpdatingStock: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              apiFailureOrSuccessOption: optionOf(Left(fakeError)),
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
          ];
          when(
            () => stockInfoRepositoryMock.getMappedStockInfoList(
              items: priceAggregateAllMaterial,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
          when(
            () => productDetailRepository.getProductsMetaData(
              materialNumbers: allMaterial(priceAggregates)
                  .map((e) => e.materialNumber)
                  .toList(),
              salesOrganisation: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => Right(metaDataResponse),
          );
          when(
            () => cartRepositoryMock.getAddedToCartProductList(
              language: fakeClientUser.preferredLanguage,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              Cart.empty().copyWith(
                cartProducts: priceAggregates,
                cartCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
                cartShipToCustomerCode: shipToInfo.shipToCustomerCode,
              ),
            ),
          );
        },
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        tearDown: () {
          expectedCartState = [];
        },
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => expectedCartState,
      );

      blocTest<CartBloc, CartState>(
        'Cart initialized fetchProductsAddedToCart-emit => getDetailsProductsAddedToCart-emit => updateProductStock-emit',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        setUp: () {
          final priceAggregateAllMaterial = allMaterial(priceAggregates);
          final metaDataResponse = ProductMetaData(
            productImages: priceAggregateAllMaterial
                .map(
                  (e) => ProductImages.empty()
                      .copyWith(materialNumber: e.materialNumber),
                )
                .toList(),
            items: priceAggregateAllMaterial
                .map(
                  (e) => ProductItem.empty()
                      .copyWith(materialNumber: e.materialNumber),
                )
                .toList(),
          );
          final allAdditionInfo = metaDataResponse.metaDataMap;
          final stockInfo = {
            for (final MaterialInfo i in priceAggregateAllMaterial)
              i.materialNumber: [
                StockInfo.empty().copyWith(
                  inStock: MaterialInStock('Yes'),
                ),
              ],
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
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetching: true,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetchingCartProductDetail: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              isUpdatingStock: true,
              cartProducts: updatedPriceAggregates,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              additionInfo: allAdditionInfo,
              cartProducts: updatedCartStockList,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
          ];
          when(
            () => stockInfoRepositoryMock.getMappedStockInfoList(
              items: priceAggregateAllMaterial,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Right(stockInfo),
          );
          when(
            () => productDetailRepository.getProductsMetaData(
              materialNumbers: allMaterial(priceAggregates)
                  .map((e) => e.materialNumber)
                  .toList(),
              salesOrganisation: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => Right(metaDataResponse),
          );
          when(
            () => cartRepositoryMock.getAddedToCartProductList(
              language: fakeClientUser.preferredLanguage,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              Cart.empty().copyWith(
                cartProducts: priceAggregates,
                cartCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
                cartShipToCustomerCode: shipToInfo.shipToCustomerCode,
              ),
            ),
          );
        },
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        tearDown: () {
          expectedCartState = [];
        },
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => expectedCartState,
      );

      blocTest<CartBloc, CartState>(
        'Cart initialized fetchProductsAddedToCart-emit => getDetailsProductsAddedToCart-emit => ClearCart-emit',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
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
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isFetching: true,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              isClearing: true,
              isFetching: true,
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
            CartState.initial().copyWith(
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              user: fakeClientUser,
            ),
          ];

          when(
            () => cartRepositoryMock.getAddedToCartProductList(
              language: fakeClientUser.preferredLanguage,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              Cart.empty().copyWith(
                cartShipToCustomerCode: 'Fake-Ship-To',
                cartCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
                cartProducts: updatedPriceAggregates,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.clearCart(),
          ).thenAnswer(
            (invocation) async => const Right(
              unit,
            ),
          );
        },
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        tearDown: () {
          expectedCartState = [];
        },
        act: (bloc) => bloc.add(
          CartEvent.initialized(
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            user: fakeClientUser,
          ),
        ),
        expect: () => expectedCartState,
      );

      blocTest<CartBloc, CartState>(
        'fetch Bonus Items Meta Data when bonus sample items is added to cart',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        setUp: () {
          final priceAggregateAllMaterial = allMaterial([
            priceAggregates.first.copyWith(bonusSampleItems: bonusSampleItem),
          ]);

          expectedCartState = [
            CartState.initial().copyWith(
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              cartProducts: [
                priceAggregates.first
                    .copyWith(bonusSampleItems: bonusSampleItem),
              ],
              isFetchingCartProductDetail: true,
            ),
            CartState.initial().copyWith(
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              cartProducts: [
                priceAggregates.first
                    .copyWith(bonusSampleItems: bonusSampleItem),
              ],
              additionInfo: ProductMetaData.empty().metaDataMap,
            ),
            CartState.initial().copyWith(
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              isUpdatingStock: true,
              cartProducts: [
                priceAggregates.first
                    .copyWith(bonusSampleItems: bonusSampleItem),
              ],
              additionInfo: ProductMetaData.empty().metaDataMap,
            ),
            CartState.initial().copyWith(
              salesOrganisation: fakeMYSalesOrganisation,
              config: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              cartProducts: [
                priceAggregates.first
                    .copyWith(bonusSampleItems: bonusSampleItem),
              ],
              apiFailureOrSuccessOption: optionOf(Left(fakeError)),
              additionInfo: ProductMetaData.empty().metaDataMap,
            ),
          ];
          when(
            () => stockInfoRepositoryMock.getMappedStockInfoList(
              items: priceAggregateAllMaterial,
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
          when(
            () => productDetailRepository.getProductsMetaData(
              materialNumbers: [
                MaterialNumber('000000000021041772'),
                MaterialNumber('fake-bonus-sample-item-1'),
              ],
              salesOrganisation: fakeMYSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => Right(ProductMetaData.empty()),
          );
        },
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          cartProducts: [
            priceAggregates.first.copyWith(bonusSampleItems: bonusSampleItem),
          ],
        ),
        act: (bloc) => bloc.add(
          CartEvent.getDetailsProductsAddedToCart(
            cartProducts: [
              priceAggregates.first.copyWith(bonusSampleItems: bonusSampleItem),
            ],
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.updateStockForMaterialDealBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: priceAggregates,
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: priceAggregates,
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart verifyMaterialDealBonus refresh bonus',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.updateStockForMaterialDealBonus(
              materials:
                  priceAggregates.map((e) => e.copyWith(quantity: 1)).toList(),
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Right(priceAggregates),
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: priceAggregates,
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: priceAggregates,
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart verifyMaterialDealBonus emitted with updated price info of state has',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          cartProducts: [
            priceAggregates.first.copyWith(
              quantity: 15,
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(35.0),
                lastPrice: MaterialPrice(39.0),
              ),
            ),
          ],
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.updateStockForMaterialDealBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [
                priceAggregates.first.copyWith(
                  quantity: 15,
                  price: Price.empty().copyWith(
                    finalPrice: MaterialPrice(39.0),
                    lastPrice: MaterialPrice(39.0),
                  ),
                ),
              ],
            ),
          ).thenAnswer(
            (invocation) async => Right(
              <PriceAggregate>[
                priceAggregates.first.copyWith(
                  quantity: 15,
                  price: Price.empty().copyWith(
                    finalPrice: MaterialPrice(39.0),
                    lastPrice: MaterialPrice(39.0),
                  ),
                ),
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.verifyMaterialDealBonus(
            item: PriceAggregate.empty(),
            items: <PriceAggregate>[
              priceAggregates.first.copyWith(
                quantity: 15,
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(39.0),
                  lastPrice: MaterialPrice(39.0),
                ),
              ),
            ],
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                quantity: 15,
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(35.0),
                  lastPrice: MaterialPrice(39.0),
                ),
              ),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                quantity: 15,
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(35.0),
                  lastPrice: MaterialPrice(39.0),
                ),
              ),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart updateMaterialDealBonus with cart having material with both tier and deal bonus',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: priceAggregatesWithBothTierAndDealBonus,
          salesOrganisation: fakeSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.updateStockForMaterialDealBonus(
              salesOrganisation: fakeSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: priceAggregatesWithBothTierAndDealBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              priceAggregatesWithBothTierAndDealBonus,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.verifyMaterialDealBonus(
            item: priceAggregates.first.copyWith(
              quantity: 20,
              price: Price.empty().copyWith(
                bonuses: <PriceBonus>[
                  PriceBonus(
                    items: priceBonus,
                  ),
                ],
              ),
            ),
            items: priceAggregatesWithBothTierAndDealBonus,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregatesWithBothTierAndDealBonus.first
                  .copyWith(discountedMaterialCount: 20),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [
              priceAggregatesWithBothTierAndDealBonus.first
                  .copyWith(discountedMaterialCount: 20),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregatesWithBothTierAndDealBonus.first
                  .copyWith(discountedMaterialCount: 20),
            ],
            salesOrganisation: fakeSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              materials: [priceAggregates.first.materialInfo.materialNumber],
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Right([]),
          );
          when(
            () => cartRepositoryMock.upsertCart(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: StringValue('fake-bonus-item-id').getValue(),
              language: fakeClientUser.preferredLanguage,
              materialInfo: priceAggregates.first.materialInfo
                  .copyWith(quantity: MaterialQty(1)),
              quantity: 1,
              tenderContractNumber: '',
              stockInfo: MaterialStockInfo.empty(),
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
                  .hashCode,
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            upsertBonusItemInProgressHashCode: [],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart addBonusToCartItem',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [priceAggregates.first],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              materials: [priceAggregates.first.materialInfo.materialNumber],
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => Right([
              MaterialStockInfo.empty().copyWith(
                stockInfos: priceAggregates.first.stockInfoList,
                materialNumber:
                    priceAggregates.first.materialInfo.materialNumber,
              ),
            ]),
          );
          when(
            () => cartRepositoryMock.upsertCart(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: StringValue('fake-item-id').getValue(),
              language: fakeClientUser.preferredLanguage,
              materialInfo: priceAggregates.first.materialInfo.copyWith(
                quantity: MaterialQty(1),
              ),
              quantity: 1,
              tenderContractNumber: '',
              stockInfo: MaterialStockInfo.empty().copyWith(
                stockInfos: priceAggregates.first.stockInfoList,
                materialNumber:
                    priceAggregates.first.materialInfo.materialNumber,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                priceAggregates.first,
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addBonusToCartItem(
            bonusItemId: StringValue('fake-item-id'),
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
                  .hashCode,
            ],
            cartProducts: [
              priceAggregates.first,
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first,
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: fakeCounterOfferDetails,
              language: fakeClientUser.preferredLanguage,
              product: priceAggregates.first.copyWith(
                quantity: 2,
              ),
              materialStockInfo: [],
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              materials: [priceAggregates.first.materialInfo.materialNumber],
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Right([]),
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart upsertCart update old Item',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [priceAggregates.first.copyWith(quantity: 1)],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
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
        'Cart upsertCart old Item and call update stock event afterward',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [priceAggregates.elementAt(1)],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: fakeCounterOfferDetails,
              language: fakeClientUser.preferredLanguage,
              product: priceAggregates.first.copyWith(
                quantity: 2,
              ),
              materialStockInfo: [],
            ),
          ).thenAnswer(
            (_) async => Right([priceAggregates.first.copyWith(quantity: 2)]),
          );

          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              materials: [priceAggregates.first.materialInfo.materialNumber],
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Right([]),
          );

          when(
            () => stockInfoRepositoryMock.getMappedStockInfoList(
              items: priceAggregates.first
                  .copyWith(quantity: 2)
                  .toStockListMaterials,
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
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
            cartProducts: [priceAggregates.elementAt(1)],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeMYSalesOrganisation,
            isUpdatingStock: true,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart upsertCart new Item and call update stock event afterward',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: fakeCounterOfferDetails,
              language: fakeClientUser.preferredLanguage,
              product: priceAggregates.first.copyWith(
                quantity: 2,
              ),
              materialStockInfo: [],
            ),
          ).thenAnswer(
            (_) async => Right([priceAggregates.first.copyWith(quantity: 2)]),
          );
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              materials: [priceAggregates.first.materialInfo.materialNumber],
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Right([]),
          );
          when(
            () => stockInfoRepositoryMock.getMappedStockInfoList(
              items: priceAggregates.first
                  .copyWith(quantity: 2)
                  .toStockListMaterials,
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeMYSalesOrganisation,
            isUpdatingStock: true,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Should add fetch total price event and update stock for ID market after upsert success',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
          config: fakeIDSalesOrgConfigs,
          shipToInfo: shipToInfo,
          user: fakeClientUser,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeIDSalesOrganisation,
              salesOrganisationConfig: fakeIDSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
                counterOfferCurrency: fakeIDSalesOrgConfigs.currency,
              ),
              language: fakeClientUser.preferredLanguage,
              product: priceAggregatesForID.first.copyWith(
                quantity: 2,
                salesOrgConfig: fakeIDSalesOrgConfigs,
              ),
              materialStockInfo: [],
            ),
          ).thenAnswer((_) async => Right([priceAggregatesForID.first]));
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              materials: [priceAggregates.first.materialInfo.materialNumber],
              salesOrganisation: fakeIDSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Right([]),
          );
          when(
            () => stockInfoRepositoryMock.getMappedStockInfoList(
              items: priceAggregatesForID.first.toStockListMaterials,
              salesOrganisation: fakeIDSalesOrganisation,
              salesOrganisationConfigs: fakeIDSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer((_) async => const Left(ApiFailure.other('fake')));
          when(
            () => cartRepositoryMock.fetchGrandTotalPriceForIdMarket(
              totalPrice: priceAggregatesForID.first.finalPriceTotal,
              materialNumbers: [priceAggregatesForID.first.getMaterialNumber],
              salesOrganisation: fakeIDSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer((_) async => const Left(ApiFailure.other('fake')));
        },
        act: (bloc) => bloc.add(
          CartEvent.upsertCart(
            priceAggregate: priceAggregatesForID.first.copyWith(
              quantity: 2,
              salesOrgConfig: fakeIDSalesOrgConfigs,
            ),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isUpserting: true,
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeIDSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                salesOrgConfig: fakeIDSalesOrgConfigs,
              ),
            ],
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeIDSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            isUpdatingStock: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                salesOrgConfig: fakeIDSalesOrgConfigs,
              ),
            ],
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeIDSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
            cartProducts: [
              priceAggregates.first.copyWith(
                salesOrgConfig: fakeIDSalesOrgConfigs,
              ),
            ],
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeIDSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            isAplProductLoading: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                salesOrgConfig: fakeIDSalesOrgConfigs,
              ),
            ],
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeIDSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake'))),
            cartProducts: [
              priceAggregates.first.copyWith(
                salesOrgConfig: fakeIDSalesOrgConfigs,
              ),
            ],
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeIDSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Should not add verify bonus and fetch total price after upsert success and cart is empty',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
          config: fakeIDSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              materials: [priceAggregates.first.materialInfo.materialNumber],
              salesOrganisation: fakeIDSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Right([]),
          );
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeIDSalesOrganisation,
              salesOrganisationConfig: fakeIDSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
                counterOfferCurrency: fakeIDSalesOrgConfigs.currency,
              ),
              language: fakeClientUser.preferredLanguage,
              product: priceAggregates.first.copyWith(
                quantity: 2,
              ),
              materialStockInfo: [],
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
            config: fakeIDSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [],
            salesOrganisation: fakeIDSalesOrganisation,
            config: fakeIDSalesOrgConfigs,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartItems(
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClientUser.preferredLanguage,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart upsertCartItems new Item fail same bundle',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.elementAt(1),
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartItems(
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClientUser.preferredLanguage,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
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
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartItems(
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClientUser.preferredLanguage,
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
            () => stockInfoRepositoryMock.getMappedStockInfoList(
              items: bundleItem.bundle.materials
                  .map((e) => e.copyWith(quantity: MaterialQty(10)))
                  .toList(),
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart upsertCartItems new Item',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartItems(
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClientUser.preferredLanguage,
              product: bundleItem,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [bundleItem],
            ),
          );
          when(
            () => stockInfoRepositoryMock.getMappedStockInfoList(
              items: bundleItem.bundle.materials.map((e) => e).toList(),
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [bundleItem],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isUpdatingStock: true,
            cartProducts: [bundleItem],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            cartProducts: [bundleItem],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.addHistoryItemsToCart(
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClientUser.preferredLanguage,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: '',
              materialInfo: [priceAggregates.first.materialInfo],
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              tenderContractDetails: {},
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addHistoryItemsToCart(
            items: [priceAggregates.first],
            counterOfferDetails: RequestCounterOfferDetails.empty(),
            tenderContractList: {},
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isBuyAgain: true,
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart addHistoryItemsToCart',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.getMappedStockInfoList(
              items: [priceAggregates.first.materialInfo],
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
          when(
            () => cartRepositoryMock.addHistoryItemsToCart(
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClientUser.preferredLanguage,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: '',
              materialInfo: [priceAggregates.first.materialInfo],
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              tenderContractDetails: {},
            ),
          ).thenAnswer(
            (invocation) async =>
                Right([priceAggregates.first.copyWith(quantity: 2)]),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addHistoryItemsToCart(
            items: [priceAggregates.first],
            counterOfferDetails: RequestCounterOfferDetails.empty(),
            tenderContractList: {},
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isBuyAgain: true,
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isUpdatingStock: true,
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            cartProducts: [priceAggregates.first.copyWith(quantity: 2)],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Add material with offer when cart already has material with offer',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          cartProducts: [cartProducts.cartProducts.first],
        ),
        setUp: () {
          final priceAggregate = cartProducts.cartProducts.first;
          final newQty = priceAggregate.materialInfo.quantity.intValue * 2;
          when(
            () => cartRepositoryMock.addHistoryItemsToCart(
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              language: fakeClientUser.preferredLanguage,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: '',
              materialInfo: [
                priceAggregate.materialInfo
                    .copyWith(quantity: MaterialQty(newQty)),
                ...priceAggregate
                    .copyWith(
                      quantity: newQty,
                      materialInfo: priceAggregate.materialInfo
                          .copyWith(quantity: MaterialQty(newQty)),
                      price: Price.empty()
                          .copyWith(bonuses: [PriceBonus(items: priceBonus)]),
                    )
                    .dealBonusList,
              ],
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              tenderContractDetails: {},
            ),
          ).thenAnswer((_) async => Left(fakeError));
        },
        act: (bloc) => bloc.add(
          CartEvent.addHistoryItemsToCart(
            items: [
              cartProducts.cartProducts.first.copyWith(
                price: Price.empty()
                    .copyWith(bonuses: [PriceBonus(items: priceBonus)]),
              ),
            ],
            counterOfferDetails: RequestCounterOfferDetails.empty(),
            tenderContractList: {},
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isBuyAgain: true,
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            cartProducts: [cartProducts.cartProducts.first],
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            cartProducts: [cartProducts.cartProducts.first],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              price: prices.first.copyWith(
                materialNumber: priceAggregates.first.getMaterialNumber,
              ),
            ),
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.updateStockForMaterialDealBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [
                priceAggregates.first.copyWith(
                  price: prices.first,
                ),
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
              priceAggregates.first.getMaterialNumber: prices.first,
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
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
        'Cart updatePriceProduct with zmg individual discount',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            cartProducts.cartProducts.first,
            cartProducts.cartProducts[1],
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.updateStockForMaterialDealBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [
                cartProducts.cartProducts.first.copyWith(
                  price: prices[11],
                  discountedMaterialCount: 19,
                  salesOrgConfig: fakeMYSalesOrgConfigs,
                  exceedQuantity: true,
                ),
                cartProducts.cartProducts[1].copyWith(
                  price: prices.last,
                  discountedMaterialCount: 10,
                  salesOrgConfig: fakeMYSalesOrgConfigs,
                  exceedQuantity: true,
                ),
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
              cartProducts.cartProducts.first.getMaterialNumber: prices[11],
              cartProducts.cartProducts[1].getMaterialNumber: prices.last,
            },
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isMappingPrice: true,
            cartProducts: [
              cartProducts.cartProducts.first,
              cartProducts.cartProducts[1],
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              cartProducts.cartProducts.first.copyWith(
                price: prices[11],
                discountedMaterialCount: 19,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
              cartProducts.cartProducts[1].copyWith(
                price: prices.last,
                discountedMaterialCount: 10,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [
              cartProducts.cartProducts.first.copyWith(
                price: prices[11],
                discountedMaterialCount: 19,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
              cartProducts.cartProducts[1].copyWith(
                price: prices.last,
                discountedMaterialCount: 10,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              cartProducts.cartProducts.first.copyWith(
                price: prices[11],
                discountedMaterialCount: 19,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
              cartProducts.cartProducts[1].copyWith(
                price: prices.last,
                discountedMaterialCount: 10,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
        'Cart updatePriceProduct with zmg group discount',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            cartProducts.cartProducts.first,
            cartProducts.cartProducts[2],
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.updateStockForMaterialDealBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [
                cartProducts.cartProducts.first.copyWith(
                  price: prices[11],
                  discountedMaterialCount: 38,
                  salesOrgConfig: fakeMYSalesOrgConfigs,
                  exceedQuantity: true,
                ),
                cartProducts.cartProducts[2].copyWith(
                  price: prices[10],
                  discountedMaterialCount: 38,
                  salesOrgConfig: fakeMYSalesOrgConfigs,
                  exceedQuantity: true,
                ),
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
              cartProducts.cartProducts.first.getMaterialNumber: prices[11],
              cartProducts.cartProducts[2].getMaterialNumber: prices[10],
            },
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isMappingPrice: true,
            cartProducts: [
              cartProducts.cartProducts.first,
              cartProducts.cartProducts[2],
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              cartProducts.cartProducts.first.copyWith(
                price: prices[11],
                discountedMaterialCount: 38,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
              cartProducts.cartProducts[2].copyWith(
                price: prices[10],
                discountedMaterialCount: 38,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [
              cartProducts.cartProducts.first.copyWith(
                price: prices[11],
                discountedMaterialCount: 38,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
              cartProducts.cartProducts[2].copyWith(
                price: prices[10],
                discountedMaterialCount: 38,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              cartProducts.cartProducts.first.copyWith(
                price: prices[11],
                discountedMaterialCount: 38,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
              cartProducts.cartProducts[2].copyWith(
                price: prices[10],
                discountedMaterialCount: 38,
                salesOrgConfig: fakeMYSalesOrgConfigs,
                exceedQuantity: true,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              price: prices.first,
            ),
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.updateStockForMaterialDealBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [
                priceAggregates.first.copyWith(
                  price: prices.first,
                ),
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
              priceAggregates.first.getMaterialNumber: prices.first,
            },
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isMappingPrice: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              price: prices.elementAt(1),
            ),
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.updateStockForMaterialDealBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
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
              priceAggregates.first.getMaterialNumber: prices.first,
            },
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isMappingPrice: true,
            cartProducts: [
              priceAggregates.first.copyWith(price: prices.elementAt(1)),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            isFetchingBonus: true,
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              price: prices.first,
            ),
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => stockInfoRepositoryMock.updateStockForMaterialDealBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfigs: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [
                priceAggregates.first.copyWith(
                  discountedMaterialCount: 1,
                  price: prices.first.copyWith(
                    tiers: priceTiers,
                  ),
                ),
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
              ),
            },
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isMappingPrice: true,
            cartProducts: [
              priceAggregates.first.copyWith(
                price: prices.first,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [priceAggregates.first, bundleItem],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.removeSelectedProducts(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              products: [priceAggregates.first.materialInfo],
              language: fakeClientUser.preferredLanguage,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [bundleItem],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Cart removeInvalidProducts',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: priceAggregates,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.removeSelectedProducts(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              products: [priceAggregates.first.materialInfo],
              language: fakeClientUser.preferredLanguage,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.elementAt(1)],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Cart removeInvalidProducts fail',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: priceAggregates,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.removeSelectedProducts(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              products: [priceAggregates.first.materialInfo],
              language: fakeClientUser.preferredLanguage,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            cartProducts: priceAggregates,
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              bonusSampleItems: bonusSampleItem,
            ),
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.removeSelectedProducts(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              products: [
                MaterialInfo.empty().copyWith(
                  materialNumber: bonusSampleItem.first.materialNumber,
                  parentID: priceAggregates.first.getMaterialNumber.getValue(),
                  quantity: MaterialQty(0),
                  sampleBonusItemId: 'fake-item-id',
                ),
              ],
              language: fakeClientUser.preferredLanguage,
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
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Cart removeSampleBonusFromCartConfig fail',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartProducts: [
            priceAggregates.first.copyWith(
              bonusSampleItems: bonusSampleItem,
            ),
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.removeSelectedProducts(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              products: [
                MaterialInfo.empty().copyWith(
                  materialNumber: bonusSampleItem.first.materialNumber,
                  parentID: priceAggregates.first.getMaterialNumber.getValue(),
                  quantity: MaterialQty(0),
                  sampleBonusItemId: 'fake-item-id',
                ),
              ],
              language: fakeClientUser.preferredLanguage,
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
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            cartProducts: [
              priceAggregates.first.copyWith(
                bonusSampleItems: bonusSampleItem,
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
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
  //         config: fakeMYSalesOrgConfigs,
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
  //           config: fakeMYSalesOrgConfigs,
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
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
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
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'clearCart Success',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.clearCart(),
          ).thenAnswer(
            (invocation) async => Left(fakeError),
          );
        },
        seed: () => CartState.initial().copyWith(
          cartProducts: [PriceAggregate.empty()],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            cartProducts: [PriceAggregate.empty()],
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );
    },
  );

  group('Testing CartBloc updateProductDetermination test', () {
    blocTest<CartBloc, CartState>(
      'updateProductDetermination get product list failure',
      build: () => CartBloc(
        cartRepositoryMock,
        productDetailRepository,
        stockInfoRepositoryMock,
      ),
      setUp: () {
        when(
          () => productDetailRepository.getProductListDetail(
            materialNumber: [MaterialNumber('fake-material-number')],
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: shipToInfo,
            language: fakeClientUser.preferredLanguage,
            types: [MaterialInfoType.material()],
          ),
        ).thenAnswer(
          (invocation) async => Left(
            fakeError,
          ),
        );
      },
      seed: () => CartState.initial().copyWith(
        cartProducts: [PriceAggregate.empty()],
        salesOrganisation: fakeSalesOrganisation,
        config: fakeMYSalesOrgConfigs,
        shipToInfo: shipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
      ),
      act: (bloc) => bloc.add(
        CartEvent.updateProductDetermination(
          productDeterminationList: [
            AplProduct.empty().copyWith(
              materialNumber: MaterialNumber('fake-material-number'),
            ),
          ],
          updatedCartItems: [PriceAggregate.empty()],
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartProducts: [PriceAggregate.empty()],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          isUpdateProductDetermination: true,
        ),
        CartState.initial().copyWith(
          cartProducts: [PriceAggregate.empty()],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          updateFailureOrSuccessOption: optionOf(
            Left(
              fakeError,
            ),
          ),
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'updateProductDetermination Update Cart With Product Determination failure',
      build: () => CartBloc(
        cartRepositoryMock,
        productDetailRepository,
        stockInfoRepositoryMock,
      ),
      setUp: () {
        when(
          () => productDetailRepository.getProductListDetail(
            materialNumber: [MaterialNumber('fake-material-number')],
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: shipToInfo,
            language: fakeClientUser.preferredLanguage,
            types: [MaterialInfoType.material()],
          ),
        ).thenAnswer(
          (invocation) async => Right(
            [
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number'),
              ),
            ],
          ),
        );

        when(
          () => cartRepositoryMock.updateCartWithProductDetermination(
            productDeterminationList: [
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number'),
                quantity: MaterialQty(100),
              ),
            ],
            updatedCartItems: [PriceAggregate.empty()],
            salesOrganisation: fakeSalesOrganisation,
            salesOrganisationConfig: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: shipToInfo,
            language: fakeClientUser.preferredLanguage,
          ),
        ).thenAnswer(
          (invocation) async => Left(fakeError),
        );
      },
      seed: () => CartState.initial().copyWith(
        cartProducts: [PriceAggregate.empty()],
        salesOrganisation: fakeSalesOrganisation,
        config: fakeMYSalesOrgConfigs,
        shipToInfo: shipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
      ),
      act: (bloc) => bloc.add(
        CartEvent.updateProductDetermination(
          productDeterminationList: [
            AplProduct.empty().copyWith(
              materialNumber: MaterialNumber('fake-material-number'),
              productQty: MaterialQty(100),
            ),
          ],
          updatedCartItems: [PriceAggregate.empty()],
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartProducts: [PriceAggregate.empty()],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          isUpdateProductDetermination: true,
        ),
        CartState.initial().copyWith(
          cartProducts: [PriceAggregate.empty()],
          salesOrganisation: fakeSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          updateFailureOrSuccessOption: optionOf(
            Left(
              fakeError,
            ),
          ),
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'updateProductDetermination update Cart With Product Determination success',
      build: () => CartBloc(
        cartRepositoryMock,
        productDetailRepository,
        stockInfoRepositoryMock,
      ),
      setUp: () {
        when(
          () => productDetailRepository.getProductListDetail(
            materialNumber: [MaterialNumber('fake-material-number')],
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: shipToInfo,
            language: fakeClientUser.preferredLanguage,
            types: [MaterialInfoType.material()],
          ),
        ).thenAnswer(
          (invocation) async => Right(
            [
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number'),
              ),
            ],
          ),
        );

        when(
          () => cartRepositoryMock.updateCartWithProductDetermination(
            productDeterminationList: [
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number'),
                quantity: MaterialQty(100),
              ),
            ],
            updatedCartItems: priceAggregates,
            salesOrganisation: fakeSalesOrganisation,
            salesOrganisationConfig: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: shipToInfo,
            language: fakeClientUser.preferredLanguage,
          ),
        ).thenAnswer(
          (invocation) async => Right(priceAggregatesForID),
        );

        when(
          () => stockInfoRepositoryMock.getMappedStockInfoList(
            items: priceAggregatesForID
                .map(
                  (element) => element.toStockListMaterials,
                )
                .expand((element) => element)
                .toList(),
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: shipToInfo,
          ),
        ).thenAnswer(
          (invocation) async => Left(fakeError),
        );
      },
      seed: () => CartState.initial().copyWith(
        cartProducts: priceAggregates,
        salesOrganisation: fakeSalesOrganisation,
        config: fakeMYSalesOrgConfigs,
        shipToInfo: shipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
      ),
      act: (bloc) => bloc.add(
        CartEvent.updateProductDetermination(
          productDeterminationList: [
            AplProduct.empty().copyWith(
              materialNumber: MaterialNumber('fake-material-number'),
              productQty: MaterialQty(100),
            ),
          ],
          updatedCartItems: priceAggregates,
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartProducts: priceAggregates,
          salesOrganisation: fakeSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          isUpdateProductDetermination: true,
        ),
        CartState.initial().copyWith(
          cartProducts: priceAggregatesForID,
          salesOrganisation: fakeSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
        CartState.initial().copyWith(
          cartProducts: priceAggregatesForID,
          salesOrganisation: fakeSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          isUpdatingStock: true,
        ),
        CartState.initial().copyWith(
          cartProducts: priceAggregatesForID,
          salesOrganisation: fakeSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          apiFailureOrSuccessOption: optionOf(Left(fakeError)),
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'updatePriceForIdMarket for Id market aplSimulateOrder failure',
      build: () => CartBloc(
        cartRepositoryMock,
        productDetailRepository,
        stockInfoRepositoryMock,
      ),
      setUp: () {
        when(
          () => cartRepositoryMock.aplSimulateOrder(
            salesOrganisation: fakeIDSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            product: priceAggregatesForID.materialInfos,
          ),
        ).thenAnswer(
          (invocation) async => Left(fakeError),
        );
      },
      seed: () => CartState.initial().copyWith(
        cartProducts: priceAggregatesForID,
        salesOrganisation: fakeIDSalesOrganisation,
        config: fakeIDSalesOrgConfigs,
        shipToInfo: shipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
      ),
      act: (bloc) => bloc.add(
        const CartEvent.updatePriceForIdMarket(),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartProducts: priceAggregatesForID,
          salesOrganisation: fakeIDSalesOrganisation,
          config: fakeIDSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          isAplProductLoading: true,
        ),
        CartState.initial().copyWith(
          cartProducts: priceAggregatesForID,
          salesOrganisation: fakeIDSalesOrganisation,
          config: fakeIDSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          apiFailureOrSuccessOption: optionOf(Left(fakeError)),
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'updatePriceForIdMarket for Id market aplSimulateOrder success',
      build: () => CartBloc(
        cartRepositoryMock,
        productDetailRepository,
        stockInfoRepositoryMock,
      ),
      setUp: () {
        final aplProductList =
            aplSimulatorOrder.productDeterminationList(priceAggregatesForID);
        when(
          () => productDetailRepository.getProductListDetail(
            materialNumber:
                aplProductList.map((e) => e.materialNumber).toList(),
            salesOrganisation: fakeIDSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: shipToInfo,
            language: fakeClientUser.preferredLanguage,
            types:
                aplProductList.map((e) => MaterialInfoType.material()).toList(),
          ),
        ).thenAnswer(
          (invocation) async => Left(fakeError),
        );
        when(
          () => cartRepositoryMock.aplSimulateOrder(
            salesOrganisation: fakeIDSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            product: priceAggregatesForID.materialInfos,
          ),
        ).thenAnswer(
          (invocation) async => Right(aplSimulatorOrder),
        );
      },
      seed: () => CartState.initial().copyWith(
        cartProducts: priceAggregatesForID,
        salesOrganisation: fakeIDSalesOrganisation,
        config: fakeIDSalesOrgConfigs,
        shipToInfo: shipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
      ),
      act: (bloc) => bloc.add(
        const CartEvent.updatePriceForIdMarket(),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartProducts: priceAggregatesForID,
          salesOrganisation: fakeIDSalesOrganisation,
          config: fakeIDSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          isAplProductLoading: true,
        ),
        CartState.initial().copyWith(
          cartProducts: priceAggregatesForID,
          salesOrganisation: fakeIDSalesOrganisation,
          config: fakeIDSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          aplSimulatorOrder: aplSimulatorOrder,
        ),
        CartState.initial().copyWith(
          cartProducts: priceAggregatesForID,
          salesOrganisation: fakeIDSalesOrganisation,
          config: fakeIDSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          aplSimulatorOrder: aplSimulatorOrder,
          isUpdateProductDetermination: true,
        ),
        CartState.initial().copyWith(
          cartProducts: priceAggregatesForID,
          salesOrganisation: fakeIDSalesOrganisation,
          config: fakeIDSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          aplSimulatorOrder: aplSimulatorOrder,
          updateFailureOrSuccessOption: optionOf(Left(fakeError)),
        ),
      ],
    );
  });

  group(
    'Testing CartBloc state test',
    () {
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
          expect(cartBlocState.priceUnderLoadingShimmer, false);
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
            cartBlocState.totalPriceWithTaxExcludeSmallOrderFees,
            273.6,
          );
        },
      );

      test('grandTotalDisplayed getter', () {
        const smallOrderFee = 13.5;
        expect(
          CartState.initial()
              .copyWith(
                salesOrganisation: fakeIDSalesOrganisation,
                aplSimulatorOrder:
                    AplSimulatorOrder.empty().copyWith(grandTotal: 999),
              )
              .grandTotalDisplayed(smallOrderFee: smallOrderFee),
          999,
        );

        expect(
          CartState.initial().copyWith(
            cartProducts: [priceAggregates.first.copyWith(price: prices.first)],
          ).grandTotalDisplayed(smallOrderFee: smallOrderFee),
          273.6 + smallOrderFee,
        );
      });

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
              ),
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
              ),
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
                documentType: DocumentType('zpfb'),
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
                documentType: DocumentType('zpfc'),
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
                documentType: DocumentType('zpfb'),
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
                documentType: DocumentType('zpfc'),
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
                documentType: DocumentType('zpor'),
              ),
            ),
            true,
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
            cartBlocState.findItemById(priceAggregates.first.getMaterialNumber),
            priceAggregates.first.copyWith(price: prices.first),
          );
        },
      );

      test(
        'Testing CartBloc state showDialog updatedCartProduct empty',
        () {
          final cartBlocState = CartState.initial();
          expect(
            cartBlocState.findItemById(priceAggregates.first.getMaterialNumber),
            PriceAggregate.empty(),
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
            config: fakeSGSalesOrgConfigs,
          );
          expect(
            cartBlocState.totalTaxPercent,
            '9',
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
            config: fakeSGSalesOrgConfigs,
          );
          expect(
            cartBlocState.totalTaxPercent,
            '9',
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
              ),
            ],
            config: fakeIDSalesOrgConfigs,
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
              ),
            ],
            config: fakeKHSalesOrgConfigs,
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
              ),
            ],
            config: fakeVNSalesOrgConfigs.copyWith(
              displaySubtotalTaxBreakdown: true,
            ),
          );
          expect(
            cartBlocState.taxMaterial,
            2.736,
          );
        },
      );

      test(
        'Testing CartBloc state taxMaterial full tax applied of MM market',
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
            config: fakeMMSalesOrgConfigs.copyWith(
              displaySubtotalTaxBreakdown: true,
            ),
          );
          expect(
            cartBlocState.taxMaterial,
            2.736,
          );
        },
      );

      //Need to revisit when Tax Exempt will be covered in another User story
      // test(
      //   'Testing CartBloc state taxMaterial full tax Exempt',
      //   () {
      //     final cartBlocState = CartState.initial().copyWith(
      //       cartProducts: [
      //         priceAggregates.first.copyWith(
      //           price: prices.first,
      //           materialInfo: priceAggregates.first.materialInfo.copyWith(
      //             tax: 1,
      //             taxClassification: MaterialTaxClassification('Exempt'),
      //           ),
      //         )
      //       ],
      //       config: fakeMYSalesOrgConfigs,
      //     );
      //     expect(
      //       cartBlocState.taxMaterial,
      //       0.0,
      //     );
      //   },
      // );

      // test(
      //   'Testing CartBloc state taxMaterial full tax Exempt for vn market',
      //   () {
      //     final cartBlocState = CartState.initial().copyWith(
      //       cartProducts: [
      //         priceAggregates.first.copyWith(
      //           price: prices.first,
      //           materialInfo: priceAggregates.first.materialInfo.copyWith(
      //             tax: 1,
      //             taxClassification: MaterialTaxClassification('Exempt'),
      //           ),
      //         )
      //       ],
      //       config: fakeMYSalesOrgConfigs,
      //     );
      //     expect(
      //       cartBlocState.taxMaterial,
      //       0.0,
      //     );
      //   },
      // );

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
              ),
            ],
            config: fakeKHSalesOrgConfigs,
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
                salesOrgConfig: fakeKHSalesOrgConfigs,
              ),
            ],
          );
          expect(
            cartBlocState.taxBundle,
            193.0,
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
            cartBlocState.totalPriceWithTaxExcludeSmallOrderFees,
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
            cartBlocState.totalCartCount,
            11,
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
            false,
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

      test(
        'Testing CartBloc state totalBonusCount => 1',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(bonusSampleItems: bonusSampleItem),
            ],
          );
          expect(
            cartBlocState.totalBonusCount,
            1,
          );
        },
      );

      test(
        'Testing CartBloc state totalCartCount => 2',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first.copyWith(bonusSampleItems: bonusSampleItem),
            ],
          );
          expect(
            cartBlocState.totalCartCount,
            2,
          );
        },
      );
      test(
        'Testing CartBloc checkoutSubTotalHidePriceMaterial for ID',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first,
            ],
            aplSimulatorOrder: aplSimulatorOrder,
            config: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          );
          expect(
            cartBlocState.checkoutSubTotalHidePriceMaterial,
            aplSimulatorOrder.totalPriceWithoutTax,
          );
        },
      );

      test(
        'Testing CartBloc checkoutSubTotalHidePriceMaterial for Other then ID',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              priceAggregates.first,
            ],
            aplSimulatorOrder: aplSimulatorOrder,
            config: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
          );
          expect(
            cartBlocState.checkoutSubTotalHidePriceMaterial,
            cartBlocState.subTotalHidePriceMaterial,
          );
        },
      );

      group('deleteSuccessMessage -', () {
        test('when cart is empty', () {
          final previousState = CartState.initial()
              .copyWith(cartProducts: cartProducts.cartProducts);
          final currentState = previousState.copyWith(cartProducts: []);

          expect(
            currentState.deleteSuccessMessage(previousState),
            'Cart has been emptied.',
          );
        });

        test('when remove material', () {
          final materialIndex = cartProducts.cartProducts
              .indexWhere((e) => e.materialInfo.type.typeMaterial);
          final previousState = CartState.initial().copyWith(
            cartProducts: cartProducts.cartProducts,
          );
          final currentState = previousState.copyWith(
            cartProducts: [...priceAggregates]..removeAt(materialIndex),
          );

          expect(
            currentState.deleteSuccessMessage(previousState),
            'Item has been removed from cart.',
          );
        });

        test('when remove bonus from material', () {
          final materialWithBonus = cartProducts.cartProducts.firstWhere(
            (e) =>
                e.materialInfo.type.typeMaterial &&
                e.bonusSampleItems.isNotEmpty,
          );
          final previousState = CartState.initial().copyWith(
            cartProducts: [materialWithBonus],
          );
          final currentState = previousState.copyWith(
            cartProducts: [materialWithBonus.copyWith(bonusSampleItems: [])],
          );

          expect(
            currentState.deleteSuccessMessage(previousState),
            'Item has been removed from cart.',
          );
        });

        test('when remove bundle', () {
          final bundleIndex = cartProducts.cartProducts
              .indexWhere((e) => e.materialInfo.type.typeBundle);
          final previousState = CartState.initial().copyWith(
            cartProducts: cartProducts.cartProducts,
          );
          final currentState = previousState.copyWith(
            cartProducts: [...cartProducts.cartProducts]..removeAt(bundleIndex),
          );

          expect(
            currentState.deleteSuccessMessage(previousState),
            'Bundle has been removed from cart.',
          );
        });

        test('when remove item from bundle', () {
          final bundle = cartProducts.cartProducts.firstWhere(
            (e) =>
                e.materialInfo.type.typeBundle && e.bundle.materials.isNotEmpty,
          );
          final previousState = CartState.initial().copyWith(
            cartProducts: [bundle],
          );
          final currentState = previousState.copyWith(
            cartProducts: [
              bundle.copyWith.bundle(
                materials: [...bundle.bundle.materials]..removeLast(),
              ),
            ],
          );
          expect(
            currentState.deleteSuccessMessage(previousState),
            'Item has been removed from bundle.',
          );
        });

        test('when remove combo', () {
          final comboIndex = cartProducts.cartProducts.indexWhere(
            (e) => e.materialInfo.type.typeCombo,
          );
          final previousState = CartState.initial().copyWith(
            cartProducts: cartProducts.cartProducts,
          );
          final currentState = previousState.copyWith(
            cartProducts: [...cartProducts.cartProducts]..removeAt(comboIndex),
          );

          expect(
            currentState.deleteSuccessMessage(previousState),
            'Combo has been removed from cart.',
          );
        });
      });

      blocTest<CartBloc, CartState>(
        'Cart upsertCart new Item if delivery address for the user is changed',
        build: () => CartBloc(
          cartRepositoryMock,
          productDetailRepository,
          stockInfoRepositoryMock,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.upsertCartWithBonus(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrganisationConfig: fakeMYSalesOrgConfigs,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
              counterOfferDetails: fakeCounterOfferDetails,
              language: fakeClientUser.preferredLanguage,
              product: priceAggregates.first.copyWith(
                quantity: 2,
              ),
              materialStockInfo: [],
            ),
          ).thenAnswer(
            (invocation) async => Left(fakeErrorWithDifferentDeliveryAddress),
          );
          when(
            () => stockInfoRepositoryMock.getStockInfoList(
              materials: [priceAggregates.first.materialInfo.materialNumber],
              salesOrganisation: fakeMYSalesOrganisation,
              shipToInfo: shipToInfo,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer(
            (invocation) async => const Right([]),
          );
          when(
            () => cartRepositoryMock.clearCart(),
          ).thenAnswer((invocation) async => Left(fakeError));
        },
        seed: () => CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
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
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Left(fakeError)),
            salesOrganisation: fakeMYSalesOrganisation,
            config: fakeMYSalesOrgConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ],
      );

      test(
        'Testing CartBloc isPriceOverrideDisabled for sales rep -->true',
        () {
          final cartBlocState = CartState.initial().copyWith(
            config: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeExternalSalesRepUser,
          );
          expect(cartBlocState.isPriceOverrideDisabled, true);
        },
      );

      test(
        'Testing CartBloc isPriceOverrideDisabled for sales rep -->false',
        () {
          final cartBlocState = CartState.initial().copyWith(
            config: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeExternalSalesRepUser.copyWith(
              hasPriceOverride: true,
            ),
          );
          expect(cartBlocState.isPriceOverrideDisabled, false);
        },
      );

      test(
        'Testing CartBloc isCounterOfferProductResetRequired -->true',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  counterOfferDetails:
                      RequestCounterOfferDetails.empty().copyWith(
                    counterOfferPrice: CounterOfferValue('100'),
                  ),
                ),
              ),
            ],
            config: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeExternalSalesRepUser,
          );
          expect(cartBlocState.isCounterOfferProductResetRequired, true);
        },
      );

      test(
        'Testing CartBloc isCounterOfferProductResetRequired -->false',
        () {
          final cartBlocState = CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  counterOfferDetails:
                      RequestCounterOfferDetails.empty().copyWith(
                    counterOfferPrice: CounterOfferValue('100'),
                  ),
                ),
              ),
            ],
            config: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeExternalSalesRepUser.copyWith(
              hasPriceOverride: true,
            ),
          );
          expect(cartBlocState.isCounterOfferProductResetRequired, false);
        },
      );

      test(
        'Testing CartBloc showSmallOrderFeeBottomSheet is true ',
        () {
          final cartBlocState = CartState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            aplSimulatorOrder:
                AplSimulatorOrder.empty().copyWith(smallOrderFee: 2000),
          );
          expect(cartBlocState.showSmallOrderFeeBottomSheet, true);
        },
      );

      test(
        'Testing CartBloc showSmallOrderFeeBottomSheet is false when salesOrg.showSmallOrderFee is false',
        () {
          final cartBlocState = CartState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            aplSimulatorOrder:
                AplSimulatorOrder.empty().copyWith(smallOrderFee: 2000),
          );
          expect(cartBlocState.showSmallOrderFeeBottomSheet, false);
        },
      );

      test(
        'Testing CartBloc showSmallOrderFeeBottomSheet is false when aplSimulatorOrder.smallOrderFee = 0',
        () {
          final cartBlocState = CartState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          );
          expect(cartBlocState.showSmallOrderFeeBottomSheet, false);
        },
      );
    },
  );
}
