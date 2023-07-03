// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_order_favourite_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentOrderFavouriteDto _$RecentOrderFavouriteDtoFromJson(
    Map<String, dynamic> json) {
  return _RecentOrderFavouriteDto.fromJson(json);
}

/// @nodoc
mixin _$RecentOrderFavouriteDto {
  @JsonKey(name: 'isFavourite', defaultValue: false)
  bool get isFavourite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentOrderFavouriteDtoCopyWith<RecentOrderFavouriteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentOrderFavouriteDtoCopyWith<$Res> {
  factory $RecentOrderFavouriteDtoCopyWith(RecentOrderFavouriteDto value,
          $Res Function(RecentOrderFavouriteDto) then) =
      _$RecentOrderFavouriteDtoCopyWithImpl<$Res, RecentOrderFavouriteDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'isFavourite', defaultValue: false) bool isFavourite});
}

/// @nodoc
class _$RecentOrderFavouriteDtoCopyWithImpl<$Res,
        $Val extends RecentOrderFavouriteDto>
    implements $RecentOrderFavouriteDtoCopyWith<$Res> {
  _$RecentOrderFavouriteDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_RecentOrderFavouriteDtoCopyWith<$Res>
    implements $RecentOrderFavouriteDtoCopyWith<$Res> {
  factory _$$_RecentOrderFavouriteDtoCopyWith(_$_RecentOrderFavouriteDto value,
          $Res Function(_$_RecentOrderFavouriteDto) then) =
      __$$_RecentOrderFavouriteDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'isFavourite', defaultValue: false) bool isFavourite});
}

/// @nodoc
class __$$_RecentOrderFavouriteDtoCopyWithImpl<$Res>
    extends _$RecentOrderFavouriteDtoCopyWithImpl<$Res,
        _$_RecentOrderFavouriteDto>
    implements _$$_RecentOrderFavouriteDtoCopyWith<$Res> {
  __$$_RecentOrderFavouriteDtoCopyWithImpl(_$_RecentOrderFavouriteDto _value,
      $Res Function(_$_RecentOrderFavouriteDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavourite = null,
  }) {
    return _then(_$_RecentOrderFavouriteDto(
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecentOrderFavouriteDto extends _RecentOrderFavouriteDto {
  _$_RecentOrderFavouriteDto(
      {@JsonKey(name: 'isFavourite', defaultValue: false)
          required this.isFavourite})
      : super._();

  factory _$_RecentOrderFavouriteDto.fromJson(Map<String, dynamic> json) =>
      _$$_RecentOrderFavouriteDtoFromJson(json);

  @override
  @JsonKey(name: 'isFavourite', defaultValue: false)
  final bool isFavourite;

  @override
  String toString() {
    return 'RecentOrderFavouriteDto(isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentOrderFavouriteDto &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isFavourite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentOrderFavouriteDtoCopyWith<_$_RecentOrderFavouriteDto>
      get copyWith =>
          __$$_RecentOrderFavouriteDtoCopyWithImpl<_$_RecentOrderFavouriteDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecentOrderFavouriteDtoToJson(
      this,
    );
  }
}

abstract class _RecentOrderFavouriteDto extends RecentOrderFavouriteDto {
  factory _RecentOrderFavouriteDto(
      {@JsonKey(name: 'isFavourite', defaultValue: false)
          required final bool isFavourite}) = _$_RecentOrderFavouriteDto;
  _RecentOrderFavouriteDto._() : super._();

  factory _RecentOrderFavouriteDto.fromJson(Map<String, dynamic> json) =
      _$_RecentOrderFavouriteDto.fromJson;

  @override
  @JsonKey(name: 'isFavourite', defaultValue: false)
  bool get isFavourite;
  @override
  @JsonKey(ignore: true)
  _$$_RecentOrderFavouriteDtoCopyWith<_$_RecentOrderFavouriteDto>
      get copyWith => throw _privateConstructorUsedError;
}
