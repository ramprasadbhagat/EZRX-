import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_aggregate.freezed.dart';

@freezed
class ProductDetailAggregate with _$ProductDetailAggregate {
  const ProductDetailAggregate._();
  factory ProductDetailAggregate({
    required MaterialInfo materialInfo,
    required ProductItem productItem,
    required List<MaterialInfo> similarProduct,
    required StockInfo stockInfo,
  }) = _ProductDetailAggregate;

  factory ProductDetailAggregate.empty() => ProductDetailAggregate(
        materialInfo: MaterialInfo.empty(),
        productItem: ProductItem.empty(),
        similarProduct: <MaterialInfo>[],
        stockInfo: StockInfo.empty(),
      );
  
  bool get productDetailsAvailable =>
      productItem != ProductItem.empty() ||
      materialInfo.productImages.description.isValid();
  
}
