import 'dart:convert';

import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/banner_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class BannerRemoteDataSource{
  HttpService httpService;
  BannerRemoteDataSource({required this.httpService});

  Future<List<BannerItem>> getBanners(bool isPreSalesOrg,String salesOrg) async {
    final res = await httpService.request(
      method: 'POST',
      url: '/ezrxapi/api/license',
      data: jsonEncode({
        'query': getBannerQuery(isPreSalesOrg,salesOrg),
      }),
    );

    return List.from(res.data['data']['getBanners']).map((e) => BannerDto.fromJson(e).toDomain()).toList();
  }

  String getBannerQuery(bool isPreSalesOrg,String salesOrg) {
    return '''
    {
      getBanners(request: {isPreSalesOrg: $isPreSalesOrg,salesOrg:"$salesOrg"})
        {
          id    
          url    
          title    
          description    
          buttonLabel    
          urlLink    
          isPreSalesOrg  
          salesOrg    
          serial
          isCustomer
      }
    }
    ''';
  }
}