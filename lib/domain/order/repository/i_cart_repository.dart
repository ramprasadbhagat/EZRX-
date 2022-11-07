import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';

abstract class ICartRepository {
  Future<Either<ApiFailure, Unit>> initCartStorage();
  Future<Either<ApiFailure, List<PriceAggregate>>> fetchCartItems();
  Future<Either<ApiFailure, List<PriceAggregate>>> addToCart({
    required PriceAggregate cartItem,
  });
  Future<Either<ApiFailure, List<PriceAggregate>>> deleteFromCart({
    required PriceAggregate cartItem,
  });
  Future<Either<ApiFailure, Unit>> close();
}
