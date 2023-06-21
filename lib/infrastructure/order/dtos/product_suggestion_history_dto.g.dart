// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_suggestion_history_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductSuggestionHistoryDtoAdapter
    extends TypeAdapter<_$_ProductSuggestionHistoryDto> {
  @override
  final int typeId = 38;

  @override
  _$_ProductSuggestionHistoryDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ProductSuggestionHistoryDto(
      searchKeyList:
          fields[0] == null ? [] : (fields[0] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_ProductSuggestionHistoryDto obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.searchKeyList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductSuggestionHistoryDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductSuggestionHistoryDto _$$_ProductSuggestionHistoryDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ProductSuggestionHistoryDto(
      searchKeyList: (json['searchKeyList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ProductSuggestionHistoryDtoToJson(
        _$_ProductSuggestionHistoryDto instance) =>
    <String, dynamic>{
      'searchKeyList': instance.searchKeyList,
    };
