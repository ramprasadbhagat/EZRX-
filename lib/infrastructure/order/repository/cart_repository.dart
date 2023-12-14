import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/cart_product_request.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_request_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_product_request_dto.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';

class CartRepository implements ICartRepository {
  final Config config;
  final CartLocalDataSource cartLocalDataSource;
  final CartRemoteDataSource cartRemoteDataSource;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final DiscountOverrideRemoteDataSource discountOverrideRemoteDataSource;
  final ViewByItemLocalDataSource viewByItemLocalDataSource;
  final OrderHistoryRemoteDataSource orderHistoryRemoteDataSource;
  final MixpanelService mixpanelService;

  CartRepository({
    required this.config,
    required this.stockInfoLocalDataSource,
    required this.stockInfoRemoteDataSource,
    required this.discountOverrideRemoteDataSource,
    required this.mixpanelService,
    required this.cartLocalDataSource,
    required this.cartRemoteDataSource,
    required this.orderHistoryRemoteDataSource,
    required this.viewByItemLocalDataSource,
  });

  @override
  Future<Either<ApiFailure, Unit>> clearCart() async {
    if (config.appFlavor == Flavor.mock) {
      return const Right(unit);
    }

    try {
      await cartRemoteDataSource.deleteCart();

      return const Right(unit);
    } on Exception catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  /*Future<CartItem> _verifyZdp5Discount({
    required CartItem cartItem,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    var updatedCartItem = cartItem;

    if (cartItem.materials.first.isPriceUpdateAvailable) {
      final newPrice = await getMaterialPriceWithZdp5Discount(
        customerCodeInfo: customerCodeInfo,
        item: cartItem,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      );
      final overRidenPrice =
          newPrice.fold((failure) => Price.empty(), (newPrice) => newPrice);

      updatedCartItem = cartItem.copyWithPrice(
        exceedQty: cartItem.totalQty >
            cartItem.materials.first.price.zdp5RemainingQuota.intValue,
        newPrice: overRidenPrice.zdp5RemainingQuota.isValidValue
            ? overRidenPrice
            : overRidenPrice.copyWith(
                zdp5RemainingQuota:
                    updatedCartItem.materials.first.price.zdp5RemainingQuota,
              ),
      );
    }

    return updatedCartItem;
  }*/

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> updateMaterialDealBonus({
    required List<PriceAggregate> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    try {
      final materialTemp = [...materials];
      for (var i = 0; i < materialTemp.length; i++) {
        final failureOrSuccess = await getStockInfoList(
          items: materialTemp[i].bonusListToMaterialInfo,
          customerCodeInfo: customerCodeInfo,
          salesOrganisationConfigs: salesOrganisationConfigs,
          salesOrganisation: salesOrganisation,
          shipToInfo: shipToInfo,
        );
        final bonusStockInfoMap = failureOrSuccess.getOrElse(() => {});
        final dealBonusWithStockInfo =
            materialTemp[i].bonusSampleItems.map((bonus) {
          final stockInfoList = bonusStockInfoMap[bonus.materialNumber] ?? [];
          if (stockInfoList.isNotEmpty) {
            final stockInfo = stockInfoList.firstWhere(
              (element) => element.materialNumber == bonus.materialNumber,
              orElse: () => StockInfo.empty(),
            );

            return bonus.copyWith(
              inStock: stockInfo.inStock,
            );
          }

          return bonus;
        }).toList();

        materialTemp[i] =
            materialTemp[i].copyWith(bonusSampleItems: dealBonusWithStockInfo);
      }

      return Right(materialTemp);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  ///TODO: Might be used while developing ZMG group discount

  // @override
  // List<CartItem> updateDiscountQty({
  //   required List<CartItem> items,
  // }) =>
  //     items.map((item) {
  //       switch (item.itemType) {
  //         case CartItemType.material:
  //           final material = item.materials.first;
  //           var updatedMaterial = material.copyWith(discountedMaterialCount: 0);
  //           if (material.price.zmgDiscount) {
  //             updatedMaterial = material.copyWith(
  //               discountedMaterialCount: items.zmgMaterialsQty(
  //                 material.materialInfo.materialGroup2,
  //               ),
  //             );
  //           } else if (material.price.isTireDiscountEligible) {
  //             updatedMaterial = material.copyWith(
  //               discountedMaterialCount: material.quantity,
  //             );
  //           }
  //           return item.copyWith(
  //             materials: [updatedMaterial],
  //           );

  //         case CartItemType.bundle:
  //         case CartItemType.comboDeal:
  //           return item;
  //       }
  //     }).toList();

  @override
  Future<Either<ApiFailure, Map<MaterialNumber, List<StockInfo>>>>
      getStockInfoList({
    required List<MaterialInfo> items,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    try {
      final stockInfoMap = <MaterialNumber, List<StockInfo>>{};
      for (final item in items) {
        final response = await getStockInfo(
          customerCodeInfo: customerCodeInfo,
          material: item,
          salesOrganisation: salesOrganisation,
          salesOrganisationConfigs: salesOrganisationConfigs,
          shipToInfo: shipToInfo,
        );
        final stockInfo = response.fold(
          (failure) => <StockInfo>[],
          (stockInfo) => stockInfo,
        );
        stockInfoMap.addAll(
          {item.materialNumber: stockInfo},
        );
      }

      return Right(stockInfoMap);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<StockInfo>>> getStockInfo({
    required MaterialInfo material,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final stockInfoList = salesOrganisationConfigs.enableBatchNumber
            ? await stockInfoLocalDataSource.getStockInfoList()
            : [await stockInfoLocalDataSource.getStockInfo()];

        return Right(stockInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    } else {
      try {
        final stockInfoList = salesOrganisationConfigs.enableBatchNumber
            ? await stockInfoRemoteDataSource.getStockInfoList(
                materialNumber: material.materialNumber.getOrCrash(),
                plant: shipToInfo.plant,
                salesOrg: salesOrganisation.salesOrg.getOrCrash(),
                selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
              )
            : [
                await stockInfoRemoteDataSource.getStockInfo(
                  materialNumber: material.materialNumber.getOrCrash(),
                  salesOrg: salesOrganisation.salesOrg.getOrCrash(),
                  selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
                ),
              ];

        return Right(stockInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  /*void _trackAddToCartSuccessEvent(CartItem cartItem) {
    final isBannerClicked = cartItem.materials.firstWhere(
          (item) => item.banner != BannerItem.empty(),
          orElse: () => PriceAggregate.empty(),
        ) !=
        PriceAggregate.empty();
    final props = <String, dynamic>{
      MixpanelProps.productName:
          cartItem.materials.first.materialInfo.materialDescription,
      MixpanelProps.productNumber: cartItem
          .materials.first.materialInfo.materialNumber
          .getOrDefaultValue(''),
      MixpanelProps.productManufacturer: cartItem
          .materials.first.materialInfo.principalData.principalName
          .getOrDefaultValue(''),
      MixpanelProps.productCategory: cartItem
          .materials.first.materialInfo.materialGroup4.getMaterialGroup4Type,
      MixpanelProps.productTotalPrice:
          cartItem.materials.first.price.finalTotalPrice.getOrDefaultValue(0.0),
      MixpanelProps.productQty: cartItem.materials.first.quantity,
      MixpanelProps.bonusName: cartItem.materials.first.addedBonusList
          .map(
            (e) => e.materialDescription,
          )
          .toList(),
      MixpanelProps.bonusManufacturer: cartItem.materials.first.addedBonusList
          .map(
            (e) => e.materialInfo.principalData.principalName
                .getOrDefaultValue(''),
          )
          .toList(),
      MixpanelProps.bannerClicked: isBannerClicked,
      MixpanelProps.bannerId: cartItem.materials.first.banner.id.toString(),
      MixpanelProps.bannerTitle: cartItem.materials.first.banner.title,
      MixpanelProps.bannerType: cartItem.materials.first.banner.category,
    };

    mixpanelService.trackEvent(
      eventName: MixpanelEvents.addToCartSuccess,
      properties: props,
    );
  }*/

  /*StockInfo _getStockInfo({
    required List<StockInfo> stockInfoList,
    required MaterialNumber materialNumber,
  }) =>
      stockInfoList.firstWhere(
        (element) => element.materialNumber == materialNumber,
        orElse: () => StockInfo.empty(),
      );*/

  ///TODO: might be used while ZDP5 Discount implementation

  // Future<Either<ApiFailure, Price>> getMaterialPriceWithZdp5Discount({
  //   required SalesOrganisation salesOrganisation,
  //   required CustomerCodeInfo customerCodeInfo,
  //   required ShipToInfo shipToInfo,
  //   required CartItem item,
  // }) async {
  //   try {
  //     final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
  //     final customerCode = customerCodeInfo.customerCodeSoldTo;
  //     final shipToCode = shipToInfo.shipToCustomerCode;
  //     final price = item.materials.first.price;
  //     final exceedQuantity = item.materials.first.hasZdp5Validation;

  //     final priceData =
  //         await discountOverrideRemoteDataSource.getMaterialOverridePriceList(
  //       salesOrgCode: salesOrgCode,
  //       customerCode: customerCode,
  //       shipToCode: shipToCode,
  //       materialQuery: PriceDto.fromDomain(price)
  //           .materialQueryWithExceedQty(exceedQuantity),
  //     );

  //     return Right(priceData.first);
  //   } catch (e) {
  //     return Left(FailureHandler.handleFailure(e));
  //   }
  // }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>>
      getAddedToCartProductList() async {
    try {
      if (config.appFlavor == Flavor.mock) {
        try {
          final savedCartList =
              await cartLocalDataSource.getAddedToCartProductList();

          return Right(savedCartList);
        } catch (e) {
          return Left(FailureHandler.handleFailure(e));
        }
      }
      final savedCartList =
          await cartRemoteDataSource.getAddedToCartProductList();

      return Right(savedCartList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCart({
    required MaterialInfo materialInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String language,
    required String itemId,
    required int quantity,
    required RequestCounterOfferDetails counterOfferDetails,
  }) async {
    if (quantity > config.maximumCartQuantity) {
      return Left(
        ApiFailure.maximumCartQuantityExceed(
          config.maximumCartQuantity.toString(),
        ),
      );
    }
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await cartLocalDataSource.upsertCart();

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: salesOrganisation.salesOrg,
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: shipToInfo.shipToCustomerCode,
        language: language,
        materialInfo: materialInfo,
        itemId: itemId,
        quantity: quantity,
        counterOfferDetails: counterOfferDetails,
      );

      final productList = await cartRemoteDataSource.upsertCart(
        requestParams:
            CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
      );

      final response = await getStockInfo(
        customerCodeInfo: customerCodeInfo,
        material: materialInfo,
        salesOrganisation: salesOrganisation,
        salesOrganisationConfigs: salesOrganisationConfig,
        shipToInfo: shipToInfo,
      );
      final stockInfo = response.fold(
        (failure) => <StockInfo>[],
        (stockInfo) => stockInfo,
      );

      final updatedProductList = productList
          .map(
            (element) =>
                element.getMaterialNumber == materialInfo.materialNumber
                    ? element.copyWith(stockInfoList: stockInfo)
                    : element,
          )
          .toList();

      return Right(updatedProductList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCartWithBonus({
    required PriceAggregate product,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String language,
    required RequestCounterOfferDetails counterOfferDetails,
  }) async {
    try {
      final productList = <PriceAggregate>[];

      final products = [
        product.materialInfo.copyWith(
          quantity: MaterialQty(product.quantity),
        ),
        ...product.dealBonusList,
      ];

      await Future.wait(
        products.map((productData) async {
          final cartProducts = await upsertCart(
            materialInfo: productData,
            salesOrganisation: salesOrganisation,
            salesOrganisationConfig: salesOrganisationConfig,
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo,
            language: language,
            itemId: productData.sampleBonusItemId,
            quantity: productData.quantity.intValue,
            counterOfferDetails: productData.counterOfferDetails,
          );

          cartProducts.fold((l) => {}, (r) {
            productList.clear();
            productList.addAll(r);
          });
        }),
      );

      return Right(productList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> addHistoryItemsToCart({
    required List<MaterialInfo> materialInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String language,
    required String itemId,
    required RequestCounterOfferDetails counterOfferDetails,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList =
            await cartLocalDataSource.upsertCartItemsWithReorderMaterials();

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final productList = await cartRemoteDataSource.upsertCartItems(
        requestParams: materialInfo.map((materialInfo) {
          // For Reordering we are using [convertToMaterialRequest] it has all
          // the cases covered for materials, bundles, bonuses and combo's,
          // for bundles we are using this one because the [ParentID] and the
          // [Material Type] we are already receiving inside Material Info
          final upsertCartRequest = CartProductRequest.toMaterialRequest(
            salesOrg: salesOrganisation.salesOrg,
            customerCode: customerCodeInfo.customerCodeSoldTo,
            shipToCustomerCode: shipToInfo.shipToCustomerCode,
            language: language,
            materialInfo: materialInfo,
            itemId: itemId,
            quantity: materialInfo.quantity.intValue,
            counterOfferDetails: counterOfferDetails,
          );

          return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
        }).toList(),
      );

      return Right(productList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCartItems({
    required PriceAggregate product,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String language,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await cartLocalDataSource.upsertCartItems();

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final productList = await cartRemoteDataSource.upsertCartItems(
        requestParams: product.bundle.materials.map((materialInfo) {
          final upsertCartRequest = CartProductRequest.toBundlesRequest(
            salesOrg: salesOrganisation.salesOrg,
            customerCode: customerCodeInfo.customerCodeSoldTo,
            shipToCustomerCode: shipToInfo.shipToCustomerCode,
            language: language,
            materialInfo: materialInfo,
            bundleCode: product.bundle.bundleCode,
          );

          return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
        }).toList(),
      );

      return Right(productList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Map<MaterialNumber, ProductMetaData>>> getProducts({
    required List<MaterialNumber> materialNumbers,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final products =
            await viewByItemLocalDataSource.getItemProductDetails();

        return Right({
          for (var product in products.productImages)
            product.materialNumber: products,
        });
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final queryMaterialNumbers =
          materialNumbers.map((e) => e.getOrDefaultValue('')).toList();
      final additionInfoData = <MaterialNumber, ProductMetaData>{};
      await Future.wait(
        queryMaterialNumbers.map((e) async {
          final products =
              await orderHistoryRemoteDataSource.getItemProductDetails(
            materialIDs: [e],
          );

          for (final product in products.productImages) {
            additionInfoData.addAll({product.materialNumber: products});
          }
        }),
      );

      return Right(additionInfoData);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> removeSelectedProducts({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String language,
    required List<MaterialInfo> products,
  }) async {
    try {
      final productList = <PriceAggregate>[];

      await Future.wait(
        products.map((product) async {
          final cartProducts = await upsertCart(
            materialInfo: product,
            salesOrganisation: salesOrganisation,
            salesOrganisationConfig: salesOrganisationConfig,
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo,
            language: language,
            itemId: product.sampleBonusItemId,
            quantity: product.quantity.intValue,
            counterOfferDetails: product.counterOfferDetails,
          );

          cartProducts.fold((l) => {}, (r) {
            productList.clear();
            productList.addAll(r);
          });
        }),
      );

      return Right(productList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>>
      upsertCartItemsWithComboOffers({
    required List<PriceAggregate> products,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String language,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList =
            await cartLocalDataSource.upsertCartItemsWithComboOffers();

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final productList = await cartRemoteDataSource.upsertCartItems(
        requestParams: products.comboMaterialItemList
            .map(
              (productUpsertRequest) => ComboProductRequestDto.fromDomain(
                comboProductRequest: productUpsertRequest,
                salesOrg: salesOrganisation.salesOrg.getOrDefaultValue(''),
                customerCode: customerCodeInfo.customerCodeSoldTo,
                shipToId: shipToInfo.shipToCustomerCode,
              ).toMap(),
            )
            .toList(),
      );

      return Right(productList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, AplSimulatorOrder>> aplSimulateOrder({
    required List<MaterialInfo> product,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final aplSimulatorOrder = await cartLocalDataSource.aplSimulateOrder();

        return Right(aplSimulatorOrder);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final materialQuantityPairList = product.map((item) {
        return {
          'material': item.materialNumber.getOrCrash(),
          'quantity': item.quantity.intValue.toString(),
        };
      }).toList();

      final aplSimulatorOrder = await cartRemoteDataSource.aplSimulateOrder(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
        materialQuantityPairList: materialQuantityPairList,
      );

      return Right(aplSimulatorOrder);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, AplSimulatorOrder>>
      fetchGrandTotalPriceForIdMarket({
    required List<MaterialNumber> materialNumbers,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required double totalPrice,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final aplSimulatorOrder = await cartLocalDataSource.aplGetTotalPrice();

        return Right(aplSimulatorOrder);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final materialNumberList =
          materialNumbers.map((item) => item.getOrCrash()).toList();

      final aplSimulatorOrder = await cartRemoteDataSource.aplGetTotalPrice(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        salesOrgCode: salesOrganisation.salesOrg.getOrCrash(),
        materialNumbers: materialNumberList,
        totalPrice: totalPrice,
      );

      return Right(aplSimulatorOrder);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>>
      updateCartWithProductDetermination({
    required List<MaterialInfo> productDeterminationList,
    required List<PriceAggregate> updatedCartItems,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String language,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList =
            await cartLocalDataSource.upsertCartItemsWithReorderMaterials();

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      await cartRemoteDataSource.deleteCart();
      final materialInfo = [
        ...productDeterminationList,
        ...updatedCartItems
            .map(
              (e) => [
                e.materialInfo.copyWith(quantity: MaterialQty(e.quantity)),
                ...e.existingProductDealBonus,
              ],
            )
            .flattened
            .toList(),
      ];

      final productList = await cartRemoteDataSource.upsertCartItems(
        requestParams: materialInfo.map((materialInfo) {
          final upsertCartRequest = CartProductRequest.toMaterialRequest(
            salesOrg: salesOrganisation.salesOrg,
            customerCode: customerCodeInfo.customerCodeSoldTo,
            shipToCustomerCode: shipToInfo.shipToCustomerCode,
            language: language,
            materialInfo: materialInfo,
            itemId: materialInfo.sampleBonusItemId,
            quantity: materialInfo.quantity.intValue,
            counterOfferDetails: materialInfo.counterOfferDetails,
          );

          return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
        }).toList(),
      );

      return Right(productList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
