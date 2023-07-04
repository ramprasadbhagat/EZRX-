import 'dart:convert';

import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/dtos/product_images_dto.dart';
import 'package:flutter/services.dart';

class ProductImageLocalDataSource {
  ProductImageLocalDataSource();

  Future<List<ProductImages>> getItemProductDetails() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getProductQueryResponse.json',
      ),
    );

    return List.from(data['data']['getProduct']['orderCloudProduct'])
        .map((e) => ProductImagesDto.fromJson(e).toDomain())
        .toList();
  }
}
