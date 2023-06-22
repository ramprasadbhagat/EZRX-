import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/material_add_favourite.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_remove_favourite.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_add_favourite_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_remove_favourite_dto.dart';
import 'package:flutter/services.dart';

class MaterialListLocalDataSource {
  MaterialListLocalDataSource();

  Future<List<MaterialInfo>> getMaterialList() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getMaterialsWithMetaResponse.json'),
    );
    final finalData = data['data']['materialsWithMeta']['materials'];

    return List.from(finalData)
        .map((e) => MaterialDto.fromJson(e).toDomain())
        .toList();
  }

  Future<MaterialResponse> getProductList() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getAllProductsResponse.json'),
    );
    final finalData = data['data']['GetAllProducts'];

    return MaterialResponseDto.fromJson(finalData).toDomain();
  }

  Future<List<MaterialInfo>> getMaterialListSalesRep() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getCustomerMaterialsForSalesRepResponse.json',
      ),
    );
    final finalData = data['data']['customerMaterialsForSalesRep']['materials'];

    return List.from(finalData)
        .map((e) => MaterialDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<MaterialInfo>> searchMaterialList() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getMaterialsWithMetaResponse.json'),
    );
    final finalData = data['data']['materialsWithMeta']['materials'];

    return List.from(finalData)
        .map((e) => MaterialDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<MaterialInfo>> searchMaterialListSalesRep() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getCustomerMaterialsForSalesRepResponse.json',
      ),
    );
    final finalData = data['data']['customerMaterialsForSalesRep']['materials'];

    return List.from(finalData)
        .map((e) => MaterialDto.fromJson(e).toDomain())
        .toList();
  }

  Future<MaterialInfo> getProductDetails() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getProductDetailsResponse.json',
      ),
    );
    final finalData = data['data']['GetProductDetails'];

    return MaterialDto.fromJson(finalData).toDomain();
  }


  Future<MaterialAddFavourite> addFavouriteMaterial() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/addFavouriteMaterialResponse.json',
      ),
    );
    final finalData = data['data'];

    return MaterialAddFavouriteDto.fromJson(finalData).toDomain();
  }

  Future<MaterialRemoveFavourite> removeFavouriteMaterial() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/removeFavouriteMaterialResponse.json',
      ),
    );
    final finalData = data['data'];

    return MaterialRemoveFavouriteDto.fromJson(finalData).toDomain();
  }
}
