import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

import 'package:ezrxmobile/infrastructure/announcement/dtos/announcement_dto.dart';

import 'package:ezrxmobile/domain/core/error/exception.dart';

class AnnouncementRemoteDataSource {
  final HttpService httpService;
  final AnnouncementQueryMutation queryMutation;
  final DataSourceExceptionHandler exceptionHandler;

  AnnouncementRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.exceptionHandler,
  });

  Future<Announcement> getAnnouncements() async {
    return await exceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/api/strapiEngine',
        data: jsonEncode({
          'query': queryMutation.getAnnouncementsQuery(),
        }),
      );
      _announcementExceptionChecker(res: res);
      if (res.data['data']['getAnnouncements'] == null ||
          res.data['data']['getAnnouncements'].isEmpty) {
        throw OtherException(message: '');
      }

      return AnnouncementDto.fromJson(res.data['data']['getAnnouncements'][0])
          .toDomain();
    });
  }

  void _announcementExceptionChecker({required Response<dynamic> res}) {
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
