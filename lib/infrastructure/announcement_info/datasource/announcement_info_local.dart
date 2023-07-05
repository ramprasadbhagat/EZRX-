

import 'dart:convert';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_info_dto.dart';
import 'package:flutter/services.dart';

class AnnouncementInfoLocalDataSource{
  Future<AnnouncementInfo> getAnnouncementInfo() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/getAnnouncementInfoResponse.json'),
    );

    return AnnouncementInfoDto.fromJson(res['data']['search'])
        .toDomain;
  }
}