// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_price_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnPriceDto _$ReturnPriceDtoFromJson(Map<String, dynamic> json) {
  return _ReturnPriceDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnPriceDto {
  @JsonKey(name: 'unitPrice', defaultValue: 0.0)
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPrice', defaultValue: 0.0)
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemNumber', defaultValue: '')
  String get itemNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnPriceDtoCopyWith<ReturnPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnPriceDtoCopyWith<$Res> {
  factory $ReturnPriceDtoCopyWith(
          ReturnPriceDto value, $Res Function(ReturnPriceDto) then) =
      _$ReturnPriceDtoCopyWithImpl<$Res, ReturnPriceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'unitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'itemNumber', defaultValue: '') String itemNumber});
}

/// @nodoc
class _$ReturnPriceDtoCopyWithImpl<$Res, $Val extends ReturnPriceDto>
    implements $ReturnPriceDtoCopyWith<$Res> {
  _$ReturnPriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? materialNumber = null,
    Object? itemNumber = null,
  }) {
    return _then(_value.copyWith(
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnPriceDtoCopyWith<$Res>
    implements $ReturnPriceDtoCopyWith<$Res> {
  factory _$$_ReturnPriceDtoCopyWith(
          _$_ReturnPriceDto value, $Res Function(_$_ReturnPriceDto) then) =
      __$$_ReturnPriceDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'unitPrice', defaultValue: 0.0) double unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0) double totalPrice,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'itemNumber', defaultValue: '') String itemNumber});
}

/// @nodoc
class __$$_ReturnPriceDtoCopyWithImpl<$Res>
    extends _$ReturnPriceDtoCopyWithImpl<$Res, _$_ReturnPriceDto>
    implements _$$_ReturnPriceDtoCopyWith<$Res> {
  __$$_ReturnPriceDtoCopyWithImpl(
      _$_ReturnPriceDto _value, $Res Function(_$_ReturnPriceDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? materialNumber = null,
    Object? itemNumber = null,
  }) {
    return _then(_$_ReturnPriceDto(
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      itemNumber: null == itemNumber
          ? _value.itemNumber
          : itemNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnPriceDto extends _ReturnPriceDto {
  const _$_ReturnPriceDto(
      {@JsonKey(name: 'unitPrice', defaultValue: 0.0) required this.unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0) required this.totalPrice,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'itemNumber', defaultValue: '') required this.itemNumber})
      : super._();

  factory _$_ReturnPriceDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnPriceDtoFromJson(json);

  @override
  @JsonKey(name: 'unitPrice', defaultValue: 0.0)
  final double unitPrice;
  @override
  @JsonKey(name: 'totalPrice', defaultValue: 0.0)
  final double totalPrice;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'itemNumber', defaultValue: '')
  final String itemNumber;

  @override
  String toString() {
    return 'ReturnPriceDto(unitPrice: $unitPrice, totalPrice: $totalPrice, materialNumber: $materialNumber, itemNumber: $itemNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnPriceDto &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.itemNumber, itemNumber) ||
                other.itemNumber == itemNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, unitPrice, totalPrice, materialNumber, itemNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnPriceDtoCopyWith<_$_ReturnPriceDto> get copyWith =>
      __$$_ReturnPriceDtoCopyWithImpl<_$_ReturnPriceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnPriceDtoToJson(
      this,
    );
  }
}

abstract class _ReturnPriceDto extends ReturnPriceDto {
  const factory _ReturnPriceDto(
      {@JsonKey(name: 'unitPrice', defaultValue: 0.0)
      required final double unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: 0.0)
      required final double totalPrice,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'itemNumber', defaultValue: '')
      required final String itemNumber}) = _$_ReturnPriceDto;
  const _ReturnPriceDto._() : super._();

  factory _ReturnPriceDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnPriceDto.fromJson;

  @override
  @JsonKey(name: 'unitPrice', defaultValue: 0.0)
  double get unitPrice;
  @override
  @JsonKey(name: 'totalPrice', defaultValue: 0.0)
  double get totalPrice;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'itemNumber', defaultValue: '')
  String get itemNumber;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnPriceDtoCopyWith<_$_ReturnPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
