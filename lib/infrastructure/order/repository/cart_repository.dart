import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_aggregate_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';

class CartRepository implements ICartRepository {
  final CartStorage cartStorage;
  final Config config;

  CartRepository({
    required this.cartStorage,
    required this.config,
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
  }) async {
    try {
      await cartStorage.add(PriceAggregateDto.fromDomain(cartItem));

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
    required PriceAggregate item,
  }) {
    final materialNumberIsEmpty =
        item.materialInfo.materialNumber.getOrDefaultValue('').isEmpty;

    final itemExist = cartItemList.any((e) =>
        e.materialInfo.materialNumber == item.materialInfo.materialNumber);

    if (itemExist || materialNumberIsEmpty) {
      return selectedItemsMaterialNumber;
    }
    
    return List.from(selectedItemsMaterialNumber)
      ..add(item.materialInfo.materialNumber);
  }
}
