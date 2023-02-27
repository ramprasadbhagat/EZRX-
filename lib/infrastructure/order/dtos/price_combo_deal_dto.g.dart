// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_combo_deal_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceComboDealDtoAdapter extends TypeAdapter<_$_PriceComboDealDto> {
  @override
  final int typeId = 17;

  @override
  _$_PriceComboDealDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceComboDealDto(
      isEligible: fields[0] == null ? false : fields[0] as bool,
      flexibleGroup: fields[1] == null ? '' : fields[1] as String,
      salesDeal: fields[2] == null ? '' : fields[2] as String,
      category: fields[3] == null
          ? PriceComboDealCategoryDto.empty
          : fields[3] as PriceComboDealCategoryDto,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceComboDealDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.isEligible)
      ..writeByte(1)
      ..write(obj.flexibleGroup)
      ..writeByte(2)
      ..write(obj.salesDeal)
      ..writeByte(3)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceComboDealDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriceComboDealCategoryDtoAdapter
    extends TypeAdapter<_$_PriceComboDealCategoryDto> {
  @override
  final int typeId = 23;

  @override
  _$_PriceComboDealCategoryDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceComboDealCategoryDto(
      type: fields[0] == null ? '' : fields[0] as String,
      value: fields[1] == null ? [] : (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceComboDealCategoryDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceComboDealCategoryDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceComboDealDto _$$_PriceComboDealDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceComboDealDto(
      isEligible: json['Eligible'] as bool? ?? false,
      flexibleGroup: json['FlexibleGroup'] as String? ?? '',
      salesDeal: json['SalesDeal'] as String? ?? '',
      category: json['Category'] == null
          ? PriceComboDealCategoryDto.empty
          : PriceComboDealCategoryDto.fromJson(
              json['Category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PriceComboDealDtoToJson(
        _$_PriceComboDealDto instance) =>
    <String, dynamic>{
      'Eligible': instance.isEligible,
      'FlexibleGroup': instance.flexibleGroup,
      'SalesDeal': instance.salesDeal,
      'Category': instance.category.toJson(),
    };

_$_PriceComboDealCategoryDto _$$_PriceComboDealCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PriceComboDealCategoryDto(
      type: json['Type'] as String? ?? '',
      value:
          (json['Value'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$$_PriceComboDealCategoryDtoToJson(
        _$_PriceComboDealCategoryDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Value': instance.value,
    };
