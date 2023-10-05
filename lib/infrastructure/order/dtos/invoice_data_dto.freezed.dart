// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvoiceDataDto _$InvoiceDataDtoFromJson(Map<String, dynamic> json) {
  return _InvoiceDataDto.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDataDto {
  @JsonKey(name: 'orderId', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice', defaultValue: '')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceDataDtoCopyWith<InvoiceDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDataDtoCopyWith<$Res> {
  factory $InvoiceDataDtoCopyWith(
          InvoiceDataDto value, $Res Function(InvoiceDataDto) then) =
      _$InvoiceDataDtoCopyWithImpl<$Res, InvoiceDataDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderId', defaultValue: '') String orderNumber,
      @JsonKey(name: 'invoice', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '') String lineNumber});
}

/// @nodoc
class _$InvoiceDataDtoCopyWithImpl<$Res, $Val extends InvoiceDataDto>
    implements $InvoiceDataDtoCopyWith<$Res> {
  _$InvoiceDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
    Object? invoiceNumber = null,
    Object? lineNumber = null,
  }) {
    return _then(_value.copyWith(
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvoiceDataDtoCopyWith<$Res>
    implements $InvoiceDataDtoCopyWith<$Res> {
  factory _$$_InvoiceDataDtoCopyWith(
          _$_InvoiceDataDto value, $Res Function(_$_InvoiceDataDto) then) =
      __$$_InvoiceDataDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderId', defaultValue: '') String orderNumber,
      @JsonKey(name: 'invoice', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '') String lineNumber});
}

/// @nodoc
class __$$_InvoiceDataDtoCopyWithImpl<$Res>
    extends _$InvoiceDataDtoCopyWithImpl<$Res, _$_InvoiceDataDto>
    implements _$$_InvoiceDataDtoCopyWith<$Res> {
  __$$_InvoiceDataDtoCopyWithImpl(
      _$_InvoiceDataDto _value, $Res Function(_$_InvoiceDataDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
    Object? invoiceNumber = null,
    Object? lineNumber = null,
  }) {
    return _then(_$_InvoiceDataDto(
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvoiceDataDto extends _InvoiceDataDto {
  const _$_InvoiceDataDto(
      {@JsonKey(name: 'orderId', defaultValue: '') required this.orderNumber,
      @JsonKey(name: 'invoice', defaultValue: '') required this.invoiceNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '') required this.lineNumber})
      : super._();

  factory _$_InvoiceDataDto.fromJson(Map<String, dynamic> json) =>
      _$$_InvoiceDataDtoFromJson(json);

  @override
  @JsonKey(name: 'orderId', defaultValue: '')
  final String orderNumber;
  @override
  @JsonKey(name: 'invoice', defaultValue: '')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  final String lineNumber;

  @override
  String toString() {
    return 'InvoiceDataDto(orderNumber: $orderNumber, invoiceNumber: $invoiceNumber, lineNumber: $lineNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceDataDto &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, orderNumber, invoiceNumber, lineNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceDataDtoCopyWith<_$_InvoiceDataDto> get copyWith =>
      __$$_InvoiceDataDtoCopyWithImpl<_$_InvoiceDataDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvoiceDataDtoToJson(
      this,
    );
  }
}

abstract class _InvoiceDataDto extends InvoiceDataDto {
  const factory _InvoiceDataDto(
      {@JsonKey(name: 'orderId', defaultValue: '')
      required final String orderNumber,
      @JsonKey(name: 'invoice', defaultValue: '')
      required final String invoiceNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '')
      required final String lineNumber}) = _$_InvoiceDataDto;
  const _InvoiceDataDto._() : super._();

  factory _InvoiceDataDto.fromJson(Map<String, dynamic> json) =
      _$_InvoiceDataDto.fromJson;

  @override
  @JsonKey(name: 'orderId', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(name: 'invoice', defaultValue: '')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceDataDtoCopyWith<_$_InvoiceDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}
