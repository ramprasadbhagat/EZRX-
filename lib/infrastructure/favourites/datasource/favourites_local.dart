import 'dart:convert';

import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/infrastructure/favourites/dtos/favourite_dto.dart';
import 'package:flutter/services.dart';

class FavouriteLocalDataSource {
  FavouriteLocalDataSource();

  Future<List<Favourite>> getFavouriteList() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/favouriteMaterialsResponse.json'),
    );

    return List.from(data['data']['favouriteMaterials'])
        .map((e) => FavouriteDto.fromJson(e).toDomain())
        .toList();
  }

  Future<Favourite> addFavourite({
    required Favourite item,
    required isPackAndPick,
  }) async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/createFavouriteMaterialResponse.json'),
    );

    return FavouriteDto.fromJson(data['data']['createFavouriteMaterial'])
        .toDomain();
  }

  Future<Favourite> deleteFavourite({required Favourite item}) async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/deleteFavouriteMaterialResponse.json'),
    );

    return FavouriteDto.fromJson(data['data']['deleteFavouriteMaterial'])
        .toDomain();
  }
}
