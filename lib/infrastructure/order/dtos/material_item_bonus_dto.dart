import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item_bonus_dto.freezed.dart';
part 'material_item_bonus_dto.g.dart';

@freezed
class MaterialItemBonusDto with _$MaterialItemBonusDto {
  const MaterialItemBonusDto._();

  const factory MaterialItemBonusDto({
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'freeQuantity', defaultValue: 0) required int qty,
    @JsonKey(name: 'comment', defaultValue: '') required String comment,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
  }) = _MaterialItemBonusDto;

  MaterialItemBonus toDomain() {
    return MaterialItemBonus(
      materialNumber: MaterialNumber(materialNumber),
      qty: qty,
      comment: comment,
      materialDescription: materialDescription,
    );
  }

  factory MaterialItemBonusDto.fromDomain(MaterialItemBonus bonus) {
    return MaterialItemBonusDto(
      materialDescription: bonus.materialDescription,
      materialNumber: bonus.materialNumber.getOrCrash(),
      qty: bonus.qty,
      comment: bonus.comment,
    );
  }

  factory MaterialItemBonusDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemBonusDtoFromJson(json);
}
