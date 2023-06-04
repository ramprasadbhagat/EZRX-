// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_beneficiary_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankBeneficiaryResponseDto _$BankBeneficiaryResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _BankBeneficiaryResponseDto.fromJson(json);
}

/// @nodoc
mixin _$BankBeneficiaryResponseDto {
  @JsonKey(name: 'info', defaultValue: '')
  String get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankBeneficiaryResponseDtoCopyWith<BankBeneficiaryResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankBeneficiaryResponseDtoCopyWith<$Res> {
  factory $BankBeneficiaryResponseDtoCopyWith(BankBeneficiaryResponseDto value,
          $Res Function(BankBeneficiaryResponseDto) then) =
      _$BankBeneficiaryResponseDtoCopyWithImpl<$Res,
          BankBeneficiaryResponseDto>;
  @useResult
  $Res call({@JsonKey(name: 'info', defaultValue: '') String info});
}

/// @nodoc
class _$BankBeneficiaryResponseDtoCopyWithImpl<$Res,
        $Val extends BankBeneficiaryResponseDto>
    implements $BankBeneficiaryResponseDtoCopyWith<$Res> {
  _$BankBeneficiaryResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankBeneficiaryResponseDtoCopyWith<$Res>
    implements $BankBeneficiaryResponseDtoCopyWith<$Res> {
  factory _$$_BankBeneficiaryResponseDtoCopyWith(
          _$_BankBeneficiaryResponseDto value,
          $Res Function(_$_BankBeneficiaryResponseDto) then) =
      __$$_BankBeneficiaryResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'info', defaultValue: '') String info});
}

/// @nodoc
class __$$_BankBeneficiaryResponseDtoCopyWithImpl<$Res>
    extends _$BankBeneficiaryResponseDtoCopyWithImpl<$Res,
        _$_BankBeneficiaryResponseDto>
    implements _$$_BankBeneficiaryResponseDtoCopyWith<$Res> {
  __$$_BankBeneficiaryResponseDtoCopyWithImpl(
      _$_BankBeneficiaryResponseDto _value,
      $Res Function(_$_BankBeneficiaryResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$_BankBeneficiaryResponseDto(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankBeneficiaryResponseDto extends _BankBeneficiaryResponseDto {
  const _$_BankBeneficiaryResponseDto(
      {@JsonKey(name: 'info', defaultValue: '') required this.info})
      : super._();

  factory _$_BankBeneficiaryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_BankBeneficiaryResponseDtoFromJson(json);

  @override
  @JsonKey(name: 'info', defaultValue: '')
  final String info;

  @override
  String toString() {
    return 'BankBeneficiaryResponseDto(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankBeneficiaryResponseDto &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankBeneficiaryResponseDtoCopyWith<_$_BankBeneficiaryResponseDto>
      get copyWith => __$$_BankBeneficiaryResponseDtoCopyWithImpl<
          _$_BankBeneficiaryResponseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankBeneficiaryResponseDtoToJson(
      this,
    );
  }
}

abstract class _BankBeneficiaryResponseDto extends BankBeneficiaryResponseDto {
  const factory _BankBeneficiaryResponseDto(
      {@JsonKey(name: 'info', defaultValue: '')
          required final String info}) = _$_BankBeneficiaryResponseDto;
  const _BankBeneficiaryResponseDto._() : super._();

  factory _BankBeneficiaryResponseDto.fromJson(Map<String, dynamic> json) =
      _$_BankBeneficiaryResponseDto.fromJson;

  @override
  @JsonKey(name: 'info', defaultValue: '')
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_BankBeneficiaryResponseDtoCopyWith<_$_BankBeneficiaryResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}
