import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/infrastructure/core/encryption/encryption.dart';
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
  late Encryption encryption;

  late Map<String, Object> variables;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.my-ezrx.com',
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
      pageSize = 20;
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
        poAttachent: [],
      );
      encryption = Encryption();

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
      // test(
      //   'Get Saved order with invalid itemlist json',
      //   () async {
      //     final res = json.decode(
      //       await rootBundle
      //           .loadString('assets/json/getSavedOrdersResponse.json'),
      //     );

      //     dioAdapter.onPost(
      //       '/api/strapiEngine',
      //       (server) => server.reply(
      //         200,
      //         res,
      //         delay: const Duration(seconds: 1),
      //       ),
      //       headers: {'Content-Type': 'application/json; charset=utf-8'},
      //       data: jsonEncode({
      //         'query': remoteDataSource.queryMutation.getSaveOrderHistory(),
      //         'variables': variables,
      //       }),
      //     );

      //     final result = await remoteDataSource.getSavedOrder(
      //       userId: userId,
      //       saleOrgName: saleOrgName,
      //       shipToCode: shipToCode,
      //       customerCode: customerCode,
      //       pageSize: pageSize,
      //       offset: offset,
      //     );

      //     expect(
      //       result.length,
      //       List.from(res['data']['draftOrders'])
      //           .where((e) => json.decode(e['itemlist']) != null)
      //           .map((e) => SavedOrderDto.fromJson(e).toDomain())
      //           .toList()
      //           .length,
      //     );
      //   },
      // );

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

      ///Todo: revisit
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
              telephone: '',
              referenceNotes: '',
              paymentTerms: '',
              collectiveNumber: '',
              blockOrder: false,
              poDocuments: [],
              orderValue: 0,
              language: '',
              paymentMethod: '');
          final encryptedData =
              encryption.encryptionData(data: submitOrder.toJson());
          final variables = {
            'NewOrderInput': {
              'data': encryptedData.data,
              'hash': encryptedData.hash
            }
          };

          final res = json.decode(
            await rootBundle.loadString('assets/json/submitOrderResponse.json'),
          );

          dioAdapter.onPost(
            '/api/order',
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
          final result = await remoteDataSource.submitOrder(
              orderEncryption: encryptedData);

          expect(
              result,
              SubmitOrderResponseDto.fromJson(res['data']['submitOrder'])
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

      test(
        'Get Saved order Detail with 200 success response',
        () async {
          final json = jsonDecode(
            await rootBundle
                .loadString('assets/json/getSavedOrderDetailResponse.json'),
          );

          final fakeResponse = SavedOrderDto.fromJson(
            json['data']['draftOrder'],
          ).toDomain();

          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              json,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getSavedOrderDetail(),
              'variables': {
                'id': 'fake-id',
              },
            }),
          );

          final result = await remoteDataSource.getSavedOrderDetail(
            orderId: 'fake-id',
          );

          expect(
            result,
            fakeResponse,
          );
        },
      );

      test(
        'Get Saved order Detail with Error response',
        () async {
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
              'query': remoteDataSource.queryMutation.getSavedOrderDetail(),
              'variables': {
                'id': 'fake-id',
              },
            }),
          );

          await remoteDataSource
              .getSavedOrderDetail(
            orderId: 'fake-id',
          )
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return SavedOrder.empty();
          });
        },
      );

      test(
        'Update Saved order with 200 success response',
        () async {
          final json = jsonDecode(
            await rootBundle
                .loadString('assets/json/updateSavedOrderResponse.json'),
          );

          final fakeResponse = SavedOrderDto.fromJson(
            json['data']['updateDraftOrder'],
          ).toDomain();

          dioAdapter.onPost(
            '/api/strapiEngineMutation',
            (server) => server.reply(
              200,
              json,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.updateSavedOrder(),
              'variables': {
                'input': {
                  'data': SavedOrderDto.fromDomain(fakeResponse).toJson()
                    ..remove('id'),
                  'where': {
                    'id': fakeResponse.id,
                  },
                },
              },
            }),
          );

          final result = await remoteDataSource.updateDraftOrder(
              updatedOrder: SavedOrderDto.fromDomain(fakeResponse));

          expect(
            result,
            fakeResponse,
          );
        },
      );

      test(
        'Update Saved order with error response',
        () async {
          final json = jsonDecode(
            await rootBundle
                .loadString('assets/json/updateSavedOrderResponse.json'),
          );
          final fakeRequest = SavedOrderDto.fromJson(
            json['data']['updateDraftOrder'],
          ).toDomain();

          dioAdapter.onPost(
            '/api/strapiEngineMutation',
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
              'query': remoteDataSource.queryMutation.updateSavedOrder(),
              'variables': {
                'input': {
                  'data': SavedOrderDto.fromDomain(fakeRequest).toJson()
                    ..remove('id'),
                  'where': {
                    'id': fakeRequest.id,
                  },
                },
              },
            }),
          );

          await remoteDataSource
              .updateDraftOrder(
            updatedOrder: SavedOrderDto.fromDomain(fakeRequest),
          )
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return SavedOrder.empty();
          });
        },
      );
    },
  );
}
