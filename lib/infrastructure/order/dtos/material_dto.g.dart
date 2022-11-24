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
      materialNumber: fields[0] == null ? '' : fields[0] as String,
      materialDescription: fields[1] == null ? '' : fields[1] as String,
      governmentMaterialCode: fields[2] == null ? '' : fields[2] as String,
      therapeuticClass: fields[3] == null ? '' : fields[3] as String,
      itemBrand: fields[4] == null ? '' : fields[4] as String,
      principalName: fields[5] == null ? '' : fields[5] as String,
      principalCode: fields[6] == null ? '' : fields[6] as String,
      taxClassification: fields[7] == null ? '' : fields[7] as String,
      itemRegistrationNumber: fields[8] == null ? '' : fields[8] as String,
      unitOfMeasurement: fields[9] == null ? '' : fields[9] as String,
      materialGroup2: fields[10] == null ? '' : fields[10] as String,
      materialGroup4: fields[11] == null ? '' : fields[11] as String,
      isSampleMaterial: fields[12] == null ? false : fields[12] as bool,
      hidePrice: fields[13] == null ? false : fields[13] as bool,
      hasValidTenderContract: fields[14] == null ? false : fields[14] as bool,
      hasMandatoryTenderContract:
          fields[15] == null ? false : fields[15] as bool,
      taxes: fields[16] == null ? ['0'] : (fields[16] as List).cast<String>(),
      bundles: fields[17] == null ? [] : (fields[17] as List).cast<BundleDto>(),
      defaultMaterialDescription:
          fields[18] == null ? '' : fields[18] as String,
      isFOCMaterial: fields[19] == null ? false : fields[19] as bool,
      quantity: fields[20] == null ? 0 : fields[20] as int,
      remarks: fields[21] == null ? '' : fields[21] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_MaterialDto obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.materialNumber)
      ..writeByte(1)
      ..write(obj.materialDescription)
      ..writeByte(2)
      ..write(obj.governmentMaterialCode)
      ..writeByte(3)
      ..write(obj.therapeuticClass)
      ..writeByte(4)
      ..write(obj.itemBrand)
      ..writeByte(5)
      ..write(obj.principalName)
      ..writeByte(6)
      ..write(obj.principalCode)
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
      ..writeByte(13)
      ..write(obj.hidePrice)
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
      ..writeByte(16)
      ..write(obj.taxes)
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialDto _$$_MaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      governmentMaterialCode: json['governmentMaterialCode'] as String? ?? '',
      therapeuticClass: json['therapeuticClass'] as String? ?? '',
      itemBrand: json['itemBrand'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      taxClassification: json['taxClassification'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      unitOfMeasurement: json['unitOfMeasurement'] as String? ?? '',
      materialGroup2: json['materialGroup2'] as String? ?? '',
      materialGroup4: json['materialGroup4'] as String? ?? '',
      isSampleMaterial: json['isSampleMaterial'] as bool? ?? false,
      hidePrice: json['hidePrice'] as bool? ?? false,
      hasValidTenderContract: json['hasValidTenderContract'] as bool? ?? false,
      hasMandatoryTenderContract:
          json['hasMandatoryTenderContract'] as bool? ?? false,
      taxes: (handleEmptyTaxList(json, 'taxes') as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          ['0'],
      bundles: (json['bundles'] as List<dynamic>?)
              ?.map((e) => BundleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      isFOCMaterial: json['isFOCMaterial'] as bool? ?? false,
      quantity: json['quantity'] as int? ?? 0,
      remarks: json['remarks'] as String? ?? '',
    );

Map<String, dynamic> _$$_MaterialDtoToJson(_$_MaterialDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'governmentMaterialCode': instance.governmentMaterialCode,
      'therapeuticClass': instance.therapeuticClass,
      'itemBrand': instance.itemBrand,
      'principalName': instance.principalName,
      'principalCode': instance.principalCode,
      'taxClassification': instance.taxClassification,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'materialGroup2': instance.materialGroup2,
      'materialGroup4': instance.materialGroup4,
      'isSampleMaterial': instance.isSampleMaterial,
      'hidePrice': instance.hidePrice,
      'hasValidTenderContract': instance.hasValidTenderContract,
      'hasMandatoryTenderContract': instance.hasMandatoryTenderContract,
      'taxes': instance.taxes,
      'bundles': instance.bundles,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'isFOCMaterial': instance.isFOCMaterial,
      'quantity': instance.quantity,
      'remarks': instance.remarks,
    };
