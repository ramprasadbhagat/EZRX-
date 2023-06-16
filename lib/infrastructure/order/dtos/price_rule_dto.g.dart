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
      tieredRules: fields[17] == null
          ? TieredRulesDto.empty
          : fields[17] as TieredRulesDto,
      bonusEligible: fields[18] == null ? false : fields[18] as bool,
      conditionNumber: fields[19] == null ? '' : fields[19] as String,
      overriddenBy: fields[20] == null ? '' : fields[20] as String,
      maxQuota: fields[21] == null ? '' : fields[21] as String,
      remainingQuota: fields[22] == null ? '' : fields[22] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceRuleDto obj) {
    writer
      ..writeByte(9)
      ..writeByte(14)
      ..write(obj.type)
      ..writeByte(15)
      ..write(obj.rate)
      ..writeByte(16)
      ..write(obj.condition)
      ..writeByte(17)
      ..write(obj.tieredRules)
      ..writeByte(18)
      ..write(obj.bonusEligible)
      ..writeByte(19)
      ..write(obj.conditionNumber)
      ..writeByte(20)
      ..write(obj.overriddenBy)
      ..writeByte(21)
      ..write(obj.maxQuota)
      ..writeByte(22)
      ..write(obj.remainingQuota);
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

class TieredRulesDtoAdapter extends TypeAdapter<_$_TieredRulesDto> {
  @override
  final int typeId = 36;

  @override
  _$_TieredRulesDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_TieredRulesDto(
      tier: fields[14] == null ? '' : fields[14] as String,
      ruleTier:
          fields[15] == null ? [] : (fields[15] as List).cast<RuleTierDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_TieredRulesDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(14)
      ..write(obj.tier)
      ..writeByte(15)
      ..write(obj.ruleTier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TieredRulesDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RuleTierDtoAdapter extends TypeAdapter<_$_RuleTierDto> {
  @override
  final int typeId = 37;

  @override
  _$_RuleTierDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_RuleTierDto(
      rate: fields[14] == null ? 0 : fields[14] as double,
      quantity: fields[15] == null ? 0 : fields[15] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$_RuleTierDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(14)
      ..write(obj.rate)
      ..writeByte(15)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuleTierDtoAdapter &&
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
      tieredRules: json['TieredRules'] == null
          ? TieredRulesDto.empty
          : TieredRulesDto.fromJson(
              json['TieredRules'] as Map<String, dynamic>),
      bonusEligible: json['BonusEligible'] as bool? ?? false,
      conditionNumber: json['ConditionNumber'] as String? ?? '',
      overriddenBy: json['OverriddenBy'] as String? ?? '',
      maxQuota: json['MaxQuota'] as String? ?? '',
      remainingQuota: json['RemainingQuota'] as String? ?? '',
    );

Map<String, dynamic> _$$_PriceRuleDtoToJson(_$_PriceRuleDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Rate': instance.rate,
      'Conditions': instance.condition,
      'TieredRules': instance.tieredRules.toJson(),
      'BonusEligible': instance.bonusEligible,
      'ConditionNumber': instance.conditionNumber,
      'OverriddenBy': instance.overriddenBy,
      'MaxQuota': instance.maxQuota,
      'RemainingQuota': instance.remainingQuota,
    };

_$_TieredRulesDto _$$_TieredRulesDtoFromJson(Map<String, dynamic> json) =>
    _$_TieredRulesDto(
      tier: json['Tier'] as String? ?? '',
      ruleTier: (json['RuleTier'] as List<dynamic>?)
              ?.map((e) => RuleTierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_TieredRulesDtoToJson(_$_TieredRulesDto instance) =>
    <String, dynamic>{
      'Tier': instance.tier,
      'RuleTier': instance.ruleTier.map((e) => e.toJson()).toList(),
    };

_$_RuleTierDto _$$_RuleTierDtoFromJson(Map<String, dynamic> json) =>
    _$_RuleTierDto(
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
      quantity: (json['Quantity'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_RuleTierDtoToJson(_$_RuleTierDto instance) =>
    <String, dynamic>{
      'Rate': instance.rate,
      'Quantity': instance.quantity,
    };
