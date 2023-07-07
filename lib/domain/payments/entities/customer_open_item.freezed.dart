// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_open_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerOpenItem {
  StatusType get status => throw _privateConstructorUsedError;
  String get accountingDocument => throw _privateConstructorUsedError;
  DateTimeStringValue get netDueDate => throw _privateConstructorUsedError;
  double get amountInTransactionCurrency => throw _privateConstructorUsedError;
  String get documentReferenceID => throw _privateConstructorUsedError;
  String get postingKeyName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerOpenItemCopyWith<CustomerOpenItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerOpenItemCopyWith<$Res> {
  factory $CustomerOpenItemCopyWith(
          CustomerOpenItem value, $Res Function(CustomerOpenItem) then) =
      _$CustomerOpenItemCopyWithImpl<$Res, CustomerOpenItem>;
  @useResult
  $Res call(
      {StatusType status,
      String accountingDocument,
      DateTimeStringValue netDueDate,
      double amountInTransactionCurrency,
      String documentReferenceID,
      String postingKeyName});
}

/// @nodoc
class _$CustomerOpenItemCopyWithImpl<$Res, $Val extends CustomerOpenItem>
    implements $CustomerOpenItemCopyWith<$Res> {
  _$CustomerOpenItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? accountingDocument = null,
    Object? netDueDate = null,
    Object? amountInTransactionCurrency = null,
    Object? documentReferenceID = null,
    Object? postingKeyName = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      accountingDocument: null == accountingDocument
          ? _value.accountingDocument
          : accountingDocument // ignore: cast_nullable_to_non_nullable
              as String,
      netDueDate: null == netDueDate
          ? _value.netDueDate
          : netDueDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountInTransactionCurrency: null == amountInTransactionCurrency
          ? _value.amountInTransactionCurrency
          : amountInTransactionCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      documentReferenceID: null == documentReferenceID
          ? _value.documentReferenceID
          : documentReferenceID // ignore: cast_nullable_to_non_nullable
              as String,
      postingKeyName: null == postingKeyName
          ? _value.postingKeyName
          : postingKeyName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerOpenItemCopyWith<$Res>
    implements $CustomerOpenItemCopyWith<$Res> {
  factory _$$_CustomerOpenItemCopyWith(
          _$_CustomerOpenItem value, $Res Function(_$_CustomerOpenItem) then) =
      __$$_CustomerOpenItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusType status,
      String accountingDocument,
      DateTimeStringValue netDueDate,
      double amountInTransactionCurrency,
      String documentReferenceID,
      String postingKeyName});
}

/// @nodoc
class __$$_CustomerOpenItemCopyWithImpl<$Res>
    extends _$CustomerOpenItemCopyWithImpl<$Res, _$_CustomerOpenItem>
    implements _$$_CustomerOpenItemCopyWith<$Res> {
  __$$_CustomerOpenItemCopyWithImpl(
      _$_CustomerOpenItem _value, $Res Function(_$_CustomerOpenItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? accountingDocument = null,
    Object? netDueDate = null,
    Object? amountInTransactionCurrency = null,
    Object? documentReferenceID = null,
    Object? postingKeyName = null,
  }) {
    return _then(_$_CustomerOpenItem(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      accountingDocument: null == accountingDocument
          ? _value.accountingDocument
          : accountingDocument // ignore: cast_nullable_to_non_nullable
              as String,
      netDueDate: null == netDueDate
          ? _value.netDueDate
          : netDueDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      amountInTransactionCurrency: null == amountInTransactionCurrency
          ? _value.amountInTransactionCurrency
          : amountInTransactionCurrency // ignore: cast_nullable_to_non_nullable
              as double,
      documentReferenceID: null == documentReferenceID
          ? _value.documentReferenceID
          : documentReferenceID // ignore: cast_nullable_to_non_nullable
              as String,
      postingKeyName: null == postingKeyName
          ? _value.postingKeyName
          : postingKeyName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CustomerOpenItem extends _CustomerOpenItem {
  _$_CustomerOpenItem(
      {required this.status,
      required this.accountingDocument,
      required this.netDueDate,
      required this.amountInTransactionCurrency,
      required this.documentReferenceID,
      required this.postingKeyName})
      : super._();

  @override
  final StatusType status;
  @override
  final String accountingDocument;
  @override
  final DateTimeStringValue netDueDate;
  @override
  final double amountInTransactionCurrency;
  @override
  final String documentReferenceID;
  @override
  final String postingKeyName;

  @override
  String toString() {
    return 'CustomerOpenItem(status: $status, accountingDocument: $accountingDocument, netDueDate: $netDueDate, amountInTransactionCurrency: $amountInTransactionCurrency, documentReferenceID: $documentReferenceID, postingKeyName: $postingKeyName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerOpenItem &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.accountingDocument, accountingDocument) ||
                other.accountingDocument == accountingDocument) &&
            (identical(other.netDueDate, netDueDate) ||
                other.netDueDate == netDueDate) &&
            (identical(other.amountInTransactionCurrency,
                    amountInTransactionCurrency) ||
                other.amountInTransactionCurrency ==
                    amountInTransactionCurrency) &&
            (identical(other.documentReferenceID, documentReferenceID) ||
                other.documentReferenceID == documentReferenceID) &&
            (identical(other.postingKeyName, postingKeyName) ||
                other.postingKeyName == postingKeyName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      accountingDocument,
      netDueDate,
      amountInTransactionCurrency,
      documentReferenceID,
      postingKeyName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerOpenItemCopyWith<_$_CustomerOpenItem> get copyWith =>
      __$$_CustomerOpenItemCopyWithImpl<_$_CustomerOpenItem>(this, _$identity);
}

abstract class _CustomerOpenItem extends CustomerOpenItem {
  factory _CustomerOpenItem(
      {required final StatusType status,
      required final String accountingDocument,
      required final DateTimeStringValue netDueDate,
      required final double amountInTransactionCurrency,
      required final String documentReferenceID,
      required final String postingKeyName}) = _$_CustomerOpenItem;
  _CustomerOpenItem._() : super._();

  @override
  StatusType get status;
  @override
  String get accountingDocument;
  @override
  DateTimeStringValue get netDueDate;
  @override
  double get amountInTransactionCurrency;
  @override
  String get documentReferenceID;
  @override
  String get postingKeyName;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerOpenItemCopyWith<_$_CustomerOpenItem> get copyWith =>
      throw _privateConstructorUsedError;
}
