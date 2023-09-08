import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
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
    @JsonKey(name: 'expiryDate', defaultValue: '') required String expiryDate,
    @JsonKey(name: 'inStock', defaultValue: '') required String inStock,
    @JsonKey(name: 'remainingQty', defaultValue: 0) required int remainingQty,
    @JsonKey(name: 'bonusOverrideFlag', defaultValue: false)
        required bool bonusOverrideFlag,
    @JsonKey(name: 'additionalBonusFlag', defaultValue: false)
        required bool additionalBonusFlag,
  }) = _MaterialItemBonusDto;

  MaterialItemBonus toDomain() {
    return MaterialItemBonus(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber(materialNumber),
        remarks: comment,
      ),
      qty: qty,
      comment: comment,
      materialDescription: materialDescription,
      expiryDate: DateTimeStringValue(expiryDate),
      inStock: inStock,
      remainingQty: remainingQty,
      additionalBonusFlag: additionalBonusFlag,
      bonusOverrideFlag: bonusOverrideFlag,
    );
  }

  factory MaterialItemBonusDto.fromDomain(MaterialItemBonus bonus) {
    return MaterialItemBonusDto(
      materialDescription: bonus.materialDescription,
      materialNumber: bonus.materialInfo.materialNumber.getOrDefaultValue(''),
      qty: bonus.qty,
      comment: bonus.comment,
      expiryDate: bonus.expiryDate.getOrDefaultValue(''),
      inStock: bonus.inStock,
      remainingQty: bonus.remainingQty,
      bonusOverrideFlag: bonus.bonusOverrideFlag,
      additionalBonusFlag: bonus.additionalBonusFlag,
    );
  }

  factory MaterialItemBonusDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemBonusDtoFromJson(json);
}
