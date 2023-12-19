import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

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
  test('Get Product List', () async {
    final variables = {
      'request': {
        'After': 0,
        'Customer': 'fake-customer-code',
        'First': 24,
        'Language': 'fake-language',
        'OrderByName': '',
        'SalesOrg': 'fake-sales-org',
        'ShipTo': 'fake-shipto-code',
        'isGimmick': false,
        'SearchKey': '',
        'fromAddBonus': true,
      },
    };
    final res = json.decode(
      await rootBundle.loadString('assets/json/getAllProductsResponse.json'),
    );

    dioAdapter.onPost(
      '/api/price',
      (server) => server.reply(
        200,
        res,
        delay: const Duration(seconds: 1),
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      data: jsonEncode({
        'query': remoteDataSource.materialListQuery.getProductQuery(),
        'variables': variables
      }),
    );

    final result = await remoteDataSource.getProductList(
      gimmickMaterial: false,
      isFavourite: false,
      bundleOffers: false,
      isProductOffer: false,
      isFOCMaterial: false,
      orderByName: '',
      orderByPrice: '',
      manufactureList: <String>[],
      countryListCode: <String>[],
      principalCode: '',
      language: 'fake-language',
      customerCode: 'fake-customer-code',
      offset: 0,
      pageSize: 24,
      salesOrgCode: 'fake-sales-org',
      shipToCode: 'fake-shipto-code',
      searchKey: '',
      salesDeal: [],
      isComboOffers: false,
      showSampleItem: true,
    );

    final finalData =
        makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));
    expect(
      result,
      MaterialResponseDto.fromJson(finalData).toDomain(),
    );
  });

  test('Get Product List exclude frommAddBonus when it is false', () async {
    final variables = {
      'request': {
        'After': 0,
        'Customer': 'fake-customer-code',
        'First': 24,
        'Language': 'fake-language',
        'OrderByName': '',
        'SalesOrg': 'fake-sales-org',
        'ShipTo': 'fake-shipto-code',
        'isGimmick': false,
        'SearchKey': '',
      },
    };
    final res = json.decode(
      await rootBundle.loadString('assets/json/getAllProductsResponse.json'),
    );

    dioAdapter.onPost(
      '/api/price',
      (server) => server.reply(
        200,
        res,
        delay: const Duration(seconds: 1),
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      data: jsonEncode({
        'query': remoteDataSource.materialListQuery.getProductQuery(),
        'variables': variables
      }),
    );

    final result = await remoteDataSource.getProductList(
      gimmickMaterial: false,
      isFavourite: false,
      bundleOffers: false,
      isProductOffer: false,
      isFOCMaterial: false,
      orderByName: '',
      orderByPrice: '',
      manufactureList: <String>[],
      countryListCode: <String>[],
      principalCode: '',
      language: 'fake-language',
      customerCode: 'fake-customer-code',
      offset: 0,
      pageSize: 24,
      salesOrgCode: 'fake-sales-org',
      shipToCode: 'fake-shipto-code',
      searchKey: '',
      salesDeal: [],
      isComboOffers: false,
      showSampleItem: false,
    );

    final finalData =
        makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));
    expect(
      result,
      MaterialResponseDto.fromJson(finalData).toDomain(),
    );
  });

  test('Get Product Details', () async {
    final variables = {
      'request': {
        'Code': 'fake_code',
        'Customer': 'fake-customer-code',
        'SalesOrg': 'fake-sales-org',
        'ShipTo': 'fake-shipto-code',
        'Type': 'bundle',
      },
    };
    final res = json.decode(
      await rootBundle.loadString('assets/json/getProductDetailsResponse.json'),
    );

    dioAdapter.onPost(
      '/api/price',
      (server) => server.reply(
        200,
        res,
        delay: const Duration(seconds: 1),
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      data: jsonEncode({
        'query': remoteDataSource.materialListQuery.getProductDetailsQuery(),
        'variables': variables
      }),
    );

    final result = await remoteDataSource.getProductDetails(
      customerCode: 'fake-customer-code',
      salesOrg: 'fake-sales-org',
      shipToCode: 'fake-shipto-code',
      type: 'bundle',
      code: 'fake_code',
      language: 'en',
    );

    final finalData =
        makeResponseCamelCase(jsonEncode(res['data']['GetProductDetails']));
    expect(
      result,
      MaterialDto.fromJson(finalData).toDomain(),
    );
  });
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

  group('Combo deal material list with principal', () {
    test('get successfully', () async {
      final variables = {
        'After': 0,
        'Customer': 'fake-customer-code',
        'First': 24,
        'Language': 'fake-language',
        'SalesOrg': 'fake-sales-org',
        'ShipTo': 'fake-shipto-code',
        'principalCodeList': ['fake-principal-code'],
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/getComboDealDetailForPrincipleResponseK5.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getComboDealPrincipalMaterialsQuery(),
          'variables': variables
        }),
      );

      final result = await remoteDataSource.getComboDealMaterialsPrincipalCode(
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: 24,
        principalCodeList: ['fake-principal-code'],
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        language: 'fake-language',
      );
      final finalData =
          makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));

      expect(
        result,
        MaterialResponseDto.fromJson(finalData).toDomain(),
      );
    });

    test('get failure', () async {
      final variables = {
        'After': 0,
        'Customer': 'fake-customer-code',
        'First': 24,
        'Language': 'fake-language',
        'SalesOrg': 'fake-sales-org',
        'ShipTo': 'fake-shipto-code',
        'principalCodeList': ['fake-principal-code'],
      };
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/getComboDealDetailForPrincipleResponseK5.json',
        ),
      );

      dioAdapter.onPost(
        '/api/price',
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
          'query': remoteDataSource.materialListQuery
              .getComboDealPrincipalMaterialsQuery(),
          'variables': variables
        }),
      );

      final finalData =
          makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));

      await remoteDataSource
          .getComboDealMaterialsPrincipalCode(
        customerCode: 'fake-customer-code',
        offset: 0,
        pageSize: 24,
        principalCodeList: ['fake-principal-code'],
        salesOrgCode: 'fake-sales-org',
        shipToCode: 'fake-shipto-code',
        language: 'fake-language',
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(MaterialResponseDto.fromJson(finalData).toDomain());
      });
    });
  });
}
