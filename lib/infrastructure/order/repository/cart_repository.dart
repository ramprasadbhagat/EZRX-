import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/cart_product_request.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
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

import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';

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
          items: materialTemp[i]
              .getMaterialItemBonus
              .map((bonus) => bonus.materialInfo)
              .toList(),
          customerCodeInfo: customerCodeInfo,
          salesOrganisationConfigs: salesOrganisationConfigs,
          salesOrganisation: salesOrganisation,
          shipToInfo: shipToInfo,
        );
        final bonusStockInfoMap = failureOrSuccess.getOrElse(() => {});
        final dealBonusWithStockInfo =
            materialTemp[i].getMaterialItemBonus.map((bonus) {
          final stockInfoList = bonusStockInfoMap[bonus.materialNumber] ?? [];
          if (stockInfoList.isNotEmpty) {
            final stockInfo = stockInfoList.firstWhere(
              (element) =>
                  element.materialNumber == bonus.materialInfo.materialNumber,
              orElse: () => StockInfo.empty(),
            );

            return bonus.copyWith(
              inStock: stockInfo.inStock.getOrCrash(),
            );
          }

          return bonus;
        }).toList();
        final newMaterialBonus = [...materialTemp[i].addedBonusList]
          ..removeWhere(
            (bonus) => !bonus.additionalBonusFlag,
          )
          ..addAll(dealBonusWithStockInfo);
        materialTemp[i] =
            materialTemp[i].copyWith(addedBonusList: newMaterialBonus);
      }

      return Right(materialTemp);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  List<CartItem> updateDiscountQty({
    required List<CartItem> items,
  }) =>
      items.map((item) {
        switch (item.itemType) {
          case CartItemType.material:
            final material = item.materials.first;
            var updatedMaterial = material.copyWith(discountedMaterialCount: 0);
            if (material.price.zmgDiscount) {
              updatedMaterial = material.copyWith(
                discountedMaterialCount: items.zmgMaterialsQty(
                  material.materialInfo.materialGroup2,
                ),
              );
            } else if (material.price.isTireDiscountEligible) {
              updatedMaterial = material.copyWith(
                discountedMaterialCount: material.quantity,
              );
            }
            return item.copyWith(
              materials: [updatedMaterial],
            );

          case CartItemType.bundle:
          case CartItemType.comboDeal:
            return item;
        }
      }).toList();

  @override
  Future<Either<ApiFailure, List<CartItem>>> saveToCartWithUpdatedStockInfo({
    required List<CartItem> cartItem,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    try {
      final stockInfoList = await getStockInfoList(
        items: cartItem.allMaterials.map((e) => e.materialInfo).toList(),
        customerCodeInfo: customerCodeInfo,
        salesOrganisationConfigs: salesOrganisationConfigs,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      );

      return stockInfoList.fold(
        (failure) => Left(failure),
        (stockInfoMap) async {
          final cartItemWithStockInfo = cartItem
              .map(
                (item) => item.copyWithStockInfo(
                  stockInfoMap: stockInfoMap,
                  salesOrganisationConfigs: salesOrganisationConfigs,
                ),
              )
              .toList();

          return Right(cartItemWithStockInfo);
        },
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

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

  Future<Either<ApiFailure, Price>> getMaterialPriceWithZdp5Discount({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required CartItem item,
  }) async {
    try {
      final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
      final customerCode = customerCodeInfo.customerCodeSoldTo;
      final shipToCode = shipToInfo.shipToCustomerCode;
      final price = item.materials.first.price;
      final exceedQuantity = item.materials.first.hasZdp5Validation;

      final priceData =
          await discountOverrideRemoteDataSource.getMaterialOverridePriceList(
        salesOrgCode: salesOrgCode,
        customerCode: customerCode,
        shipToCode: shipToCode,
        materialQuery: PriceDto.fromDomain(price)
            .materialQueryWithExceedQty(exceedQuantity),
      );

      return Right(priceData.first);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

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
    if (config.appFlavor == Flavor.mock) {
      try {
        final productList = await cartLocalDataSource.upsertCart();

        return Right(productList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final upsertCartRequest = CartProductRequest(
        salesOrg: salesOrganisation.salesOrg,
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToId: shipToInfo.shipToCustomerCode,
        productNumber: materialInfo.materialNumber.getOrDefaultValue(''),
        quantity: quantity,
        language: language,
        parentID: materialInfo.parentID,
        counterOfferPrice:
            counterOfferDetails.counterOfferPrice.counterOfferValue,
        counterOfferCurrency: counterOfferDetails.counterOfferCurrency.code,
        comment: counterOfferDetails.comment.getOrDefaultValue(''),
        type: materialInfo.type.getValue(),
        itemId: itemId,
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
  Future<Either<ApiFailure, List<PriceAggregate>>> addHistoryItemsToCart({
    required List<MaterialInfo> materialInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String language,
    required List<int> quantity,
    required String itemId,
    required RequestCounterOfferDetails counterOfferDetails,
  }) async {
    try {
      final productList = <PriceAggregate>[];

      for (var i = 0; i < materialInfo.length; i++) {
        final cartDetail = await upsertCart(
          counterOfferDetails: counterOfferDetails,
          quantity: quantity[i],
          language: language,
          shipToInfo: shipToInfo,
          customerCodeInfo: customerCodeInfo,
          salesOrganisationConfig: salesOrganisationConfig,
          salesOrganisation: salesOrganisation,
          materialInfo: materialInfo[i],
          itemId: itemId,
        );

        cartDetail.fold((l) => {}, (r) {
          productList.clear();
          productList.addAll(r);
        });
      }

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
      final salesOrgCode = salesOrganisation.salesOrg.getOrCrash();
      final customerCode = customerCodeInfo.customerCodeSoldTo;
      final shipToCode = shipToInfo.shipToCustomerCode;

      final productList = await cartRemoteDataSource.upsertCartItems(
        product: product,
        customerCode: customerCode,
        salesOrg: salesOrgCode,
        shipToCode: shipToCode,
        language: language,
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
          materialNumbers.map((e) => e.getOrCrash()).toList();
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
}
