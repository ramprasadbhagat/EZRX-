import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/favourite_status.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/add_favourite_dto.dart';
import 'package:ezrxmobile/domain/order/entities/add_favourite.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/favourite_status_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/remove_favourite_dto.dart';
import 'package:ezrxmobile/domain/order/entities/remove_favourite.dart';

class FavouriteRemoteDataSource {
  HttpService httpService;
  FavouriteMutation favouriteMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  FavouriteRemoteDataSource({
    required this.httpService,
    required this.favouriteMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<AddFavourite> addFavouriteMaterial({
    required String materialNumber,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final queryData = favouriteMutation.addFavouriteMutation();

        final variables = {'materialNumber': materialNumber};

        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}license',
          data: jsonEncode(
            {
              'query': queryData,
              'variables': variables,
            },
          ),
          apiEndpoint: 'addFavouriteMaterial',
        );
        _exceptionChecker(res: res);
        final finalData = res.data['data'];

        return AddFavouriteDto.fromJson(finalData).toDomain();
      },
    );
  }

  Future<RemoveFavourite> removeFavouriteMaterial({
    required String materialNumber,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final queryData = favouriteMutation.removeFavouriteMutation();

        final variables = {'materialNumber': materialNumber};

        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}license',
          data: jsonEncode(
            {
              'query': queryData,
              'variables': variables,
            },
          ),
          apiEndpoint: 'removeFavouriteMaterial',
        );
        _exceptionChecker(res: res);
        final finalData = res.data['data'];

        return RemoveFavouriteDto.fromJson(finalData).toDomain();
      },
    );
  }

  Future<FavouriteStatus> getFavouriteStatus({
    required String materialNumber,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = favouriteMutation.favouriteStatusQuery();

      final variables = {
        'language': language,
        'materialNumber': materialNumber,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'materialDetails',
      );
      _exceptionChecker(res: res);
      final finalData = res.data['data']['materialDetails'];

      return FavouriteStatusDto.fromJson(finalData).toDomain();
    });
  }

  void _exceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
