// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemTypeAdapter extends TypeAdapter<CartItemType> {
  @override
  final int typeId = 22;

  @override
  CartItemType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CartItemType.material;
      case 1:
        return CartItemType.bundle;
      default:
        return CartItemType.material;
    }
  }

  @override
  void write(BinaryWriter writer, CartItemType obj) {
    switch (obj) {
      case CartItemType.material:
        writer.writeByte(0);
        break;
      case CartItemType.bundle:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
