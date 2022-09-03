// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'role_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoleDto _$RoleDtoFromJson(Map<String, dynamic> json) {
  return _RoleDto.fromJson(json);
}

/// @nodoc
mixin _$RoleDto {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleDtoCopyWith<RoleDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleDtoCopyWith<$Res> {
  factory $RoleDtoCopyWith(RoleDto value, $Res Function(RoleDto) then) =
      _$RoleDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'description') String description});
}

/// @nodoc
class _$RoleDtoCopyWithImpl<$Res> implements $RoleDtoCopyWith<$Res> {
  _$RoleDtoCopyWithImpl(this._value, this._then);

  final RoleDto _value;
  // ignore: unused_field
  final $Res Function(RoleDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RoleDtoCopyWith<$Res> implements $RoleDtoCopyWith<$Res> {
  factory _$$_RoleDtoCopyWith(
          _$_RoleDto value, $Res Function(_$_RoleDto) then) =
      __$$_RoleDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'description') String description});
}

/// @nodoc
class __$$_RoleDtoCopyWithImpl<$Res> extends _$RoleDtoCopyWithImpl<$Res>
    implements _$$_RoleDtoCopyWith<$Res> {
  __$$_RoleDtoCopyWithImpl(_$_RoleDto _value, $Res Function(_$_RoleDto) _then)
      : super(_value, (v) => _then(v as _$_RoleDto));

  @override
  _$_RoleDto get _value => super._value as _$_RoleDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_RoleDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoleDto extends _RoleDto {
  const _$_RoleDto(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'description') required this.description})
      : super._();

  factory _$_RoleDto.fromJson(Map<String, dynamic> json) =>
      _$$_RoleDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'description')
  final String description;

  @override
  String toString() {
    return 'RoleDto(id: $id, name: $name, type: $type, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoleDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_RoleDtoCopyWith<_$_RoleDto> get copyWith =>
      __$$_RoleDtoCopyWithImpl<_$_RoleDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoleDtoToJson(
      this,
    );
  }
}

abstract class _RoleDto extends RoleDto {
  const factory _RoleDto(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'type') required final String type,
          @JsonKey(name: 'description') required final String description}) =
      _$_RoleDto;
  const _RoleDto._() : super._();

  factory _RoleDto.fromJson(Map<String, dynamic> json) = _$_RoleDto.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_RoleDtoCopyWith<_$_RoleDto> get copyWith =>
      throw _privateConstructorUsedError;
}
