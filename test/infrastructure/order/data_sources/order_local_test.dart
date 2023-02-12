import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_response_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderTemplateMock extends Mock implements OrderTemplate {}

void main() {
  late OrderLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = OrderLocalDataSource();
    },
  );

  group(
    'Saved Orders',
    () {
      test(
        'Get saved Order ',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getSavedOrdersResponse.json'),
          );

          final result = await localDataSource.getSavedOrders();

          expect(
            result,
            List.from(res['data']['draftOrders'])
                .where((e) => json.decode(e['itemlist']) != null)
                .map((e) => SavedOrderDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );

      test(
        'delete saved order',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
                'assets/json/deleteSavedOrderTemplateResponse.json'),
          );

          final result = await localDataSource.deleteSavedOrder(
            item: SavedOrder.empty(),
          );

          expect(
            result,
            SavedOrderDto.fromJson(
              res['data']['deleteDraftOrder']['draftOrder'],
            ).toDomain(),
          );
        },
      );

      test(
        'submit saved order',
        () async {
          final res = json.decode(
            await rootBundle.loadString('assets/json/submitOrderResponse.json'),
          );

          final result = await localDataSource.submitOrder(
              submitOrder: SubmitOrderDto.fromDomain(
                  SubmitOrder.empty()
                      .copyWith(companyName: CompanyName('fake-name')),
                  'fake-currency'));

          expect(
            result,
            SubmitOrderResponseDto.fromJson(res['data']['submitOrderTwo'])
                .toDomain(),
          );
        },
      );

      test(
        'create saved order',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/createDraftOrderResponse.json'),
          );

          final result = await localDataSource.createDraftOrder(
              draftOrder: SavedOrderDto.fromDomain(SavedOrder.empty().copyWith(
                  companyName: CompanyName('fake-name'),
                  shipToParty: ShipToParty('fake-shipto'),
                  soldToParty: SoldToParty('fake-soldto'))));

          expect(
            result,
            SavedOrderDto.fromJson(res['data']['createDraftOrder']).toDomain(),
          );
        },
      );

      test(
        'Get saved Order Detail',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getSavedOrderDetailResponse.json'),
          );

          final result = await localDataSource.getSavedOrderDetail();

          expect(
            result,
            SavedOrderDto.fromJson(
              res['data']['draftOrder'],
            ).toDomain(),
          );
        },
      );

      test(
        'Update saved Order',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/updateSavedOrderResponse.json'),
          );

          final result = await localDataSource.updateDraftOrder();

          expect(
            result,
            SavedOrderDto.fromJson(
              res['data']['updateDraftOrder'],
            ).toDomain(),
          );
        },
      );
    },
  );
}
