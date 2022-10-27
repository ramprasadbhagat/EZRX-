// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemDtoAdapter extends TypeAdapter<CartItemDto> {
  @override
  final int typeId = 2;

  @override
  CartItemDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemDto(
      materialDto: fields[0] as MaterialDto,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartItemDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.materialDto)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
