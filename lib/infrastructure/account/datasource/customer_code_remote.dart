import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class CustomerCodeRemoteDataSource {
  HttpService httpService;
  CustomerCodeQueryMutation customerCodeQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  CustomerCodeRemoteDataSource({
    required this.httpService,
    required this.customerCodeQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<CustomerCodeInfo>> getCustomerCodeList({
    required String customerCode,
    required String salesOrg,
    required bool hidecustomer,
    required int pageSize,
    required int offset,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = customerCodeQueryMutation.getCustomerInfoBySearch();

      final variables = {
        'searchKey': customerCode,
        'salesOrganisation': salesOrg,
        'first': pageSize,
        'after': offset,
        'filterBlockCustomer': hidecustomer,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'customerInformationSearch',
      );
      _customerCodeExceptionChecker(res: res);

      final finalData =
          res.data['data']['customerInformationSearch']['SoldToInformation'];

      return List.from(finalData)
          .map((e) => CustomerCodeDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<List<CustomerCodeInfo>> getSalesRepCustomerCodeList({
    required String customerCode,
    required String salesOrg,
    required String userName,
    required int pageSize,
    required int offset,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = customerCodeQueryMutation.getCustomerListForSalesRep();

      final variables = {
        'salesOrganisation': salesOrg,
        'first': pageSize,
        'after': offset,
        'username': userName,
      };

      if (customerCode.isNotEmpty) {
        variables.putIfAbsent('searchKey', () => customerCode);
      }

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'customerListForSalesRep',
      );
      _customerCodeExceptionChecker(res: res);

      final finalData = res.data['data']['customerListForSalesRep'];

      return List.from(finalData)
          .map((e) => CustomerCodeDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _customerCodeExceptionChecker({required Response<dynamic> res}) {
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
