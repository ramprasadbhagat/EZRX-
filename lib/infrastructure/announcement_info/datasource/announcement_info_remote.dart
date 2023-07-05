import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_info_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class AnnouncementInfoRemoteDataSource {
  final HttpService httpService;
  final AnnouncementInfoQueryMutation queryMutation;
  final DataSourceExceptionHandler exceptionHandler;

  AnnouncementInfoRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.exceptionHandler,
  });

  Future<AnnouncementInfo> getAnnouncementInfo({
    required String announcementUrlPath,
    required String template,
    required String variablePath,
    required int pageSize,
    required String lang,
  }) async {
    final variableData = {
      'template': template,
      'path': variablePath,
      'pageSize': pageSize,
      'lang': lang,
    };
    
    return await exceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: announcementUrlPath,
        data: jsonEncode({
          'query': queryMutation.getAnnouncementInfoQuery(),
          'variables': variableData,
        }),
      );
      _announcementInfoExceptionChecker(res: res);
      if (res.data['data']['search'] == null ||
          res.data['data']['search'].isEmpty) {
        throw OtherException();
      }

      return AnnouncementInfoDto.fromJson(res.data['data']['search']).toDomain;
    });
  }

  void _announcementInfoExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
