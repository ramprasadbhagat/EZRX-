import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/product_image/datasource/product_image_query.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/dtos/product_images_dto.dart';

class ProductImageRemoteDataSource {
  HttpService httpService;
  ProductImageQuery productImageQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ProductImageRemoteDataSource({
    required this.httpService,
    required this.productImageQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<ProductImages>> getItemProductDetails({
    required List<String> materialIDs,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode(
        {
          'query': productImageQuery.getProductImage(),
          'variables': {
            'request': {
              'materialID': materialIDs,
            },
          },
        },
      ),
    );
    _exceptionChecker(res: res);
    final data = res.data['data']['getProduct']['orderCloudProduct'];

    return List.from(data)
        .map((e) => ProductImagesDto.fromJson(e).toDomain())
        .toList();
  }

  void _exceptionChecker({required Response<dynamic> res}) {
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
