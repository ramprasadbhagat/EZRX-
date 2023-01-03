import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_customer_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_response_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class SavedOrderMock extends Mock implements SavedOrder {}

void main() {
  late OrderRemoteDataSource remoteDataSource;
  late String userId;
  late String saleOrgName;
  late String shipToCode;
  late String customerCode;
  late int pageSize;
  late int offset;
  late SavedOrderDto draftOrder;

  late Map<String, Object> variables;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = OrderRemoteDataSource(
        httpService: service,
        queryMutation: OrderQueryMutation(),
        exceptionHandler: DataSourceExceptionHandler(),
      );
      userId = '11461';
      saleOrgName = '2601';
      shipToCode = '0000002610';
      customerCode = '0000002610';
      pageSize = 10;
      offset = 0;
      draftOrder = const SavedOrderDto(
        address1: '',
        address2: '',
        billingDocument: '',
        city: '',
        collectiveNo: '',
        companyName: '',
        contactPerson: '',
        country: '',
        deliveryDocument: '',
        eZRxNumber: '',
        fax: '',
        id: '',
        isDraftOrder: false,
        items: [],
        orderReason: '',
        orderType: '',
        payTerm: '',
        phonenumber: '',
        poReference: '',
        postCode1: '',
        principal: '',
        processingStatus: '',
        quantity: 0,
        referenceNotes: '',
        requestedDeliveryDate: '',
        salesOrganization: '',
        shipToParty: '',
        shippingCondition: '',
        soldToParty: '',
        specialInstructions: '',
        totalOrderValue: 0,
        totalPrice: 0,
        unitPrice: 0,
        user: '',
      );

      variables = {
        'whereQuery': {
          'draftorder': true,
          'processingStatusIn': ['Draft', 'Failed'],
          'user': userId,
          'SalesOrganization': saleOrgName,
          'ShipToParty': shipToCode,
          'SoldToParty': customerCode,
        },
        'first': pageSize,
        'after': offset,
      };
    },
  );

  group(
    'Order Remote',
    () {
      test(
        'Get Saved order with invalid itemlist json',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getSavedOrdersResponse.json'),
          );

          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getSaveOrderHistory(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getSavedOrder(
            userId: userId,
            saleOrgName: saleOrgName,
            shipToCode: shipToCode,
            customerCode: customerCode,
            pageSize: pageSize,
            offset: offset,
          );

          expect(
            result.length,
            List.from(res['data']['draftOrders'])
                .where((e) => json.decode(e['itemlist']) != null)
                .map((e) => SavedOrderDto.fromJson(e).toDomain())
                .toList()
                .length,
          );
        },
      );

      test(
        'Create Draft Order',
        () async {
          Map<String, dynamic> removeUnnecessaryElement(
              Map<String, dynamic> input) {
            input.remove('id');

            return input;
          }

          final variables = {
            'input': {
              'data': removeUnnecessaryElement(draftOrder.toJson()),
            },
          };
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/createDraftOrderResponse.json'),
          );

          dioAdapter.onPost(
            '/api/strapiEngineMutation',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.createSavedOrder(),
              'variables': variables,
            }),
          );

          final result =
              await remoteDataSource.createDraftOrder(draftOrder: draftOrder);

          expect(
              result,
              SavedOrderDto.fromJson(res['data']['createDraftOrder'])
                  .toDomain());
        },
      );

      test(
        'Submit Order',
        () async {
          const submitOrder = SubmitOrderDto(
              userName: '',
              companyName: '',
              customer: SubmitOrderCustomerDto(
                  customerNumber: '',
                  customerNumberShipTo: '',
                  division: '',
                  salesOrganisation: ''),
              poReference: '',
              materials: [],
              poDate: '',
              requestedDeliveryDate: '',
              specialInstructions: '',
              purchaseOrderType: '',
              orderType: '',
              orderReason: '',
              shippingCondition: '',
              telephone: '',
              referenceNotes: '',
              paymentTerms: '',
              collectiveNumber: '',
              subscribeStatusChange: false,
              trackingLevel: '',
              blockOrder: false);
          final variables = {
            'order': submitOrder.toJson(),
          };

          final res = json.decode(
            await rootBundle.loadString('assets/json/submitOrderResponse.json'),
          );

          dioAdapter.onPost(
            '/api/orderMutation',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.submitOrder(),
              'variables': variables,
            }),
          );

          final result =
              await remoteDataSource.submitOrder(submitOrder: submitOrder);

          expect(
              result,
              SubmitOrderResponseDto.fromJson(res['data']['submitOrderTwo'])
                  .toDomain());
        },
      );

      test(
        'Delete Saved Order',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
                'assets/json/deleteSavedOrderTemplateResponse.json'),
          );

          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.deleteSavedOrder(),
              'variables': {
                'input': {
                  'where': {
                    'id': '1234',
                  },
                },
              },
            }),
          );

          final result =
              await remoteDataSource.deleteSavedOrder(itemId: '1234');

          expect(
              result,
              SavedOrderDto.fromJson(
                res['data']['deleteDraftOrder']['draftOrder'],
              ).toDomain());
        },
      );

      test(
        'statuscode not equla to 200',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getSavedOrdersResponse.json'),
          );

          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              205,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getSaveOrderHistory(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getSavedOrder(
            userId: userId,
            saleOrgName: saleOrgName,
            shipToCode: shipToCode,
            customerCode: customerCode,
            pageSize: pageSize,
            offset: offset,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<SavedOrderMock>[]);
          });
        },
      );

      test(
        'response with error',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getSavedOrdersResponse.json'),
          );

          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'}
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getSaveOrderHistory(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getSavedOrder(
            userId: userId,
            saleOrgName: saleOrgName,
            shipToCode: shipToCode,
            customerCode: customerCode,
            pageSize: pageSize,
            offset: offset,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<SavedOrderMock>[]);
          });
        },
      );
    },
  );
}
