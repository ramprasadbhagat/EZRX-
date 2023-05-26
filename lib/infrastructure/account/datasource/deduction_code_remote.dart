import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/deduction_code_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class DeductionCodeRemoteDataSource {
  HttpService httpService;
  DeductionCodeQueryMutation deductionCodeQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  DeductionCodeRemoteDataSource({
    required this.httpService,
    required this.deductionCodeQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<DeductionCode>> getDeductionCodes() async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpay',
        data: jsonEncode({
          'query': deductionCodeQueryMutation.getDeductionCodesQuery(),
          'variables': {'request': {}},
        }),
        apiEndpoint: 'getDeductionCodes',
      );
      _deductionCodeExceptionChecker(res: res);

      return List.from(res.data['data']['deductionCodes'])
          .map((e) => DeductionCodeDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _deductionCodeExceptionChecker({required Response<dynamic> res}) {
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
