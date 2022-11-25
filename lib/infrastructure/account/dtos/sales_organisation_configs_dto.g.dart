// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_organisation_configs_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalesOrganisationConfigsDtoAdapter
    extends TypeAdapter<_$_SalesOrganisationConfigsDto> {
  @override
  final int typeId = 5;

  @override
  _$_SalesOrganisationConfigsDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_SalesOrganisationConfigsDto(
      disableProcessingStatus:
          fields[100] == null ? false : fields[100] as bool,
      currency: fields[101] == null ? '' : fields[101] as String,
      hideCustomer: fields[102] == null ? false : fields[102] as bool,
      enableGimmickMaterial: fields[103] == null ? false : fields[103] as bool,
      languageFilter: fields[104] == null ? false : fields[104] as bool,
      languageValue: fields[105] == null ? '' : fields[105] as String,
      disablePrincipals: fields[106] == null ? false : fields[106] as bool,
      principalList:
          fields[7] == null ? [] : (fields[7] as List).cast<dynamic>(),
      disableOrderType: fields[108] == null ? false : fields[108] as bool,
      enableBatchNumber: fields[109] == null ? false : fields[109] as bool,
      disableBundles: fields[110] == null ? false : fields[110] as bool,
      enableZDP5: fields[111] == null ? false : fields[111] as bool,
      enableTaxClassification:
          fields[112] == null ? false : fields[112] as bool,
      enableVat: fields[113] == null ? false : fields[113] as bool,
      vatValue: fields[114] == null ? 0 : fields[114] as int,
      materialWithoutPrice: fields[115] == null ? false : fields[115] as bool,
      enableSpecialInstructions:
          fields[116] == null ? false : fields[116] as bool,
      enableReferenceNote: fields[117] == null ? false : fields[117] as bool,
      enableCollectiveNumber: fields[118] == null ? false : fields[118] as bool,
      enableMobileNumber: fields[119] == null ? false : fields[119] as bool,
      enableFutureDeliveryDay:
          fields[120] == null ? false : fields[120] as bool,
      enablePaymentTerms: fields[121] == null ? false : fields[121] as bool,
      futureDeliveryDay: fields[122] == null ? '' : fields[122] as String,
      enableGMC: fields[123] == null ? false : fields[123] as bool,
      enableListPrice: fields[124] == null ? false : fields[124] as bool,
      enableDefaultMD: fields[125] == null ? false : fields[125] as bool,
      priceOverride: fields[126] == null ? false : fields[126] as bool,
      disablePaymentTermsDisplay:
          fields[127] == null ? false : fields[127] as bool,
      disableDeliveryDate: fields[128] == null ? false : fields[128] as bool,
      enableBillTo: fields[129] == null ? false : fields[129] as bool,
      showPOAttachment: fields[130] == null ? false : fields[130] as bool,
      expiryDateDisplay: fields[131] == null ? false : fields[131] as bool,
      hideStockDisplay: fields[132] == null ? false : fields[132] as bool,
      addOosMaterials: fields[133] == null ? false : fields[133] as bool,
      oosValue: fields[134] == null ? 0 : fields[134] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_SalesOrganisationConfigsDto obj) {
    writer
      ..writeByte(35)
      ..writeByte(100)
      ..write(obj.disableProcessingStatus)
      ..writeByte(101)
      ..write(obj.currency)
      ..writeByte(102)
      ..write(obj.hideCustomer)
      ..writeByte(103)
      ..write(obj.enableGimmickMaterial)
      ..writeByte(104)
      ..write(obj.languageFilter)
      ..writeByte(105)
      ..write(obj.languageValue)
      ..writeByte(106)
      ..write(obj.disablePrincipals)
      ..writeByte(108)
      ..write(obj.disableOrderType)
      ..writeByte(109)
      ..write(obj.enableBatchNumber)
      ..writeByte(110)
      ..write(obj.disableBundles)
      ..writeByte(111)
      ..write(obj.enableZDP5)
      ..writeByte(112)
      ..write(obj.enableTaxClassification)
      ..writeByte(113)
      ..write(obj.enableVat)
      ..writeByte(114)
      ..write(obj.vatValue)
      ..writeByte(115)
      ..write(obj.materialWithoutPrice)
      ..writeByte(116)
      ..write(obj.enableSpecialInstructions)
      ..writeByte(117)
      ..write(obj.enableReferenceNote)
      ..writeByte(118)
      ..write(obj.enableCollectiveNumber)
      ..writeByte(119)
      ..write(obj.enableMobileNumber)
      ..writeByte(120)
      ..write(obj.enableFutureDeliveryDay)
      ..writeByte(121)
      ..write(obj.enablePaymentTerms)
      ..writeByte(122)
      ..write(obj.futureDeliveryDay)
      ..writeByte(123)
      ..write(obj.enableGMC)
      ..writeByte(124)
      ..write(obj.enableListPrice)
      ..writeByte(125)
      ..write(obj.enableDefaultMD)
      ..writeByte(126)
      ..write(obj.priceOverride)
      ..writeByte(127)
      ..write(obj.disablePaymentTermsDisplay)
      ..writeByte(128)
      ..write(obj.disableDeliveryDate)
      ..writeByte(129)
      ..write(obj.enableBillTo)
      ..writeByte(130)
      ..write(obj.showPOAttachment)
      ..writeByte(131)
      ..write(obj.expiryDateDisplay)
      ..writeByte(132)
      ..write(obj.hideStockDisplay)
      ..writeByte(133)
      ..write(obj.addOosMaterials)
      ..writeByte(134)
      ..write(obj.oosValue)
      ..writeByte(7)
      ..write(obj.principalList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesOrganisationConfigsDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesOrganisationConfigsDto _$$_SalesOrganisationConfigsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SalesOrganisationConfigsDto(
      disableProcessingStatus: json['disableProcessingStatus'] as bool,
      currency: json['currency'] as String,
      hideCustomer: json['hideCustomer'] as bool? ?? false,
      enableGimmickMaterial: json['enableGimmickMaterial'] as bool? ?? false,
      languageFilter: json['languageFilter'] as bool? ?? false,
      languageValue: json['languageValue'] as String? ?? '',
      disablePrincipals: json['disablePrincipals'] as bool? ?? false,
      principalList: const _PrincipalListConverter()
          .fromJson(json['principalList'] as Map<String, dynamic>),
      disableOrderType: json['disableOrderType'] as bool? ?? false,
      enableBatchNumber: json['enableBatchNumber'] as bool? ?? false,
      disableBundles: json['disableBundles'] as bool? ?? false,
      enableZDP5: json['enableZDP5'] as bool? ?? false,
      enableTaxClassification:
          json['enableTaxClassification'] as bool? ?? false,
      enableVat: json['enableVat'] as bool? ?? false,
      vatValue: json['vatValue'] as int? ?? 0,
      materialWithoutPrice: json['materialWithoutPrice'] as bool? ?? false,
      enableSpecialInstructions:
          json['enableSpecialInstructions'] as bool? ?? false,
      enableReferenceNote: json['enableReferenceNote'] as bool? ?? false,
      enableCollectiveNumber: json['enableCollectiveNumber'] as bool? ?? false,
      enableMobileNumber: json['enableMobileNumber'] as bool? ?? false,
      enableFutureDeliveryDay:
          json['enableFutureDeliveryDay'] as bool? ?? false,
      enablePaymentTerms: json['enablePaymentTerms'] as bool? ?? false,
      futureDeliveryDay: json['futureDeliveryDay'] as String? ?? '',
      enableGMC: json['enableGMC'] as bool? ?? false,
      enableListPrice: json['enableListPrice'] as bool? ?? false,
      enableDefaultMD: json['enableDefaultMD'] as bool? ?? false,
      priceOverride: json['priceOverride'] as bool? ?? false,
      disablePaymentTermsDisplay:
          json['disablePaymentTermsDisplay'] as bool? ?? false,
      disableDeliveryDate: json['disableDeliveryDate'] as bool? ?? false,
      enableBillTo: json['enableBillTo'] as bool? ?? false,
      showPOAttachment: json['showPOAttachment'] as bool? ?? false,
      expiryDateDisplay: json['expiryDateDisplay'] as bool? ?? false,
      hideStockDisplay: json['hideStockDisplay'] as bool? ?? false,
      addOosMaterials: json['addOosMaterials'] as bool? ?? false,
      oosValue: json['oosValue'] as int? ?? 0,
    );

Map<String, dynamic> _$$_SalesOrganisationConfigsDtoToJson(
        _$_SalesOrganisationConfigsDto instance) =>
    <String, dynamic>{
      'disableProcessingStatus': instance.disableProcessingStatus,
      'currency': instance.currency,
      'hideCustomer': instance.hideCustomer,
      'enableGimmickMaterial': instance.enableGimmickMaterial,
      'languageFilter': instance.languageFilter,
      'languageValue': instance.languageValue,
      'disablePrincipals': instance.disablePrincipals,
      'principalList':
          const _PrincipalListConverter().toJson(instance.principalList),
      'disableOrderType': instance.disableOrderType,
      'enableBatchNumber': instance.enableBatchNumber,
      'disableBundles': instance.disableBundles,
      'enableZDP5': instance.enableZDP5,
      'enableTaxClassification': instance.enableTaxClassification,
      'enableVat': instance.enableVat,
      'vatValue': instance.vatValue,
      'materialWithoutPrice': instance.materialWithoutPrice,
      'enableSpecialInstructions': instance.enableSpecialInstructions,
      'enableReferenceNote': instance.enableReferenceNote,
      'enableCollectiveNumber': instance.enableCollectiveNumber,
      'enableMobileNumber': instance.enableMobileNumber,
      'enableFutureDeliveryDay': instance.enableFutureDeliveryDay,
      'enablePaymentTerms': instance.enablePaymentTerms,
      'futureDeliveryDay': instance.futureDeliveryDay,
      'enableGMC': instance.enableGMC,
      'enableListPrice': instance.enableListPrice,
      'enableDefaultMD': instance.enableDefaultMD,
      'priceOverride': instance.priceOverride,
      'disablePaymentTermsDisplay': instance.disablePaymentTermsDisplay,
      'disableDeliveryDate': instance.disableDeliveryDate,
      'enableBillTo': instance.enableBillTo,
      'showPOAttachment': instance.showPOAttachment,
      'expiryDateDisplay': instance.expiryDateDisplay,
      'hideStockDisplay': instance.hideStockDisplay,
      'addOosMaterials': instance.addOosMaterials,
      'oosValue': instance.oosValue,
    };
