import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/cart_product_request.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_item_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_request_dto.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';

class CartRepository implements ICartRepository {
  final CartStorage cartStorage;
  final Config config;
  final CartLocalDataSource cartLocalDataSource;
  final CartRemoteDataSource cartRemoteDataSource;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final DiscountOverrideRemoteDataSource discountOverrideRemoteDataSource;
  final OrderHistoryLocalDataSource orderHistoryLocalDataSource;
  final OrderHistoryRemoteDataSource orderHistoryRemoteDataSource;

  final MixpanelService mixpanelService;

  CartRepository({
    required this.cartStorage,
    required this.config,
    required this.stockInfoLocalDataSource,
    required this.stockInfoRemoteDataSource,
    required this.discountOverrideRemoteDataSource,
    required this.mixpanelService,
    required this.cartLocalDataSource,
    required this.cartRemoteDataSource,
    required this.orderHistoryRemoteDataSource,
    required this.orderHistoryLocalDataSource,
  });

  @override
  Either<ApiFailure, List<CartItem>> fetchCart() {
    try {
      final items = cartStorage.getAll();
      final cart = items.map((e) => e.toDomain).toList();

      return Right(cart);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

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

  @override
  Future<Either<ApiFailure, List<CartItem>>> addItemToCart({
    required CartItem cartItem,
    required bool override,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
  }) async {
    try {
      final stockInfo = await getStockInfoList(
        items: cartItem.materials.map((e) => e.materialInfo).toList(),
        customerCodeInfo: customerCodeInfo,
        salesOrganisationConfigs: salesOrganisationConfigs,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      );
      final cartItemWithStock = cartItem.copyWithStockInfo(
        stockInfoMap: stockInfo.getOrElse(() => {}),
        salesOrganisationConfigs: salesOrganisationConfigs,
      );
      final isOutOfStockItem = cartItemWithStock
          .copyWithInStockOnly(allowOutOfStock: !doNotAllowOutOfStockMaterials)
          .materials
          .isEmpty;
      if (isOutOfStockItem) {
        mixpanelService.trackEvent(
          eventName: MixpanelEvents.addToCartFailed,
          properties: {
            MixpanelProps.errorMessage:
                const ApiFailure.productOutOfStock().failureMessage,
          },
        );

        return const Left(ApiFailure.productOutOfStock());
      }
      final savedCartItem = getSavedCartItem(
        cartItemWithStock: cartItemWithStock,
        override: override,
      );

      final updatedCartItem = await _verifyZdp5Discount(
        cartItem: savedCartItem,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      );
      await cartStorage.put(
        id: updatedCartItem.id,
        item: CartItemDto.fromDomain(updatedCartItem),
      );
      final failureOrSuccess = fetchCart();
      _trackAddToCartSuccessEvent(cartItem);

      return failureOrSuccess;
    } catch (e) {
      mixpanelService.trackEvent(
        eventName: MixpanelEvents.addToCartFailed,
        properties: {
          MixpanelProps.errorMessage:
              FailureHandler.handleFailure(e).failureMessage,
        },
      );

      return Left(FailureHandler.handleFailure(e));
    }
  }

  CartItem getSavedCartItem({
    required CartItem cartItemWithStock,
    required bool override,
  }) {
    final inCartItem = cartStorage.get(id: cartItemWithStock.id)?.toDomain;

    return (inCartItem != null && !override)
        ? inCartItem.copyWith(
            materials: inCartItem.materials.map(
              (material) {
                final qty = cartItemWithStock.materials
                        .firstWhereOrNull(
                          (item) =>
                              item.getMaterialNumber ==
                              material.getMaterialNumber,
                        )
                        ?.quantity ??
                    0;

                return material.copyWithIncreasedQty(qty: qty);
              },
            ).toList(),
          )
        : cartItemWithStock;
  }

  Future<CartItem> _verifyZdp5Discount({
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
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> discountOverride({
    required CartItem cartItem,
  }) async {
    try {
      final inCartItem = cartStorage.get(id: cartItem.id)?.toDomain;
      if (inCartItem != null) {
        final updatedCartItem = inCartItem.copyWith(
          materials: inCartItem.materials.map((item) {
            if (item.getMaterialNumber ==
                cartItem.materials.first.getMaterialNumber) {
              return cartItem.materials.first;
            }

            return item;
          }).toList(),
        );

        await cartStorage.put(
          id: updatedCartItem.id,
          item: CartItemDto.fromDomain(updatedCartItem),
        );
      }

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> updateMaterialQtyInCartItem({
    required CartItem cartItem,
    required PriceAggregate updatedQtyItem,
    required bool override,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
  }) async {
    try {
      final result = await getStockInfo(
        material: updatedQtyItem.materialInfo,
        customerCodeInfo: customerCodeInfo,
        salesOrganisationConfigs: salesOrganisationConfigs,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      );
      final stockInfo = result.fold(
        (failure) => StockInfo.empty(),
        (stockInfoList) => _getStockInfo(
          stockInfoList: stockInfoList,
          materialNumber: updatedQtyItem.materialInfo.materialNumber,
        ),
      );
      if (!stockInfo.inStock.isMaterialInStock &&
          doNotAllowOutOfStockMaterials) {
        return const Left(
          ApiFailure.productOutOfStock(),
        );
      }

      final inCartItem = cartStorage.get(id: cartItem.id)?.toDomain;
      if (inCartItem != null) {
        final updatedCartItem = inCartItem.copyWith(
          materials: inCartItem.materials.map((item) {
            if (item.getMaterialNumber == updatedQtyItem.getMaterialNumber) {
              return override
                  ? item.copyWith(
                      quantity: updatedQtyItem.quantity,
                    )
                  : item.copyWithIncreasedQty(
                      qty: updatedQtyItem.quantity,
                    );
            }

            return item;
          }).toList(),
        );

        await cartStorage.put(
          id: updatedCartItem.id,
          item: CartItemDto.fromDomain(updatedCartItem),
        );
      }

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> deleteFromCart({
    required CartItem item,
  }) async {
    try {
      //TODO: Implement deleteCart
      await cartStorage.delete(id: item.id);
      mixpanelService.trackEvent(
        eventName: MixpanelEvents.clearCart,
      );

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> addRemarkToCartItem({
    required CartItem item,
    required String remarkMessage,
  }) async {
    try {
      final inCartItem = cartStorage.get(id: item.id)?.toDomain;
      if (inCartItem != null) {
        switch (inCartItem.itemType) {
          case CartItemType.material:
            final material = inCartItem.materials.first;
            final itemWithRemark = inCartItem.copyWith(
              materials: [
                material.copyWith.materialInfo(
                  remarks: remarkMessage,
                ),
              ],
            );
            await cartStorage.put(
              id: itemWithRemark.id,
              item: CartItemDto.fromDomain(itemWithRemark),
            );
            break;
          case CartItemType.bundle:
          case CartItemType.comboDeal:
            break;
        }
      }

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> addBonusToCartItem({
    required CartItem item,
    required MaterialItemBonus newBonus,
    required bool overrideQty,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
  }) async {
    try {
      final result = await getStockInfo(
        material: newBonus.materialInfo,
        customerCodeInfo: customerCodeInfo,
        salesOrganisationConfigs: salesOrganisationConfigs,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      );
      final stockInfo = result.fold(
        (failure) => StockInfo.empty(),
        (stockInfoList) => _getStockInfo(
          stockInfoList: stockInfoList,
          materialNumber: newBonus.materialInfo.materialNumber,
        ),
      );
      if (!stockInfo.inStock.isMaterialInStock &&
          doNotAllowOutOfStockMaterials) {
        return const Left(ApiFailure.productOutOfStock());
      }

      final newBonusWithStock = newBonus.copyWith(
        inStock: stockInfo.inStock.getOrDefaultValue(''),
        expiryDate: stockInfo.expiryDate,
      );

      final inCartItem = cartStorage.get(id: item.id)?.toDomain;
      if (inCartItem != null) {
        switch (inCartItem.itemType) {
          case CartItemType.material:
            await cartItemTypeMaterial(
              cartItem: inCartItem,
              newBonusWithStock: newBonusWithStock,
              overrideQty: overrideQty,
            );
            break;
          case CartItemType.bundle:
          case CartItemType.comboDeal:
            break;
        }
      }

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  Future<void> cartItemTypeMaterial({
    required CartItem cartItem,
    required MaterialItemBonus newBonusWithStock,
    required bool overrideQty,
  }) async {
    final material = cartItem.materials.first;
    var bonusExisting = false;
    final updatedBonuses = material.addedBonusList.map((bonus) {
      if (bonus.materialNumber == newBonusWithStock.materialNumber &&
          bonus.additionalBonusFlag == newBonusWithStock.additionalBonusFlag) {
        bonusExisting = true;

        return bonus.copyWith(
          qty: overrideQty
              ? newBonusWithStock.qty
              : bonus.qty + newBonusWithStock.qty,
          expiryDate: bonus.expiryDate,
        );
      }

      return bonus;
    }).toList();
    if (!bonusExisting) {
      updatedBonuses.add(newBonusWithStock);
    }
    final itemWithNewBonus = cartItem.copyWith(
      materials: [material.copyWith(addedBonusList: updatedBonuses)],
    );
    await cartStorage.put(
      id: itemWithNewBonus.id,
      item: CartItemDto.fromDomain(itemWithNewBonus),
    );
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> deleteBonusFromCartItem({
    required CartItem item,
    required MaterialItemBonus deletedBonus,
  }) async {
    try {
      final inCartItem = cartStorage.get(id: item.id)?.toDomain;
      if (inCartItem != null) {
        switch (inCartItem.itemType) {
          case CartItemType.material:
            final material = inCartItem.materials.first;
            final updatedBonuses =
                List<MaterialItemBonus>.from(material.addedBonusList)
                  ..removeWhere(
                    (bonus) =>
                        bonus.materialNumber == deletedBonus.materialNumber &&
                        bonus.additionalBonusFlag ==
                            deletedBonus.additionalBonusFlag,
                  );
            final itemWithNewBonus = inCartItem.copyWith(
              materials: [material.copyWith(addedBonusList: updatedBonuses)],
            );
            await cartStorage.put(
              id: itemWithNewBonus.id,
              item: CartItemDto.fromDomain(itemWithNewBonus),
            );
            break;
          case CartItemType.bundle:
          case CartItemType.comboDeal:
            break;
        }
      }

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

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
  Future<Either<ApiFailure, List<CartItem>>> addRemarkToBonusItem({
    required CartItem item,
    required MaterialItemBonus bonus,
    required String remarkMessage,
  }) async {
    try {
      final inCartItem = cartStorage.get(id: item.id)?.toDomain;
      if (inCartItem != null) {
        switch (inCartItem.itemType) {
          case CartItemType.material:
            final material = inCartItem.materials.first;
            final updatedBonuses = material.addedBonusList.map((item) {
              if (item.materialNumber == bonus.materialNumber &&
                  item.additionalBonusFlag == bonus.additionalBonusFlag) {
                return item.copyWith(comment: remarkMessage);
              }

              return item;
            }).toList();
            final itemWithNewBonus = inCartItem.copyWith(
              materials: [material.copyWith(addedBonusList: updatedBonuses)],
            );
            await cartStorage.put(
              id: itemWithNewBonus.id,
              item: CartItemDto.fromDomain(itemWithNewBonus),
            );
            break;
          case CartItemType.bundle:
          case CartItemType.comboDeal:
            break;
        }
      }

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> overrideCartItemPrice({
    required CartItem item,
    required List<Price> overridePriceList,
  }) async {
    try {
      final inCartItem = cartStorage.get(id: item.id)?.toDomain;
      if (inCartItem != null) {
        switch (inCartItem.itemType) {
          case CartItemType.material:
            final updatedMaterials = inCartItem.materials.map((material) {
              final overridePrice = overridePriceList.firstWhereOrNull(
                (price) => price.materialNumber == material.getMaterialNumber,
              );

              return overridePrice == null
                  ? material
                  : material.copyWith(
                      price: overridePrice.copyWith(isPriceOverride: true),
                    );
            }).toList();

            await cartStorage.put(
              id: inCartItem.id,
              item: CartItemDto.fromDomain(
                inCartItem.copyWith(
                  materials: updatedMaterials,
                ),
              ),
            );
            break;
          case CartItemType.bundle:
          case CartItemType.comboDeal:
            break;
        }
      }

      return fetchCart();
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
  Future<Either<ApiFailure, List<CartItem>>> updateSelectionInCart({
    required CartItem updatedItem,
  }) async {
    try {
      await cartStorage.put(
        id: updatedItem.id,
        item: CartItemDto.fromDomain(updatedItem.copyWithSelectSwitched),
      );

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> updateAllSelectionInCart({
    required List<CartItem> currentCart,
  }) async {
    try {
      final newCart = <CartItem>[];
      if (currentCart.every((item) => item.isSelected)) {
        newCart.addAll(
          currentCart.map(
            (item) => item.copyWith(isSelected: false),
          ),
        );
      } else {
        newCart.addAll(
          currentCart.map(
            (item) => item.copyWith(isSelected: true),
          ),
        );
      }

      await cartStorage.putAll(
        items: {
          for (final item in newCart) item.id: CartItemDto.fromDomain(item),
        },
      );

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

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

          try {
            await cartStorage.putAll(
              items: {
                for (final item in cartItemWithStockInfo)
                  item.id: CartItemDto.fromDomain(item),
              },
            );
          } catch (e) {
            return Left(FailureHandler.handleFailure(e));
          }

          return fetchCart();
        },
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> replaceCartWithItems({
    required List<CartItem> items,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
  }) async {
    try {
      final stockInfoMap = await getStockInfoList(
        items: items.allMaterials.map((e) => e.materialInfo).toList(),
        customerCodeInfo: customerCodeInfo,
        salesOrganisationConfigs: salesOrganisationConfigs,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      );

      final itemsWithStockInfo = items
          .map(
            (item) => item.copyWithStockInfo(
              stockInfoMap: stockInfoMap.getOrElse(
                () => {},
              ),
              salesOrganisationConfigs: salesOrganisationConfigs,
            ),
          )
          .toList();

      if (itemsWithStockInfo.allOutOfStock(
        allowOutOfStock: !doNotAllowOutOfStockMaterials,
      )) {
        return const Left(
          ApiFailure.productOutOfStock(),
        );
      }

      await clearCart();
      await cartStorage.putAll(
        items: {
          for (final item in itemsWithStockInfo)
            item.id: CartItemDto.fromDomain(item),
        },
      );

      return fetchCart();
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

  void _trackAddToCartSuccessEvent(CartItem cartItem) {
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
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> clearCartOnlySelectedItems({
    required List<String> selectedItemIds,
  }) async {
    try {
      await cartStorage.deleteSelectedItems(selectedItemIds: selectedItemIds);

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  StockInfo _getStockInfo({
    required List<StockInfo> stockInfoList,
    required MaterialNumber materialNumber,
  }) =>
      stockInfoList.firstWhere(
        (element) => element.materialNumber == materialNumber,
        orElse: () => StockInfo.empty(),
      );

  @override
  Future<Either<ApiFailure, List<CartItem>>> updatedBatchInCartItem({
    required CartItem item,
    required StockInfo stockInfo,
  }) async {
    try {
      await cartStorage.put(
        id: item.id,
        item: CartItemDto.fromDomain(
          item.copyWithBatch(stockInfo: stockInfo),
        ),
      );

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

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
        parentID: '',
        counterOfferPrice:
            counterOfferDetails.counterOfferPrice.counterOfferValue,
        counterOfferCurrency: counterOfferDetails.counterOfferCurrency.code,
        comment: counterOfferDetails.comment.getOrDefaultValue(''),
        type: materialInfo.type.getValue(),
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
            await orderHistoryLocalDataSource.getItemProductDetails();

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
