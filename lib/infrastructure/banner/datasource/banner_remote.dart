import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/banner_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  Future<dynamic> downloadImage(Map credential) async {
    if (credential['url'] != '') {
      try {
        final res = await httpService.request(
          method: 'POST',
          url: '/api/downloadAttachment',
          data: credential,
          responseType: ResponseType.bytes
        );

        if (res.statusCode == 200) {
          var data = res.data;
          return data;
        } else {
          await Fluttertoast.showToast(
            msg: 'Error while fetching data',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ZPColors.error,
            textColor: ZPColors.white,
            fontSize: 16.0,
          );
          return 'error';
        }
      } catch (e) {
        await Fluttertoast.showToast(
            msg: 'Oops! Something went wrong.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ZPColors.error,
            textColor: ZPColors.white,
            fontSize: 16.0);
        return 'error';
      }
    } else {
      return 'empty url';
    }
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