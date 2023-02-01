import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approval_and_approver_rights.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_status_dto.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/user_restrictions_dto.dart';

import 'package:ezrxmobile/domain/returns/entities/user_restriction_status.dart';

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

  Future<UserRestrictions> getUserRestrictions({
    required String salesOrg,
    required String userName,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData =
          userRestrictionMutation.getUserRestrictions();

      final request = {
        'request': {
          'salesOrg': salesOrg,
          'username': userName,
        },
        'approverRequest': {
          'salesOrg': salesOrg,
          'username': userName,
        },
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({'query': queryData, 'variables': request}),
      );

      _userRestrictionExceptionChecker(res: res);

      final finalData = res.data['data'];

      return UserRestrictionsDto.fromJson(finalData).toDomain();
    });
  }

  Future<UserRestrictionStatus> addApprovalLimit({
    required String salesOrg,
    required String userName,
    required int valueUpperLimit,
    required int valueLowerLimit,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = userRestrictionMutation.addApprovalLimit();

      final request = {
        'request': {
          'username': userName,
          'salesOrg': salesOrg,
          'valueLowerLimit': valueLowerLimit,
          'valueUpperLimit': valueUpperLimit,
        },
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': request,
        }),
      );

      _userRestrictionExceptionChecker(res: res);

      final finalData = res.data['data'];

      return UserRestrictionStatusDto.fromJson(finalData).toDomain();
    });
  }

  Future<UserRestrictionStatus> configureUserRestriction({
    required String userName,
    required List<Map<String, dynamic>> approverRightsList,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = userRestrictionMutation.addRestriction();

      final request = {
        'username': userName,
        'approverRights': approverRightsList,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': {
            'input': request,
          },
        }),
      );

      _userRestrictionExceptionChecker(res: res);

      final finalData = res.data['data'];

      return UserRestrictionStatusDto.fromJson(finalData).toDomain();
    });
  }

  Future<UserRestrictionStatus> deleteApprovalRight({
    required String salesOrg,
    required String uuid,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = userRestrictionMutation.deleteApprovalRight();

      final request = {
        'uuid': uuid,
        'salesOrg': salesOrg,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': {
            'input': request,
          },
        }),
      );

      _userRestrictionExceptionChecker(res: res);

      final finalData = res.data['data'];

      return UserRestrictionStatusDto.fromJson(finalData).toDomain();
    });
  }

  Future<UserRestrictionStatus> deleteApprovalLimit({
    required String uuid,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = userRestrictionMutation.deleteApprovalLimit();

      final request = {
        'uuid': uuid,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': {
            'input': request,
          },
        }),
      );

      _userRestrictionExceptionChecker(res: res);

      final finalData = res.data['data'];

      return UserRestrictionStatusDto.fromJson(finalData).toDomain();
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
