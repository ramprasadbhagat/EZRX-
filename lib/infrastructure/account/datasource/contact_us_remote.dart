import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class ContactUsRemoteDataSource {
  HttpService httpService;
  ContactUsQueryMutation mutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ContactUsRemoteDataSource({
    required this.httpService,
    required this.mutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<bool> submit({
    required Map<String, dynamic> contactUsMap,
    required String customerCode,
    required String clinicName,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': mutation.submitQuery(),
          'variables': {
            'input': {
              ...contactUsMap,
              'customerCode': customerCode,
              'clinicName': clinicName,
              'language': language,
            },
          },
        }),
        apiEndpoint: 'contactUs',
      );
      _contactUsExceptionChecker(res: res);

      return res.data['data']['contactUs']['success'];
    });
  }

  void _contactUsExceptionChecker({required Response<dynamic> res}) {
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
