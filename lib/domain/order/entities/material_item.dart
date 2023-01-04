import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
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
    required List<MaterialItemBonus> bonuses,
    required MaterialGroup materialGroup2,
    required MaterialGroup materialGroup4,
    required MaterialNumber materialNumber,
    required String defaultMaterialDescription,
    required PriceOverrideValue overridenPrice,
    required String unitOfMeasurement,
    required String itemRegistrationNumber,
    required String materialDescription,
    required String remarks,
    required Zdp8OverrideValue zdp8Override,
    required String bundleName,
    required String bundleCode,
    required List<BundleInfo> bundleInformation,
    required List<MaterialInfo> materials,
    required int totalQuantity,
  }) = _MaterialItem;

  factory MaterialItem.empty() => MaterialItem(
        qty: 0,
        type: '',
        comment: '',
        defaultMaterialDescription: '',
        hidePrice: false,
        batchNumber: '',
        bonuses: <MaterialItemBonus>[],
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
        materialNumber: MaterialNumber(''),
        overridenPrice: PriceOverrideValue(0),
        unitOfMeasurement: '',
        itemRegistrationNumber: '',
        materialDescription: '',
        remarks: '',
        zdp8Override: Zdp8OverrideValue(0),
        bundleName: '',
        bundleCode: '',
        bundleInformation: [],
        materials: [],
        totalQuantity: 0,
      );

  MaterialQueryInfo get queryInfo => MaterialQueryInfo.fromSavedOrder(
        orderMaterial: this,
      );

  String get displayDescription => materialDescription.isEmpty
      ? defaultMaterialDescription
      : materialDescription;
}
