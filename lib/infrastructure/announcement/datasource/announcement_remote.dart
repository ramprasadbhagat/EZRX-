import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/announcement/entities/maintenance_item.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement/dtos/announcement_dto.dart';
import 'package:ezrxmobile/infrastructure/announcement/dtos/maintenance_item_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

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
    return await exceptionHandler.handle(
      () async {
        final res = await httpService.request(
          method: 'POST',
          url: '/api/strapiEngine',
          data: jsonEncode({
            'query': queryMutation.getAnnouncementsQuery(),
          }),
          apiEndpoint: 'getAnnouncements',
        );
        _announcementExceptionChecker(res: res);
        if (res.data['data']['getAnnouncements'] == null ||
            res.data['data']['getAnnouncements'].isEmpty) {
          throw OtherException(message: '');
        }

        return AnnouncementDto.fromJson(res.data['data']['getAnnouncements'][0])
            .toDomain;
      },
    );
  }

  Future<MaintenanceItem> getMaintenanceBanner({
    required String languageCode,
    required String pathId,
  }) async {
    return await exceptionHandler.handle(
      () async {
        final res = await httpService.request(
          method: 'POST',
          url: '/api/announcement',
          data: jsonEncode({
            'query': queryMutation.getMaintenanceBannerQuery(),
            'variables': {
              'itemId': pathId,
              'lang': languageCode,
            },
          }),
          apiEndpoint: 'announcement',
        );
        _announcementExceptionChecker(res: res);

        return MaintenanceItemDto.fromJson(res.data['data']['item']).toDomain;
      },
    );
  }

  void _announcementExceptionChecker({required Response<dynamic> res}) {
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
