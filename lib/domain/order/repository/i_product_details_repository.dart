import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';

abstract class IProductDetailRepository {
  Future<Either<ApiFailure, MaterialInfo>> getProductDetail({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
  });

  Future<Either<ApiFailure, StockInfo>> getStockInfo({
    required MaterialNumber materialNumber,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
  });

  Future<Either<ApiFailure, List<MaterialInfo>>> getSimilarProduct({
    required MaterialNumber materialNumber,
    required PrincipalCode principalCode,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
  });

  Future<Either<ApiFailure, List<MaterialStockInfo>>> getStockInfoList({
    required List<MaterialInfo> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
  });

  Future<Either<ApiFailure, ProductDetailAggregate>> getItemProductMetaData({
    required ProductDetailAggregate productDetailAggregate,
  });
}
