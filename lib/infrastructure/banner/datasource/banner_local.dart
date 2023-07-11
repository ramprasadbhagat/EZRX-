import 'dart:convert';

import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/banner_dto.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/ez_reach_banner_dto.dart';
import 'package:flutter/services.dart';

class BannerLocalDataSource {
  BannerLocalDataSource();

  Future<List<BannerItem>> getBanners() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getBannersResponse.json'),
    );

    return List.from(data['data']['getBanners'])
        .map((e) => BannerDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<BannerItem>> getEZReachBanners() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getEZReachBannerResponse.json'),
    );

    return List.from(data['data']['getLiveCampaigns']['data'])
        .map((e) => EZReachBannerDto.fromJson(e).toDomain())
        .toList();
  }
}
