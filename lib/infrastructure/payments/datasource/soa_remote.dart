import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/soa_dto.dart';

class SoaRemoteDataSource {
  HttpService httpService;
  Config config;
  SoaRemoteDataSource({
    required this.httpService,
    required this.config,
  });

  Future<List<Soa>> getSoa(String customerCode) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}payment/listSoa',
      data: jsonEncode(
        {
          'customer_code': customerCode,
        },
      ),
    );
    _exceptionChecker(res: res);
    final data = res.data['data'];

    return List.from(data).map((e) => SoaDto.fromJson(e).toDomain()).toList();
  }

  void _exceptionChecker({
    required Response<dynamic> res,
  }) {
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
