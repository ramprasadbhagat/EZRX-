import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourites_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FavouriteLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = FavouriteLocalDataSource();
    },
  );
  group(
    'Favourite Local Datasource Test',
    () {
      test(
        '=> getFavouriteList',
        () async {
          final result = await localDataSource.getFavouriteList();

          expect(
            result.length,
            4,
          );
        },
      );

      test(
        '=> addFavourite',
        () async {
          final result = await localDataSource.addFavourite(
            item: Favourite.empty(),
            isPackAndPick: false,
          );

          expect(
            result.id,
            '000000000023168451',
          );
        },
      );

      test(
        '=> deleteFavourite',
        () async {
          final result = await localDataSource.deleteFavourite(
            item: Favourite.empty(),
          );

          expect(
            result.id,
            '2876',
          );
        },
      );
    },
  );
}
