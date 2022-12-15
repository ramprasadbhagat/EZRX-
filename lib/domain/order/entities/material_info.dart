import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_info.freezed.dart';

@freezed
class MaterialInfo with _$MaterialInfo {
  const MaterialInfo._();

  const factory MaterialInfo({
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String defaultMaterialDescription,
    required String governmentMaterialCode,
    required String therapeuticClass,
    required String itemBrand,
    required PrincipalData principalData,
    required String itemRegistrationNumber,
    required String unitOfMeasurement,
    required MaterialGroup materialGroup2,
    required MaterialGroup materialGroup4,
    required bool isSampleMaterial,
    required bool hidePrice,
    required bool hasValidTenderContract,
    required bool hasMandatoryTenderContract,
    required MaterialTaxClassification taxClassification,
    required List<String> taxes,
    required List<Bundle> bundles,
    required bool isFOCMaterial,
    required int quantity,
    required String remarks,
  }) = _MaterialInfo;

  factory MaterialInfo.empty() => MaterialInfo(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        governmentMaterialCode: '',
        therapeuticClass: '',
        itemBrand: '',
        principalData: PrincipalData(
          principalName: '',
          principalCode: PrincipleCode(''),
        ),
        taxClassification: MaterialTaxClassification(''),
        itemRegistrationNumber: '',
        unitOfMeasurement: '',
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
        isSampleMaterial: false,
        hidePrice: false,
        hasValidTenderContract: false,
        hasMandatoryTenderContract: false,
        taxes: [],
        defaultMaterialDescription: '',
        bundles: [],
        isFOCMaterial: false,
        quantity: 0,
        remarks: '',
      );

  MaterialQueryInfo get queryInfo => MaterialQueryInfo.fromBundles(
        materialInfo: this,
      );

  String get _displayTaxes {
    return taxes.isNotEmpty ? '${taxes.join('% , ')}%' : '0%';
  }

  String getTaxClassification(
    bool enableTaxDisplay,
    bool enableTaxClassification,
  ) {
    return enableTaxDisplay && enableTaxClassification
        ? taxClassification.getOrCrash()
        : '';
  }

  String getTotalTax(bool enableTaxDisplay) {
    return enableTaxDisplay ? '${'Total Tax: '.tr()}$_displayTaxes' : '';
  }

  String get displayDescription => materialDescription.isEmpty
      ? defaultMaterialDescription
      : materialDescription;
}
