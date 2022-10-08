import 'dart:async';
import 'package:ezrxmobile/config.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/favourites/repository/i_favourite_repository.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourite_remote.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourites_local.dart';

class FavouriteRepository implements IFavouriteRepository {
  final Config config;
  final FavouriteLocalDataSource localDataSource;
  final FavouriteRemoteDataSource remoteDataSource;

  FavouriteRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<Favourite>>> getFavourites({
    required User user,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final favourite = await localDataSource.getFavouriteList();

        return Right(favourite);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final favourite =
          await remoteDataSource.getFavouriteList(userId: user.id);

      return Right(favourite);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<Favourite>>> addFavourites({
    required Favourite item,
    required List<Favourite> favouriteItems,
    required bool isPackAndPick,
    required User user,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        // final addedFavourite = await localDataSource.addFavourite(
        //   item: item,
        //   isPackAndPick: true,
        // );
        final newfavouriteItems = List<Favourite>.from(favouriteItems)
          ..insert(0, item);

        return Right(newfavouriteItems);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      String type;
      if (isPackAndPick) {
        type = 'P&P';
      } else if (item.isFOC) {
        type = '6A1';
      } else {
        type = 'Comm';
      }
      final addedFavourite = await remoteDataSource.addFavourite(
        type: type,
        isFOC: item.isFOC,
        isTenderContract: item.isTenderContract,
        materialDescription: item.materialDescription,
        materialNumber: item.materialNumber.getOrCrash(),
        userId: user.id,
      );
      final newfavouriteItems = List<Favourite>.from(favouriteItems)
        ..insert(0, item.copyWith(id: addedFavourite.id));

      return Right(newfavouriteItems);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<Favourite>>> deleteFavourites({
    required Favourite item,
    required List<Favourite> favouriteItems,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        // final deletedFavourite = await localDataSource.deleteFavourite(
        //   item: item,
        // );
        final newfavouriteItems = List<Favourite>.from(favouriteItems)
          ..removeWhere((element) => element.id == item.id);

        return Right(newfavouriteItems);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final deletedFavourite =
          await remoteDataSource.deleteFavourite(itemId: item.id);
      final newfavouriteItems = List<Favourite>.from(favouriteItems)
        ..removeWhere((element) => element.id == deletedFavourite.id);

      return Right(newfavouriteItems);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
