import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
// import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MaterialInfoMock extends Mock implements MaterialInfo {}

void main() {
  late MaterialListRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = MaterialListRemoteDataSource(
        httpService: service,
        config: Config(),
        materialListQuery: MaterialsWithMetaQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  // group(
  //   'Material List',
  //   () {
  //     test('Search Material List', () async {
  //       final variables = {
  //         'salesOrganisation': 'fake-sales-org',
  //         'customerCode': 'fake-customer-code',
  //         'shipToCustomer': 'fake-shipto-code',
  //         'excludePrincipal': [],
  //         'plants': [],
  //         'first': 10,
  //         'after': 0,
  //         'cached': true,
  //         'searchKey': '',
  //         'orderBy': '',
  //         'language': 'fake-language',
  //         'principalNameList': <String>[],
  //         'therapeuticClassList': <String>[],
  //         'itemBrandList': <String>[],
  //         'isForFOC': false,
  //       };
  //       final res = json.decode(
  //         await rootBundle
  //             .loadString('assets/json/getMaterialsWithMetaResponse.json'),
  //       );
  //
  //       dioAdapter.onPost(
  //         '/api/license',
  //         (server) => server.reply(
  //           200,
  //           res,
  //           delay: const Duration(seconds: 1),
  //         ),
  //         headers: {'Content-Type': 'application/json; charset=utf-8'},
  //         data: jsonEncode({
  //           'query':
  //               remoteDataSource.materialListQuery.getCustomerMaterialList(),
  //           'variables': variables
  //         }),
  //       );
  //
  //       final result = await remoteDataSource.searchMaterialList(
  //         language: 'fake-language',
  //         customerCode: 'fake-customer-code',
  //         excludePrincipal: [],
  //         isForFOC: false,
  //         itemBrandList: [],
  //         offset: 0,
  //         orderBy: '',
  //         pageSize: 10,
  //         principalNameList: [],
  //         salesOrgCode: 'fake-sales-org',
  //         searchKey: '',
  //         shipToCode: 'fake-shipto-code',
  //         therapeuticClassList: [],
  //         selectedMaterialFilter: const MaterialFilter(
  //             uniquePrincipalName: [],
  //             uniqueTherapeuticClass: [],
  //             uniqueItemBrand: []),
  //       );
  //       final finalData = res['data']['materialsWithMeta']['materials'];
  //
  //       expect(
  //           result,
  //           List.from(finalData)
  //               .map((e) => MaterialDto.fromJson(e).toDomain())
  //               .toList());
  //     });
  //
  //     test('Search Material List for sales rep', () async {
  //       final variables = {
  //         'username': 'fake-username',
  //         'salesOrganisation': 'fake-sales-org',
  //         'customerSoldToCode': 'fake-customer-code',
  //         'customerShipToCode': 'fake-shipto-code',
  //         'excludePrincipal': [],
  //         'gimmickMaterial': false,
  //         'pickAndPack': '',
  //         'plants': [],
  //         'searchKey': '',
  //         'first': 10,
  //         'after': 0,
  //         'cached': true,
  //         'orderBy': '',
  //         'language': 'fake-language',
  //         'principalNameList': [],
  //         'therapeuticClassList': [],
  //         'itemBrandList': [],
  //       };
  //       final res = json.decode(
  //         await rootBundle.loadString(
  //             'assets/json/getCustomerMaterialsForSalesRepResponse.json'),
  //       );
  //
  //       dioAdapter.onPost(
  //         '/api/license',
  //         (server) => server.reply(
  //           200,
  //           res,
  //           delay: const Duration(seconds: 1),
  //         ),
  //         headers: {'Content-Type': 'application/json; charset=utf-8'},
  //         data: jsonEncode({
  //           'query':
  //               remoteDataSource.materialListQuery.getSalesRepMaterialList(),
  //           'variables': variables
  //         }),
  //       );
  //
  //       final result = await remoteDataSource.searchMaterialListSalesRep(
  //         language: 'fake-language',
  //         customerCode: 'fake-customer-code',
  //         excludePrincipal: [],
  //         isForFOC: false,
  //         userName: 'fake-username',
  //         gimmickMaterial: false,
  //         pickAndPack: '',
  //         offset: 0,
  //         orderBy: '',
  //         pageSize: 10,
  //         salesOrgCode: 'fake-sales-org',
  //         searchKey: '',
  //         shipToCode: 'fake-shipto-code',
  //         selectedMaterialFilter: const MaterialFilter(
  //             uniquePrincipalName: [],
  //             uniqueTherapeuticClass: [],
  //             uniqueItemBrand: []),
  //       );
  //       final finalData =
  //           res['data']['customerMaterialsForSalesRep']['materials'];
  //
  //       expect(
  //           result,
  //           List.from(finalData)
  //               .map((e) => MaterialDto.fromJson(e).toDomain())
  //               .toList());
  //     });
  //
  //     test('Get Material List', () async {
  //       final variables = {
  //         'salesOrganisation': 'fake-sales-org',
  //         'customerCode': 'fake-customer-code',
  //         'shipToCustomer': 'fake-shipto-code',
  //         'excludePrincipal': [],
  //         'plants': [],
  //         'searchKey': '',
  //         'first': 10,
  //         'after': 0,
  //         'cached': true,
  //         'orderBy': '',
  //         'language': 'fake-language',
  //         'principalNameList': [],
  //         'therapeuticClassList': [],
  //         'itemBrandList': [],
  //         'isForFOC': false,
  //       };
  //       final res = json.decode(
  //         await rootBundle
  //             .loadString('assets/json/getMaterialsWithMetaResponse.json'),
  //       );
  //
  //       dioAdapter.onPost(
  //         '/api/license',
  //         (server) => server.reply(
  //           200,
  //           res,
  //           delay: const Duration(seconds: 1),
  //         ),
  //         headers: {'Content-Type': 'application/json; charset=utf-8'},
  //         data: jsonEncode({
  //           'query':
  //               remoteDataSource.materialListQuery.getCustomerMaterialList(),
  //           'variables': variables
  //         }),
  //       );
  //
  //       final result = await remoteDataSource.getMaterialList(
  //         language: 'fake-language',
  //         customerCode: 'fake-customer-code',
  //         excludePrincipal: [],
  //         isForFOC: false,
  //         itemBrandList: [],
  //         offset: 0,
  //         orderBy: '',
  //         pageSize: 10,
  //         principalNameList: [],
  //         salesOrgCode: 'fake-sales-org',
  //         searchKey: '',
  //         shipToCode: 'fake-shipto-code',
  //         therapeuticClassList: [],
  //       );
  //       final finalData = res['data']['materialsWithMeta']['materials'];
  //
  //       expect(
  //           result,
  //           List.from(finalData)
  //               .map((e) => MaterialDto.fromJson(e).toDomain())
  //               .toList());
  //     });
  //
  //     test('Get Material List for sales rep', () async {
  //       final variables = {
  //         'username': 'fake-username',
  //         'salesOrganisation': 'fake-sales-org',
  //         'customerSoldToCode': 'fake-customer-code',
  //         'customerShipToCode': 'fake-shipto-code',
  //         'searchKey': '',
  //         'excludePrincipal': [],
  //         'gimmickMaterial': false,
  //         'pickAndPack': '',
  //         'plants': [],
  //         'first': 10,
  //         'after': 0,
  //         'cached': true,
  //         'orderBy': '',
  //         'language': 'fake-language',
  //         'principalNameList': [],
  //         'therapeuticClassList': [],
  //         'itemBrandList': [],
  //         'isSample': false,
  //         'isForFOC': false,
  //       };
  //       final res = json.decode(
  //         await rootBundle.loadString(
  //             'assets/json/getCustomerMaterialsForSalesRepResponse.json'),
  //       );
  //
  //       dioAdapter.onPost(
  //         '/api/license',
  //         (server) => server.reply(
  //           200,
  //           res,
  //           delay: const Duration(seconds: 1),
  //         ),
  //         headers: {'Content-Type': 'application/json; charset=utf-8'},
  //         data: jsonEncode({
  //           'query':
  //               remoteDataSource.materialListQuery.getSalesRepMaterialList(),
  //           'variables': variables
  //         }),
  //       );
  //
  //       final result = await remoteDataSource.getMaterialListSalesRep(
  //         language: 'fake-language',
  //         customerCode: 'fake-customer-code',
  //         excludePrincipal: [],
  //         isForFOC: false,
  //         userName: 'fake-username',
  //         gimmickMaterial: false,
  //         pickAndPack: '',
  //         offset: 0,
  //         orderBy: '',
  //         pageSize: 10,
  //         salesOrgCode: 'fake-sales-org',
  //         searchKey: '',
  //         shipToCode: 'fake-shipto-code',
  //         isSample: false,
  //         itemBrandList: [],
  //         principalNameList: [],
  //         therapeuticClassList: [],
  //       );
  //       final finalData =
  //           res['data']['customerMaterialsForSalesRep']['materials'];
  //
  //       expect(
  //           result,
  //           List.from(finalData)
  //               .map((e) => MaterialDto.fromJson(e).toDomain())
  //               .toList());
  //     });
  //
  //     test('Status Not Equal To 200', () async {
  //       final variables = {
  //         'username': 'fake-username',
  //         'salesOrganisation': 'fake-sales-org',
  //         'customerSoldToCode': 'fake-customer-code',
  //         'customerShipToCode': 'fake-shipto-code',
  //         'excludePrincipal': [],
  //         'gimmickMaterial': false,
  //         'pickAndPack': '',
  //         'plants': [],
  //         'searchKey': '',
  //         'first': 10,
  //         'after': 0,
  //         'cached': true,
  //         'orderBy': '',
  //         'language': 'fake-language',
  //         'principalNameList': [],
  //         'therapeuticClassList': [],
  //         'itemBrandList': [],
  //       };
  //
  //       dioAdapter.onPost(
  //         '/api/license',
  //         (server) => server.reply(
  //           204,
  //           {'data': []},
  //           delay: const Duration(seconds: 1),
  //         ),
  //         headers: {'Content-Type': 'application/json; charset=utf-8'},
  //         data: jsonEncode({
  //           'query':
  //               remoteDataSource.materialListQuery.getSalesRepMaterialList(),
  //           'variables': variables
  //         }),
  //       );
  //
  //       await remoteDataSource
  //           .searchMaterialListSalesRep(
  //         language: 'fake-language',
  //         customerCode: 'fake-customer-code',
  //         excludePrincipal: [],
  //         isForFOC: false,
  //         userName: 'fake-username',
  //         gimmickMaterial: false,
  //         pickAndPack: '',
  //         offset: 0,
  //         orderBy: '',
  //         pageSize: 10,
  //         salesOrgCode: 'fake-sales-org',
  //         searchKey: '',
  //         shipToCode: 'fake-shipto-code',
  //         selectedMaterialFilter: const MaterialFilter(
  //             uniquePrincipalName: [],
  //             uniqueTherapeuticClass: [],
  //             uniqueItemBrand: []),
  //       )
  //           .onError((error, _) async {
  //         expect(error, isA<ServerException>());
  //         return Future.value(<MaterialInfoMock>[]);
  //       });
  //     });
  //
  //     test('response with error', () async {
  //       final variables = {
  //         'username': 'fake-username',
  //         'salesOrganisation': 'fake-sales-org',
  //         'customerSoldToCode': 'fake-customer-code',
  //         'customerShipToCode': 'fake-shipto-code',
  //         'excludePrincipal': [],
  //         'gimmickMaterial': false,
  //         'pickAndPack': '',
  //         'plants': [],
  //         'searchKey': '',
  //         'first': 10,
  //         'after': 0,
  //         'cached': true,
  //         'orderBy': '',
  //         'language': 'fake-language',
  //         'principalNameList': [],
  //         'therapeuticClassList': [],
  //         'itemBrandList': [],
  //       };
  //
  //       dioAdapter.onPost(
  //         '/api/license',
  //         (server) => server.reply(
  //           200,
  //           {
  //             'data': null,
  //             'errors': [
  //               {'message': 'fake-error'}
  //             ],
  //           },
  //           delay: const Duration(seconds: 1),
  //         ),
  //         headers: {'Content-Type': 'application/json; charset=utf-8'},
  //         data: jsonEncode({
  //           'query':
  //               remoteDataSource.materialListQuery.getSalesRepMaterialList(),
  //           'variables': variables
  //         }),
  //       );
  //
  //       await remoteDataSource
  //           .searchMaterialListSalesRep(
  //         language: 'fake-language',
  //         customerCode: 'fake-customer-code',
  //         excludePrincipal: [],
  //         isForFOC: false,
  //         userName: 'fake-username',
  //         gimmickMaterial: false,
  //         pickAndPack: '',
  //         offset: 0,
  //         orderBy: '',
  //         pageSize: 10,
  //         salesOrgCode: 'fake-sales-org',
  //         searchKey: '',
  //         shipToCode: 'fake-shipto-code',
  //         selectedMaterialFilter: const MaterialFilter(
  //             uniquePrincipalName: [],
  //             uniqueTherapeuticClass: [],
  //             uniqueItemBrand: []),
  //       )
  //           .onError((error, _) async {
  //         expect(error, isA<ServerException>());
  //         return Future.value(<MaterialInfoMock>[]);
  //       });
  //     });
  //   },
  // );

  group('Combo deal material list', () {
    test('get successfully', () async {
      final variables = {
        'salesOrganisation': 'fake-sales-org',
        'customerCode': 'fake-customer-code',
        'shipToCustomer': 'fake-shipto-code',
        'first': 10,
        'after': 0,
        'principalNameList': ['fake-name'],
      };
      final res = json.decode(
        await rootBundle
            .loadString('assets/json/getMaterialsWithMetaResponse.json'),
      );

      dioAdapter.onPost(
        '/api/license',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery.comboDealMaterials,
          'variables': variables
        }),
      );

      final result = await remoteDataSource.getComboDealMaterials(
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: 10,
        principalNameList: ['fake-name'],
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
      );
      final finalData = res['data']['materialsWithMeta']['materials'];

      expect(
        result,
        List.from(finalData)
            .map((e) => MaterialDto.fromJson(e).toDomain())
            .toList(),
      );
    });

    test('get failure', () async {
      final variables = {
        'salesOrganisation': 'fake-sales-org',
        'customerCode': 'fake-customer-code',
        'shipToCustomer': 'fake-shipto-code',
        'first': 10,
        'after': 0,
        'principalNameList': ['fake-name'],
      };

      dioAdapter.onPost(
        '/api/license',
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
          'query': remoteDataSource.materialListQuery.comboDealMaterials,
          'variables': variables
        }),
      );

      await remoteDataSource
          .getComboDealMaterials(
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: 10,
        principalNameList: ['fake-name'],
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(<MaterialInfoMock>[]);
      });
    });

    test('get successfully for salesRep', () async {
      final variables = {
        'salesOrganisation': 'fake-sales-org',
        'customerSoldToCode': 'fake-customer-code',
        'customerShipToCode': 'fake-shipto-code',
        'first': 10,
        'after': 0,
        'principalNameList': ['fake-name'],
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/getCustomerMaterialsForSalesRepResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/license',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query':
              remoteDataSource.materialListQuery.comboDealMaterialsForSaleRep,
          'variables': variables
        }),
      );

      final result = await remoteDataSource.getComboDealMaterialsForSaleRep(
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: 10,
        principalNameList: ['fake-name'],
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
      );
      final finalData =
          res['data']['customerMaterialsForSalesRep']['materials'];

      expect(
        result,
        List.from(finalData)
            .map((e) => MaterialDto.fromJson(e).toDomain())
            .toList(),
      );
    });

    test('get failure for salesRep', () async {
      final variables = {
        'salesOrganisation': 'fake-sales-org',
        'customerSoldToCode': 'fake-customer-code',
        'customerShipToCode': 'fake-shipto-code',
        'first': 10,
        'after': 0,
        'principalNameList': ['fake-name'],
      };

      dioAdapter.onPost(
        '/api/license',
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
          'query':
              remoteDataSource.materialListQuery.comboDealMaterialsForSaleRep,
          'variables': variables
        }),
      );

      await remoteDataSource
          .getComboDealMaterialsForSaleRep(
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: 10,
        principalNameList: ['fake-name'],
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(<MaterialInfoMock>[]);
      });
    });
  });
}
