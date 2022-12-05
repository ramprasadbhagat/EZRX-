// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_item_bonus_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaterialItemBonusDtoAdapter extends TypeAdapter<_$_MaterialItemBonusDto> {
  @override
  final int typeId = 19;

  @override
  _$_MaterialItemBonusDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_MaterialItemBonusDto(
      materialNumber: fields[51] == null ? '' : fields[51] as String,
      qty: fields[52] == null ? 0 : fields[52] as int,
      comment: fields[53] == null ? '' : fields[53] as String,
      materialDescription: fields[54] == null ? '' : fields[54] as String,
      expiryDate: fields[55] == null ? '' : fields[55] as String,
      inStock: fields[56] == null ? '' : fields[56] as String,
      remainingQty: fields[57] == null ? 0 : fields[57] as int,
      bonusOverrideFlag: fields[58] == null ? false : fields[58] as bool,
      additionalBonusFlag: fields[59] == null ? false : fields[59] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_MaterialItemBonusDto obj) {
    writer
      ..writeByte(9)
      ..writeByte(51)
      ..write(obj.materialNumber)
      ..writeByte(52)
      ..write(obj.qty)
      ..writeByte(53)
      ..write(obj.comment)
      ..writeByte(54)
      ..write(obj.materialDescription)
      ..writeByte(55)
      ..write(obj.expiryDate)
      ..writeByte(56)
      ..write(obj.inStock)
      ..writeByte(57)
      ..write(obj.remainingQty)
      ..writeByte(58)
      ..write(obj.bonusOverrideFlag)
      ..writeByte(59)
      ..write(obj.additionalBonusFlag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaterialItemBonusDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialItemBonusDto _$$_MaterialItemBonusDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaterialItemBonusDto(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      qty: json['freeQuantity'] as int? ?? 0,
      comment: json['comment'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      expiryDate: json['expiryDate'] as String? ?? '',
      inStock: json['inStock'] as String? ?? '',
      remainingQty: json['remainingQty'] as int? ?? 0,
      bonusOverrideFlag: json['bonusOverrideFlag'] as bool? ?? false,
      additionalBonusFlag: json['additionalBonusFlag'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MaterialItemBonusDtoToJson(
        _$_MaterialItemBonusDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'freeQuantity': instance.qty,
      'comment': instance.comment,
      'MaterialDescription': instance.materialDescription,
      'expiryDate': instance.expiryDate,
      'inStock': instance.inStock,
      'remainingQty': instance.remainingQty,
      'bonusOverrideFlag': instance.bonusOverrideFlag,
      'additionalBonusFlag': instance.additionalBonusFlag,
    };
