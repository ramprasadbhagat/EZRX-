import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';

abstract class ICartRepository {
  Future<Either<ApiFailure, Unit>> initCartStorage();
  Future<Either<ApiFailure, List<CartItem>>> fetchCartItems();
  Future<Either<ApiFailure, List<CartItem>>> addToCart({
    required CartItem cartItem,
  });
  Future<Either<ApiFailure, List<CartItem>>> deleteFromCart({
    required CartItem cartItem,
  });
  Future<Either<ApiFailure, Unit>> close();
}
