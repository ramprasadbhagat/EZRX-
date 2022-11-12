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
  @JsonKey(name: 'shipTo')
  List<ShipToDto> get shipToDtoList => throw _privateConstructorUsedError;

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
      _$PaymentCustomerInformationDtoCopyWithImpl<$Res,
          PaymentCustomerInformationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentTerm') String paymentTerm,
      @JsonKey(name: 'shipTo') List<ShipToDto> shipToDtoList});
}

/// @nodoc
class _$PaymentCustomerInformationDtoCopyWithImpl<$Res,
        $Val extends PaymentCustomerInformationDto>
    implements $PaymentCustomerInformationDtoCopyWith<$Res> {
  _$PaymentCustomerInformationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTerm = null,
    Object? shipToDtoList = null,
  }) {
    return _then(_value.copyWith(
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      shipToDtoList: null == shipToDtoList
          ? _value.shipToDtoList
          : shipToDtoList // ignore: cast_nullable_to_non_nullable
              as List<ShipToDto>,
    ) as $Val);
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
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentTerm') String paymentTerm,
      @JsonKey(name: 'shipTo') List<ShipToDto> shipToDtoList});
}

/// @nodoc
class __$$_PaymentCustomerInformationDtoCopyWithImpl<$Res>
    extends _$PaymentCustomerInformationDtoCopyWithImpl<$Res,
        _$_PaymentCustomerInformationDto>
    implements _$$_PaymentCustomerInformationDtoCopyWith<$Res> {
  __$$_PaymentCustomerInformationDtoCopyWithImpl(
      _$_PaymentCustomerInformationDto _value,
      $Res Function(_$_PaymentCustomerInformationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTerm = null,
    Object? shipToDtoList = null,
  }) {
    return _then(_$_PaymentCustomerInformationDto(
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      shipToDtoList: null == shipToDtoList
          ? _value._shipToDtoList
          : shipToDtoList // ignore: cast_nullable_to_non_nullable
              as List<ShipToDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentCustomerInformationDto extends _PaymentCustomerInformationDto {
  const _$_PaymentCustomerInformationDto(
      {@JsonKey(name: 'paymentTerm') required this.paymentTerm,
      @JsonKey(name: 'shipTo') required final List<ShipToDto> shipToDtoList})
      : _shipToDtoList = shipToDtoList,
        super._();

  factory _$_PaymentCustomerInformationDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_PaymentCustomerInformationDtoFromJson(json);

  @override
  @JsonKey(name: 'paymentTerm')
  final String paymentTerm;
  final List<ShipToDto> _shipToDtoList;
  @override
  @JsonKey(name: 'shipTo')
  List<ShipToDto> get shipToDtoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipToDtoList);
  }

  @override
  String toString() {
    return 'PaymentCustomerInformationDto(paymentTerm: $paymentTerm, shipToDtoList: $shipToDtoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentCustomerInformationDto &&
            (identical(other.paymentTerm, paymentTerm) ||
                other.paymentTerm == paymentTerm) &&
            const DeepCollectionEquality()
                .equals(other._shipToDtoList, _shipToDtoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentTerm,
      const DeepCollectionEquality().hash(_shipToDtoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
          {@JsonKey(name: 'paymentTerm')
              required final String paymentTerm,
          @JsonKey(name: 'shipTo')
              required final List<ShipToDto> shipToDtoList}) =
      _$_PaymentCustomerInformationDto;
  const _PaymentCustomerInformationDto._() : super._();

  factory _PaymentCustomerInformationDto.fromJson(Map<String, dynamic> json) =
      _$_PaymentCustomerInformationDto.fromJson;

  @override
  @JsonKey(name: 'paymentTerm')
  String get paymentTerm;
  @override
  @JsonKey(name: 'shipTo')
  List<ShipToDto> get shipToDtoList;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentCustomerInformationDtoCopyWith<_$_PaymentCustomerInformationDto>
      get copyWith => throw _privateConstructorUsedError;
}
