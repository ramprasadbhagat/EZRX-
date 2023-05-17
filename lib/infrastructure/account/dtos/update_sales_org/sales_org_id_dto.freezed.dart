// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_org_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesOrgIdDto _$SalesOrgIdDtoFromJson(Map<String, dynamic> json) {
  return _SalesOrgIdDto.fromJson(json);
}

/// @nodoc
mixin _$SalesOrgIdDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesOrgIdDtoCopyWith<SalesOrgIdDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrgIdDtoCopyWith<$Res> {
  factory $SalesOrgIdDtoCopyWith(
          SalesOrgIdDto value, $Res Function(SalesOrgIdDto) then) =
      _$SalesOrgIdDtoCopyWithImpl<$Res, SalesOrgIdDto>;
  @useResult
  $Res call({@JsonKey(name: 'id') int id});
}

/// @nodoc
class _$SalesOrgIdDtoCopyWithImpl<$Res, $Val extends SalesOrgIdDto>
    implements $SalesOrgIdDtoCopyWith<$Res> {
  _$SalesOrgIdDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesOrgIdDtoCopyWith<$Res>
    implements $SalesOrgIdDtoCopyWith<$Res> {
  factory _$$_SalesOrgIdDtoCopyWith(
          _$_SalesOrgIdDto value, $Res Function(_$_SalesOrgIdDto) then) =
      __$$_SalesOrgIdDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id') int id});
}

/// @nodoc
class __$$_SalesOrgIdDtoCopyWithImpl<$Res>
    extends _$SalesOrgIdDtoCopyWithImpl<$Res, _$_SalesOrgIdDto>
    implements _$$_SalesOrgIdDtoCopyWith<$Res> {
  __$$_SalesOrgIdDtoCopyWithImpl(
      _$_SalesOrgIdDto _value, $Res Function(_$_SalesOrgIdDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_SalesOrgIdDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalesOrgIdDto extends _SalesOrgIdDto {
  const _$_SalesOrgIdDto({@JsonKey(name: 'id') required this.id}) : super._();

  factory _$_SalesOrgIdDto.fromJson(Map<String, dynamic> json) =>
      _$$_SalesOrgIdDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;

  @override
  String toString() {
    return 'SalesOrgIdDto(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrgIdDto &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesOrgIdDtoCopyWith<_$_SalesOrgIdDto> get copyWith =>
      __$$_SalesOrgIdDtoCopyWithImpl<_$_SalesOrgIdDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesOrgIdDtoToJson(
      this,
    );
  }
}

abstract class _SalesOrgIdDto extends SalesOrgIdDto {
  const factory _SalesOrgIdDto({@JsonKey(name: 'id') required final int id}) =
      _$_SalesOrgIdDto;
  const _SalesOrgIdDto._() : super._();

  factory _SalesOrgIdDto.fromJson(Map<String, dynamic> json) =
      _$_SalesOrgIdDto.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrgIdDtoCopyWith<_$_SalesOrgIdDto> get copyWith =>
      throw _privateConstructorUsedError;
}
