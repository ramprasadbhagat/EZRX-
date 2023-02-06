// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_information_return_invoices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnInvoices {
  String get invoiceNumber => throw _privateConstructorUsedError;
  String get invoiceDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnInvoicesCopyWith<ReturnInvoices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnInvoicesCopyWith<$Res> {
  factory $ReturnInvoicesCopyWith(
          ReturnInvoices value, $Res Function(ReturnInvoices) then) =
      _$ReturnInvoicesCopyWithImpl<$Res, ReturnInvoices>;
  @useResult
  $Res call({String invoiceNumber, String invoiceDate});
}

/// @nodoc
class _$ReturnInvoicesCopyWithImpl<$Res, $Val extends ReturnInvoices>
    implements $ReturnInvoicesCopyWith<$Res> {
  _$ReturnInvoicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
  }) {
    return _then(_value.copyWith(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnInvoicesCopyWith<$Res>
    implements $ReturnInvoicesCopyWith<$Res> {
  factory _$$_ReturnInvoicesCopyWith(
          _$_ReturnInvoices value, $Res Function(_$_ReturnInvoices) then) =
      __$$_ReturnInvoicesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String invoiceNumber, String invoiceDate});
}

/// @nodoc
class __$$_ReturnInvoicesCopyWithImpl<$Res>
    extends _$ReturnInvoicesCopyWithImpl<$Res, _$_ReturnInvoices>
    implements _$$_ReturnInvoicesCopyWith<$Res> {
  __$$_ReturnInvoicesCopyWithImpl(
      _$_ReturnInvoices _value, $Res Function(_$_ReturnInvoices) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
  }) {
    return _then(_$_ReturnInvoices(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReturnInvoices extends _ReturnInvoices {
  const _$_ReturnInvoices(
      {required this.invoiceNumber, required this.invoiceDate})
      : super._();

  @override
  final String invoiceNumber;
  @override
  final String invoiceDate;

  @override
  String toString() {
    return 'ReturnInvoices(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnInvoices &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceNumber, invoiceDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnInvoicesCopyWith<_$_ReturnInvoices> get copyWith =>
      __$$_ReturnInvoicesCopyWithImpl<_$_ReturnInvoices>(this, _$identity);
}

abstract class _ReturnInvoices extends ReturnInvoices {
  const factory _ReturnInvoices(
      {required final String invoiceNumber,
      required final String invoiceDate}) = _$_ReturnInvoices;
  const _ReturnInvoices._() : super._();

  @override
  String get invoiceNumber;
  @override
  String get invoiceDate;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnInvoicesCopyWith<_$_ReturnInvoices> get copyWith =>
      throw _privateConstructorUsedError;
}
