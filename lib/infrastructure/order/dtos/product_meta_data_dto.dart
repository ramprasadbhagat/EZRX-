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
    @JsonKey(
      name: 'HidePrice',
      defaultValue: false,
    )
        required bool hidePrice,
    @JsonKey(
      name: 'XP',
    )
        required ProductItemXpDto xp,
  }) = _ProductItemDto;

  ProductItem toDomain() => ProductItem(
        hidePrice: hidePrice,
        promotionMaterial: StringValue(promotionMaterial),
        xp: xp.toDomain(),
      );

  factory ProductItemDto.fromJson(Map<String, dynamic> json) =>
      _$ProductItemDtoFromJson(json);
}

@freezed
class ProductItemXpDto with _$ProductItemXpDto {
  const ProductItemXpDto._();

  const factory ProductItemXpDto({
    @JsonKey(
      name: 'Dosage',
      defaultValue: '',
    )
        required String dosage,
    @JsonKey(
      name: 'HowToUse',
      defaultValue: '',
    )
        required String howToUse,
    @JsonKey(
      name: 'Composition',
      defaultValue: '',
    )
        required String composition,
    @JsonKey(
      name: 'DeliveryInstructions',
      defaultValue: '',
    )
        required String deliveryInstructions,
    @JsonKey(
      name: 'Usability',
      defaultValue: '',
    )
        required String usability,
  }) = _ProductItemXpDto;

  ProductItemXp toDomain() => ProductItemXp(
      dosage: dosage,
      howToUse: howToUse,
      composition: composition,
      deliveryInstructions: deliveryInstructions,
        usability: usability,
      );

  factory ProductItemXpDto.fromJson(Map<String, dynamic> json) =>
      _$ProductItemXpDtoFromJson(json);
}
