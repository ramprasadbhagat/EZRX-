import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'material_item_bonus_dto.freezed.dart';
part 'material_item_bonus_dto.g.dart';

@freezed
class MaterialItemBonusDto with _$MaterialItemBonusDto {
  const MaterialItemBonusDto._();
  @HiveType(typeId: 19, adapterName: 'MaterialItemBonusDtoAdapter')
  const factory MaterialItemBonusDto({
    @HiveField(51, defaultValue: '')
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
        required String materialNumber,
    @HiveField(52, defaultValue: 0)
    @JsonKey(name: 'freeQuantity', defaultValue: 0)
        required int qty,
    @HiveField(53, defaultValue: '')
    @JsonKey(name: 'comment', defaultValue: '')
        required String comment,
    @HiveField(54, defaultValue: '')
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @HiveField(55, defaultValue: '')
    @JsonKey(name: 'expiryDate', defaultValue: '')
        required String expiryDate,
    @HiveField(56, defaultValue: '')
    @JsonKey(name: 'inStock', defaultValue: '')
        required String inStock,
    @HiveField(57, defaultValue: 0)
    @JsonKey(name: 'remainingQty', defaultValue: 0)
        required int remainingQty,
    @HiveField(58, defaultValue: false)
    @JsonKey(name: 'bonusOverrideFlag', defaultValue: false)
        required bool bonusOverrideFlag,
    @HiveField(59, defaultValue: false)
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
      expiryDate: expiryDate,
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
      expiryDate: bonus.expiryDate,
      inStock: bonus.inStock,
      remainingQty: bonus.remainingQty,
      bonusOverrideFlag: bonus.bonusOverrideFlag,
      additionalBonusFlag: bonus.additionalBonusFlag,
    );
  }

  factory MaterialItemBonusDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemBonusDtoFromJson(json);
}
