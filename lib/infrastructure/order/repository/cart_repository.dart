import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
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
}
