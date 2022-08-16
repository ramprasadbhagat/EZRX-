import 'dart:convert';

import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/banner_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class BannerRemoteDataSource {
  HttpService httpService;
  BannerQueryMutation bannerQueryMutation;
  BannerRemoteDataSource({
    required this.httpService,
    required this.bannerQueryMutation,
  });

  Future<List<BannerItem>> getBanners(
      bool isPreSalesOrg, String salesOrg) async {
    final res = await httpService.request(
      method: 'POST',
      url: '/ezrxapi/api/license',
      data: jsonEncode({
        'query': bannerQueryMutation.getBannerQuery(isPreSalesOrg, salesOrg),
      }),
    );

    return List.from(res.data['data']['getBanners'])
        .map((e) => BannerDto.fromJson(e).toDomain())
        .toList();
  }
}
