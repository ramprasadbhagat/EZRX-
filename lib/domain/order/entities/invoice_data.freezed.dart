// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InvoiceData {
  OrderNumber get orderNumber => throw _privateConstructorUsedError;
  StringValue get invoiceNumber => throw _privateConstructorUsedError;
  StringValue get lineNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceDataCopyWith<InvoiceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDataCopyWith<$Res> {
  factory $InvoiceDataCopyWith(
          InvoiceData value, $Res Function(InvoiceData) then) =
      _$InvoiceDataCopyWithImpl<$Res, InvoiceData>;
  @useResult
  $Res call(
      {OrderNumber orderNumber,
      StringValue invoiceNumber,
      StringValue lineNumber});
}

/// @nodoc
class _$InvoiceDataCopyWithImpl<$Res, $Val extends InvoiceData>
    implements $InvoiceDataCopyWith<$Res> {
  _$InvoiceDataCopyWithImpl(this._value, this._then);

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
              as OrderNumber,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvoiceDataCopyWith<$Res>
    implements $InvoiceDataCopyWith<$Res> {
  factory _$$_InvoiceDataCopyWith(
          _$_InvoiceData value, $Res Function(_$_InvoiceData) then) =
      __$$_InvoiceDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderNumber orderNumber,
      StringValue invoiceNumber,
      StringValue lineNumber});
}

/// @nodoc
class __$$_InvoiceDataCopyWithImpl<$Res>
    extends _$InvoiceDataCopyWithImpl<$Res, _$_InvoiceData>
    implements _$$_InvoiceDataCopyWith<$Res> {
  __$$_InvoiceDataCopyWithImpl(
      _$_InvoiceData _value, $Res Function(_$_InvoiceData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
    Object? invoiceNumber = null,
    Object? lineNumber = null,
  }) {
    return _then(_$_InvoiceData(
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_InvoiceData extends _InvoiceData {
  const _$_InvoiceData(
      {required this.orderNumber,
      required this.invoiceNumber,
      required this.lineNumber})
      : super._();

  @override
  final OrderNumber orderNumber;
  @override
  final StringValue invoiceNumber;
  @override
  final StringValue lineNumber;

  @override
  String toString() {
    return 'InvoiceData(orderNumber: $orderNumber, invoiceNumber: $invoiceNumber, lineNumber: $lineNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceData &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, orderNumber, invoiceNumber, lineNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceDataCopyWith<_$_InvoiceData> get copyWith =>
      __$$_InvoiceDataCopyWithImpl<_$_InvoiceData>(this, _$identity);
}

abstract class _InvoiceData extends InvoiceData {
  const factory _InvoiceData(
      {required final OrderNumber orderNumber,
      required final StringValue invoiceNumber,
      required final StringValue lineNumber}) = _$_InvoiceData;
  const _InvoiceData._() : super._();

  @override
  OrderNumber get orderNumber;
  @override
  StringValue get invoiceNumber;
  @override
  StringValue get lineNumber;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceDataCopyWith<_$_InvoiceData> get copyWith =>
      throw _privateConstructorUsedError;
}
