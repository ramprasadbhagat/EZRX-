import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
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

  Future<ResetPassword> changePassword(
    String username,
    String oldPassword,
    String newPassword,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
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

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return ResetPasswordDto.fromJson(res.data['data']['changePassword'])
          .toDomain();
    });
  }

  Future<ResetPassword> resetPassword({
    required String username,
    required String newPassword,
    required String resetPasswordToken,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode(
          {
            'query': authQueryMutation.resetPassword(),
            'variables': {
              'username': username,
              'newPassword': newPassword,
              'resetPasswordToken': resetPasswordToken,
            },
          },
        ),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return ResetPasswordDto.fromJson(res.data['data']['resetPasswordV3'])
          .toDomain();
    });
  }

  Future<ResetPassword> changePasswordForFirstTime({
    required String newPassword,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode(
          {
            'query': authQueryMutation.changePasswordForFirstTime(),
            'variables': {
              'newPassword': newPassword,
            },
          },
        ),
      );

      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      return ResetPasswordDto.fromJson(
        res.data['data']['changePasswordFirstTime'],
      ).toDomain();
    });
  }
}
