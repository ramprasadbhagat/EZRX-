import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';

abstract class IFavouriteRepository {
  Future<Either<ApiFailure, List<Favourite>>> getFavourites({
    required User user,
  });
  Future<Either<ApiFailure, List<Favourite>>> addFavourites({
    required Favourite item,
    required List<Favourite> favouriteItems,
    required bool isPackAndPick,
    required User user,
  });
  Future<Either<ApiFailure, List<Favourite>>> deleteFavourites({
    required Favourite item,
    required List<Favourite> favouriteItems,
  });
}
