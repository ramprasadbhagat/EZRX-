import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';

class UserRestrictionRemoteDataSource {
  Config config;
  HttpService httpService;
  UserRestrictionMutation userRestrictionMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;

  UserRestrictionRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.userRestrictionMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<UserRestrictionListDto> fetch({
    required String salesOrg,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = userRestrictionMutation.getApproverRights();

      final request = {
        'salesOrg': salesOrg,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': {
            'request': request,
          },
        }),
      );

      _userRestrictionExceptionChecker(res: res);

      return UserRestrictionListDto.fromJson(
        res.data['data']['approverRights'],
      );
    });
  }

  void _userRestrictionExceptionChecker({required Response<dynamic> res}) {
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
