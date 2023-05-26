import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/add_or_update_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/add_or_update_beneficiary_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_district_dto.dart';
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

  Future<List<BankBeneficiary>> getBankBeneficiaries() async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpay',
        data: jsonEncode({
          'query': bankBeneficiaryQueryMutation.getBankBeneficiaryQuery(),
          'variables': {'request': {}},
        }),
        apiEndpoint: 'bankBeneficiary',
      );
      _bankBeneficiaryExceptionChecker(res: res);

      return List.from(res.data['data']['bankBeneficiary'])
          .map((e) => BankBeneficiaryDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<List<SalesDistrict>> getSalesDistrict(
      {required SalesOrg salesOrg,}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpay',
        data: jsonEncode({
          'query': bankBeneficiaryQueryMutation.getSalesDistrictQuery(),
          'variables': {
            'request': {
              'salesOrg': salesOrg.getValue(),
            },
          },
        }),
        apiEndpoint: 'salesDistrict',
      );
      _bankBeneficiaryExceptionChecker(res: res);

      return List.from(res.data['data']['salesDistrict'])
          .map((e) => SalesDistrictDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<AddOrUpdateBeneficiary> addOrUpdateBeneficiary({
    required Map<String, dynamic> beneficiaryData,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final variables = {
          'input': beneficiaryData,
        };
        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}ezpay',
          data: jsonEncode(
            {
              'query':
                  bankBeneficiaryQueryMutation.addOrUpdateBeneficiaryQuery(),
              'variables': variables,
            },
          ),
          apiEndpoint: 'addBankBeneficiary',
        );
        _bankBeneficiaryExceptionChecker(res: res);

        return AddOrUpdateBeneficiaryDto.fromJson(
          res.data['data']['addBankBeneficiary'],
        ).toDomain();
      },
    );
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
