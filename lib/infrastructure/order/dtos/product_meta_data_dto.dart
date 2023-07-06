import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/dtos/product_images_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_meta_data_dto.freezed.dart';
part 'product_meta_data_dto.g.dart';

@freezed
class ProductMetaDataDto with _$ProductMetaDataDto {
  const ProductMetaDataDto._();
  factory ProductMetaDataDto({
    @JsonKey(
      name: 'orderCloudProduct',
      defaultValue: <ProductImagesDto>[],
    )
        required List<ProductImagesDto> productImages,
    @JsonKey(
      name: 'Items',
      defaultValue: <ProductItemDto>[],
    )
        required List<ProductItemDto> items,
  }) = _ProductMetaDataDto;

  ProductMetaData toDomain() => ProductMetaData(
        productImages: productImages.map((e) => e.toDomain()).toList(),
        items: items.map((e) => e.toDomain()).toList(),
      );

  factory ProductMetaDataDto.fromJson(Map<String, dynamic> json) =>
      _$ProductMetaDataDtoFromJson(json);
}


@freezed
class ProductItemDto with _$ProductItemDto {
  const ProductItemDto._();
  const factory ProductItemDto({
    @JsonKey(
      name: 'PromotionMaterial',
      defaultValue: '',
    )
        required String promotionMaterial,
  }) = _ProductItemDto;

  ProductItem toDomain() => ProductItem(
        promotionMaterial: StringValue(promotionMaterial),
      );

  factory ProductItemDto.fromJson(Map<String, dynamic> json) =>
      _$ProductItemDtoFromJson(json);
}

