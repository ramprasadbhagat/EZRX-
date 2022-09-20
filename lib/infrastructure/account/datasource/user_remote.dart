import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/error/user_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';

class UserRemoteDataSource {
  HttpService httpService;
  UserQueryMutation userQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  UserRemoteDataSource({
    required this.httpService,
    required this.userQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<User> getUser() async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/api/strapiEngine',
        data: jsonEncode({
          'query': userQueryMutation.getUserQuery(),
          'variables': {'id': '11044'}, //@@@@@@@ need to remove dependency
          // 'variables': {'id': '10797'}, //@@@@@@@ need to remove dependency
        }),
      );
      _userExceptionChecker(res: res);

      return UserDto.fromJson(res.data['data']['user']).toDomain();
    });
  }

  void _userExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['data'] == null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode == 404) {
      throw const UserException.userNotFound();
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
