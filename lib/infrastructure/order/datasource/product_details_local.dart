import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_detail_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_meta_data_dto.dart';
import 'package:flutter/services.dart';

class ProductDetailLocalDataSource {
  Future<MaterialInfo> getProductDetails() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/materialDetailsResponse.json'),
    );

    final finalData = res['data']['materialDetails'];

    return ProductDetailDto.fromJson(finalData).toDomain();
  }

  Future<List<MaterialInfo>> getSimilarProduct() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/similarSearchesResponse.json'),
    );

    final finalData = res['data']['similarSearches']['materials'];

    return List.from(finalData)
        .map((e) => MaterialDto.fromJson(e).toDomain())
        .toList();
  }

  Future<ProductMetaData> getItemProductMetaData() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getProductQueryResponse.json',
      ),
    );
    final finalData = data['data']['getProduct'];
    
    return ProductMetaDataDto.fromJson(finalData).toDomain();
  }
}
