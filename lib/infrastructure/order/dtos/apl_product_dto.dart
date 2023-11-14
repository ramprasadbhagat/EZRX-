import 'package:ezrxmobile/domain/order/entities/apl_product.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'apl_product_dto.freezed.dart';
part 'apl_product_dto.g.dart';

@freezed
class AplProductDto with _$AplProductDto {
  const AplProductDto._();
  const factory AplProductDto({
    @JsonKey(name: 'material', defaultValue: '') required String materialNumber,
    @JsonKey(name: 'netValue', defaultValue: 0)
        required double
            finalPriceTotal, //total individual price (unit price * quantity)
    @JsonKey(name: 'productPriceNetValue', defaultValue: 0)
        required double finalPrice, //item unit price
    @JsonKey(name: 'productQty', defaultValue: 0) required int productQty,
    @JsonKey(name: 'taxValue', defaultValue: 0) required double taxValue,
  }) = _AplProductDto;

  AplProduct get toDomain => AplProduct(
        materialNumber: MaterialNumber(materialNumber),
        finalPrice: MaterialPrice(finalPrice),
        finalPriceTotal: MaterialPrice(finalPriceTotal),
        productQty: MaterialQty(productQty),
        tax: taxValue,
      );

  factory AplProductDto.fromJson(Map<String, dynamic> json) =>
      _$AplProductDtoFromJson(json);
}
