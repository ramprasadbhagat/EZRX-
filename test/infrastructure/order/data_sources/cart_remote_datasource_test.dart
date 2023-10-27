import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://my.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);
  final remoteDataSource = CartRemoteDataSource(
    httpService: service,
    config: Config(),
    dataSourceExceptionHandler: DataSourceExceptionHandler(),
    cartQueryMutation: CartQueryMutation(),
  );

  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  group(
    'Cart Remote data source getAddedToCartProductList',
    () {
      late Map<String, dynamic> getAddedToCartProductListJson;

      setUpAll(() async {
        getAddedToCartProductListJson = json.decode(
          await rootBundle
              .loadString('assets/json/getAddedToCartProductList.json'),
        );
      });

      test(
        'Cart Remote data source Success',
        () async {
          final finalData =
              getAddedToCartProductListJson['data']['cart']['EzRxItems'];
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              getAddedToCartProductListJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.cart(),
              'variables': {}
            }),
          );

          final result = await remoteDataSource.getAddedToCartProductList();

          expect(
            result,
            List.from(makeResponseCamelCase(jsonEncode(finalData)))
                .map((e) => CartProductDto.fromJson(e).toDomain)
                .toList(),
          );
        },
      );

      test(
        'Cart Remote data source success fail status 200 and error in response',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              getAddedToCartProductListJson
                ..putIfAbsent(
                  'errors',
                  () => [
                    {'message': 'fake-error'}
                  ],
                ),
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.cart(),
              'variables': {}
            }),
          );
          await remoteDataSource
              .getAddedToCartProductList()
              .onError((error, _) {
            expect(
              error,
              isA<ServerException>(),
            );
            return Future.value(<PriceAggregate>[]);
          });
        },
      );

      test(
        'Cart Remote data source success fail status 200 and error as no cart found',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              200,
              {
                'data': {
                  'upsertCartItems': {'EzRxItems': []}
                },
                'errors': [
                  {'message': 'no cart found'}
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.cart(),
              'variables': {}
            }),
          );
          final result = await remoteDataSource.getAddedToCartProductList();

          expect(
            result,
            <PriceAggregate>[],
          );
        },
      );

      test(
        'Cart Remote data source fail with status 204',
        () async {
          dioAdapter.onPost(
            '/api/cart',
            (server) => server.reply(
              204,
              getAddedToCartProductListJson,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.cartQueryMutation.cart(),
              'variables': {}
            }),
          );

          await remoteDataSource
              .getAddedToCartProductList()
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return Future.value(<PriceAggregate>[]);
          });
        },
      );
    },
  );

//Todo will revisit and fix the testcase
  // group(
  //   'Cart Remote data source upsertCartListJson',
  //   () {
  //     late Map<String, dynamic> upsertCartListJson;

  //     setUpAll(() async {
  //       upsertCartListJson = json.decode(
  //         await rootBundle.loadString('assets/json/upsertQueryResponse.json'),
  //       );
  //     });

  // final fakeQueryVariables = {
  //   'itemInput': {
  //     'ProductID': '',
  //     'Quantity': 1,
  //     'ItemSource': 'EZRX',
  //     'CustomerCode': '',
  //     'ShipToID': '',
  //     'SalesOrg': '',
  //     'ParentID': '',
  //     'Language': '',
  //   },
  // };

  // test(
  //   'Cart Remote data source Success',
  //   () async {
  //     final finalData =
  //         upsertCartListJson['data']['upsertCart']['EzRxItems'];

  //     dioAdapter.onPost(
  //       '/api/cart',
  //       (server) => server.reply(
  //         200,
  //         upsertCartListJson,
  //         delay: const Duration(seconds: 1),
  //       ),
  //       headers: {'Content-Type': 'application/json; charset=utf-8'},
  //       data: jsonEncode({
  //         'query': remoteDataSource.cartQueryMutation.upsertCart(),
  //         'variables': fakeQueryVariables
  //       }),
  //     );

  //     final result = await remoteDataSource.upsertCart(
  //       requestParams: {
  //         'ProductID': '',
  //         'Quantity': 1,
  //         'ItemSource': 'EZRX',
  //         'CustomerCode': '',
  //         'ShipToID': '',
  //         'SalesOrg': '',
  //         'ParentID': '',
  //         'Language': '',
  //       },
  //     );

  //     expect(
  //       result,
  //       List.from(makeResponseCamelCase(jsonEncode(finalData)))
  //           .map((e) => CartProductDto.fromJson(e).toDomain)
  //           .toList(),
  //     );
  //   },
  // );

  // test(
  //   'Cart Remote data source success fail status 200 and error in response',
  //   () async {
  //     dioAdapter.onPost(
  //       '/api/cart',
  //       (server) => server.reply(
  //         200,
  //         upsertCartListJson
  //           ..putIfAbsent(
  //             'errors',
  //             () => [
  //               {'message': 'fake-error'}
  //             ],
  //           ),
  //         delay: const Duration(seconds: 1),
  //       ),
  //       headers: {'Content-Type': 'application/json; charset=utf-8'},
  //       data: jsonEncode({
  //         'query': remoteDataSource.cartQueryMutation.upsertCart(),
  //         'variables': fakeQueryVariables
  //       }),
  //     );

  //     await remoteDataSource.upsertCart(
  //       requestParams: {
  //         'ProductID': '',
  //         'Quantity': 1,
  //         'ItemSource': 'EZRX',
  //         'CustomerCode': '',
  //         'ShipToID': '',
  //         'SalesOrg': '',
  //         'ParentID': '',
  //         'Language': '',
  //       },
  //     ).onError((error, _) {
  //       expect(error, isA<ServerException>());
  //       return Future.value(<PriceAggregate>[]);
  //     });
  //   },
  // );

  // test(
  //   'Cart Remote data source fail with status 204',
  //   () async {
  //     dioAdapter.onPost(
  //       '/api/cart',
  //       (server) => server.reply(
  //         204,
  //         upsertCartListJson,
  //         delay: const Duration(seconds: 1),
  //       ),
  //       headers: {'Content-Type': 'application/json; charset=utf-8'},
  //       data: jsonEncode({
  //         'query': remoteDataSource.cartQueryMutation.upsertCart(),
  //         'variables': fakeQueryVariables
  //       }),
  //     );

  //     await remoteDataSource.upsertCart(
  //       requestParams: {
  //         'ProductID': '',
  //         'Quantity': 1,
  //         'ItemSource': 'EZRX',
  //         'CustomerCode': '',
  //         'ShipToID': '',
  //         'SalesOrg': '',
  //         'ParentID': '',
  //         'Language': '',
  //       },
  //     ).onError((error, _) {
  //       expect(error, isA<ServerException>());
  //       return Future.value(<PriceAggregate>[]);
  //     });
  //   },
  // );
  //},
  //);
}
