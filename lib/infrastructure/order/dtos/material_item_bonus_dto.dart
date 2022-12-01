import 'package:ezrxmobile/domain/order/entities/saved_order_material_bonus.dart';
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
  }) = _MaterialItemBonusDto;

  SavedOrderMaterialBonus toDomain() {
    return SavedOrderMaterialBonus(
      materialNumber: MaterialNumber(materialNumber),
      qty: qty,
      comment: comment,
      materialDescription: materialDescription,
      expiryDate: expiryDate,
      inStock: inStock,
      remainingQty: remainingQty,
    );
  }

  factory MaterialItemBonusDto.fromDomain(SavedOrderMaterialBonus bonus) {
    return MaterialItemBonusDto(
      materialDescription: bonus.materialDescription,
      materialNumber: bonus.materialNumber.getOrCrash(),
      qty: bonus.qty,
      comment: bonus.comment,
      expiryDate: bonus.expiryDate,
      inStock: bonus.inStock,
      remainingQty: bonus.remainingQty,
    );
  }

  factory MaterialItemBonusDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemBonusDtoFromJson(json);
}
