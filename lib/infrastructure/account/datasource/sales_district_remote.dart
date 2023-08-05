import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/manage_sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_district_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_district_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/manage_sales_district_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class SalesDistrictRemoteDataSource {
  HttpService httpService;
  SalesDistrictQueryMutation salesDistrictQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  SalesDistrictRemoteDataSource({
    required this.httpService,
    required this.salesDistrictQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<SalesDistrict>> getSalesDistrictList() async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpay',
        data: jsonEncode({
          'query': salesDistrictQueryMutation.getSalesDistrictQuery(),
          'variables': {'request': {}},
        }),
        apiEndpoint: 'salesDistrict',
      );
      _salesDistrictExceptionChecker(res: res);

      return List.from(res.data['data']['salesDistrict'])
          .map((e) => SalesDistrictDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<SalesDistrictResponseMessage> addSalesDistrict({
    required String salesOrg,
    required String salesDistrict,
    required String salesDistrictLabel,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpayMutation',
        data: jsonEncode({
          'query': salesDistrictQueryMutation.manageSalesDistrictQuery(),
          'variables': {
            'input': {
              'salesOrg': salesOrg,
              'salesDistrict': salesDistrict,
              'salesDistrictLabel': salesDistrictLabel,
            },
          },
        }),
        apiEndpoint: 'addSalesDistrict',
      );
      _salesDistrictExceptionChecker(res: res);

      return ManageSalesDistrictDto.fromJson(
        res.data['data']['addSalesDistrict'],
      ).toDomain();
    });
  }

  Future<SalesDistrictResponseMessage> editSalesDistrict({
    required int id,
    required String salesOrg,
    required String salesDistrict,
    required String salesDistrictLabel,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpayMutation',
        data: jsonEncode({
          'query': salesDistrictQueryMutation.manageSalesDistrictQuery(),
          'variables': {
            'input': {
              'id': id,
              'salesOrg': salesOrg,
              'salesDistrict': salesDistrict,
              'salesDistrictLabel': salesDistrictLabel,
            },
          },
        }),
        apiEndpoint: 'addSalesDistrict',
      );
      _salesDistrictExceptionChecker(res: res);

      return ManageSalesDistrictDto.fromJson(
        res.data['data']['addSalesDistrict'],
      ).toDomain();
    });
  }

  Future<SalesDistrictResponseMessage> deleteSalesDistrict({
    required int id,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpayMutation',
        data: jsonEncode({
          'query': salesDistrictQueryMutation.deleteSalesDistrictQuery(),
          'variables': {
            'id': id,
          },
        }),
        apiEndpoint: 'deleteSalesDistrict',
      );
      _salesDistrictExceptionChecker(res: res);

      return ManageSalesDistrictDto.fromJson(
        res.data['data']['deleteSalesDistrict'],
      ).toDomain();
    });
  }

  void _salesDistrictExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
