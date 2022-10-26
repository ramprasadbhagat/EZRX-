import 'package:ezrxmobile/infrastructure/order/dtos/customer_material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';

part 'material_price_detail_dto.freezed.dart';
part 'material_price_detail_dto.g.dart';

@freezed
class MaterialDetailDto with _$MaterialDetailDto {
  const MaterialDetailDto._();
  const factory MaterialDetailDto({
    @JsonKey(name: 'Price') required PriceDto price,
    @JsonKey(name: 'MaterialInformation') required CustomerMaterialDto info,
    @JsonKey(name: 'ValidMaterial', defaultValue: false)
        required bool isValidMaterial,
  }) = _MaterialDetailDto;

  MaterialPriceDetail toDomain() => MaterialPriceDetail(
        price: price.toDomain(),
        info: info.toDomain(),
        isValidMaterial: isValidMaterial,
      );

  factory MaterialDetailDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDetailDtoFromJson(json);
}
