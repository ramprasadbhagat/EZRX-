import 'dart:convert';

import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/ez_reach_banner_dto.dart';
import 'package:flutter/services.dart';

class BannerLocalDataSource {
  BannerLocalDataSource();

  Future<List<BannerItem>> getEZReachBanners({
    required String bannerType,
  }) async {
    final data = json.decode(
      await rootBundle.loadString(
        bannerType == 'banner_carousel'
            ? 'assets/json/getEZReachBannerResponse.json'
            : 'assets/json/getEZReachTopAdvertBoxResponse.json',
      ),
    );

    return List.from(data['data']['getLiveCampaigns']['data'])
        .map((e) => EZReachBannerDto.fromJson(e).toDomain())
        .toList();
  }
}
