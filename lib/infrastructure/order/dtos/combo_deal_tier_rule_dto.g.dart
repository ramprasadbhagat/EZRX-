// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_tier_rule_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComboDealTierRuleDtoAdapter extends TypeAdapter<_$_ComboDealTierRuleDto> {
  @override
  final int typeId = 32;

  @override
  _$_ComboDealTierRuleDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ComboDealTierRuleDto(
      rate: fields[0] == null ? 0 : fields[0] as double,
      conditionNumber: fields[1] == null ? '' : fields[1] as String,
      minTotalAmount: fields[2] == null ? 0 : fields[2] as double,
      minTotalCurrency: fields[3] == null ? '' : fields[3] as String,
      maxTotalAmount: fields[4] == null ? 0 : fields[4] as double,
      maxTotalCurrency: fields[5] == null ? '' : fields[5] as String,
      type: fields[6] == null ? '' : fields[6] as String,
      minQty: fields[7] == null ? 0 : fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ComboDealTierRuleDto obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.rate)
      ..writeByte(1)
      ..write(obj.conditionNumber)
      ..writeByte(2)
      ..write(obj.minTotalAmount)
      ..writeByte(3)
      ..write(obj.minTotalCurrency)
      ..writeByte(4)
      ..write(obj.maxTotalAmount)
      ..writeByte(5)
      ..write(obj.maxTotalCurrency)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.minQty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComboDealTierRuleDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboDealTierRuleDto _$$_ComboDealTierRuleDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealTierRuleDto(
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      conditionNumber: json['conditionNumber'] as String? ?? '',
      minTotalAmount: json['minTotalAmount'] == null
          ? 0
          : const StringToDoubleConverter()
              .fromJson(json['minTotalAmount'] as String),
      minTotalCurrency: json['minTotalCurrency'] as String? ?? '',
      maxTotalAmount: json['maxTotalAmount'] == null
          ? 0
          : const StringToDoubleConverter()
              .fromJson(json['maxTotalAmount'] as String),
      maxTotalCurrency: json['maxTotalCurrency'] as String? ?? '',
      type: json['type'] as String? ?? '',
      minQty: json['minQty'] == null
          ? 0
          : const StringToIntConverter().fromJson(json['minQty'] as String),
    );

Map<String, dynamic> _$$_ComboDealTierRuleDtoToJson(
        _$_ComboDealTierRuleDto instance) =>
    <String, dynamic>{
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'conditionNumber': instance.conditionNumber,
      'minTotalAmount':
          const StringToDoubleConverter().toJson(instance.minTotalAmount),
      'minTotalCurrency': instance.minTotalCurrency,
      'maxTotalAmount':
          const StringToDoubleConverter().toJson(instance.maxTotalAmount),
      'maxTotalCurrency': instance.maxTotalCurrency,
      'type': instance.type,
      'minQty': const StringToIntConverter().toJson(instance.minQty),
    };
