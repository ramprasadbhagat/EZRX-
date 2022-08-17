import 'dart:convert';

import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
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

  Future<List<BannerItem>> getBanners(bool isPreSalesOrg, String salesOrg) async {
    try {
      final res = await httpService.request(
        method: 'POST',
        url: '/ezrxapi/api/license',
        data: jsonEncode({
          'query': bannerQueryMutation.getBannerQuery(isPreSalesOrg, salesOrg),
        }),
      );
      if (res.data['errors'] != null && res.data['data'] == null) {
        throw AuthException.other(res.data['errors'][0]['message']);
      }else if (res.statusCode != 200) {
        throw const AuthException.serverError();
      }
      return List.from(res.data['data']['getBanners']).map((e) => BannerDto.fromJson(e).toDomain()).toList();
    } catch (e) {
      throw const AuthException.serverError();
    }
  }
}
