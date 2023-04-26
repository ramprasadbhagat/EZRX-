// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BannerDtoAdapter extends TypeAdapter<_$_BannerDto> {
  @override
  final int typeId = 34;

  @override
  _$_BannerDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_BannerDto(
      id: fields[0] == null ? 0 : fields[0] as int,
      url: fields[1] == null ? '' : fields[1] as String,
      title: fields[2] == null ? '' : fields[2] as String,
      description: fields[3] == null ? '' : fields[3] as String,
      buttonLabel: fields[4] == null ? '' : fields[4] as String,
      urlLink: fields[5] == null ? '' : fields[5] as String,
      isPreSalesOrg: fields[6] == null ? false : fields[6] as bool,
      salesOrg: fields[7] == null ? '' : fields[7] as String,
      serial: fields[8] == null ? 0 : fields[8] as int,
      isCustomer: fields[9] == null ? false : fields[9] as bool,
      isKeyword: fields[10] == null ? false : fields[10] as bool,
      keyword: fields[11] == null ? '' : fields[11] as String,
      category: fields[12] == null ? '' : fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_BannerDto obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.buttonLabel)
      ..writeByte(5)
      ..write(obj.urlLink)
      ..writeByte(6)
      ..write(obj.isPreSalesOrg)
      ..writeByte(7)
      ..write(obj.salesOrg)
      ..writeByte(8)
      ..write(obj.serial)
      ..writeByte(9)
      ..write(obj.isCustomer)
      ..writeByte(10)
      ..write(obj.isKeyword)
      ..writeByte(11)
      ..write(obj.keyword)
      ..writeByte(12)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BannerDto _$$_BannerDtoFromJson(Map<String, dynamic> json) => _$_BannerDto(
      id: json['id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      buttonLabel: json['buttonLabel'] as String,
      urlLink: json['urlLink'] as String,
      isPreSalesOrg: json['isPreSalesOrg'] as bool,
      salesOrg: json['salesOrg'] as String,
      serial: json['serial'] as int,
      isCustomer: json['isCustomer'] as bool,
      isKeyword: json['isKeyword'] as bool? ?? false,
      keyword: json['keyword'] as String? ?? '',
      category: json['category'] as String? ?? '',
    );

Map<String, dynamic> _$$_BannerDtoToJson(_$_BannerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'buttonLabel': instance.buttonLabel,
      'urlLink': instance.urlLink,
      'isPreSalesOrg': instance.isPreSalesOrg,
      'salesOrg': instance.salesOrg,
      'serial': instance.serial,
      'isCustomer': instance.isCustomer,
      'isKeyword': instance.isKeyword,
      'keyword': instance.keyword,
      'category': instance.category,
    };
