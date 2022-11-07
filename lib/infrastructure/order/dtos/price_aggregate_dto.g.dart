// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_aggregate_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceAggregateDtoAdapter extends TypeAdapter<PriceAggregateDto> {
  @override
  final int typeId = 2;

  @override
  PriceAggregateDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PriceAggregateDto(
      materialDto: fields[0] as MaterialDto,
      quantity: fields[1] as int,
      priceDto: fields[2] as PriceDto,
      salesOrganisationConfigsDto: fields[3] as SalesOrganisationConfigsDto,
      zmgMaterialCountOnCart: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PriceAggregateDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.materialDto)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.priceDto)
      ..writeByte(3)
      ..write(obj.salesOrganisationConfigsDto)
      ..writeByte(4)
      ..write(obj.zmgMaterialCountOnCart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceAggregateDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
