import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_price_detail_dto.freezed.dart';
part 'material_price_detail_dto.g.dart';

@freezed
class MaterialPriceDetailDto with _$MaterialPriceDetailDto {
  const MaterialPriceDetailDto._();
  const factory MaterialPriceDetailDto({
    @JsonKey(name: 'Price') required PriceDto price,
    @JsonKey(name: 'ValidMaterial', defaultValue: false)
        required bool isValidMaterial,
  }) = _MaterialPriceDetailDto;

  MaterialPriceDetail toDomain() => MaterialPriceDetail(
        price: price.toDomain(),
        info: MaterialInfo.empty(),
        isValidMaterial: isValidMaterial,
      );

  factory MaterialPriceDetailDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialPriceDetailDtoFromJson(json);
}
