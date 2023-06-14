// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_limit_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreditLimitDto _$CreditLimitDtoFromJson(Map<String, dynamic> json) {
  return _CreditLimitDto.fromJson(json);
}

/// @nodoc
mixin _$CreditLimitDto {
  @JsonKey(name: 'partner', defaultValue: '')
  String get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'creditLimit', defaultValue: '')
  String get creditLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'creditExposure', defaultValue: '')
  String get creditExposure => throw _privateConstructorUsedError;
  @JsonKey(name: 'creditBalance', defaultValue: '')
  String get creditBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditLimitDtoCopyWith<CreditLimitDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditLimitDtoCopyWith<$Res> {
  factory $CreditLimitDtoCopyWith(
          CreditLimitDto value, $Res Function(CreditLimitDto) then) =
      _$CreditLimitDtoCopyWithImpl<$Res, CreditLimitDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'partner', defaultValue: '') String customerCode,
      @JsonKey(name: 'currency', defaultValue: '') String currency,
      @JsonKey(name: 'creditLimit', defaultValue: '') String creditLimit,
      @JsonKey(name: 'creditExposure', defaultValue: '') String creditExposure,
      @JsonKey(name: 'creditBalance', defaultValue: '') String creditBalance});
}

/// @nodoc
class _$CreditLimitDtoCopyWithImpl<$Res, $Val extends CreditLimitDto>
    implements $CreditLimitDtoCopyWith<$Res> {
  _$CreditLimitDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? currency = null,
    Object? creditLimit = null,
    Object? creditExposure = null,
    Object? creditBalance = null,
  }) {
    return _then(_value.copyWith(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as String,
      creditExposure: null == creditExposure
          ? _value.creditExposure
          : creditExposure // ignore: cast_nullable_to_non_nullable
              as String,
      creditBalance: null == creditBalance
          ? _value.creditBalance
          : creditBalance // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreditLimitDtoCopyWith<$Res>
    implements $CreditLimitDtoCopyWith<$Res> {
  factory _$$_CreditLimitDtoCopyWith(
          _$_CreditLimitDto value, $Res Function(_$_CreditLimitDto) then) =
      __$$_CreditLimitDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'partner', defaultValue: '') String customerCode,
      @JsonKey(name: 'currency', defaultValue: '') String currency,
      @JsonKey(name: 'creditLimit', defaultValue: '') String creditLimit,
      @JsonKey(name: 'creditExposure', defaultValue: '') String creditExposure,
      @JsonKey(name: 'creditBalance', defaultValue: '') String creditBalance});
}

/// @nodoc
class __$$_CreditLimitDtoCopyWithImpl<$Res>
    extends _$CreditLimitDtoCopyWithImpl<$Res, _$_CreditLimitDto>
    implements _$$_CreditLimitDtoCopyWith<$Res> {
  __$$_CreditLimitDtoCopyWithImpl(
      _$_CreditLimitDto _value, $Res Function(_$_CreditLimitDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? currency = null,
    Object? creditLimit = null,
    Object? creditExposure = null,
    Object? creditBalance = null,
  }) {
    return _then(_$_CreditLimitDto(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as String,
      creditExposure: null == creditExposure
          ? _value.creditExposure
          : creditExposure // ignore: cast_nullable_to_non_nullable
              as String,
      creditBalance: null == creditBalance
          ? _value.creditBalance
          : creditBalance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreditLimitDto extends _CreditLimitDto {
  const _$_CreditLimitDto(
      {@JsonKey(name: 'partner', defaultValue: '')
          required this.customerCode,
      @JsonKey(name: 'currency', defaultValue: '')
          required this.currency,
      @JsonKey(name: 'creditLimit', defaultValue: '')
          required this.creditLimit,
      @JsonKey(name: 'creditExposure', defaultValue: '')
          required this.creditExposure,
      @JsonKey(name: 'creditBalance', defaultValue: '')
          required this.creditBalance})
      : super._();

  factory _$_CreditLimitDto.fromJson(Map<String, dynamic> json) =>
      _$$_CreditLimitDtoFromJson(json);

  @override
  @JsonKey(name: 'partner', defaultValue: '')
  final String customerCode;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  final String currency;
  @override
  @JsonKey(name: 'creditLimit', defaultValue: '')
  final String creditLimit;
  @override
  @JsonKey(name: 'creditExposure', defaultValue: '')
  final String creditExposure;
  @override
  @JsonKey(name: 'creditBalance', defaultValue: '')
  final String creditBalance;

  @override
  String toString() {
    return 'CreditLimitDto(customerCode: $customerCode, currency: $currency, creditLimit: $creditLimit, creditExposure: $creditExposure, creditBalance: $creditBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreditLimitDto &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.creditExposure, creditExposure) ||
                other.creditExposure == creditExposure) &&
            (identical(other.creditBalance, creditBalance) ||
                other.creditBalance == creditBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customerCode, currency,
      creditLimit, creditExposure, creditBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreditLimitDtoCopyWith<_$_CreditLimitDto> get copyWith =>
      __$$_CreditLimitDtoCopyWithImpl<_$_CreditLimitDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreditLimitDtoToJson(
      this,
    );
  }
}

abstract class _CreditLimitDto extends CreditLimitDto {
  const factory _CreditLimitDto(
      {@JsonKey(name: 'partner', defaultValue: '')
          required final String customerCode,
      @JsonKey(name: 'currency', defaultValue: '')
          required final String currency,
      @JsonKey(name: 'creditLimit', defaultValue: '')
          required final String creditLimit,
      @JsonKey(name: 'creditExposure', defaultValue: '')
          required final String creditExposure,
      @JsonKey(name: 'creditBalance', defaultValue: '')
          required final String creditBalance}) = _$_CreditLimitDto;
  const _CreditLimitDto._() : super._();

  factory _CreditLimitDto.fromJson(Map<String, dynamic> json) =
      _$_CreditLimitDto.fromJson;

  @override
  @JsonKey(name: 'partner', defaultValue: '')
  String get customerCode;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency;
  @override
  @JsonKey(name: 'creditLimit', defaultValue: '')
  String get creditLimit;
  @override
  @JsonKey(name: 'creditExposure', defaultValue: '')
  String get creditExposure;
  @override
  @JsonKey(name: 'creditBalance', defaultValue: '')
  String get creditBalance;
  @override
  @JsonKey(ignore: true)
  _$$_CreditLimitDtoCopyWith<_$_CreditLimitDto> get copyWith =>
      throw _privateConstructorUsedError;
}
