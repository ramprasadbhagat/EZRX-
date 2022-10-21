import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourite_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/favourites/dtos/favourite_dto.dart';

class FavouriteRemoteDataSource {
  HttpService httpService;
  FavouriteQueryMutation favouriteQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  FavouriteRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.dataSourceExceptionHandler,
    required this.favouriteQueryMutation,
  });

  Future<List<Favourite>> getFavouriteList({required String userId}) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}strapiEngine',
          data: jsonEncode(
            {
              'query': favouriteQueryMutation.getFavourite(),
              'variables': {
                'user': userId,
              },
            },
          ),
        );

        _favouriteExceptionChecker(res: res);

        return List.from(res.data['data']['favouriteMaterials'])
            .map((e) => FavouriteDto.fromJson(e).toDomain())
            .toList();
      },
    );
  }

  Future<Favourite> addFavourite({
    required String materialNumber,
    required String materialDescription,
    required bool isFOC,
    required bool isTenderContract,
    required String userId,
    required String type,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}strapiEngine',
          data: jsonEncode(
            {
              'query': favouriteQueryMutation.addFavourite(),
              'variables': {
                'input': {
                  'data': {
                    'user': userId,
                    'materialNumber': materialNumber,
                    'materialDescription': materialDescription,
                    'isFOC': isFOC,
                    'type': type,
                    'isTenderContract': isTenderContract,
                  },
                },
              },
            },
          ),
        );

        _favouriteExceptionChecker(res: res);

        return FavouriteDto.fromJson(
          res.data['data']['createFavouriteMaterial'],
        ).toDomain();
      },
    );
  }

  Future<Favourite> deleteFavourite({required String itemId}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}strapiEngine',
        data: jsonEncode(
          {
            'query': favouriteQueryMutation.deleteFavourite(),
            'variables': {
              'input': {'id': itemId},
            },
          },
        ),
      );

      _favouriteExceptionChecker(res: res);

      return FavouriteDto.fromJson(
        res.data['data']['deleteFavouriteMaterial'],
      ).toDomain();
    });
  }

  void _favouriteExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
