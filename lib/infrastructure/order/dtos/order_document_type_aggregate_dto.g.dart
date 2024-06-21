// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_document_type_aggregate_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDocumentTypeDtoAdapter
    extends TypeAdapter<_$OrderDocumentTypeDtoImpl> {
  @override
  final int typeId = 31;

  @override
  _$OrderDocumentTypeDtoImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$OrderDocumentTypeDtoImpl(
      salesOrg: fields[0] == null ? '' : fields[0] as String,
      documentType: fields[1] == null ? '' : fields[1] as String,
      description: fields[2] == null ? '' : fields[2] as String,
      shippingCondition: fields[3] == null ? '' : fields[3] as String,
      orderReason: fields[4] == null ? '' : fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$OrderDocumentTypeDtoImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.salesOrg)
      ..writeByte(1)
      ..write(obj.documentType)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.shippingCondition)
      ..writeByte(4)
      ..write(obj.orderReason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDocumentTypeDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDocumentTypeDtoImpl _$$OrderDocumentTypeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDocumentTypeDtoImpl(
      salesOrg: json['salesOrg'] as String,
      documentType: json['documentType'] as String,
      description: json['description'] as String,
      shippingCondition: json['shippingCondition'] as String,
      orderReason: json['orderReason'] as String,
    );

Map<String, dynamic> _$$OrderDocumentTypeDtoImplToJson(
        _$OrderDocumentTypeDtoImpl instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'documentType': instance.documentType,
      'description': instance.description,
      'shippingCondition': instance.shippingCondition,
      'orderReason': instance.orderReason,
    };
