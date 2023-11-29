// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentDetailsDto _$PaymentDetailsDtoFromJson(Map<String, dynamic> json) {
  return _PaymentDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentDetailsDto {
  @JsonKey(name: 'vaNumber', defaultValue: '')
  String get vaNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vaName', defaultValue: '')
  String get vaName => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiresAt', defaultValue: '', readValue: expiresAtDate)
  String get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentDetailsDtoCopyWith<PaymentDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsDtoCopyWith<$Res> {
  factory $PaymentDetailsDtoCopyWith(
          PaymentDetailsDto value, $Res Function(PaymentDetailsDto) then) =
      _$PaymentDetailsDtoCopyWithImpl<$Res, PaymentDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'vaNumber', defaultValue: '') String vaNumber,
      @JsonKey(name: 'vaName', defaultValue: '') String vaName,
      @JsonKey(name: 'expiresAt', defaultValue: '', readValue: expiresAtDate)
      String expiresAt});
}

/// @nodoc
class _$PaymentDetailsDtoCopyWithImpl<$Res, $Val extends PaymentDetailsDto>
    implements $PaymentDetailsDtoCopyWith<$Res> {
  _$PaymentDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaNumber = null,
    Object? vaName = null,
    Object? expiresAt = null,
  }) {
    return _then(_value.copyWith(
      vaNumber: null == vaNumber
          ? _value.vaNumber
          : vaNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vaName: null == vaName
          ? _value.vaName
          : vaName // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentDetailsDtoCopyWith<$Res>
    implements $PaymentDetailsDtoCopyWith<$Res> {
  factory _$$_PaymentDetailsDtoCopyWith(_$_PaymentDetailsDto value,
          $Res Function(_$_PaymentDetailsDto) then) =
      __$$_PaymentDetailsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'vaNumber', defaultValue: '') String vaNumber,
      @JsonKey(name: 'vaName', defaultValue: '') String vaName,
      @JsonKey(name: 'expiresAt', defaultValue: '', readValue: expiresAtDate)
      String expiresAt});
}

/// @nodoc
class __$$_PaymentDetailsDtoCopyWithImpl<$Res>
    extends _$PaymentDetailsDtoCopyWithImpl<$Res, _$_PaymentDetailsDto>
    implements _$$_PaymentDetailsDtoCopyWith<$Res> {
  __$$_PaymentDetailsDtoCopyWithImpl(
      _$_PaymentDetailsDto _value, $Res Function(_$_PaymentDetailsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaNumber = null,
    Object? vaName = null,
    Object? expiresAt = null,
  }) {
    return _then(_$_PaymentDetailsDto(
      vaNumber: null == vaNumber
          ? _value.vaNumber
          : vaNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vaName: null == vaName
          ? _value.vaName
          : vaName // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentDetailsDto extends _PaymentDetailsDto {
  const _$_PaymentDetailsDto(
      {@JsonKey(name: 'vaNumber', defaultValue: '') required this.vaNumber,
      @JsonKey(name: 'vaName', defaultValue: '') required this.vaName,
      @JsonKey(name: 'expiresAt', defaultValue: '', readValue: expiresAtDate)
      required this.expiresAt})
      : super._();

  factory _$_PaymentDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentDetailsDtoFromJson(json);

  @override
  @JsonKey(name: 'vaNumber', defaultValue: '')
  final String vaNumber;
  @override
  @JsonKey(name: 'vaName', defaultValue: '')
  final String vaName;
  @override
  @JsonKey(name: 'expiresAt', defaultValue: '', readValue: expiresAtDate)
  final String expiresAt;

  @override
  String toString() {
    return 'PaymentDetailsDto(vaNumber: $vaNumber, vaName: $vaName, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentDetailsDto &&
            (identical(other.vaNumber, vaNumber) ||
                other.vaNumber == vaNumber) &&
            (identical(other.vaName, vaName) || other.vaName == vaName) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, vaNumber, vaName, expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentDetailsDtoCopyWith<_$_PaymentDetailsDto> get copyWith =>
      __$$_PaymentDetailsDtoCopyWithImpl<_$_PaymentDetailsDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentDetailsDtoToJson(
      this,
    );
  }
}

abstract class _PaymentDetailsDto extends PaymentDetailsDto {
  const factory _PaymentDetailsDto(
      {@JsonKey(name: 'vaNumber', defaultValue: '')
      required final String vaNumber,
      @JsonKey(name: 'vaName', defaultValue: '') required final String vaName,
      @JsonKey(name: 'expiresAt', defaultValue: '', readValue: expiresAtDate)
      required final String expiresAt}) = _$_PaymentDetailsDto;
  const _PaymentDetailsDto._() : super._();

  factory _PaymentDetailsDto.fromJson(Map<String, dynamic> json) =
      _$_PaymentDetailsDto.fromJson;

  @override
  @JsonKey(name: 'vaNumber', defaultValue: '')
  String get vaNumber;
  @override
  @JsonKey(name: 'vaName', defaultValue: '')
  String get vaName;
  @override
  @JsonKey(name: 'expiresAt', defaultValue: '', readValue: expiresAtDate)
  String get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentDetailsDtoCopyWith<_$_PaymentDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
