import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
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
    required bool zdp8Override,
    required List<MaterialItemBonus> bonuses,
    required MaterialGroup materialGroup2,
    required MaterialGroup materialGroup4,
    required MaterialNumber materialNumber,
    required String defaultMaterialDescription,
    required double overridenPrice,
    required String unitOfMeasurement,
    required String itemRegistrationNumber,
    required String materialDescription,
    required MaterialItemOverride overrideInfo,
  }) = _MaterialItem;

  factory MaterialItem.empty() => MaterialItem(
        qty: 0,
        type: '',
        comment: '',
        defaultMaterialDescription: '',
        hidePrice: false,
        batchNumber: '',
        zdp8Override: false,
        bonuses: <MaterialItemBonus>[],
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
      );

  MaterialInfo toMaterialInfo() {
    return MaterialInfo(
      materialNumber: materialNumber,
      materialDescription: materialDescription,
      itemRegistrationNumber: itemRegistrationNumber,
      unitOfMeasurement: unitOfMeasurement,
      materialGroup2: materialGroup2,
      materialGroup4: materialGroup4,
      hidePrice: hidePrice,
      governmentMaterialCode: '',
      therapeuticClass: '',
      itemBrand: '',
      principalData: const PrincipalData(principalName: '', principalCode: ''),
      taxClassification: MaterialTaxClassification(''),
      isSampleMaterial: false,
      hasValidTenderContract: false,
      hasMandatoryTenderContract: false,
      taxes: [],
      defaultMaterialDescription: defaultMaterialDescription,
      bundles: [],
      isFOCMaterial: false,
    );
  }

  MaterialQueryInfo get queryInfo => MaterialQueryInfo.fromSavedOrder(
        orderMaterial: this,
      );
}
