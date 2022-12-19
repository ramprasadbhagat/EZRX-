import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_template_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class OrderTemplateMock extends Mock implements OrderTemplate {}

void main() {
  late OrderTemplateRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = OrderTemplateRemoteDataSource(
        httpService: service,
        config: Config(),
        orderTemplateQueries: OrderTemplateQueries(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Order Template',
    () {
      test(
        'Get Order template Success with unparsable cartList',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getOrderTemplatesResponse.json'),
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
                  remoteDataSource.orderTemplateQueries.getOrderTemplates(),
              'variables': {
                'userId': '11416',
              },
            }),
          );

          final result = await remoteDataSource.getOrderTemplates(
            userId: '11416',
          );

          expect(
            result,
            List.from(res['data']['orderTemplates'])
                .where((e) => json.decode(e['cartList']) != null)
                .map((e) => OrderTemplateDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );
    },
  );
}
