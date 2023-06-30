import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/datasource/product_images_query.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/dtos/product_images_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class ProductImagesRemoteDataSource {
  HttpService httpService;
  ProductImagesQuery productImageQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  ProductImagesRemoteDataSource({
    required this.httpService,
    required this.productImageQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<ProductImages>> getProductImages({
    required List materialNumbers,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode(
        {
          'query': productImageQuery.getProduct(),
          'variables': {
            'request': {
              'materialID': materialNumbers,
            },
          },
        },
      ),
    );
    _exceptionChecker(property: 'getProduct', res: res);
    final data = res.data['data']['getProduct']['orderCloudProduct'];

    return List.from(data)
        .map((e) => ProductImagesDto.fromJson(e).toDomain())
        .toList();
  }

  void _exceptionChecker({
    required String property,
    required Response<dynamic> res,
  }) {
    final data = res.data;
    if (data['errors'] != null && data['errors'].isNotEmpty) {
      throw ServerException(message: data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (data['data'] == null || data['data'][property] == null) {
      throw ServerException(message: 'Some thing went wrong');
    }
  }
}
