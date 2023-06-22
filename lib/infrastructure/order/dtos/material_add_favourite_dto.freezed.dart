// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_add_favourite_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialAddFavouriteDto _$MaterialAddFavouriteDtoFromJson(
    Map<String, dynamic> json) {
  return _MaterialAddFavouriteDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialAddFavouriteDto {
  @JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
  int get addFavouriteMaterial => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialAddFavouriteDtoCopyWith<MaterialAddFavouriteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialAddFavouriteDtoCopyWith<$Res> {
  factory $MaterialAddFavouriteDtoCopyWith(MaterialAddFavouriteDto value,
          $Res Function(MaterialAddFavouriteDto) then) =
      _$MaterialAddFavouriteDtoCopyWithImpl<$Res, MaterialAddFavouriteDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
          int addFavouriteMaterial});
}

/// @nodoc
class _$MaterialAddFavouriteDtoCopyWithImpl<$Res,
        $Val extends MaterialAddFavouriteDto>
    implements $MaterialAddFavouriteDtoCopyWith<$Res> {
  _$MaterialAddFavouriteDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_MaterialAddFavouriteDtoCopyWith<$Res>
    implements $MaterialAddFavouriteDtoCopyWith<$Res> {
  factory _$$_MaterialAddFavouriteDtoCopyWith(_$_MaterialAddFavouriteDto value,
          $Res Function(_$_MaterialAddFavouriteDto) then) =
      __$$_MaterialAddFavouriteDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
          int addFavouriteMaterial});
}

/// @nodoc
class __$$_MaterialAddFavouriteDtoCopyWithImpl<$Res>
    extends _$MaterialAddFavouriteDtoCopyWithImpl<$Res,
        _$_MaterialAddFavouriteDto>
    implements _$$_MaterialAddFavouriteDtoCopyWith<$Res> {
  __$$_MaterialAddFavouriteDtoCopyWithImpl(_$_MaterialAddFavouriteDto _value,
      $Res Function(_$_MaterialAddFavouriteDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addFavouriteMaterial = null,
  }) {
    return _then(_$_MaterialAddFavouriteDto(
      addFavouriteMaterial: null == addFavouriteMaterial
          ? _value.addFavouriteMaterial
          : addFavouriteMaterial // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialAddFavouriteDto extends _MaterialAddFavouriteDto {
  const _$_MaterialAddFavouriteDto(
      {@JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
          required this.addFavouriteMaterial})
      : super._();

  factory _$_MaterialAddFavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialAddFavouriteDtoFromJson(json);

  @override
  @JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
  final int addFavouriteMaterial;

  @override
  String toString() {
    return 'MaterialAddFavouriteDto(addFavouriteMaterial: $addFavouriteMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialAddFavouriteDto &&
            (identical(other.addFavouriteMaterial, addFavouriteMaterial) ||
                other.addFavouriteMaterial == addFavouriteMaterial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, addFavouriteMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialAddFavouriteDtoCopyWith<_$_MaterialAddFavouriteDto>
      get copyWith =>
          __$$_MaterialAddFavouriteDtoCopyWithImpl<_$_MaterialAddFavouriteDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialAddFavouriteDtoToJson(
      this,
    );
  }
}

abstract class _MaterialAddFavouriteDto extends MaterialAddFavouriteDto {
  const factory _MaterialAddFavouriteDto(
          {@JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
              required final int addFavouriteMaterial}) =
      _$_MaterialAddFavouriteDto;
  const _MaterialAddFavouriteDto._() : super._();

  factory _MaterialAddFavouriteDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialAddFavouriteDto.fromJson;

  @override
  @JsonKey(name: 'addFavouriteMaterial', defaultValue: 0)
  int get addFavouriteMaterial;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialAddFavouriteDtoCopyWith<_$_MaterialAddFavouriteDto>
      get copyWith => throw _privateConstructorUsedError;
}
