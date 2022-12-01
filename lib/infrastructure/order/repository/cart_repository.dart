import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_aggregate_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';

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
  Future<Either<ApiFailure, Unit>> initCartStorage() async {
    try {
      await cartStorage.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> addToCart({
    required PriceAggregate cartItem,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotallowOutOfStockMaterial,
  }) async {
    try {
      final stockInfo = await getStockInfo(
        material: cartItem.materialInfo,
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        salesOrganisationConfigs: salesOrganisationConfigs,
        shipToInfo: shipToInfo,
      );
      final stockInformation = stockInfo.fold(
        (faliure) {
          throw OtherException(message: faliure.failureMessage);
        },
        (stockInfo) => stockInfo,
      );
      if (!stockInformation.inStock.isMaterialInStock &&
          doNotallowOutOfStockMaterial) {
        throw OtherException(message: 'Product Not Available');
      }
      await cartStorage.add(PriceAggregateDto.fromDomain(cartItem.copyWith(
        stockInfo: stockInformation,
      )));
      await countlyService
          .addCountlyEvent('Add materials to cart', segmentation: {
        'materialNum': cartItem.getMaterialNumber.getOrCrash(),
        'listPrice': cartItem.listPrice,
        'price': cartItem.price.finalPrice.getOrCrash(),
        'numItemInCart': cartStorage.cartBoxSize,
        'materialType':
          cartItem.materialInfo.materialGroup4.getMaterialGroup4Type,
      });

      return fetchCartItems();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> updateCartItem({
    required PriceAggregate cartItem,
  }) async {
    try {
      await cartStorage.updateItem(PriceAggregateDto.fromDomain(cartItem));

      return fetchCartItems();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> updateStockInfo({
    required User user,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    try {
      final cartItemDtoList = await cartStorage.get();
      final cartItemList = cartItemDtoList.map((e) => e.toDomain()).toList();
      for (final element in cartItemList) {
        final updatedStockInfo = await getStockInfo(
          material: element.materialInfo,
          customerCodeInfo: customerCodeInfo,
          salesOrganisationConfigs: salesOrganisationConfigs,
          salesOrganisation: salesOrganisation,
          shipToInfo: shipToInfo,
        );
        final stockInfo = updatedStockInfo.fold(
          (faliure) {
            throw OtherException(message: faliure.failureMessage);
          },
          (stockInfo) => stockInfo,
        );
        await cartStorage.updateStockInfo(StockInfoDto.fromDomain(stockInfo));
      }

      return fetchCartItems();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

//updating when user select price override
  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> updateCart({
    required List<Price> cartItem,
    required String materialNumber,
  }) async {
    try {
      Price item;

      for (var i = 0; i < cartItem.length; i++) {
        if (cartItem[i].materialNumber.getOrCrash() == materialNumber) {
          item = cartItem[i];
          await cartStorage.update(
            cartDto: PriceDto.fromDomain(item),
            materialNumber: materialNumber,
            isMock: config.appFlavor == Flavor.mock,
          );
          // break;
        }
      }

      return fetchCartItems();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> deleteFromCart({
    required PriceAggregate cartItem,
  }) async {
    try {
      await cartStorage.delete(
        cartItem.materialInfo.materialNumber.getOrCrash(),
      );
      await countlyService.addCountlyEvent('Delete from Order Summary');

      return fetchCartItems();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> fetchCartItems() async {
    try {
      final cartItemDtoList = await cartStorage.get();
      final cartItemList = cartItemDtoList.map((e) => e.toDomain()).toList();

      return Right(cartItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> clear() async {
    try {
      await cartStorage.clear();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> addToCartList({
    required List<PriceAggregate> items,
  }) async {
    try {
      final apiSuccessOrFailure = await fetchCartItems();

      return apiSuccessOrFailure.fold(
        (apiFailure) => Left(
          FailureHandler.handleFailure(apiFailure),
        ),
        (storedList) async {
          final storedItemsMap = {
            for (final storedItem in storedList)
              storedItem.materialInfo.materialNumber.displayMatNo: storedItem,
          };

          for (final item in items) {
            final materialNumber =
                item.materialInfo.materialNumber.displayMatNo;
            if (storedItemsMap[materialNumber] != null) {
              final storedItemToUpdate = storedItemsMap[materialNumber];
              final itemToUpdate = storedItemToUpdate!.copyWith(
                quantity: storedItemToUpdate.quantity + item.quantity,
              );
              await cartStorage.updateItem(PriceAggregateDto.fromDomain(
                itemToUpdate,
              ));
            } else {
              await cartStorage.add(PriceAggregateDto.fromDomain(item));
            }
          }

          return fetchCartItems();
        },
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  List<MaterialNumber> updateSelectedItem({
    required PriceAggregate cartItem,
    required List<MaterialNumber> selectedMaterialList,
  }) {
    if (selectedMaterialList.contains(cartItem.materialInfo.materialNumber)) {
      return List.from(selectedMaterialList)
        ..remove(cartItem.materialInfo.materialNumber);
    }

    return List.from(selectedMaterialList)
      ..add(cartItem.materialInfo.materialNumber);
  }

  @override
  List<MaterialNumber> removeFromSelectedMaterialList({
    required PriceAggregate cartItem,
    required List<MaterialNumber> selectedMaterialList,
  }) {
    if (selectedMaterialList.contains(cartItem.materialInfo.materialNumber)) {
      return List.from(selectedMaterialList)
        ..remove(cartItem.materialInfo.materialNumber);
    }

    return selectedMaterialList;
  }

  @override
  List<MaterialNumber> updateSelectAll({
    required List<PriceAggregate> cartItemList,
  }) {
    final newMaterialNumberList = <MaterialNumber>[];
    for (final element in cartItemList) {
      newMaterialNumberList.add(element.materialInfo.materialNumber);
    }

    return newMaterialNumberList;
  }

  @override
  List<MaterialNumber> getUpdatedMaterialList({
    required List<PriceAggregate> cartItemList,
    required List<MaterialNumber> selectedItemsMaterialNumber,
    required List<PriceAggregate> items,
  }) {
    final selectedItems =
        List<MaterialNumber>.from(selectedItemsMaterialNumber);
    for (final item in items) {
      final materialNumberIsEmpty =
          item.materialInfo.materialNumber.getOrDefaultValue('').isEmpty;

      final itemExist = cartItemList.any((e) =>
          e.materialInfo.materialNumber == item.materialInfo.materialNumber);

      if (itemExist || materialNumberIsEmpty) {
        continue;
      } else {
        selectedItems.add(item.materialInfo.materialNumber);
      }
    }

    return selectedItems;
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> updateBonusItem({
    required PriceAggregate cartItem,
    required int quantity,
    required MaterialInfo bonusItem,
    required bool isUpdatedFromCart,
  }) async {
    try {
      await cartStorage.updateBonus(
        cartDto: PriceAggregateDto.fromDomain(cartItem),
        bonusItem: bonusItem,
        isUpdateFromCart: isUpdatedFromCart,
        quantity: quantity,
      );

      return fetchCartItems();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PriceAggregate>>> deleteBonusItem({
    required PriceAggregate cartItem,
    required MaterialInfo bonusItem,
    required bool isUpdateFromCart,
  }) async {
    try {
      await cartStorage.deleteBonus(
        cartDto: PriceAggregateDto.fromDomain(cartItem),
        bonusItem: bonusItem,
        isUpdateFromCart: isUpdateFromCart,
      );
      await countlyService.addCountlyEvent('Remove bonus');

      return fetchCartItems();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

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
        final stockInformation = stockInfoList
            .where(
              (element) => element.materialNumber == material.materialNumber,
            )
            .toList()
            .first;

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
                principalCode: material.principalData.principalCode,
                salesOrg: salesOrganisation.salesOrg.getOrCrash(),
                selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
              )
            : [
                await stockInfoRemoteDataSource.getStockInfo(
                  materialNumber: material.materialNumber.getOrCrash(),
                  plant: shipToInfo.plant,
                  principalCode: material.principalData.principalCode,
                  salesOrg: salesOrganisation.salesOrg.getOrCrash(),
                  selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
                ),
              ];
        final stockInformation = stockInfoList
            .where(
              (element) => element.materialNumber == material.materialNumber,
            )
            .toList()
            .first;

        return Right(stockInformation);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }
}
