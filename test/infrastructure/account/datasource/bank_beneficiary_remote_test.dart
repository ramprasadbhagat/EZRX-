import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_response_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_district_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class BankBeneficiaryMock extends Mock implements BankBeneficiary {}

class SalesDistrictMock extends Mock implements SalesDistrict {}

class BankBeneficiaryResponseMock extends Mock
    implements BankBeneficiaryResponse {}

void main() {
  late BankBeneficiaryRemoteDataSource remoteDataSource;
  late String salesOrg;
  late BankBeneficiary bankBeneficiary;

  late Map<String, dynamic> getBankBeneficiaryVariables;
  late Map<String, dynamic> getSalesDistricts;
  late Map<String, dynamic> getAddOrUpdateBeneficiaryVariable;
  late Map<String, dynamic> getDeleteBeneficiaryVariable;

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
      remoteDataSource = BankBeneficiaryRemoteDataSource(
        httpService: service,
        bankBeneficiaryQueryMutation: BankBeneficiaryQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: locator.get<Config>(),
      );
      salesOrg = '3050';
      bankBeneficiary = BankBeneficiary.empty().copyWith(
        salesOrg: SalesOrg(salesOrg),
        salesDistrict: 'HCM',
        beneficiaryName: StringValue('TestName'),
        bankAccount: StringValue('435464324454'),
        bankAddress: 'TestAddress',
        bankName: StringValue('Test Bank'),
        branch: 'TestBranch',
        bankCode: 'HENS45958554',
        hdbcSwiftCode: 'GDH493843',
        payNowUen: 'Pay',
        emailId: EmailAddress('abc@gmail.com'),
      );
      getBankBeneficiaryVariables = {'request': {}};
      getSalesDistricts = {
        'variables': {
          'request': {
            'salesOrg': salesOrg,
          },
        },
      };
      getAddOrUpdateBeneficiaryVariable =
          BankBeneficiaryDto.fromDomain(bankBeneficiary).toJson();
      getDeleteBeneficiaryVariable = {
          'input': {
            'salesOrg': salesOrg,
            'salesDistrict': 'HCM',
          },
      };
    },
  );

  group('Bank Beneficiary Remote for getBankBeneficiaries', () {
    test(
      '=> Success',
      () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getManageBankBenificiary.json'),
        );

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.bankBeneficiaryQueryMutation
                .getBankBeneficiaryQuery(),
            'variables': getBankBeneficiaryVariables,
          }),
        );

        final result = await remoteDataSource.getBankBeneficiaries();
        expect(
          result.length,
          List.from(res['data']['bankBeneficiary'])
              .map((e) => BankBeneficiaryDto.fromJson(e).toDomain())
              .toList()
              .length,
        );
      },
    );

    test(
      '=> Failure',
      () async {
        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.bankBeneficiaryQueryMutation
                .getBankBeneficiaryQuery(),
            'variables': getBankBeneficiaryVariables,
          }),
        );

        await remoteDataSource.getBankBeneficiaries().onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<BankBeneficiaryMock>[]);
        });
      },
    );
  });
  group('Bank Beneficiary Remote for getSalesDistrict', () {
    test(
      '=> Success',
      () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getSalesDistrictResponse.json'),
        );

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.bankBeneficiaryQueryMutation
                .getSalesDistrictQuery(),
            'variables': getSalesDistricts,
          }),
        );

        final result = await remoteDataSource.
              getSalesDistrict(salesOrg: salesOrg);
        expect(
          result.length,
          List.from(res['data']['salesDistrict'])
            .map((e) => SalesDistrictDto.fromJson(e).toDomain())
            .toList().length,
        );
      },
    );

    test(
      '=> Failure',
      () async {
        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.bankBeneficiaryQueryMutation
                .getSalesDistrictQuery(),
            'variables': getSalesDistricts,
          }),
        );

        await remoteDataSource.getSalesDistrict(salesOrg: salesOrg)
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<SalesDistrictMock>[]);
        });
      },
    );
  });

  group('Bank Beneficiary Remote for addOrUpdateBeneficiary', () {
    test(
      '=> Success',
      () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/addOrUpdateBeneficiaryResponse.json'),
        );

        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.bankBeneficiaryQueryMutation
                .addOrUpdateBeneficiaryQuery(),
            'variables': getAddOrUpdateBeneficiaryVariable,
          }),
        );

        final result = await remoteDataSource.
          addOrUpdateBeneficiary(beneficiaryData: getAddOrUpdateBeneficiaryVariable);
        expect(
          result.info,
          BankBeneficiaryResponseDto.fromJson(
          res['data']['addBankBeneficiary'],).toDomain().info,
        );
      },
    );

    test(
      '=> Failure',
      () async {
        dioAdapter.onPost(
          '/api/ezpay',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.bankBeneficiaryQueryMutation
                .addOrUpdateBeneficiaryQuery(),
            'variables': getAddOrUpdateBeneficiaryVariable,
          }),
        );

        await remoteDataSource. addOrUpdateBeneficiary(
          beneficiaryData:getAddOrUpdateBeneficiaryVariable
          ).onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(BankBeneficiaryResponseMock());
        });
      },
    );
  });

  group('Bank Beneficiary Remote for deleteBeneficiary', () {
    test(
      '=> Success',
      () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/deleteBeneficiaryResponse.json'),
        );

        dioAdapter.onPost(
          '/api/ezpayMutation',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.bankBeneficiaryQueryMutation
                .deleteBeneficiaryQuery(),
            'variables': getDeleteBeneficiaryVariable,
          }),
        );

        final result = await remoteDataSource.
          deleteBeneficiary(salesOrg: salesOrg,salesDistrict: 'HCM');
        expect(
          result.info,
          BankBeneficiaryResponseDto.fromJson(
          res['data']['deleteBankBeneficiary'],).toDomain().info,
        );
      },
    );

    test(
      '=> Failure',
      () async {
        dioAdapter.onPost(
          '/api/ezpayMutation',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.bankBeneficiaryQueryMutation
                .deleteBeneficiaryQuery(),
            'variables': getDeleteBeneficiaryVariable,
          }),
        );

        await remoteDataSource.
          deleteBeneficiary(salesOrg: salesOrg,salesDistrict: 'HCM')
          .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(BankBeneficiaryResponseMock());
        });
      },
    );
  });
}
