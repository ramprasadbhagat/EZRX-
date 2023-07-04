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
    required bool hidePrice,
    required ProductItemXp xp,
  }) = _ProductItem;

  factory ProductItem.empty() => ProductItem(
        hidePrice: false,
        promotionMaterial: StringValue(''),
        xp: ProductItemXp.empty(),
      );
}

@freezed
class ProductItemXp with _$ProductItemXp {
  const ProductItemXp._();
  factory ProductItemXp({
    required String dosage,
    required String howToUse,
    required String composition,
    required String deliveryInstructions,
    required String usability,
  }) = _ProductItemXp;

  factory ProductItemXp.empty() => ProductItemXp(
        composition: '',
        deliveryInstructions: '',
        dosage: '',
        howToUse: '',
        usability: '',
      );
}
