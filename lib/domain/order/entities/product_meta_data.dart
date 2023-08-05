import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_meta_data.freezed.dart';

@freezed
class ProductMetaData with _$ProductMetaData {
  const ProductMetaData._();
  factory ProductMetaData({
    required List<ProductImages> productImages,
    required List<ProductItem> items,
  }) = _ProductMetaData;

  factory ProductMetaData.empty() => ProductMetaData(
        productImages: <ProductImages>[],
        items: <ProductItem>[],
      );
}

@freezed
class ProductItem with _$ProductItem {
  const ProductItem._();
  factory ProductItem({
    required StringValue promotionMaterial,
    required ProductItemXp productItemXp,
  }) = _ProductItem;

  factory ProductItem.empty() => ProductItem(
        promotionMaterial: StringValue(''),
        productItemXp: ProductItemXp.empty(),
      );
}

@freezed
class ProductItemXp with _$ProductItemXp {
  const ProductItemXp._();
  factory ProductItemXp({
    required StringValue dosage,
    required StringValue howToUse,
    required StringValue composition,
    required StringValue deliveryInstructions,
  }) = _ProductItemXp;

  factory ProductItemXp.empty() => ProductItemXp(
        composition: StringValue(''),
        deliveryInstructions: StringValue(''),
        dosage: StringValue(''),
        howToUse: StringValue(''),
      );
}
