import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
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

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  late MaterialListRemoteDataSource remoteDataSource;
  final remoteConfigService = RemoteConfigServiceMock();
  const fakeMarket = 'fake-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);
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
      when(() => remoteConfigService.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      remoteDataSource = MaterialListRemoteDataSource(
        httpService: service,
        config: Config(),
        materialListQuery: MaterialsWithMetaQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        remoteConfigService: remoteConfigService,
      );
    },
  );

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
        'isMarketPlace': true,
        'isTender': true,
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
        'query':
            remoteDataSource.materialListQuery.getProductQuery(fakeConfigValue),
        'variables': variables,
      }),
    );

    final result = await remoteDataSource.getProductList(
      gimmickMaterial: false,
      isFavourite: false,
      type: '',
      isProductOffer: false,
      isCovidSelected: false,
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
      market: fakeMarket,
      isMarketPlace: true,
      isTender: true,
    );

    final finalData =
        makeResponseCamelCase(jsonEncode(res['data']['GetAllProducts']));
    expect(
      result,
      MaterialResponseDto.fromJson(finalData).toDomain(),
    );
  });

  test(
      'Get Product List exclude frommAddBonus and IsMarketPlace when they are false',
      () async {
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
        'query':
            remoteDataSource.materialListQuery.getProductQuery(fakeConfigValue),
        'variables': variables,
      }),
    );

    final result = await remoteDataSource.getProductList(
      gimmickMaterial: false,
      isFavourite: false,
      type: 'material',
      isProductOffer: false,
      isCovidSelected: false,
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
      market: fakeMarket,
      isMarketPlace: false,
      isTender: false,
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
        'query': remoteDataSource.materialListQuery
            .getProductDetailsQuery(fakeConfigValue),
        'variables': variables,
      }),
    );

    final result = await remoteDataSource.getProductDetails(
      customerCode: 'fake-customer-code',
      salesOrg: 'fake-sales-org',
      shipToCode: 'fake-shipto-code',
      type: 'bundle',
      code: 'fake_code',
      language: 'en',
      market: fakeMarket,
    );

    final finalData =
        makeResponseCamelCase(jsonEncode(res['data']['GetProductDetails']));
    expect(
      result,
      MaterialDto.fromJson(finalData).toDomain(),
    );
  });

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
              .getProductQuery(fakeConfigValue),
          'variables': variables,
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
        market: fakeMarket,
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
              {'message': 'fake-error'},
            ],
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.materialListQuery
              .getProductQuery(fakeConfigValue),
          'variables': variables,
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
        market: fakeMarket,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(MaterialResponseDto.fromJson(finalData).toDomain());
      });
    });
  });
}
