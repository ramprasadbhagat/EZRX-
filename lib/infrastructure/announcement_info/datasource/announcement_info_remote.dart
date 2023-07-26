import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_article_info_dto.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_info_details_dto.dart';
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

  Future<AnnouncementArticleInfo> getAnnouncementInfo({
    required String announcementUrlPath,
    required String template,
    required String variablePath,
    required int pageSize,
    required String lang,
    required String after,
  }) async {
    final variableData = {
      'template': template,
      'path': variablePath,
      'pageSize': pageSize,
      'lang': lang,
      'after': after,
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
      _announcementInfoExceptionChecker(
        res: res,
        label: 'search',
      );

      return AnnouncementArticleInfoDto.fromJson(res.data['data']['search'])
          .toDomain;
    });
  }

  Future<AnnouncementInfoDetails> getAnnouncementInfoDetails({
    required String announcementUrlPath,
    required String lang,
    required String announcementId,
  }) async {
    final variableData = {
      'itemId': announcementId,
      'lang': lang,
    };

    return await exceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: announcementUrlPath,
        data: jsonEncode({
          'query': queryMutation.getAnnouncementInfoDetailsQuery(),
          'variables': variableData,
        }),
      );
      _announcementInfoExceptionChecker(
        res: res,
        label: 'item',
      );

      return AnnouncementInfoDetailsDto.fromJson(res.data['data']['item'])
          .toDomain;
    });
  }

  void _announcementInfoExceptionChecker({
    required Response<dynamic> res,
    required String label,
  }) {
    if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['data'][label] == null ||
        res.data['data'][label].isEmpty) {
      throw OtherException(
        message: label == 'item'
            ? 'Announcement Details is either null or empty!'
            : 'Error while fetching announcement list!',
      );
    }
  }
}
