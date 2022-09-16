import 'dart:convert';

import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/infrastructure/announcement/dtos/announcement_dto.dart';
import 'package:flutter/services.dart';

class AnnouncementLocalDataSource {
  Future<Announcement> getAnnouncements() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/getAnnouncementsResponse.json'),
    );

    return AnnouncementDto.fromJson(res['data']['getAnnouncements'][0])
        .toDomain();
  }
}
