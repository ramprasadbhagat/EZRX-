import 'package:ezrxmobile/domain/order/entities/cart_addition_info_product.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/dtos/product_images_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_addition_info_product_dto.freezed.dart';
part 'cart_addition_info_product_dto.g.dart';

@freezed
class CartAdditionInfoProductDto with _$CartAdditionInfoProductDto {
  const CartAdditionInfoProductDto._();
  const factory CartAdditionInfoProductDto({
    @JsonKey(name: 'orderCloudProduct')
        required List<ProductImagesDto> productImages,
    // @JsonKey(name: 'Items')
    // required List<Items> items,
  }) = _CartAdditionInfoProductDto;

  factory CartAdditionInfoProductDto.fromDomain(
    CartAdditionInfoProduct cartAdditionInfoProduct,
  ) =>
      CartAdditionInfoProductDto(
        productImages: cartAdditionInfoProduct.productImages
            .map(
              (productImage) => ProductImagesDto.fromDomain(productImage),
            )
            .toList(),
      );

  CartAdditionInfoProduct get toDomain => CartAdditionInfoProduct(
        productImages: productImages.map((item) => item.toDomain()).toList(),
      );

  factory CartAdditionInfoProductDto.fromJson(Map<String, dynamic> json) =>
      _$CartAdditionInfoProductDtoFromJson(json);
}
