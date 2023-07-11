import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/sales_org_id.dart';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/update_sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/update_sales_org/update_sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/update_sales_org/update_sales_organisation_configs_variable_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late UpdateSalesOrgRemoteDataSource remoteDataSource;
  late SalesOrg salesOrg;
  late SalesOrgId salesOrgId;
  late UpdateSalesOrganisationConfigs configs;
  late Map<String, dynamic> variableData;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = UpdateSalesOrgRemoteDataSource(
        httpService: service,
        updateSalesOrgQueryMutation: UpdateSalesOrgQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
      salesOrg = SalesOrg('2601');
      salesOrgId = const SalesOrgId(id: 10);
      configs = UpdateSalesOrganisationConfigs(
          salesOrg: salesOrg,
          poNumberRequired: false,
          priceOverride: true,
          expiryDateDisplay: true,
          batchNumDisplay: true,
          currency: Currency('sgd'),
          minOrderAmount: '100',
          vatValue: 8,
          netPriceOverride: true,
          languageFilter: false,
          languageValue: LanguageValue(''),
          materialWithoutPrice: true,
          enablePaymentTerms: false,
          enableMobileNumber: false,
          enableRemarks: true,
          enableListPrice: false,
          enableTaxDisplay: false,
          addOosMaterials: true,
          oosValue: OosValue(1),
          enableDefaultMD: false,
          enableZDP5: false,
          enableZDP8Override: false,
          enableGMC: false,
          enableGMN: false,
          enableBatchNumber: false,
          enableOHPrice: true,
          enableSpecialInstructions: true,
          enableReferenceNote: false,
          displayOrderDiscount: true,
          enableIRN: false,
          enableTaxClassification: false,
          disableBundles: false,
          disableProcessingStatus: false,
          disableOrderType: true,
          enableCollectiveNumber: false,
          enableGimmickMaterial: false,
          enableVat: false,
          hideCustomer: false,
          enableBillTo: false,
          disablePaymentTermsDisplay: false,
          hideStockDisplay: false,
          showPOAttachment: false,
          disableDeliveryDate: false,
          enableTaxAtTotalLevelOnly: true,
          enableGreenDelivery: false,
          greenDeliveryUserRole: GreenDeliveryUserRole(0),
          greenDeliveryDelayInDays: 2);
      variableData = UpdateSalesOrganisationConfigsVariableDto.fromDomain(
        salesOrgId,
        configs,
      ).toJson();
    },
  );

  group('Update Sales remote', () {
    test(
      'Update sales config',
      () async {
        final variableData =
            UpdateSalesOrganisationConfigsVariableDto.fromDomain(
          salesOrgId,
          configs,
        ).toJson();
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/updateSalesOrgConfigSGResponse.json'),
        );

        dioAdapter.onPost(
          '/api/strapiEngineMutation',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.updateSalesOrgQueryMutation
                .getUpdateSalesOrgConfigsQuery(),
            'variables': {'input': variableData},
          }),
        );
        final result = await remoteDataSource.updateSalesOrgConfig(
            variableData: variableData);
        final resTest = UpdateSalesOrganisationConfigsDto.fromJson(
          res['data']['updateSalesOrgConfig']['salesOrgConfig'],
        ).toDomain();
        expect(result.enableBatchNumber, resTest.enableBatchNumber);
      },
    );
    test(
      'Get sales config details is empty',
      () async {
        final res = {
          'data': {'updateSalesOrgConfig': {}}
        };

        dioAdapter.onPost(
          '/api/strapiEngineMutation',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.updateSalesOrgQueryMutation
                .getUpdateSalesOrgConfigsQuery(),
            'variables': {'input': variableData},
          }),
        );
        final result = await remoteDataSource.updateSalesOrgConfig(
            variableData: variableData);

        expect(result, UpdateSalesOrganisationConfigs.empty());
      },
    );

    test(
      'Get the server exception',
      () async {
        dioAdapter.onPost(
          '/api/strapiEngineMutation',
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
            'query': remoteDataSource.updateSalesOrgQueryMutation
                .getUpdateSalesOrgConfigsQuery(),
            'variables': {'input': variableData},
          }),
        );
        await remoteDataSource
            .updateSalesOrgConfig(variableData: variableData)
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(UpdateSalesOrganisationConfigs.empty());
        });
      },
    );
    test(
      'Status code != 200',
      () async {
        dioAdapter.onPost(
          '/api/strapiEngineMutation',
          (server) => server.reply(
            201,
            {
              'data': null,
              'errors': null,
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.updateSalesOrgQueryMutation
                .getUpdateSalesOrgConfigsQuery(),
            'variables': {'input': variableData},
          }),
        );
        await remoteDataSource
            .updateSalesOrgConfig(variableData: variableData)
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(UpdateSalesOrganisationConfigs.empty());
        });
      },
    );
  });
}
