// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tncdate_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TncDateDto _$TncDateDtoFromJson(Map<String, dynamic> json) {
  return _TncDateDto.fromJson(json);
}

/// @nodoc
mixin _$TncDateDto {
  String get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TncDateDtoCopyWith<TncDateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TncDateDtoCopyWith<$Res> {
  factory $TncDateDtoCopyWith(
          TncDateDto value, $Res Function(TncDateDto) then) =
      _$TncDateDtoCopyWithImpl<$Res, TncDateDto>;
  @useResult
  $Res call({String date});
}

/// @nodoc
class _$TncDateDtoCopyWithImpl<$Res, $Val extends TncDateDto>
    implements $TncDateDtoCopyWith<$Res> {
  _$TncDateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TncDateDtoCopyWith<$Res>
    implements $TncDateDtoCopyWith<$Res> {
  factory _$$_TncDateDtoCopyWith(
          _$_TncDateDto value, $Res Function(_$_TncDateDto) then) =
      __$$_TncDateDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date});
}

/// @nodoc
class __$$_TncDateDtoCopyWithImpl<$Res>
    extends _$TncDateDtoCopyWithImpl<$Res, _$_TncDateDto>
    implements _$$_TncDateDtoCopyWith<$Res> {
  __$$_TncDateDtoCopyWithImpl(
      _$_TncDateDto _value, $Res Function(_$_TncDateDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$_TncDateDto(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_TncDateDto extends _TncDateDto {
  const _$_TncDateDto({required this.date}) : super._();

  factory _$_TncDateDto.fromJson(Map<String, dynamic> json) =>
      _$$_TncDateDtoFromJson(json);

  @override
  final String date;

  @override
  String toString() {
    return 'TncDateDto(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TncDateDto &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TncDateDtoCopyWith<_$_TncDateDto> get copyWith =>
      __$$_TncDateDtoCopyWithImpl<_$_TncDateDto>(this, _$identity);
}

abstract class _TncDateDto extends TncDateDto {
  const factory _TncDateDto({required final String date}) = _$_TncDateDto;
  const _TncDateDto._() : super._();

  factory _TncDateDto.fromJson(Map<String, dynamic> json) =
      _$_TncDateDto.fromJson;

  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_TncDateDtoCopyWith<_$_TncDateDto> get copyWith =>
      throw _privateConstructorUsedError;
}
