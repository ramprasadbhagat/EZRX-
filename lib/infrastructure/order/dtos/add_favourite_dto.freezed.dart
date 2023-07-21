// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_favourite_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddFavouriteDto _$AddFavouriteDtoFromJson(Map<String, dynamic> json) {
  return _AddFavouriteDto.fromJson(json);
}

/// @nodoc
mixin _$AddFavouriteDto {
  @JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
  int get addFavouriteMaterial => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddFavouriteDtoCopyWith<AddFavouriteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFavouriteDtoCopyWith<$Res> {
  factory $AddFavouriteDtoCopyWith(
          AddFavouriteDto value, $Res Function(AddFavouriteDto) then) =
      _$AddFavouriteDtoCopyWithImpl<$Res, AddFavouriteDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
      int addFavouriteMaterial});
}

/// @nodoc
class _$AddFavouriteDtoCopyWithImpl<$Res, $Val extends AddFavouriteDto>
    implements $AddFavouriteDtoCopyWith<$Res> {
  _$AddFavouriteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addFavouriteMaterial = null,
  }) {
    return _then(_value.copyWith(
      addFavouriteMaterial: null == addFavouriteMaterial
          ? _value.addFavouriteMaterial
          : addFavouriteMaterial // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddFavouriteDtoCopyWith<$Res>
    implements $AddFavouriteDtoCopyWith<$Res> {
  factory _$$_AddFavouriteDtoCopyWith(
          _$_AddFavouriteDto value, $Res Function(_$_AddFavouriteDto) then) =
      __$$_AddFavouriteDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
      int addFavouriteMaterial});
}

/// @nodoc
class __$$_AddFavouriteDtoCopyWithImpl<$Res>
    extends _$AddFavouriteDtoCopyWithImpl<$Res, _$_AddFavouriteDto>
    implements _$$_AddFavouriteDtoCopyWith<$Res> {
  __$$_AddFavouriteDtoCopyWithImpl(
      _$_AddFavouriteDto _value, $Res Function(_$_AddFavouriteDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addFavouriteMaterial = null,
  }) {
    return _then(_$_AddFavouriteDto(
      addFavouriteMaterial: null == addFavouriteMaterial
          ? _value.addFavouriteMaterial
          : addFavouriteMaterial // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddFavouriteDto extends _AddFavouriteDto {
  const _$_AddFavouriteDto(
      {@JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
      required this.addFavouriteMaterial})
      : super._();

  factory _$_AddFavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$$_AddFavouriteDtoFromJson(json);

  @override
  @JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
  final int addFavouriteMaterial;

  @override
  String toString() {
    return 'AddFavouriteDto(addFavouriteMaterial: $addFavouriteMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddFavouriteDto &&
            (identical(other.addFavouriteMaterial, addFavouriteMaterial) ||
                other.addFavouriteMaterial == addFavouriteMaterial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, addFavouriteMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFavouriteDtoCopyWith<_$_AddFavouriteDto> get copyWith =>
      __$$_AddFavouriteDtoCopyWithImpl<_$_AddFavouriteDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddFavouriteDtoToJson(
      this,
    );
  }
}

abstract class _AddFavouriteDto extends AddFavouriteDto {
  const factory _AddFavouriteDto(
      {@JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
      required final int addFavouriteMaterial}) = _$_AddFavouriteDto;
  const _AddFavouriteDto._() : super._();

  factory _AddFavouriteDto.fromJson(Map<String, dynamic> json) =
      _$_AddFavouriteDto.fromJson;

  @override
  @JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
  int get addFavouriteMaterial;
  @override
  @JsonKey(ignore: true)
  _$$_AddFavouriteDtoCopyWith<_$_AddFavouriteDto> get copyWith =>
      throw _privateConstructorUsedError;
}
