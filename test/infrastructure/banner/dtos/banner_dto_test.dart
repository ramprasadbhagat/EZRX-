import 'dart:convert';

import 'package:ezrxmobile/infrastructure/banner/dtos/banner_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Banner DTO', () {
    setUp(() async {
      data = json.decode(
          await rootBundle.loadString('assets/json/getBannersResponse.json'));
    });
    test('toDomain Test', () {
      final bannerData = BannerDto.fromJson(
        data['data']['getBanners'][0],
      ).toDomain();
      expect(bannerData.salesOrg, '2601');
    });

    test('fromDomain Test', () {
      final configsDto = BannerDto.fromDomain(
          BannerDto.fromJson(
        data['data']['getBanners'][0],
      ).toDomain());
      expect(configsDto.salesOrg, '2601');
    });

     test('toJson Test', () {
      final bannerDtoMap = BannerDto.fromDomain(
              BannerDto.fromJson(
        data['data']['getBanners'][0],
      ).toDomain())
          .toJson();
      expect(bannerDtoMap['salesOrg'], '2601');
    });
  });
}
