// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemDtoAdapter extends TypeAdapter<_$_CartItemDto> {
  @override
  final int typeId = 21;

  @override
  _$_CartItemDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_CartItemDto(
      materials: fields[0] == null
          ? []
          : (fields[0] as List).cast<PriceAggregateDto>(),
      itemType:
          fields[1] == null ? CartItemType.material : fields[1] as CartItemType,
      isSelected: fields[2] == null ? true : fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_CartItemDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.itemType)
      ..writeByte(2)
      ..write(obj.isSelected)
      ..writeByte(0)
      ..write(obj.materials);
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
