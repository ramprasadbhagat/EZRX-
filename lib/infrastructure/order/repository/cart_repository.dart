import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_item_dto.dart';

class CartRepository implements ICartRepository {
  final CartStorage cartStorage;

  CartRepository({
    required this.cartStorage,
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
  Future<Either<ApiFailure, List<CartItem>>> addToCart({
    required CartItem cartItem,
  }) async {
    try {
      await cartStorage.add(CartItemDto.fromDomain(cartItem));

      return fetchCartItems();
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<CartItem>>> deleteFromCart({
    required CartItem cartItem,
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
  Future<Either<ApiFailure, List<CartItem>>> fetchCartItems() async {
    try {
      final cartItemDtoList = await cartStorage.get();
      final cartItemList = cartItemDtoList.map((e) => e.toDomain()).toList();

      return Right(cartItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> close() async {
    try {
      await cartStorage.close();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
