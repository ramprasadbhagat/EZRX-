import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/infrastructure/about_us/dtos/about_us_dto.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class AboutUsLocalDataSource {
  Future<AboutUs> getAboutUsStaticInfo(String country) async {
    final res = json.decode(
      await rootBundle
          .loadString('assets/json/aboutUs${country}marketStaticContent.json'),
    );

    return AboutUsDto.fromJson(res).toDomain();
  }
}
