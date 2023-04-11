// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_organisation_configs_principal_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalesOrganisationConfigsPrincipalDtoAdapter
    extends TypeAdapter<_$_SalesOrganisationConfigsPrincipalDto> {
  @override
  final int typeId = 33;

  @override
  _$_SalesOrganisationConfigsPrincipalDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_SalesOrganisationConfigsPrincipalDto(
      date: fields[1] == null ? 0 : fields[1] as int,
      principalCode: fields[2] == null ? '' : fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_SalesOrganisationConfigsPrincipalDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.principalCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalesOrganisationConfigsPrincipalDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesOrganisationConfigsPrincipalDto
    _$$_SalesOrganisationConfigsPrincipalDtoFromJson(
            Map<String, dynamic> json) =>
        _$_SalesOrganisationConfigsPrincipalDto(
          date: json['date'] as int? ?? 0,
          principalCode: json['principal'] as String,
        );

Map<String, dynamic> _$$_SalesOrganisationConfigsPrincipalDtoToJson(
        _$_SalesOrganisationConfigsPrincipalDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'principal': instance.principalCode,
    };
