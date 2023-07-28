// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_payment_method_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AvailablePaymentMethodDto _$AvailablePaymentMethodDtoFromJson(
    Map<String, dynamic> json) {
  return _AvailablePaymentMethodDto.fromJson(json);
}

/// @nodoc
mixin _$AvailablePaymentMethodDto {
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethods', defaultValue: '')
  String get paymentMethod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailablePaymentMethodDtoCopyWith<AvailablePaymentMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailablePaymentMethodDtoCopyWith<$Res> {
  factory $AvailablePaymentMethodDtoCopyWith(AvailablePaymentMethodDto value,
          $Res Function(AvailablePaymentMethodDto) then) =
      _$AvailablePaymentMethodDtoCopyWithImpl<$Res, AvailablePaymentMethodDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'paymentMethods', defaultValue: '') String paymentMethod});
}

/// @nodoc
class _$AvailablePaymentMethodDtoCopyWithImpl<$Res,
        $Val extends AvailablePaymentMethodDto>
    implements $AvailablePaymentMethodDtoCopyWith<$Res> {
  _$AvailablePaymentMethodDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvailablePaymentMethodDtoCopyWith<$Res>
    implements $AvailablePaymentMethodDtoCopyWith<$Res> {
  factory _$$_AvailablePaymentMethodDtoCopyWith(
          _$_AvailablePaymentMethodDto value,
          $Res Function(_$_AvailablePaymentMethodDto) then) =
      __$$_AvailablePaymentMethodDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'paymentMethods', defaultValue: '') String paymentMethod});
}

/// @nodoc
class __$$_AvailablePaymentMethodDtoCopyWithImpl<$Res>
    extends _$AvailablePaymentMethodDtoCopyWithImpl<$Res,
        _$_AvailablePaymentMethodDto>
    implements _$$_AvailablePaymentMethodDtoCopyWith<$Res> {
  __$$_AvailablePaymentMethodDtoCopyWithImpl(
      _$_AvailablePaymentMethodDto _value,
      $Res Function(_$_AvailablePaymentMethodDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$_AvailablePaymentMethodDto(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AvailablePaymentMethodDto extends _AvailablePaymentMethodDto {
  const _$_AvailablePaymentMethodDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '') required this.salesOrg,
      @JsonKey(name: 'paymentMethods', defaultValue: '')
      required this.paymentMethod})
      : super._();

  factory _$_AvailablePaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$$_AvailablePaymentMethodDtoFromJson(json);

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  final String salesOrg;
  @override
  @JsonKey(name: 'paymentMethods', defaultValue: '')
  final String paymentMethod;

  @override
  String toString() {
    return 'AvailablePaymentMethodDto(salesOrg: $salesOrg, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvailablePaymentMethodDto &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailablePaymentMethodDtoCopyWith<_$_AvailablePaymentMethodDto>
      get copyWith => __$$_AvailablePaymentMethodDtoCopyWithImpl<
          _$_AvailablePaymentMethodDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvailablePaymentMethodDtoToJson(
      this,
    );
  }
}

abstract class _AvailablePaymentMethodDto extends AvailablePaymentMethodDto {
  const factory _AvailablePaymentMethodDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
      required final String salesOrg,
      @JsonKey(name: 'paymentMethods', defaultValue: '')
      required final String paymentMethod}) = _$_AvailablePaymentMethodDto;
  const _AvailablePaymentMethodDto._() : super._();

  factory _AvailablePaymentMethodDto.fromJson(Map<String, dynamic> json) =
      _$_AvailablePaymentMethodDto.fromJson;

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'paymentMethods', defaultValue: '')
  String get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$_AvailablePaymentMethodDtoCopyWith<_$_AvailablePaymentMethodDto>
      get copyWith => throw _privateConstructorUsedError;
}
