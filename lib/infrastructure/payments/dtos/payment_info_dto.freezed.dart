// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentInfoDto _$PaymentInfoDtoFromJson(Map<String, dynamic> json) {
  return _PaymentInfoDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentInfoDto {
  @JsonKey(name: 'zzHtmcs', defaultValue: '')
  String get zzHtmcs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInfoDtoCopyWith<PaymentInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoDtoCopyWith<$Res> {
  factory $PaymentInfoDtoCopyWith(
          PaymentInfoDto value, $Res Function(PaymentInfoDto) then) =
      _$PaymentInfoDtoCopyWithImpl<$Res, PaymentInfoDto>;
  @useResult
  $Res call({@JsonKey(name: 'zzHtmcs', defaultValue: '') String zzHtmcs});
}

/// @nodoc
class _$PaymentInfoDtoCopyWithImpl<$Res, $Val extends PaymentInfoDto>
    implements $PaymentInfoDtoCopyWith<$Res> {
  _$PaymentInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zzHtmcs = null,
  }) {
    return _then(_value.copyWith(
      zzHtmcs: null == zzHtmcs
          ? _value.zzHtmcs
          : zzHtmcs // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentInfoDtoCopyWith<$Res>
    implements $PaymentInfoDtoCopyWith<$Res> {
  factory _$$_PaymentInfoDtoCopyWith(
          _$_PaymentInfoDto value, $Res Function(_$_PaymentInfoDto) then) =
      __$$_PaymentInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'zzHtmcs', defaultValue: '') String zzHtmcs});
}

/// @nodoc
class __$$_PaymentInfoDtoCopyWithImpl<$Res>
    extends _$PaymentInfoDtoCopyWithImpl<$Res, _$_PaymentInfoDto>
    implements _$$_PaymentInfoDtoCopyWith<$Res> {
  __$$_PaymentInfoDtoCopyWithImpl(
      _$_PaymentInfoDto _value, $Res Function(_$_PaymentInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zzHtmcs = null,
  }) {
    return _then(_$_PaymentInfoDto(
      zzHtmcs: null == zzHtmcs
          ? _value.zzHtmcs
          : zzHtmcs // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentInfoDto extends _PaymentInfoDto {
  const _$_PaymentInfoDto(
      {@JsonKey(name: 'zzHtmcs', defaultValue: '') required this.zzHtmcs})
      : super._();

  factory _$_PaymentInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'zzHtmcs', defaultValue: '')
  final String zzHtmcs;

  @override
  String toString() {
    return 'PaymentInfoDto(zzHtmcs: $zzHtmcs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentInfoDto &&
            (identical(other.zzHtmcs, zzHtmcs) || other.zzHtmcs == zzHtmcs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, zzHtmcs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentInfoDtoCopyWith<_$_PaymentInfoDto> get copyWith =>
      __$$_PaymentInfoDtoCopyWithImpl<_$_PaymentInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentInfoDtoToJson(
      this,
    );
  }
}

abstract class _PaymentInfoDto extends PaymentInfoDto {
  const factory _PaymentInfoDto(
      {@JsonKey(name: 'zzHtmcs', defaultValue: '')
      required final String zzHtmcs}) = _$_PaymentInfoDto;
  const _PaymentInfoDto._() : super._();

  factory _PaymentInfoDto.fromJson(Map<String, dynamic> json) =
      _$_PaymentInfoDto.fromJson;

  @override
  @JsonKey(name: 'zzHtmcs', defaultValue: '')
  String get zzHtmcs;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentInfoDtoCopyWith<_$_PaymentInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
