import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
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
  UserBloc user;

  FavouriteRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.dataSourceExceptionHandler,
    required this.favouriteQueryMutation,
    required this.user,
  });

  Future<List<Favourite>> getFavouriteList() async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}strapiEngine',
          data: jsonEncode(
            {
              'query': favouriteQueryMutation.getFavourite(),
              'variables': {
                'user': user.state.user.id.toString(),
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
    required Favourite item,
    required isPackAndPick,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        String type;
        if (isPackAndPick) {
          type = 'P&P';
        } else if (item.isFOC) {
          type = '6A1';
        } else {
          type = 'Comm';
        }
        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}strapiEngine',
          data: jsonEncode(
            {
              'query': favouriteQueryMutation.addFavourite(),
              'variables': {
                'input': {
                  'data': {
                    'user': user.state.user.id.toString(),
                    'materialNumber': item.materialNumber.getOrCrash(),
                    'materialDescription': item.materialDescription,
                    'isFOC': item.isFOC,
                    'type': type,
                    'isTenderContract': item.isTenderContract,
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

  Future<Favourite> deleteFavourite({required Favourite item}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}strapiEngine',
        data: jsonEncode(
          {
            'query': favouriteQueryMutation.deleteFavourite(),
            'variables': {
              'input': {
                'id': item.id.toString(),
              },
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
    } else if (res.data['errors'] != null && res.data['data'] == null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
