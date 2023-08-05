import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localDataSource = CartLocalDataSource();
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  group(
    'Cart local data source',
    () {
      test(
        'Cart local data source getAddedToCartProductList',
        () async {
          final data = json.decode(
            await rootBundle
                .loadString('assets/json/getAddedToCartProductList.json'),
          );
          final finalData = data['data']['cart']['EzRxItems'];
          final result = await localDataSource.getAddedToCartProductList();
          expect(
            result,
            List.from(finalData)
                .map((e) => CartProductDto.fromJson(e).toDomain)
                .toList(),
          );
        },
      );

      test(
        'Cart local data source upsertCart',
        () async {
          final data = json.decode(
            await rootBundle.loadString('assets/json/upsertQueryResponse.json'),
          );
          final finalData = data['data']['upsertCart']['EzRxItems'];
          final result = await localDataSource.upsertCart();

          expect(
            result,
            List.from(finalData)
                .map((e) => CartProductDto.fromJson(e).toDomain)
                .toList(),
          );
        },
      );
    },
  );
}
