// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_payment_term_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryDetailsPaymentTermDto _$OrderHistoryDetailsPaymentTermDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsPaymentTermDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsPaymentTermDto {
  @JsonKey(name: 'PaymentTermCode', defaultValue: '')
  String get paymentTermCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentTermDescription', defaultValue: '')
  String get paymentTermDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsPaymentTermDtoCopyWith<OrderHistoryDetailsPaymentTermDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsPaymentTermDtoCopyWith(
          OrderHistoryDetailsPaymentTermDto value,
          $Res Function(OrderHistoryDetailsPaymentTermDto) then) =
      _$OrderHistoryDetailsPaymentTermDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'PaymentTermCode', defaultValue: '')
          String paymentTermCode,
      @JsonKey(name: 'PaymentTermDescription', defaultValue: '')
          String paymentTermDescription});
}

/// @nodoc
class _$OrderHistoryDetailsPaymentTermDtoCopyWithImpl<$Res>
    implements $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res> {
  _$OrderHistoryDetailsPaymentTermDtoCopyWithImpl(this._value, this._then);

  final OrderHistoryDetailsPaymentTermDto _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryDetailsPaymentTermDto) _then;

  @override
  $Res call({
    Object? paymentTermCode = freezed,
    Object? paymentTermDescription = freezed,
  }) {
    return _then(_value.copyWith(
      paymentTermCode: paymentTermCode == freezed
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermDescription: paymentTermDescription == freezed
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>
    implements $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsPaymentTermDtoCopyWith(
          _$_OrderHistoryDetailsPaymentTermDto value,
          $Res Function(_$_OrderHistoryDetailsPaymentTermDto) then) =
      __$$_OrderHistoryDetailsPaymentTermDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'PaymentTermCode', defaultValue: '')
          String paymentTermCode,
      @JsonKey(name: 'PaymentTermDescription', defaultValue: '')
          String paymentTermDescription});
}

/// @nodoc
class __$$_OrderHistoryDetailsPaymentTermDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsPaymentTermDtoCopyWithImpl<$Res>
    implements _$$_OrderHistoryDetailsPaymentTermDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsPaymentTermDtoCopyWithImpl(
      _$_OrderHistoryDetailsPaymentTermDto _value,
      $Res Function(_$_OrderHistoryDetailsPaymentTermDto) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryDetailsPaymentTermDto));

  @override
  _$_OrderHistoryDetailsPaymentTermDto get _value =>
      super._value as _$_OrderHistoryDetailsPaymentTermDto;

  @override
  $Res call({
    Object? paymentTermCode = freezed,
    Object? paymentTermDescription = freezed,
  }) {
    return _then(_$_OrderHistoryDetailsPaymentTermDto(
      paymentTermCode: paymentTermCode == freezed
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermDescription: paymentTermDescription == freezed
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryDetailsPaymentTermDto
    extends _OrderHistoryDetailsPaymentTermDto {
  const _$_OrderHistoryDetailsPaymentTermDto(
      {@JsonKey(name: 'PaymentTermCode', defaultValue: '')
          required this.paymentTermCode,
      @JsonKey(name: 'PaymentTermDescription', defaultValue: '')
          required this.paymentTermDescription})
      : super._();

  factory _$_OrderHistoryDetailsPaymentTermDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsPaymentTermDtoFromJson(json);

  @override
  @JsonKey(name: 'PaymentTermCode', defaultValue: '')
  final String paymentTermCode;
  @override
  @JsonKey(name: 'PaymentTermDescription', defaultValue: '')
  final String paymentTermDescription;

  @override
  String toString() {
    return 'OrderHistoryDetailsPaymentTermDto(paymentTermCode: $paymentTermCode, paymentTermDescription: $paymentTermDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsPaymentTermDto &&
            const DeepCollectionEquality()
                .equals(other.paymentTermCode, paymentTermCode) &&
            const DeepCollectionEquality()
                .equals(other.paymentTermDescription, paymentTermDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(paymentTermCode),
      const DeepCollectionEquality().hash(paymentTermDescription));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryDetailsPaymentTermDtoCopyWith<
          _$_OrderHistoryDetailsPaymentTermDto>
      get copyWith => __$$_OrderHistoryDetailsPaymentTermDtoCopyWithImpl<
          _$_OrderHistoryDetailsPaymentTermDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryDetailsPaymentTermDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsPaymentTermDto
    extends OrderHistoryDetailsPaymentTermDto {
  const factory _OrderHistoryDetailsPaymentTermDto(
          {@JsonKey(name: 'PaymentTermCode', defaultValue: '')
              required final String paymentTermCode,
          @JsonKey(name: 'PaymentTermDescription', defaultValue: '')
              required final String paymentTermDescription}) =
      _$_OrderHistoryDetailsPaymentTermDto;
  const _OrderHistoryDetailsPaymentTermDto._() : super._();

  factory _OrderHistoryDetailsPaymentTermDto.fromJson(
          Map<String, dynamic> json) =
      _$_OrderHistoryDetailsPaymentTermDto.fromJson;

  @override
  @JsonKey(name: 'PaymentTermCode', defaultValue: '')
  String get paymentTermCode;
  @override
  @JsonKey(name: 'PaymentTermDescription', defaultValue: '')
  String get paymentTermDescription;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsPaymentTermDtoCopyWith<
          _$_OrderHistoryDetailsPaymentTermDto>
      get copyWith => throw _privateConstructorUsedError;
}
