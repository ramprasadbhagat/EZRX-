// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_material_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComboDealMaterialSetDtoAdapter
    extends TypeAdapter<_$_ComboDealMaterialSetDto> {
  @override
  final int typeId = 25;

  @override
  _$_ComboDealMaterialSetDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ComboDealMaterialSetDto(
      setNo: fields[0] == null ? '' : fields[0] as String,
      materials: fields[1] == null
          ? []
          : (fields[1] as List).cast<ComboDealMaterialDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_ComboDealMaterialSetDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.setNo)
      ..writeByte(1)
      ..write(obj.materials);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComboDealMaterialSetDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ComboDealMaterialDtoAdapter extends TypeAdapter<_$_ComboDealMaterialDto> {
  @override
  final int typeId = 26;

  @override
  _$_ComboDealMaterialDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ComboDealMaterialDto(
      minQty: fields[0] == null ? 0 : fields[0] as int,
      materialNumber: fields[1] == null ? '' : fields[1] as String,
      rate: fields[2] == null ? 0 : fields[2] as double,
      type: fields[3] == null ? '' : fields[3] as String,
      conditionNumber: fields[4] == null ? '' : fields[4] as String,
      mandatory: fields[5] == null ? false : fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ComboDealMaterialDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.minQty)
      ..writeByte(1)
      ..write(obj.materialNumber)
      ..writeByte(2)
      ..write(obj.rate)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.conditionNumber)
      ..writeByte(5)
      ..write(obj.mandatory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComboDealMaterialDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboDealMaterialSetDto _$$_ComboDealMaterialSetDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealMaterialSetDto(
      setNo: json['setNo'] as String? ?? '',
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ComboDealMaterialSetDtoToJson(
        _$_ComboDealMaterialSetDto instance) =>
    <String, dynamic>{
      'setNo': instance.setNo,
      'materials': instance.materials.map((e) => e.toJson()).toList(),
    };

_$_ComboDealMaterialDto _$$_ComboDealMaterialDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealMaterialDto(
      minQty: json['minQty'] == null
          ? 0
          : const StringToIntConverter().fromJson(json['minQty'] as String),
      materialNumber: json['materialNumber'] as String? ?? '',
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      type: json['type'] as String? ?? '',
      conditionNumber: json['conditionNumber'] as String? ?? '',
      mandatory: json['mandatory'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ComboDealMaterialDtoToJson(
        _$_ComboDealMaterialDto instance) =>
    <String, dynamic>{
      'minQty': const StringToIntConverter().toJson(instance.minQty),
      'materialNumber': instance.materialNumber,
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'type': instance.type,
      'conditionNumber': instance.conditionNumber,
      'mandatory': instance.mandatory,
    };
