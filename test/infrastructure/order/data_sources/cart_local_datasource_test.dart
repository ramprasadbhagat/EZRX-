import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_simulator_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_dto.dart';
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
          final finalData = data['data']['cart'];
          final result = await localDataSource.getAddedToCartProductList();
          expect(
            result,
            CartDto.fromJson(
              makeResponseCamelCase(jsonEncode(finalData)),
            ).toDomain(),
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
            List.from(makeResponseCamelCase(jsonEncode(finalData)))
                .map((e) => CartProductDto.fromJson(e).toDomain)
                .toList(),
          );
        },
      );

      test(
        'Cart local data source upsertCartItemsWithComboOffers',
        () async {
          final data = json.decode(
            await rootBundle.loadString(
              'assets/json/upsertCartItemsWithComboOffersResponse.json',
            ),
          );
          final finalData = data['data']['upsertCartItems']['EzRxItems'];
          final result = await localDataSource.upsertCart(type: UpsertCartLocalType.upsertCartItemsComboOffer);

          expect(
            result,
            List.from(makeResponseCamelCase(jsonEncode(finalData)))
                .map((e) => CartProductDto.fromJson(e).toDomain)
                .toList(),
          );
        },
      );

      test(
        'Cart local data source aplOrderSimulator',
        () async {
          final data = json.decode(
            await rootBundle.loadString(
              'assets/json/aplSimulateOrderResponse.json',
            ),
          );
          final aplSimulatorOrder = data['data']['aplSimulateOrder'];
          final result = AplSimulatorOrderDto.fromJson(aplSimulatorOrder).toDomain;
          

          expect(
            result,
            AplSimulatorOrderDto.fromJson(
              makeResponseCamelCase(jsonEncode(aplSimulatorOrder)),
            ).toDomain,
          );
        },
      );
    },
  );
}
