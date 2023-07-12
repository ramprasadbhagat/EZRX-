// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaterialDtoAdapter extends TypeAdapter<_$_MaterialDto> {
  @override
  final int typeId = 3;

  @override
  _$_MaterialDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_MaterialDto(
      governmentMaterialCode: fields[2] == null ? '' : fields[2] as String,
      therapeuticClass: fields[3] == null ? '' : fields[3] as String,
      itemBrand: fields[4] == null ? '' : fields[4] as String,
      principalName: fields[5] == null ? '' : fields[5] as String,
      taxClassification: fields[7] == null ? '' : fields[7] as String,
      itemRegistrationNumber: fields[8] == null ? '' : fields[8] as String,
      unitOfMeasurement: fields[9] == null ? '' : fields[9] as String,
      materialGroup2: fields[10] == null ? '' : fields[10] as String,
      materialGroup4: fields[11] == null ? '' : fields[11] as String,
      isSampleMaterial: fields[12] == null ? false : fields[12] as bool,
      hasValidTenderContract: fields[14] == null ? false : fields[14] as bool,
      hasMandatoryTenderContract:
          fields[15] == null ? false : fields[15] as bool,
      taxes: fields[16] == null ? ['0'] : (fields[16] as List).cast<String>(),
      defaultMaterialDescription:
          fields[18] == null ? '' : fields[18] as String,
      isFOCMaterial: fields[19] == null ? false : fields[19] as bool,
      quantity: fields[20] == null ? 0 : fields[20] as int,
      remarks: fields[21] == null ? '' : fields[21] as String,
      genericMaterialName: fields[22] == null ? '' : fields[22] as String,
      ean: fields[23] == null ? '' : fields[23] as String,
      bundle: fields[39] == null
          ? const BundleDto(
              bonusEligible: false,
              bundleCode: '',
              bundleInformation: [],
              bundleName: '',
              conditions: '',
              materials: [])
          : fields[39] as BundleDto,
      code: fields[24] == null ? '' : fields[24] as String,
      name: fields[25] == null ? '' : fields[25] as String,
      principalCode: fields[27] == null ? '' : fields[27] as String,
      materialNumber: fields[28] == null ? '' : fields[28] as String,
      materialDescription: fields[29] == null ? '' : fields[29] as String,
      manufactured: fields[31] == null ? '' : fields[31] as String,
      isFavourite: fields[32] == null ? false : fields[32] as bool,
      type: fields[33] == null ? '' : fields[33] as String,
      hidePrice: fields[34] == null ? false : fields[34] as bool,
      dataTotalCount: fields[35] == null ? 0 : fields[35] as int,
      dataTotalHidden: fields[36] == null ? 0 : fields[36] as int,
      isGimmick: fields[37] == null ? false : fields[37] as bool,
      data: fields[38] == null
          ? []
          : (fields[38] as List).cast<MaterialDataDto>(),
      bundles: fields[17] == null ? [] : (fields[17] as List).cast<BundleDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_MaterialDto obj) {
    writer
      ..writeByte(34)
      ..writeByte(2)
      ..write(obj.governmentMaterialCode)
      ..writeByte(3)
      ..write(obj.therapeuticClass)
      ..writeByte(4)
      ..write(obj.itemBrand)
      ..writeByte(5)
      ..write(obj.principalName)
      ..writeByte(7)
      ..write(obj.taxClassification)
      ..writeByte(8)
      ..write(obj.itemRegistrationNumber)
      ..writeByte(9)
      ..write(obj.unitOfMeasurement)
      ..writeByte(10)
      ..write(obj.materialGroup2)
      ..writeByte(11)
      ..write(obj.materialGroup4)
      ..writeByte(12)
      ..write(obj.isSampleMaterial)
      ..writeByte(14)
      ..write(obj.hasValidTenderContract)
      ..writeByte(15)
      ..write(obj.hasMandatoryTenderContract)
      ..writeByte(18)
      ..write(obj.defaultMaterialDescription)
      ..writeByte(19)
      ..write(obj.isFOCMaterial)
      ..writeByte(20)
      ..write(obj.quantity)
      ..writeByte(21)
      ..write(obj.remarks)
      ..writeByte(22)
      ..write(obj.genericMaterialName)
      ..writeByte(23)
      ..write(obj.ean)
      ..writeByte(39)
      ..write(obj.bundle)
      ..writeByte(24)
      ..write(obj.code)
      ..writeByte(25)
      ..write(obj.name)
      ..writeByte(27)
      ..write(obj.principalCode)
      ..writeByte(28)
      ..write(obj.materialNumber)
      ..writeByte(29)
      ..write(obj.materialDescription)
      ..writeByte(31)
      ..write(obj.manufactured)
      ..writeByte(32)
      ..write(obj.isFavourite)
      ..writeByte(33)
      ..write(obj.type)
      ..writeByte(34)
      ..write(obj.hidePrice)
      ..writeByte(35)
      ..write(obj.dataTotalCount)
      ..writeByte(36)
      ..write(obj.dataTotalHidden)
      ..writeByte(37)
      ..write(obj.isGimmick)
      ..writeByte(16)
      ..write(obj.taxes)
      ..writeByte(38)
      ..write(obj.data)
      ..writeByte(17)
      ..write(obj.bundles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaterialDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MaterialDataDtoAdapter extends TypeAdapter<_$_MaterialDataDto> {
  @override
  final int typeId = 3;

  @override
  _$_MaterialDataDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_MaterialDataDto(
      code: fields[1] == null ? '' : fields[1] as String,
      manufactured: fields[2] == null ? '' : fields[2] as String,
      materialDescription: fields[3] == null ? '' : fields[3] as String,
      defaultMaterialDescription: fields[4] == null ? '' : fields[4] as String,
      genericMaterialName: fields[5] == null ? '' : fields[5] as String,
      materialImageURL: fields[6] == null ? '' : fields[6] as String,
      governmentMaterialCode: fields[7] == null ? '' : fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_MaterialDataDto obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.manufactured)
      ..writeByte(3)
      ..write(obj.materialDescription)
      ..writeByte(4)
      ..write(obj.defaultMaterialDescription)
      ..writeByte(5)
      ..write(obj.genericMaterialName)
      ..writeByte(6)
      ..write(obj.materialImageURL)
      ..writeByte(7)
      ..write(obj.governmentMaterialCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaterialDataDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialDto _$$_MaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialDto(
      governmentMaterialCode: json['governmentMaterialCode'] as String? ?? '',
      therapeuticClass: json['therapeuticClass'] as String? ?? '',
      itemBrand: json['itemBrand'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      taxClassification: json['taxClassification'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      unitOfMeasurement: json['unitOfMeasurement'] as String? ?? '',
      materialGroup2: json['materialGroup2'] as String? ?? '',
      materialGroup4: json['materialGroup4'] as String? ?? '',
      isSampleMaterial: json['isSampleMaterial'] as bool? ?? false,
      hasValidTenderContract: json['hasValidTenderContract'] as bool? ?? false,
      hasMandatoryTenderContract:
          json['hasMandatoryTenderContract'] as bool? ?? false,
      taxes: (handleEmptyTaxList(json, 'taxes') as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          ['0'],
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      isFOCMaterial: json['isFOCMaterial'] as bool? ?? false,
      quantity: _validateQantity(json, 'quantity') as int? ?? 0,
      remarks: json['remarks'] as String? ?? '',
      genericMaterialName: json['genericMaterialName'] as String? ?? '',
      ean: json['ean'] as String? ?? '',
      bundle: BundleDto.fromJson(
          _nullCheck(json, 'BundleInformation') as Map<String, dynamic>),
      code: json['Code'] as String? ?? '',
      name: json['Name'] as String? ?? '',
      principalCode:
          _principalCodeReadValue(json, 'PrincipalCode') as String? ?? '',
      materialNumber:
          _materialNumberReadValue(json, 'MaterialNumber') as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      manufactured: json['Manufactured'] as String? ?? '',
      isFavourite: json['IsFavourite'] as bool? ?? false,
      type: json['Type'] as String? ?? '',
      hidePrice: json['HidePrice'] as bool? ?? false,
      dataTotalCount: json['DataTotalCount'] as int? ?? 0,
      dataTotalHidden: json['DataTotalHidden'] as int? ?? 0,
      isGimmick: json['IsGimmick'] as bool? ?? false,
      data: (json['Data'] as List<dynamic>?)
              ?.map((e) => MaterialDataDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bundles: (json['bundles'] as List<dynamic>?)
              ?.map((e) => BundleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MaterialDtoToJson(_$_MaterialDto instance) =>
    <String, dynamic>{
      'governmentMaterialCode': instance.governmentMaterialCode,
      'therapeuticClass': instance.therapeuticClass,
      'itemBrand': instance.itemBrand,
      'principalName': instance.principalName,
      'taxClassification': instance.taxClassification,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'materialGroup2': instance.materialGroup2,
      'materialGroup4': instance.materialGroup4,
      'isSampleMaterial': instance.isSampleMaterial,
      'hasValidTenderContract': instance.hasValidTenderContract,
      'hasMandatoryTenderContract': instance.hasMandatoryTenderContract,
      'taxes': instance.taxes,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'isFOCMaterial': instance.isFOCMaterial,
      'quantity': instance.quantity,
      'remarks': instance.remarks,
      'genericMaterialName': instance.genericMaterialName,
      'ean': instance.ean,
      'BundleInformation': instance.bundle.toJson(),
      'Code': instance.code,
      'Name': instance.name,
      'PrincipalCode': instance.principalCode,
      'MaterialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'Manufactured': instance.manufactured,
      'IsFavourite': instance.isFavourite,
      'Type': instance.type,
      'HidePrice': instance.hidePrice,
      'DataTotalCount': instance.dataTotalCount,
      'DataTotalHidden': instance.dataTotalHidden,
      'IsGimmick': instance.isGimmick,
      'Data': instance.data.map((e) => e.toJson()).toList(),
      'bundles': instance.bundles.map((e) => e.toJson()).toList(),
    };

_$_MaterialDataDto _$$_MaterialDataDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialDataDto(
      code: materialNumberReadValue(json, 'Code') as String? ?? '',
      manufactured: json['Manufactured'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      defaultMaterialDescription:
          json['DefaultMaterialDescription'] as String? ?? '',
      genericMaterialName: json['GenericMaterialName'] as String? ?? '',
      materialImageURL: json['MaterialImageURL'] as String? ?? '',
      governmentMaterialCode: json['GovernmentMaterialCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_MaterialDataDtoToJson(_$_MaterialDataDto instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Manufactured': instance.manufactured,
      'MaterialDescription': instance.materialDescription,
      'DefaultMaterialDescription': instance.defaultMaterialDescription,
      'GenericMaterialName': instance.genericMaterialName,
      'MaterialImageURL': instance.materialImageURL,
      'GovernmentMaterialCode': instance.governmentMaterialCode,
    };

_$_MaterialResponseDto _$$_MaterialResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaterialResponseDto(
      count: json['Count'] as int? ?? 0,
      products: (json['Products'] as List<dynamic>?)
              ?.map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MaterialResponseDtoToJson(
        _$_MaterialResponseDto instance) =>
    <String, dynamic>{
      'Count': instance.count,
      'Products': instance.products.map((e) => e.toJson()).toList(),
    };
