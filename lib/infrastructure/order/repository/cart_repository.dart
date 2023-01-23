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
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_item_dto.dart';

class CartRepository implements ICartRepository {
  final CartStorage cartStorage;
  final Config config;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final CountlyService countlyService;

  CartRepository({
    required this.cartStorage,
    required this.config,
    required this.stockInfoLocalDataSource,
    required this.stockInfoRemoteDataSource,
    required this.countlyService,
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
    try {
      await cartStorage.clear();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> addItemToCart({
    required CartItem cartItem,
    required bool override,
  }) async {
    //TODO: Implement countly event for both adding material and bundle to cart
    //    await countlyService
    //     .addCountlyEvent('Add materials to cart', segmentation: {
    //   'materialNum': cartItem.getMaterialNumber.getOrCrash(),
    //   'listPrice': cartItem.listPrice,
    //   'price': cartItem.price.finalPrice.getOrCrash(),
    //   'numItemInCart': cartStorage.cartBoxSize,
    //   'materialType':
    //       cartItem.materialInfo.materialGroup4.getMaterialGroup4Type,
    // });

    try {
      final inCartItem = cartStorage.get(id: cartItem.id)?.toDomain;
      final savedCartItem = (inCartItem != null && !override)
          ? inCartItem.copyWith(
              materials: inCartItem.materials.map(
                (material) {
                  final qty = cartItem.materials
                          .firstWhereOrNull((item) =>
                              item.getMaterialNumber ==
                              material.getMaterialNumber)
                          ?.quantity ??
                      0;

                  return material.copyWithIncreasedQty(qty: qty);
                },
              ).toList(),
            )
          : cartItem;

      await cartStorage.put(
        id: savedCartItem.id,
        item: CartItemDto.fromDomain(savedCartItem),
      );

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
      await countlyService.addCountlyEvent('Delete from Cart');
      await cartStorage.delete(id: item.id);

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
            final itemWithRemark = inCartItem.copyWith(materials: [
              material.copyWith.materialInfo(
                remarks: remarkMessage,
              ),
            ]);
            await cartStorage.put(
              id: itemWithRemark.id,
              item: CartItemDto.fromDomain(itemWithRemark),
            );
            break;
          case CartItemType.bundle:
            // TODO: Handle this case.
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
  }) async {
    try {
      final inCartItem = cartStorage.get(id: item.id)?.toDomain;
      if (inCartItem != null) {
        switch (inCartItem.itemType) {
          case CartItemType.material:
            final material = inCartItem.materials.first;
            var bonusExisting = false;
            final updatedBonuses = material.addedBonusList.map((bonus) {
              if (bonus.materialNumber == newBonus.materialNumber &&
                  bonus.additionalBonusFlag == newBonus.additionalBonusFlag) {
                bonusExisting = true;
                if (overrideQty) {
                  return newBonus;
                }

                return bonus.copyWith(qty: bonus.qty + newBonus.qty);
              }

              return bonus;
            }).toList();
            if (!bonusExisting) {
              updatedBonuses.add(newBonus);
            }
            final itemWithNewBonus = inCartItem.copyWith(
              materials: [material.copyWith(addedBonusList: updatedBonuses)],
            );
            await cartStorage.put(
              id: itemWithNewBonus.id,
              item: CartItemDto.fromDomain(itemWithNewBonus),
            );
            break;
          case CartItemType.bundle:
            // TODO: Handle this case.
            break;
        }
      }

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
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
            // TODO: Handle this case.
            break;
        }
      }
      await countlyService.addCountlyEvent('Remove bonus');

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> updateMaterialDealBonus({
    required PriceAggregate material,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    try {
      final failureOrSuccess = await getStockInfoList(
        items: material.getMaterialItemBonus
            .map((bonus) => bonus.materialInfo)
            .toList(),
        customerCodeInfo: customerCodeInfo,
        salesOrganisationConfigs: salesOrganisationConfigs,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      );
      final bonusStockInfoMap = failureOrSuccess.getOrElse(() => {});
      final dealBonusWithStockInfo = material.getMaterialItemBonus.map((bonus) {
        final stockInfo = bonusStockInfoMap[bonus.materialNumber];
        if (stockInfo != null) {
          return bonus.copyWith(
            inStock: stockInfo.inStock.getOrCrash(),
          );
        }

        return bonus;
      }).toList();
      final newMaterialBonus = [...material.addedBonusList]
        ..removeWhere(
          (bonus) => !bonus.additionalBonusFlag,
        )
        ..addAll(dealBonusWithStockInfo);

      final newCartItemWithBonus = CartItem.material(
        material.copyWith(
          addedBonusList: newMaterialBonus,
        ),
      );
      await cartStorage.put(
        id: newCartItemWithBonus.id,
        item: CartItemDto.fromDomain(newCartItemWithBonus),
      );

      return fetchCart();
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
            // TODO: Handle this case.
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
            // TODO: Handle this case.
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
  }) {
    final zmgDiscountQty = items.allZmgMaterialsQty;
    final updatedCart = items.map((item) {
      switch (item.itemType) {
        case CartItemType.material:
          final material = item.materials.first;
          var updatedMaterial = material.copyWith(discountedMaterialCount: 0);
          if (material.price.zmgDiscount) {
            updatedMaterial = material.copyWith(
              discountedMaterialCount: zmgDiscountQty,
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
          return item;
      }
    }).toList();

    return updatedCart;
  }

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
              .map((item) => item.copyWithStockInfo(stockInfoMap: stockInfoMap))
              .toList();

          try {
            await cartStorage.putAll(items: {
              for (final item in cartItemWithStockInfo)
                item.id: CartItemDto.fromDomain(item),
            });
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
  Future<Either<ApiFailure, Map<MaterialNumber, StockInfo>>> getStockInfoList({
    required List<MaterialInfo> items,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    try {
      final stockInfoMap = <MaterialNumber, StockInfo>{};
      for (final item in items) {
        final response = await getStockInfo(
          customerCodeInfo: customerCodeInfo,
          material: item,
          salesOrganisation: salesOrganisation,
          salesOrganisationConfigs: salesOrganisationConfigs,
          shipToInfo: shipToInfo,
        );
        final stockInfo = response.fold(
          (failure) => StockInfo.empty().copyWith(
            materialNumber: item.materialNumber,
          ),
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
  Future<Either<ApiFailure, StockInfo>> getStockInfo({
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
        final stockInformation = stockInfoList.firstWhere(
          (element) => element.materialNumber == material.materialNumber,
          orElse: () => StockInfo.empty(),
        );

        return Right(stockInformation);
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
                  plant: shipToInfo.plant,
                  salesOrg: salesOrganisation.salesOrg.getOrCrash(),
                  selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
                ),
              ];
        final stockInformation = stockInfoList.firstWhere(
          (element) => element.materialNumber == material.materialNumber,
          orElse: () => StockInfo.empty(),
        );

        return Right(stockInformation);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> replaceCartWithItems({
    required List<CartItem> items,
  }) async {
    try {
      await clearCart();
      await cartStorage.putAll(
        items: {
          for (final item in items) item.id: CartItemDto.fromDomain(item),
        },
      );

      return fetchCart();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
