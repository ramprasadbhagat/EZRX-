// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_rule_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceRuleDtoAdapter extends TypeAdapter<_$_PriceRuleDto> {
  @override
  final int typeId = 7;

  @override
  _$_PriceRuleDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceRuleDto(
      type: fields[14] == null ? '' : fields[14] as String,
      rate: fields[15] == null ? 0 : fields[15] as double,
      condition: fields[16] == null ? '' : fields[16] as String,
      conditionNumber: fields[17] == null ? '' : fields[17] as String,
      bonusEligible: fields[18] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceRuleDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(14)
      ..write(obj.type)
      ..writeByte(15)
      ..write(obj.rate)
      ..writeByte(16)
      ..write(obj.condition)
      ..writeByte(17)
      ..write(obj.conditionNumber)
      ..writeByte(18)
      ..write(obj.bonusEligible);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceRuleDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceRuleDto _$$_PriceRuleDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceRuleDto(
      type: json['Type'] as String? ?? '',
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
      condition: json['Conditions'] as String? ?? '',
      conditionNumber: json['ConditionNumber'] as String? ?? '',
      bonusEligible: json['BonusEligible'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PriceRuleDtoToJson(_$_PriceRuleDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Rate': instance.rate,
      'Conditions': instance.condition,
      'ConditionNumber': instance.conditionNumber,
      'BonusEligible': instance.bonusEligible,
    };
