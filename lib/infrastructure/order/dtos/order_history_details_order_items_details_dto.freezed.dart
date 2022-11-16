// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_order_items_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryDetailsOrderItemDetailsDto
    _$OrderHistoryDetailsOrderItemDetailsDtoFromJson(
        Map<String, dynamic> json) {
  return _OrderHistoryDetailsOrderItemDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsOrderItemDetailsDto {
  @JsonKey(name: 'DiscountCode', defaultValue: '')
  String get discountCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountDescription', defaultValue: '')
  String get discountDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rate', defaultValue: '')
  String get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsOrderItemDetailsDtoCopyWith<
          OrderHistoryDetailsOrderItemDetailsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsOrderItemDetailsDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsOrderItemDetailsDtoCopyWith(
          OrderHistoryDetailsOrderItemDetailsDto value,
          $Res Function(OrderHistoryDetailsOrderItemDetailsDto) then) =
      _$OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'DiscountCode', defaultValue: '')
          String discountCode,
      @JsonKey(name: 'DiscountDescription', defaultValue: '')
          String discountDescription,
      @JsonKey(name: 'Rate', defaultValue: '')
          String rate});
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl<$Res>
    implements $OrderHistoryDetailsOrderItemDetailsDtoCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl(this._value, this._then);

  final OrderHistoryDetailsOrderItemDetailsDto _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryDetailsOrderItemDetailsDto) _then;

  @override
  $Res call({
    Object? discountCode = freezed,
    Object? discountDescription = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      discountCode: discountCode == freezed
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      discountDescription: discountDescription == freezed
          ? _value.discountDescription
          : discountDescription // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsOrderItemDetailsDtoCopyWith<$Res>
    implements $OrderHistoryDetailsOrderItemDetailsDtoCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsOrderItemDetailsDtoCopyWith(
          _$_OrderHistoryDetailsOrderItemDetailsDto value,
          $Res Function(_$_OrderHistoryDetailsOrderItemDetailsDto) then) =
      __$$_OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'DiscountCode', defaultValue: '')
          String discountCode,
      @JsonKey(name: 'DiscountDescription', defaultValue: '')
          String discountDescription,
      @JsonKey(name: 'Rate', defaultValue: '')
          String rate});
}

/// @nodoc
class __$$_OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl<$Res>
    implements _$$_OrderHistoryDetailsOrderItemDetailsDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl(
      _$_OrderHistoryDetailsOrderItemDetailsDto _value,
      $Res Function(_$_OrderHistoryDetailsOrderItemDetailsDto) _then)
      : super(_value,
            (v) => _then(v as _$_OrderHistoryDetailsOrderItemDetailsDto));

  @override
  _$_OrderHistoryDetailsOrderItemDetailsDto get _value =>
      super._value as _$_OrderHistoryDetailsOrderItemDetailsDto;

  @override
  $Res call({
    Object? discountCode = freezed,
    Object? discountDescription = freezed,
    Object? rate = freezed,
  }) {
    return _then(_$_OrderHistoryDetailsOrderItemDetailsDto(
      discountCode: discountCode == freezed
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      discountDescription: discountDescription == freezed
          ? _value.discountDescription
          : discountDescription // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryDetailsOrderItemDetailsDto
    extends _OrderHistoryDetailsOrderItemDetailsDto {
  const _$_OrderHistoryDetailsOrderItemDetailsDto(
      {@JsonKey(name: 'DiscountCode', defaultValue: '')
          required this.discountCode,
      @JsonKey(name: 'DiscountDescription', defaultValue: '')
          required this.discountDescription,
      @JsonKey(name: 'Rate', defaultValue: '')
          required this.rate})
      : super._();

  factory _$_OrderHistoryDetailsOrderItemDetailsDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsOrderItemDetailsDtoFromJson(json);

  @override
  @JsonKey(name: 'DiscountCode', defaultValue: '')
  final String discountCode;
  @override
  @JsonKey(name: 'DiscountDescription', defaultValue: '')
  final String discountDescription;
  @override
  @JsonKey(name: 'Rate', defaultValue: '')
  final String rate;

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItemDetailsDto(discountCode: $discountCode, discountDescription: $discountDescription, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsOrderItemDetailsDto &&
            const DeepCollectionEquality()
                .equals(other.discountCode, discountCode) &&
            const DeepCollectionEquality()
                .equals(other.discountDescription, discountDescription) &&
            const DeepCollectionEquality().equals(other.rate, rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(discountCode),
      const DeepCollectionEquality().hash(discountDescription),
      const DeepCollectionEquality().hash(rate));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryDetailsOrderItemDetailsDtoCopyWith<
          _$_OrderHistoryDetailsOrderItemDetailsDto>
      get copyWith => __$$_OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl<
          _$_OrderHistoryDetailsOrderItemDetailsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryDetailsOrderItemDetailsDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsOrderItemDetailsDto
    extends OrderHistoryDetailsOrderItemDetailsDto {
  const factory _OrderHistoryDetailsOrderItemDetailsDto(
          {@JsonKey(name: 'DiscountCode', defaultValue: '')
              required final String discountCode,
          @JsonKey(name: 'DiscountDescription', defaultValue: '')
              required final String discountDescription,
          @JsonKey(name: 'Rate', defaultValue: '')
              required final String rate}) =
      _$_OrderHistoryDetailsOrderItemDetailsDto;
  const _OrderHistoryDetailsOrderItemDetailsDto._() : super._();

  factory _OrderHistoryDetailsOrderItemDetailsDto.fromJson(
          Map<String, dynamic> json) =
      _$_OrderHistoryDetailsOrderItemDetailsDto.fromJson;

  @override
  @JsonKey(name: 'DiscountCode', defaultValue: '')
  String get discountCode;
  @override
  @JsonKey(name: 'DiscountDescription', defaultValue: '')
  String get discountDescription;
  @override
  @JsonKey(name: 'Rate', defaultValue: '')
  String get rate;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsOrderItemDetailsDtoCopyWith<
          _$_OrderHistoryDetailsOrderItemDetailsDto>
      get copyWith => throw _privateConstructorUsedError;
}
