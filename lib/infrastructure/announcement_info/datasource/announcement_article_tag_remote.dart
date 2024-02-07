import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

const pageSize = 1000;

class AnnouncementArticlTagRemoteDataSource {
  final HttpService httpService;
  final AnnouncementArticleTagQueryMutation queryMutation;
  final DataSourceExceptionHandler exceptionHandler;

  AnnouncementArticlTagRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.exceptionHandler,
  });

  Future<List<String>> getAnnouncementArticleTags({
    required String announcementArticleUrlPath,
    required String template,
    required String variablePath,
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
        url: announcementArticleUrlPath,
        data: jsonEncode({
          'query': queryMutation.getAnnouncementArticleTagQuery(),
          'variables': variableData,
        }),
      );
      _announcementInfoExceptionChecker(
        res: res,
      );
      final finalData = res.data['data']['search']['results'];

      return List.from(finalData)
          .map((e) => e['displayName'].toString())
          .toList();
    });
  }

  void _announcementInfoExceptionChecker({
    required Response<dynamic> res,
  }) {
    if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['data']['search'] == null ||
        res.data['data']['search'].isEmpty) {
      throw const ApiFailure.articleannuncementTagFetchingError();
    }
  }
}
