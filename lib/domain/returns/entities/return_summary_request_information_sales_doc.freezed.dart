// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_information_sales_doc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesDoc {
  String get invoiceNo => throw _privateConstructorUsedError;
  String get invoiceDate => throw _privateConstructorUsedError;
  String get bapiSalesDoc => throw _privateConstructorUsedError;
  String get ezrxNumber => throw _privateConstructorUsedError;
  List<CreditNotes> get creditNotes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesDocCopyWith<SalesDoc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesDocCopyWith<$Res> {
  factory $SalesDocCopyWith(SalesDoc value, $Res Function(SalesDoc) then) =
      _$SalesDocCopyWithImpl<$Res, SalesDoc>;
  @useResult
  $Res call(
      {String invoiceNo,
      String invoiceDate,
      String bapiSalesDoc,
      String ezrxNumber,
      List<CreditNotes> creditNotes});
}

/// @nodoc
class _$SalesDocCopyWithImpl<$Res, $Val extends SalesDoc>
    implements $SalesDocCopyWith<$Res> {
  _$SalesDocCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNo = null,
    Object? invoiceDate = null,
    Object? bapiSalesDoc = null,
    Object? ezrxNumber = null,
    Object? creditNotes = null,
  }) {
    return _then(_value.copyWith(
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
      bapiSalesDoc: null == bapiSalesDoc
          ? _value.bapiSalesDoc
          : bapiSalesDoc // ignore: cast_nullable_to_non_nullable
              as String,
      ezrxNumber: null == ezrxNumber
          ? _value.ezrxNumber
          : ezrxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      creditNotes: null == creditNotes
          ? _value.creditNotes
          : creditNotes // ignore: cast_nullable_to_non_nullable
              as List<CreditNotes>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesDocCopyWith<$Res> implements $SalesDocCopyWith<$Res> {
  factory _$$_SalesDocCopyWith(
          _$_SalesDoc value, $Res Function(_$_SalesDoc) then) =
      __$$_SalesDocCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String invoiceNo,
      String invoiceDate,
      String bapiSalesDoc,
      String ezrxNumber,
      List<CreditNotes> creditNotes});
}

/// @nodoc
class __$$_SalesDocCopyWithImpl<$Res>
    extends _$SalesDocCopyWithImpl<$Res, _$_SalesDoc>
    implements _$$_SalesDocCopyWith<$Res> {
  __$$_SalesDocCopyWithImpl(
      _$_SalesDoc _value, $Res Function(_$_SalesDoc) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNo = null,
    Object? invoiceDate = null,
    Object? bapiSalesDoc = null,
    Object? ezrxNumber = null,
    Object? creditNotes = null,
  }) {
    return _then(_$_SalesDoc(
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
      bapiSalesDoc: null == bapiSalesDoc
          ? _value.bapiSalesDoc
          : bapiSalesDoc // ignore: cast_nullable_to_non_nullable
              as String,
      ezrxNumber: null == ezrxNumber
          ? _value.ezrxNumber
          : ezrxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      creditNotes: null == creditNotes
          ? _value._creditNotes
          : creditNotes // ignore: cast_nullable_to_non_nullable
              as List<CreditNotes>,
    ));
  }
}

/// @nodoc

class _$_SalesDoc extends _SalesDoc {
  const _$_SalesDoc(
      {required this.invoiceNo,
      required this.invoiceDate,
      required this.bapiSalesDoc,
      required this.ezrxNumber,
      required final List<CreditNotes> creditNotes})
      : _creditNotes = creditNotes,
        super._();

  @override
  final String invoiceNo;
  @override
  final String invoiceDate;
  @override
  final String bapiSalesDoc;
  @override
  final String ezrxNumber;
  final List<CreditNotes> _creditNotes;
  @override
  List<CreditNotes> get creditNotes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creditNotes);
  }

  @override
  String toString() {
    return 'SalesDoc(invoiceNo: $invoiceNo, invoiceDate: $invoiceDate, bapiSalesDoc: $bapiSalesDoc, ezrxNumber: $ezrxNumber, creditNotes: $creditNotes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesDoc &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.bapiSalesDoc, bapiSalesDoc) ||
                other.bapiSalesDoc == bapiSalesDoc) &&
            (identical(other.ezrxNumber, ezrxNumber) ||
                other.ezrxNumber == ezrxNumber) &&
            const DeepCollectionEquality()
                .equals(other._creditNotes, _creditNotes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      invoiceNo,
      invoiceDate,
      bapiSalesDoc,
      ezrxNumber,
      const DeepCollectionEquality().hash(_creditNotes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesDocCopyWith<_$_SalesDoc> get copyWith =>
      __$$_SalesDocCopyWithImpl<_$_SalesDoc>(this, _$identity);
}

abstract class _SalesDoc extends SalesDoc {
  const factory _SalesDoc(
      {required final String invoiceNo,
      required final String invoiceDate,
      required final String bapiSalesDoc,
      required final String ezrxNumber,
      required final List<CreditNotes> creditNotes}) = _$_SalesDoc;
  const _SalesDoc._() : super._();

  @override
  String get invoiceNo;
  @override
  String get invoiceDate;
  @override
  String get bapiSalesDoc;
  @override
  String get ezrxNumber;
  @override
  List<CreditNotes> get creditNotes;
  @override
  @JsonKey(ignore: true)
  _$$_SalesDocCopyWith<_$_SalesDoc> get copyWith =>
      throw _privateConstructorUsedError;
}
