// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_customer_information_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentCustomerInformationDto _$PaymentCustomerInformationDtoFromJson(
    Map<String, dynamic> json) {
  return _PaymentCustomerInformationDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentCustomerInformationDto {
  @JsonKey(name: 'paymentTerm')
  String get paymentTerm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCustomerInformationDtoCopyWith<PaymentCustomerInformationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCustomerInformationDtoCopyWith<$Res> {
  factory $PaymentCustomerInformationDtoCopyWith(
          PaymentCustomerInformationDto value,
          $Res Function(PaymentCustomerInformationDto) then) =
      _$PaymentCustomerInformationDtoCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'paymentTerm') String paymentTerm});
}

/// @nodoc
class _$PaymentCustomerInformationDtoCopyWithImpl<$Res>
    implements $PaymentCustomerInformationDtoCopyWith<$Res> {
  _$PaymentCustomerInformationDtoCopyWithImpl(this._value, this._then);

  final PaymentCustomerInformationDto _value;
  // ignore: unused_field
  final $Res Function(PaymentCustomerInformationDto) _then;

  @override
  $Res call({
    Object? paymentTerm = freezed,
  }) {
    return _then(_value.copyWith(
      paymentTerm: paymentTerm == freezed
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentCustomerInformationDtoCopyWith<$Res>
    implements $PaymentCustomerInformationDtoCopyWith<$Res> {
  factory _$$_PaymentCustomerInformationDtoCopyWith(
          _$_PaymentCustomerInformationDto value,
          $Res Function(_$_PaymentCustomerInformationDto) then) =
      __$$_PaymentCustomerInformationDtoCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'paymentTerm') String paymentTerm});
}

/// @nodoc
class __$$_PaymentCustomerInformationDtoCopyWithImpl<$Res>
    extends _$PaymentCustomerInformationDtoCopyWithImpl<$Res>
    implements _$$_PaymentCustomerInformationDtoCopyWith<$Res> {
  __$$_PaymentCustomerInformationDtoCopyWithImpl(
      _$_PaymentCustomerInformationDto _value,
      $Res Function(_$_PaymentCustomerInformationDto) _then)
      : super(_value, (v) => _then(v as _$_PaymentCustomerInformationDto));

  @override
  _$_PaymentCustomerInformationDto get _value =>
      super._value as _$_PaymentCustomerInformationDto;

  @override
  $Res call({
    Object? paymentTerm = freezed,
  }) {
    return _then(_$_PaymentCustomerInformationDto(
      paymentTerm: paymentTerm == freezed
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentCustomerInformationDto extends _PaymentCustomerInformationDto {
  const _$_PaymentCustomerInformationDto(
      {@JsonKey(name: 'paymentTerm') required this.paymentTerm})
      : super._();

  factory _$_PaymentCustomerInformationDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_PaymentCustomerInformationDtoFromJson(json);

  @override
  @JsonKey(name: 'paymentTerm')
  final String paymentTerm;

  @override
  String toString() {
    return 'PaymentCustomerInformationDto(paymentTerm: $paymentTerm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentCustomerInformationDto &&
            const DeepCollectionEquality()
                .equals(other.paymentTerm, paymentTerm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(paymentTerm));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentCustomerInformationDtoCopyWith<_$_PaymentCustomerInformationDto>
      get copyWith => __$$_PaymentCustomerInformationDtoCopyWithImpl<
          _$_PaymentCustomerInformationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentCustomerInformationDtoToJson(
      this,
    );
  }
}

abstract class _PaymentCustomerInformationDto
    extends PaymentCustomerInformationDto {
  const factory _PaymentCustomerInformationDto(
          {@JsonKey(name: 'paymentTerm') required final String paymentTerm}) =
      _$_PaymentCustomerInformationDto;
  const _PaymentCustomerInformationDto._() : super._();

  factory _PaymentCustomerInformationDto.fromJson(Map<String, dynamic> json) =
      _$_PaymentCustomerInformationDto.fromJson;

  @override
  @JsonKey(name: 'paymentTerm')
  String get paymentTerm;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentCustomerInformationDtoCopyWith<_$_PaymentCustomerInformationDto>
      get copyWith => throw _privateConstructorUsedError;
}
