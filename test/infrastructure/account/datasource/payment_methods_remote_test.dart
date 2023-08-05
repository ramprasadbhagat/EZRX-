import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/delete_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/edit_payment_method.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/available_payment_method_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/edit_payment_method_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class AvailablePaymentMethodMock extends Mock
    implements AvailablePaymentMethod {}

class EditPaymentMethodMock extends Mock implements EditPaymentMethod {}

class DeletePaymentMethodMock extends Mock implements DeletePaymentMethod {}

void main() {
  late PaymentMethodsRemoteDataSource remoteDataSource;
  late String salesOrg;
  late String newPaymentMethod;
  late String oldPaymentMethod;

  late Map<String, Object> getPaymentMethodVariables;
  late Map<String, Object> updatePaymentMethodVariables;
  late Map<String, Object> deletePaymentMethodVariables;
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
      remoteDataSource = PaymentMethodsRemoteDataSource(
        httpService: service,
        paymentMethodsQueryMutation: PaymentMethodsQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: locator.get<Config>(),
      );
      salesOrg = '2601';
      newPaymentMethod = 'QR Code';
      oldPaymentMethod = 'Bank Transfer';
      getPaymentMethodVariables = {'request': {}};
      updatePaymentMethodVariables = {
        'input': {
          'salesOrg': salesOrg,
          'newPaymentMethod': newPaymentMethod,
          'oldPaymentMethod': oldPaymentMethod,
        },
      };
      deletePaymentMethodVariables = {
        'request': {
          'salesOrg': salesOrg,
          'paymentMethod': newPaymentMethod,
        },
      };
    },
  );

  group(
    'Payment Method Remote for getAvailablePaymentMethods',
    () {
      test(
        '=> Success',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/getAvailablePaymentMethodsResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.paymentMethodsQueryMutation
                  .getAvailablePaymentMethodsQuery(),
              'variables': getPaymentMethodVariables,
            }),
          );

          final result = await remoteDataSource.getAvailablePaymentMethods();
          expect(
            result.length,
            List.from(res['data']['availablePaymentMethods'])
                .map((e) => AvailablePaymentMethodDto.fromJson(e).toDomain())
                .toList()
                .length,
          );
        },
      );

      test(
        '=> Failure',
        () async {
          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.paymentMethodsQueryMutation
                  .getAvailablePaymentMethodsQuery(),
              'variables': getPaymentMethodVariables,
            }),
          );

          await remoteDataSource
              .getAvailablePaymentMethods()
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<AvailablePaymentMethodMock>[]);
          });
        },
      );
    },
  );

  group(
    'Payment Method Remote for updatePaymentMethods',
    () {
      test(
        '=> Success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/updatePaymentMethodResponse.json'),
          );

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.paymentMethodsQueryMutation
                  .updatePaymentMethodsMutation(),
              'variables': updatePaymentMethodVariables,
            }),
          );

          final result = await remoteDataSource.updatePaymentMethods(
            salesOrg: salesOrg,
            newPaymentMethod: newPaymentMethod,
            oldPaymentMethod: oldPaymentMethod,
          );
          expect(
            result.success,
            EditPaymentMethodDto.fromJson(
              res['data']['updatePaymentMethods'],
            ).toDomain().success,
          );
        },
      );

      test(
        '=> Failure',
        () async {
          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.paymentMethodsQueryMutation
                  .updatePaymentMethodsMutation(),
              'variables': updatePaymentMethodVariables,
            }),
          );

          await remoteDataSource
              .updatePaymentMethods(
            salesOrg: salesOrg,
            newPaymentMethod: newPaymentMethod,
            oldPaymentMethod: oldPaymentMethod,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(EditPaymentMethodMock());
          });
        },
      );
    },
  );

  group(
    'Payment Method Remote for deletePaymentMethods',
    () {
      test(
        '=> Success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/deletePaymentMethodResponse.json'),
          );

          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.paymentMethodsQueryMutation
                  .deletePaymentMethodsMutation(),
              'variables': deletePaymentMethodVariables,
            }),
          );

          final result = await remoteDataSource.deletePaymentMethods(
            salesOrg: salesOrg,
            paymentMethod: newPaymentMethod,
          );
          expect(
            result.success,
            EditPaymentMethodDto.fromJson(
              res['data']['deletePaymentMethods'],
            ).toDomain().success,
          );
        },
      );

      test(
        '=> Failure',
        () async {
          dioAdapter.onPost(
            '/api/ezpay',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.paymentMethodsQueryMutation
                  .deletePaymentMethodsMutation(),
              'variables': deletePaymentMethodVariables,
            }),
          );

          await remoteDataSource
              .deletePaymentMethods(
            salesOrg: salesOrg,
            paymentMethod: newPaymentMethod,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(DeletePaymentMethodMock());
          });
        },
      );
    },
  );
}
