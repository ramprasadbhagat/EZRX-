import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_details.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_aggregate.freezed.dart';

@freezed
class ProductDetailAggregate with _$ProductDetailAggregate {
  const ProductDetailAggregate._();
  factory ProductDetailAggregate({
    required ProductDetail productDetail,
    required ProductImages productImages,
    required ProductItem productItem,
    required List<MaterialInfo> similarProduct,
    required StockInfo stockInfo,
  }) = _ProductDetailAggregate;

  factory ProductDetailAggregate.empty() => ProductDetailAggregate(
        productDetail: ProductDetail.empty(),
        productImages: ProductImages.empty(),
        productItem: ProductItem.empty(),
        similarProduct: <MaterialInfo>[],
        stockInfo: StockInfo.empty(),
      );

  MaterialNumber get materialNumber => productDetail.materialNumber;
  MaterialInfo get materialInfo => productDetail.toMaterialInfo();
}
