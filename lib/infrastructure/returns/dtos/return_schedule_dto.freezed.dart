// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnScheduleDto _$ReturnScheduleDtoFromJson(Map<String, dynamic> json) {
  return _ReturnScheduleDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnScheduleDto {
  @JsonKey(name: 'scheduledLine', defaultValue: '')
  String get scheduledLine => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestDate', defaultValue: '')
  String get requestDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnScheduleDtoCopyWith<ReturnScheduleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnScheduleDtoCopyWith<$Res> {
  factory $ReturnScheduleDtoCopyWith(
          ReturnScheduleDto value, $Res Function(ReturnScheduleDto) then) =
      _$ReturnScheduleDtoCopyWithImpl<$Res, ReturnScheduleDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'scheduledLine', defaultValue: '') String scheduledLine,
      @JsonKey(name: 'requestDate', defaultValue: '') String requestDate});
}

/// @nodoc
class _$ReturnScheduleDtoCopyWithImpl<$Res, $Val extends ReturnScheduleDto>
    implements $ReturnScheduleDtoCopyWith<$Res> {
  _$ReturnScheduleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduledLine = null,
    Object? requestDate = null,
  }) {
    return _then(_value.copyWith(
      scheduledLine: null == scheduledLine
          ? _value.scheduledLine
          : scheduledLine // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnScheduleDtoCopyWith<$Res>
    implements $ReturnScheduleDtoCopyWith<$Res> {
  factory _$$_ReturnScheduleDtoCopyWith(_$_ReturnScheduleDto value,
          $Res Function(_$_ReturnScheduleDto) then) =
      __$$_ReturnScheduleDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'scheduledLine', defaultValue: '') String scheduledLine,
      @JsonKey(name: 'requestDate', defaultValue: '') String requestDate});
}

/// @nodoc
class __$$_ReturnScheduleDtoCopyWithImpl<$Res>
    extends _$ReturnScheduleDtoCopyWithImpl<$Res, _$_ReturnScheduleDto>
    implements _$$_ReturnScheduleDtoCopyWith<$Res> {
  __$$_ReturnScheduleDtoCopyWithImpl(
      _$_ReturnScheduleDto _value, $Res Function(_$_ReturnScheduleDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduledLine = null,
    Object? requestDate = null,
  }) {
    return _then(_$_ReturnScheduleDto(
      scheduledLine: null == scheduledLine
          ? _value.scheduledLine
          : scheduledLine // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnScheduleDto extends _ReturnScheduleDto {
  const _$_ReturnScheduleDto(
      {@JsonKey(name: 'scheduledLine', defaultValue: '')
          required this.scheduledLine,
      @JsonKey(name: 'requestDate', defaultValue: '')
          required this.requestDate})
      : super._();

  factory _$_ReturnScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnScheduleDtoFromJson(json);

  @override
  @JsonKey(name: 'scheduledLine', defaultValue: '')
  final String scheduledLine;
  @override
  @JsonKey(name: 'requestDate', defaultValue: '')
  final String requestDate;

  @override
  String toString() {
    return 'ReturnScheduleDto(scheduledLine: $scheduledLine, requestDate: $requestDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnScheduleDto &&
            (identical(other.scheduledLine, scheduledLine) ||
                other.scheduledLine == scheduledLine) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, scheduledLine, requestDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnScheduleDtoCopyWith<_$_ReturnScheduleDto> get copyWith =>
      __$$_ReturnScheduleDtoCopyWithImpl<_$_ReturnScheduleDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnScheduleDtoToJson(
      this,
    );
  }
}

abstract class _ReturnScheduleDto extends ReturnScheduleDto {
  const factory _ReturnScheduleDto(
      {@JsonKey(name: 'scheduledLine', defaultValue: '')
          required final String scheduledLine,
      @JsonKey(name: 'requestDate', defaultValue: '')
          required final String requestDate}) = _$_ReturnScheduleDto;
  const _ReturnScheduleDto._() : super._();

  factory _ReturnScheduleDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnScheduleDto.fromJson;

  @override
  @JsonKey(name: 'scheduledLine', defaultValue: '')
  String get scheduledLine;
  @override
  @JsonKey(name: 'requestDate', defaultValue: '')
  String get requestDate;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnScheduleDtoCopyWith<_$_ReturnScheduleDto> get copyWith =>
      throw _privateConstructorUsedError;
}
