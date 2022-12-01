import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order_material_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_order_material.freezed.dart';

@freezed
class SavedOrderMaterial with _$SavedOrderMaterial {
  const SavedOrderMaterial._();
  const factory SavedOrderMaterial({
    required int qty,
    required String type,
    required String comment,
    required bool hidePrice,
    required String batchNumber,
    required bool zdp8Override,
    required List<SavedOrderMaterialBonus> bonuses,
    required MaterialGroup materialGroup2,
    required MaterialGroup materialGroup4,
    required MaterialNumber materialNumber,
    required String defaultMaterialDescription,
    required double overridenPrice,
    required String unitOfMeasurement,
    required String itemRegistrationNumber,
    required String materialDescription,
    required MaterialItemOverride overrideInfo,
    required String remarks,
  }) = _SavedOrderMaterial;

  factory SavedOrderMaterial.empty() => SavedOrderMaterial(
        qty: 0,
        type: '',
        comment: '',
        defaultMaterialDescription: '',
        hidePrice: false,
        batchNumber: '',
        zdp8Override: false,
        bonuses: <SavedOrderMaterialBonus>[],
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
        materialNumber: MaterialNumber(''),
        overridenPrice: 0.0,
        unitOfMeasurement: '',
        itemRegistrationNumber: '',
        materialDescription: '',
        overrideInfo: const MaterialItemOverride(
          percentageOverride: '',
          reference: '',
          valueOverride: <ValueOverride>[],
        ),
        remarks: '',
      );

  MaterialQueryInfo get queryInfo => MaterialQueryInfo.fromSavedOrder(
        orderMaterial: this,
      );
}
