// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_amount_tier_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComboDealAmountTierDtoAdapter
    extends TypeAdapter<_$_ComboDealAmountTierDto> {
  @override
  final int typeId = 30;

  @override
  _$_ComboDealAmountTierDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ComboDealAmountTierDto(
      rate: fields[0] == null ? '' : fields[0] as String,
      conditionNumber: fields[1] == null ? '' : fields[1] as String,
      minTotalAmount: fields[2] == null ? '' : fields[2] as String,
      minTotalCurrency: fields[3] == null ? '' : fields[3] as String,
      maxTotalAmount: fields[4] == null ? '' : fields[4] as String,
      maxTotalCurrency: fields[5] == null ? '' : fields[5] as String,
      type: fields[6] == null ? '' : fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ComboDealAmountTierDto obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComboDealAmountTierDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboDealAmountTierDto _$$_ComboDealAmountTierDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealAmountTierDto(
      rate: json['rate'] as String? ?? '',
      conditionNumber: json['conditionNumber'] as String? ?? '',
      minTotalAmount: json['minTotalAmount'] as String? ?? '',
      minTotalCurrency: json['minTotalCurrency'] as String? ?? '',
      maxTotalAmount: json['maxTotalAmount'] as String? ?? '',
      maxTotalCurrency: json['maxTotalCurrency'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$_ComboDealAmountTierDtoToJson(
        _$_ComboDealAmountTierDto instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'conditionNumber': instance.conditionNumber,
      'minTotalAmount': instance.minTotalAmount,
      'minTotalCurrency': instance.minTotalCurrency,
      'maxTotalAmount': instance.maxTotalAmount,
      'maxTotalCurrency': instance.maxTotalCurrency,
      'type': instance.type,
    };
