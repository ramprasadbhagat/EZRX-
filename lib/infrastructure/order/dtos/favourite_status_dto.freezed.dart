// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavouriteStatusDto _$FavouriteStatusDtoFromJson(Map<String, dynamic> json) {
  return _FavouriteStatusDto.fromJson(json);
}

/// @nodoc
mixin _$FavouriteStatusDto {
  @JsonKey(name: 'isFavourite', defaultValue: false)
  bool get isFavourite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteStatusDtoCopyWith<FavouriteStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteStatusDtoCopyWith<$Res> {
  factory $FavouriteStatusDtoCopyWith(
          FavouriteStatusDto value, $Res Function(FavouriteStatusDto) then) =
      _$FavouriteStatusDtoCopyWithImpl<$Res, FavouriteStatusDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'isFavourite', defaultValue: false) bool isFavourite});
}

/// @nodoc
class _$FavouriteStatusDtoCopyWithImpl<$Res, $Val extends FavouriteStatusDto>
    implements $FavouriteStatusDtoCopyWith<$Res> {
  _$FavouriteStatusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavourite = null,
  }) {
    return _then(_value.copyWith(
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavouriteStatusDtoCopyWith<$Res>
    implements $FavouriteStatusDtoCopyWith<$Res> {
  factory _$$_FavouriteStatusDtoCopyWith(_$_FavouriteStatusDto value,
          $Res Function(_$_FavouriteStatusDto) then) =
      __$$_FavouriteStatusDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'isFavourite', defaultValue: false) bool isFavourite});
}

/// @nodoc
class __$$_FavouriteStatusDtoCopyWithImpl<$Res>
    extends _$FavouriteStatusDtoCopyWithImpl<$Res, _$_FavouriteStatusDto>
    implements _$$_FavouriteStatusDtoCopyWith<$Res> {
  __$$_FavouriteStatusDtoCopyWithImpl(
      _$_FavouriteStatusDto _value, $Res Function(_$_FavouriteStatusDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavourite = null,
  }) {
    return _then(_$_FavouriteStatusDto(
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavouriteStatusDto extends _FavouriteStatusDto {
  _$_FavouriteStatusDto(
      {@JsonKey(name: 'isFavourite', defaultValue: false)
          required this.isFavourite})
      : super._();

  factory _$_FavouriteStatusDto.fromJson(Map<String, dynamic> json) =>
      _$$_FavouriteStatusDtoFromJson(json);

  @override
  @JsonKey(name: 'isFavourite', defaultValue: false)
  final bool isFavourite;

  @override
  String toString() {
    return 'FavouriteStatusDto(isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouriteStatusDto &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isFavourite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouriteStatusDtoCopyWith<_$_FavouriteStatusDto> get copyWith =>
      __$$_FavouriteStatusDtoCopyWithImpl<_$_FavouriteStatusDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavouriteStatusDtoToJson(
      this,
    );
  }
}

abstract class _FavouriteStatusDto extends FavouriteStatusDto {
  factory _FavouriteStatusDto(
      {@JsonKey(name: 'isFavourite', defaultValue: false)
          required final bool isFavourite}) = _$_FavouriteStatusDto;
  _FavouriteStatusDto._() : super._();

  factory _FavouriteStatusDto.fromJson(Map<String, dynamic> json) =
      _$_FavouriteStatusDto.fromJson;

  @override
  @JsonKey(name: 'isFavourite', defaultValue: false)
  bool get isFavourite;
  @override
  @JsonKey(ignore: true)
  _$$_FavouriteStatusDtoCopyWith<_$_FavouriteStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}
