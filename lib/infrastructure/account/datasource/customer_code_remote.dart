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

  Future<List<CustomerCodeInfo>> getCustomerCode({
    required String customerCode,
    required String salesOrg,
    required int paginate,
    required bool hidecustomer,
    required String loginUserType,
    required String userName,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = loginUserType == 'client'
          ? customerCodeQueryMutation.getCustomerInfoBySearch()
          : customerCodeQueryMutation.getCustomerListForSalesRep();

      final variables = {
        'searchKey': customerCode,
        'salesOrganisation': salesOrg,
        'first': 20,
        'after': paginate,
        'filterBlockCustomer': hidecustomer,
      };

      if (loginUserType != 'client') {
        variables.addEntries({MapEntry('username', userName)});
      }

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _customerCodeExceptionChecker(res: res);

      var finalData = loginUserType == 'client'
          ? res.data['data']['customerInformationSearch']['SoldToInformation']
          : res.data['data']['customerListForSalesRep'];

      return List.from(finalData)
          .map((e) => CustomerCodeDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _customerCodeExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['data'] == null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
