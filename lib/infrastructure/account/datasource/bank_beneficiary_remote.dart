import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class BankBeneficiaryRemoteDataSource {
  HttpService httpService;
  BankBeneficiaryQueryMutation bankBeneficiaryQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  BankBeneficiaryRemoteDataSource({
    required this.httpService,
    required this.bankBeneficiaryQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<BankBeneficiary>> getBankBeneficiariesBySaleOrg({
    required String salesOrg,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpay',
        data: jsonEncode(
          {
            'query': bankBeneficiaryQueryMutation.getBankBeneficiaryQuery(),
            'variables': {
              'request': {
                'salesOrg': salesOrg,
              },
            },
          },
        ),
        apiEndpoint: 'bankBeneficiary',
      );
      _bankBeneficiaryExceptionChecker(res: res);

      return List.from(res.data['data']['bankBeneficiary'])
          .map((e) => BankBeneficiaryDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _bankBeneficiaryExceptionChecker({required Response<dynamic> res}) {
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
