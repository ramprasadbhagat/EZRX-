

import 'dart:convert';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_article_info_dto.dart';
import 'package:flutter/services.dart';

class AnnouncementInfoLocalDataSource{
  Future<AnnouncementArticleInfo> getAnnouncementInfo() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/getAnnouncementInfoResponse.json'),
    );

    return AnnouncementArticleInfoDto.fromJson(res['data']['search'])
        .toDomain;
  }
}