// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usage_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsageDto _$UsageDtoFromJson(Map<String, dynamic> json) {
  return _UsageDto.fromJson(json);
}

/// @nodoc
mixin _$UsageDto {
  @JsonKey(name: 'usageCode')
  String get usageCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'usageDescription')
  String get usageDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsageDtoCopyWith<UsageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageDtoCopyWith<$Res> {
  factory $UsageDtoCopyWith(UsageDto value, $Res Function(UsageDto) then) =
      _$UsageDtoCopyWithImpl<$Res, UsageDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'usageCode') String usageCode,
      @JsonKey(name: 'usageDescription') String usageDescription});
}

/// @nodoc
class _$UsageDtoCopyWithImpl<$Res, $Val extends UsageDto>
    implements $UsageDtoCopyWith<$Res> {
  _$UsageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usageCode = null,
    Object? usageDescription = null,
  }) {
    return _then(_value.copyWith(
      usageCode: null == usageCode
          ? _value.usageCode
          : usageCode // ignore: cast_nullable_to_non_nullable
              as String,
      usageDescription: null == usageDescription
          ? _value.usageDescription
          : usageDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsageDtoCopyWith<$Res> implements $UsageDtoCopyWith<$Res> {
  factory _$$_UsageDtoCopyWith(
          _$_UsageDto value, $Res Function(_$_UsageDto) then) =
      __$$_UsageDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'usageCode') String usageCode,
      @JsonKey(name: 'usageDescription') String usageDescription});
}

/// @nodoc
class __$$_UsageDtoCopyWithImpl<$Res>
    extends _$UsageDtoCopyWithImpl<$Res, _$_UsageDto>
    implements _$$_UsageDtoCopyWith<$Res> {
  __$$_UsageDtoCopyWithImpl(
      _$_UsageDto _value, $Res Function(_$_UsageDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usageCode = null,
    Object? usageDescription = null,
  }) {
    return _then(_$_UsageDto(
      usageCode: null == usageCode
          ? _value.usageCode
          : usageCode // ignore: cast_nullable_to_non_nullable
              as String,
      usageDescription: null == usageDescription
          ? _value.usageDescription
          : usageDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsageDto extends _UsageDto {
  const _$_UsageDto(
      {@JsonKey(name: 'usageCode') required this.usageCode,
      @JsonKey(name: 'usageDescription') required this.usageDescription})
      : super._();

  factory _$_UsageDto.fromJson(Map<String, dynamic> json) =>
      _$$_UsageDtoFromJson(json);

  @override
  @JsonKey(name: 'usageCode')
  final String usageCode;
  @override
  @JsonKey(name: 'usageDescription')
  final String usageDescription;

  @override
  String toString() {
    return 'UsageDto(usageCode: $usageCode, usageDescription: $usageDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsageDto &&
            (identical(other.usageCode, usageCode) ||
                other.usageCode == usageCode) &&
            (identical(other.usageDescription, usageDescription) ||
                other.usageDescription == usageDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, usageCode, usageDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsageDtoCopyWith<_$_UsageDto> get copyWith =>
      __$$_UsageDtoCopyWithImpl<_$_UsageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsageDtoToJson(
      this,
    );
  }
}

abstract class _UsageDto extends UsageDto {
  const factory _UsageDto(
      {@JsonKey(name: 'usageCode')
          required final String usageCode,
      @JsonKey(name: 'usageDescription')
          required final String usageDescription}) = _$_UsageDto;
  const _UsageDto._() : super._();

  factory _UsageDto.fromJson(Map<String, dynamic> json) = _$_UsageDto.fromJson;

  @override
  @JsonKey(name: 'usageCode')
  String get usageCode;
  @override
  @JsonKey(name: 'usageDescription')
  String get usageDescription;
  @override
  @JsonKey(ignore: true)
  _$$_UsageDtoCopyWith<_$_UsageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
