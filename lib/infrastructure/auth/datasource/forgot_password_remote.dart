import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/forgot_password_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class ForgotPasswordRemoteDataSource {
  final HttpService httpService;
  final AuthQueryMutation authQueryMutation;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;

  ForgotPasswordRemoteDataSource({
    required this.httpService,
    required this.authQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });
  Future<ForgotPassword> requestResetPassword({
    required String username,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final variable = {
        'username': username,
        'language': language,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode(
          {
            'query': authQueryMutation.requestResetPassword(),
            'variables': variable,
          },
        ),
      );

      _exceptionChecker(res: res);
      final data = res.data['data']['requestResetPassword'];

      return ForgotPasswordDto.fromJson(data).toDomain();
    });
  }

  void _exceptionChecker({required Response<dynamic> res}) {
    if (dataSourceExceptionHandler.isServerResponseError(res: res)) {
      isEqualsIgnoreCase(
        res.data['errors'][0]['message'],
        'Invalid username or password',
      )
          ? throw const AuthException.invalidUserName()
          : throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
