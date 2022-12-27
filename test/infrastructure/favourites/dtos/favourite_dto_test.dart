import 'dart:convert';

import 'package:ezrxmobile/infrastructure/favourites/dtos/favourite_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group(
    'Test Favourite DTO',
    () {
      setUp(
        () async {
          data = json.decode(await rootBundle
              .loadString('assets/json/favouriteMaterialsResponse.json'));
        },
      );
      test(
        '=> data mapping',
        () {
          final favList = List.from(data['data']['favouriteMaterials'])
              .map((e) => FavouriteDto.fromJson(e).toDomain())
              .toList();
          expect(favList.length, 4);
          expect(favList.first.id, '2876');

          final favDtoList =
              favList.map((e) => FavouriteDto.fromDomain(e)).toList();
          expect(favDtoList.length, 4);
          expect(favDtoList.first.id, '2876');

          final favDtoListMap = favDtoList.map((e) => e.toJson()).toList();
          expect(favDtoListMap.length, 4);
          expect(favDtoListMap.first['id'], '2876');
        },
      );
    },
  );
}
