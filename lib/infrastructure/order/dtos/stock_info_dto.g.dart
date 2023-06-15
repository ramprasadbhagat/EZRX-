// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_info_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockInfoDtoAdapter extends TypeAdapter<_$_StockInfoDto> {
  @override
  final int typeId = 18;

  @override
  _$_StockInfoDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_StockInfoDto(
      materialNumber: fields[0] == null ? '' : fields[0] as String,
      expiryDate: fields[1] == null ? '' : fields[1] as String,
      batch: fields[2] == null ? '' : fields[2] as String,
      inStock: fields[3] == null ? '' : fields[3] as String,
      salesDistrict: fields[4] == null ? '' : fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_StockInfoDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.materialNumber)
      ..writeByte(1)
      ..write(obj.expiryDate)
      ..writeByte(2)
      ..write(obj.batch)
      ..writeByte(3)
      ..write(obj.inStock)
      ..writeByte(4)
      ..write(obj.salesDistrict);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockInfoDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialStockInfoDto _$$_MaterialStockInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaterialStockInfoDto(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      stockInformation: (json['StockInformation'] as List<dynamic>?)
              ?.map((e) => StockInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MaterialStockInfoDtoToJson(
        _$_MaterialStockInfoDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'StockInformation':
          instance.stockInformation.map((e) => e.toJson()).toList(),
    };

_$_StockInfoDto _$$_StockInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_StockInfoDto(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      expiryDate: json['ExpiryDate'] as String? ?? '',
      batch: json['Batch'] as String? ?? '',
      inStock: json['InStock'] as String? ?? '',
      salesDistrict: json['SalesDistrict'] as String? ?? '',
    );

Map<String, dynamic> _$$_StockInfoDtoToJson(_$_StockInfoDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'ExpiryDate': instance.expiryDate,
      'Batch': instance.batch,
      'InStock': instance.inStock,
      'SalesDistrict': instance.salesDistrict,
    };
