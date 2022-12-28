import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BannerLocalDataSource localDataSource;
  late String saleOrgName;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    localDataSource = BannerLocalDataSource();
    saleOrgName = '2601';
  });

  group('Banners Local', () {
    test('Get Banners Test', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/getBannersResponse.json'),
      );
      final result = await localDataSource.getBanners(
          isPreSalesOrg: false, salesOrg: saleOrgName);

      expect(result.length, List.from(res['data']['getBanners']).length);
    });
  });
}
