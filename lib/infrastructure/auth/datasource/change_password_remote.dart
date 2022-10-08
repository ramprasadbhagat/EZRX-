import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/reset_password_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class ChangePasswordRemoteDataSource {
  HttpService httpService;
  AuthQueryMutation authQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ChangePasswordRemoteDataSource({
    required this.httpService,
    required this.authQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<ResetPassword> setUserPassword(
    String username,
    String oldPassword,
    String newPassword,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}loginAd',
        data: jsonEncode(
          {
            'query': authQueryMutation.changePassword(),
            'variables': {
              'username': username,
              'oldPassword': oldPassword,
              'newPassword': newPassword,
            },
          },
        ),
      );

      _exceptionChecker(
        res: res,
      );

      return ResetPasswordDto.fromJson(res.data['data']['changePassword'])
          .toDomain();
    });
  }

  void _exceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['data'] == null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
