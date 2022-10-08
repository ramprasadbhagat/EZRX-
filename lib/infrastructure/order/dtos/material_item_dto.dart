import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/material_item_bonus_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item_dto.freezed.dart';
part 'material_item_dto.g.dart';

@freezed
class MaterialItemDto with _$MaterialItemDto {
  const MaterialItemDto._();

  const factory MaterialItemDto({
    @JsonKey(name: 'qty', defaultValue: 0) required int qty,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'additionalBonus', defaultValue: <MaterialItemBonusDto>[])
        required List<MaterialItemBonusDto> bonuses,
    @JsonKey(name: 'materialGroup2', defaultValue: '')
        required String materialGroup2,
    @JsonKey(name: 'materialGroup4', defaultValue: '')
        required String materialGroup4,
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'overridenPrice', defaultValue: 0)
        required double overridenPrice,
    @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
        required String unitOfMeasurement,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
        required String itemRegistrationNumber,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'comment', defaultValue: '') required String comment,
    @JsonKey(name: 'batchNumber', defaultValue: '') required String batchNumber,
    @JsonKey(name: 'zdp8Override', defaultValue: false)
        required bool zdp8Override,
    // TODO: correct the overrideInfo
    // @JsonKey(name: 'override') MaterialItemOverrideDto overrideInfo,
  }) = _MaterialItemDto;

  MaterialItem toDomain() {
    return MaterialItem(
      qty: qty,
      type: type,
      comment: comment,
      hidePrice: hidePrice,
      batchNumber: batchNumber,
      zdp8Override: zdp8Override,
      bonuses: bonuses.map((e) => e.toDomain()).toList(),
      overrideInfo: MaterialItemOverride.empty(),
      materialGroup2: MaterialGroup.two(materialGroup2),
      materialGroup4: MaterialGroup.four(materialGroup4),
      materialNumber: MaterialNumber(materialNumber),
      overridenPrice: overridenPrice,
      unitOfMeasurement: unitOfMeasurement,
      itemRegistrationNumber: itemRegistrationNumber,
      materialDescription: materialDescription,
    );
  }

  factory MaterialItemDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemDtoFromJson(json);
}
