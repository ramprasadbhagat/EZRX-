// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InvoiceDetails {
  String get invoiceNumber => throw _privateConstructorUsedError;
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  List<ReturnItemDetails> get returnItemDetailsList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceDetailsCopyWith<InvoiceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailsCopyWith<$Res> {
  factory $InvoiceDetailsCopyWith(
          InvoiceDetails value, $Res Function(InvoiceDetails) then) =
      _$InvoiceDetailsCopyWithImpl<$Res, InvoiceDetails>;
  @useResult
  $Res call(
      {String invoiceNumber,
      SalesOrg salesOrg,
      List<ReturnItemDetails> returnItemDetailsList});
}

/// @nodoc
class _$InvoiceDetailsCopyWithImpl<$Res, $Val extends InvoiceDetails>
    implements $InvoiceDetailsCopyWith<$Res> {
  _$InvoiceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? salesOrg = null,
    Object? returnItemDetailsList = null,
  }) {
    return _then(_value.copyWith(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      returnItemDetailsList: null == returnItemDetailsList
          ? _value.returnItemDetailsList
          : returnItemDetailsList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvoiceDetailsCopyWith<$Res>
    implements $InvoiceDetailsCopyWith<$Res> {
  factory _$$_InvoiceDetailsCopyWith(
          _$_InvoiceDetails value, $Res Function(_$_InvoiceDetails) then) =
      __$$_InvoiceDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String invoiceNumber,
      SalesOrg salesOrg,
      List<ReturnItemDetails> returnItemDetailsList});
}

/// @nodoc
class __$$_InvoiceDetailsCopyWithImpl<$Res>
    extends _$InvoiceDetailsCopyWithImpl<$Res, _$_InvoiceDetails>
    implements _$$_InvoiceDetailsCopyWith<$Res> {
  __$$_InvoiceDetailsCopyWithImpl(
      _$_InvoiceDetails _value, $Res Function(_$_InvoiceDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? salesOrg = null,
    Object? returnItemDetailsList = null,
  }) {
    return _then(_$_InvoiceDetails(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      returnItemDetailsList: null == returnItemDetailsList
          ? _value._returnItemDetailsList
          : returnItemDetailsList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemDetails>,
    ));
  }
}

/// @nodoc

class _$_InvoiceDetails extends _InvoiceDetails {
  const _$_InvoiceDetails(
      {required this.invoiceNumber,
      required this.salesOrg,
      required final List<ReturnItemDetails> returnItemDetailsList})
      : _returnItemDetailsList = returnItemDetailsList,
        super._();

  @override
  final String invoiceNumber;
  @override
  final SalesOrg salesOrg;
  final List<ReturnItemDetails> _returnItemDetailsList;
  @override
  List<ReturnItemDetails> get returnItemDetailsList {
    if (_returnItemDetailsList is EqualUnmodifiableListView)
      return _returnItemDetailsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnItemDetailsList);
  }

  @override
  String toString() {
    return 'InvoiceDetails(invoiceNumber: $invoiceNumber, salesOrg: $salesOrg, returnItemDetailsList: $returnItemDetailsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceDetails &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            const DeepCollectionEquality()
                .equals(other._returnItemDetailsList, _returnItemDetailsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceNumber, salesOrg,
      const DeepCollectionEquality().hash(_returnItemDetailsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceDetailsCopyWith<_$_InvoiceDetails> get copyWith =>
      __$$_InvoiceDetailsCopyWithImpl<_$_InvoiceDetails>(this, _$identity);
}

abstract class _InvoiceDetails extends InvoiceDetails {
  const factory _InvoiceDetails(
          {required final String invoiceNumber,
          required final SalesOrg salesOrg,
          required final List<ReturnItemDetails> returnItemDetailsList}) =
      _$_InvoiceDetails;
  const _InvoiceDetails._() : super._();

  @override
  String get invoiceNumber;
  @override
  SalesOrg get salesOrg;
  @override
  List<ReturnItemDetails> get returnItemDetailsList;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceDetailsCopyWith<_$_InvoiceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
