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
      var queryData = loginUserType == 'client'
          ? customerCodeQueryMutation.getCustomerInfoBySearch(
              customerCode,
              salesOrg,
              paginate,
              hidecustomer,
            )
          : customerCodeQueryMutation.getCustomerListForSalesRep(
              userName,
              customerCode,
              salesOrg,
              paginate,
              hidecustomer,
            );
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
        }),
      );
      _customerCodeExceptionChecker(res: res);

      return List.from(res.data['data']['customerInformationSearch']
              ['SoldToInformation'])
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
