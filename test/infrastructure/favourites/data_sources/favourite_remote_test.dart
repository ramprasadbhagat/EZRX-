import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourite_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourite_remote.dart';
import 'package:ezrxmobile/infrastructure/favourites/dtos/favourite_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class FavouriteMock extends Mock implements Favourite {}

void main() {
  late FavouriteRemoteDataSource remoteDataSource;
  late String userId;
  late String itemId;

  late Map<String, Object> getFavouriteListVariables,
      addFavouriteVariables,
      deleteFavouriteVariables;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = FavouriteRemoteDataSource(
        httpService: service,
        favouriteQueryMutation: FavouriteQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: locator.get<Config>(),
      );
      userId = '11461';
      itemId = '2876';
      getFavouriteListVariables = {
        'user': userId,
      };
      addFavouriteVariables = {
        'input': {
          'data': {
            'user': userId,
            'materialNumber': '0000111234',
            'materialDescription': 'Fake material description',
            'isFOC': 'false',
            'type': 'ZPOR',
            'isTenderContract': 'false',
          },
        }
      };
      deleteFavouriteVariables = {
        'input': {
          'id': itemId,
        },
      };
    },
  );

  group(
    'Favourite Remote for SUCCESS',
    () {
      test(
        '=> getFavouriteList',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/favouriteMaterialsResponse.json'),
          );

          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.favouriteQueryMutation.getFavourite(),
              'variables': getFavouriteListVariables,
            }),
          );

          final result = await remoteDataSource.getFavouriteList(
            userId: userId,
          );

          expect(
            result.length,
            List.from(res['data']['favouriteMaterials'])
                .map((e) => FavouriteDto.fromJson(e).toDomain())
                .toList()
                .length,
          );
        },
      );

      test(
        '=> addFavourite',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/createFavouriteMaterialResponse.json'),
          );

          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.favouriteQueryMutation.addFavourite(),
              'variables': addFavouriteVariables,
            }),
          );

          final result = await remoteDataSource.addFavourite(
            materialNumber: '0000111234',
            materialDescription: 'Fake material description',
            isFOC: false,
            isTenderContract: false,
            userId: userId,
            type: 'ZPOR',
          );

          expect(
            result.materialNumber,
            FavouriteDto.fromJson(res['data']['createFavouriteMaterial'])
                .toDomain()
                .materialNumber,
          );
        },
      );

      test(
        '=> deleteFavourite',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/deleteFavouriteMaterialResponse.json'),
          );

          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query':
                  remoteDataSource.favouriteQueryMutation.deleteFavourite(),
              'variables': deleteFavouriteVariables,
            }),
          );

          final result = await remoteDataSource.deleteFavourite(itemId: itemId);

          expect(
            result.id,
            FavouriteDto.fromJson(res['data']['deleteFavouriteMaterial'])
                .toDomain()
                .id,
          );
        },
      );
    },
  );
  group(
    'Favourite Remote for FAILURE',
    () {
      test(
        '=> getFavouriteList Status not 200',
        () async {
          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.favouriteQueryMutation.getFavourite(),
              'variables': getFavouriteListVariables,
            }),
          );

          await remoteDataSource
              .getFavouriteList(userId: userId)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<FavouriteMock>[]);
          });
        },
      );

      test(
        '=> getFavouriteList with error',
        () async {
          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'}
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.favouriteQueryMutation.addFavourite(),
              'variables': getFavouriteListVariables,
            }),
          );

          await remoteDataSource
              .getFavouriteList(userId: userId)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<FavouriteMock>[]);
          });
        },
      );

      test(
        '=> addFavourite Status not 200',
        () async {
          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.favouriteQueryMutation.addFavourite(),
              'variables': addFavouriteVariables,
            }),
          );

          await remoteDataSource
              .addFavourite(
            materialNumber: '0000111234',
            materialDescription: 'Fake material description',
            isFOC: false,
            isTenderContract: false,
            userId: userId,
            type: 'ZPOR',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(FavouriteMock());
          });
        },
      );

      test(
        '=> addFavourite with error',
        () async {
          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'}
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.favouriteQueryMutation.addFavourite(),
              'variables': addFavouriteVariables,
            }),
          );

          await remoteDataSource
              .addFavourite(
            materialNumber: '0000111234',
            materialDescription: 'Fake material description',
            isFOC: false,
            isTenderContract: false,
            userId: userId,
            type: 'ZPOR',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(FavouriteMock());
          });
        },
      );

      test(
        '=> deleteFavourite Status not 200',
        () async {
          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query':
                  remoteDataSource.favouriteQueryMutation.deleteFavourite(),
              'variables': deleteFavouriteVariables,
            }),
          );

          await remoteDataSource
              .deleteFavourite(itemId: itemId)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(FavouriteMock());
          });
        },
      );

      test(
        '=> deleteFavourite with error',
        () async {
          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'}
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query':
                  remoteDataSource.favouriteQueryMutation.deleteFavourite(),
              'variables': deleteFavouriteVariables,
            }),
          );

          await remoteDataSource
              .deleteFavourite(itemId: itemId)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(FavouriteMock());
          });
        },
      );
    },
  );
}
