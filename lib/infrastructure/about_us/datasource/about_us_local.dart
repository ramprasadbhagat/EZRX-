import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/infrastructure/about_us/dtos/about_us_dto.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class AboutUsLocalDataSource {
  Future<AboutUs> getAboutUs() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/aboutUsResponse.json'),
    );

    return AboutUsDto.fromJson(res['data']['item']['components']).toDomain();
  }
}
