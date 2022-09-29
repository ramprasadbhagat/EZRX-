import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item.freezed.dart';

@freezed
class MaterialItem with _$MaterialItem {
  const MaterialItem._();
  const factory MaterialItem({
    required int qty,
    required String type,
    required String comment,
    required bool hidePrice,
    required String batchNumber,
    required bool zdp8Override,
    required List<MaterialItemBonus> bonuses,
    required String materialGroup2,
    required String materialGroup4,
    required String materialNumber,
    required double overridenPrice,
    required String unitOfMeasurement,
    required String itemRegistrationNumber,
    required String materialDescription,
    required MaterialItemOverride? overrideInfo,
  }) = _MaterialItem;
}
