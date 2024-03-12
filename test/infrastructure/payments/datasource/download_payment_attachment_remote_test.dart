import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_query.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late DownloadPaymentAttachmentRemoteDataSource remoteDataSource;
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
      remoteDataSource = DownloadPaymentAttachmentRemoteDataSource(
        httpService: service,
        config: Config(),
        downloadPaymentAttachmentQuery: DownloadPaymentAttachmentQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Download e credit remote test',
    () {
      test('Fetch e credit url Remote DataSource Test status code 200',
          () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/eCreditResponse.json'),
        );

        final data = jsonEncode(
          {'ecn_number': 'fake-eCredit'},
        );

        dioAdapter.onPost(
          '/api/payment/listEcn',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result = await remoteDataSource.getECreditDownloadUrl(
          eCreditNumber: 'fake-eCredit',
        );

        final response =
            ECreditInvoiceDto.fromJson(res['data'].first).toDomain();

        expect(
          result,
          response,
        );
      });
      test(
          'Fetch e credit url Remote DataSource Test and returned url is empty status code 200',
          () async {
        final data = jsonEncode(
          {'ecn_number': 'fake-eCredit'},
        );

        dioAdapter.onPost(
          '/api/payment/listEcn',
          (server) => server.reply(
            200,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result = await remoteDataSource.getECreditDownloadUrl(
          eCreditNumber: 'fake-eCredit',
        );

        final response = ECreditInvoiceDto.fromJson({'data': []}).toDomain();

        expect(
          result,
          response,
        );
      });
      test('Fetch e credit url Remote DataSource Test status code not 200',
          () async {
        final data = jsonEncode(
          {'ecn_number': 'fake-eCredit'},
        );

        dioAdapter.onPost(
          '/api/payment/listEcn',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await remoteDataSource
            .getECreditDownloadUrl(
          eCreditNumber: 'fake-eCredit',
        )
            .onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(DownloadPaymentAttachment.empty());
        });
      });
    },
  );
}
