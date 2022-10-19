import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';

class BonusMaterialRemoteDataSource {
  HttpService httpService;
  BonusMaterialQueryMutation bonusQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  BonusMaterialRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.dataSourceExceptionHandler,
    required this.bonusQueryMutation,
  });
  Future<List<MaterialInfo>> getadditionalBonus({
    required String searchKey,
    required String salesOrganisation,
    required String customerCodeSoldTo,
    required String shipToCode,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}license',
          data: jsonEncode(
            {
              'query': bonusQueryMutation.getBonusItem(),
              'variables': {
                'customerCode': customerCodeSoldTo,
                'shipToCode': shipToCode,
                'salesOrganisation': salesOrganisation,
                'searchKey': searchKey,
              },
            },
          ),
        );

        _bonusExceptionChecker(res: res);
        // print(res.data['data']['additionalBonusMaterial']);
        // return MaterialDto.fromJson(
        //         res.data['data']['additionalBonusMaterial']['materials'])
        //     .toDomain();

        return List.from(
          res.data['data']['additionalBonusMaterial']['materials'],
        )
            .map(
              (e) => MaterialDto.fromJson(e).toDomain(),
            )
            .toList();
      },
    );
  }

  Future<List<MaterialInfo>> customerMaterialsForSalesRep({
    required String username,
    required String soldTo,
    required String shipTo,
    required String salesOrganisation,
    required bool gimmickMaterial,
    required String pickandpack,
    required String searchKey,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}license',
          data: jsonEncode(
            {
              'query': bonusQueryMutation.getBonusItemforSalesRep(),
              'variables': {
                'username': username,
                'customerSoldToCode': soldTo,
                'customerShipToCode': shipTo,
                'salesOrganisation': salesOrganisation,
                'gimmickMaterial': gimmickMaterial,
                'searchKey': searchKey,
                'pickAndPack': pickandpack,
              },
            },
          ),
        );

        _bonusExceptionChecker(res: res);

        return List.from(
          res.data['data']['customerMaterialsForSalesRep']['materials'],
        )
            .map(
              (e) => MaterialDto.fromJson(e).toDomain(),
            )
            .toList();
      },
    );
  }
}

void _bonusExceptionChecker({required Response<dynamic> res}) {
  if (res.statusCode != 200) {
    throw ServerException(
      code: res.statusCode ?? 0,
      message: res.statusMessage ?? '',
    );
  } else if (res.data['errors'] != null && res.data['data'] == null) {
    throw ServerException(message: res.data['errors'][0]['message']);
  }
}
