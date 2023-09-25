// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentItemDto _$PaymentItemDtoFromJson(Map<String, dynamic> json) {
  return _PaymentItemDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentItemDto {
  @JsonKey(name: 'accountingDocument', defaultValue: '')
  String get accountingDocument => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountingDocumentItem', defaultValue: '')
  String get accountingDocumentItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'netDueDate', defaultValue: '')
  String get netDueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'postingDate', defaultValue: '')
  String get postingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentDate', defaultValue: '')
  String get documentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionCurrency', defaultValue: '')
  String get transactionCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentAmountInDisplayCrcy', defaultValue: 0)
  double get paymentAmountInDisplayCrcy => throw _privateConstructorUsedError;
  @JsonKey(name: 'postingKeyName', defaultValue: '')
  String get postingKeyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentReferenceID', defaultValue: '')
  String get documentReferenceID => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountingDocumentType', defaultValue: '')
  String get accountingDocumentType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentItemDtoCopyWith<PaymentItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentItemDtoCopyWith<$Res> {
  factory $PaymentItemDtoCopyWith(
          PaymentItemDto value, $Res Function(PaymentItemDto) then) =
      _$PaymentItemDtoCopyWithImpl<$Res, PaymentItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'accountingDocument', defaultValue: '')
      String accountingDocument,
      @JsonKey(name: 'accountingDocumentItem', defaultValue: '')
      String accountingDocumentItem,
      @JsonKey(name: 'netDueDate', defaultValue: '') String netDueDate,
      @JsonKey(name: 'postingDate', defaultValue: '') String postingDate,
      @JsonKey(name: 'documentDate', defaultValue: '') String documentDate,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      String transactionCurrency,
      @JsonKey(name: 'paymentAmountInDisplayCrcy', defaultValue: 0)
      double paymentAmountInDisplayCrcy,
      @JsonKey(name: 'postingKeyName', defaultValue: '') String postingKeyName,
      @JsonKey(name: 'documentReferenceID', defaultValue: '')
      String documentReferenceID,
      @JsonKey(name: 'accountingDocumentType', defaultValue: '')
      String accountingDocumentType});
}

/// @nodoc
class _$PaymentItemDtoCopyWithImpl<$Res, $Val extends PaymentItemDto>
    implements $PaymentItemDtoCopyWith<$Res> {
  _$PaymentItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountingDocument = null,
    Object? accountingDocumentItem = null,
    Object? netDueDate = null,
    Object? postingDate = null,
    Object? documentDate = null,
    Object? transactionCurrency = null,
    Object? paymentAmountInDisplayCrcy = null,
    Object? postingKeyName = null,
    Object? documentReferenceID = null,
    Object? accountingDocumentType = null,
  }) {
    return _then(_value.copyWith(
      accountingDocument: null == accountingDocument
          ? _value.accountingDocument
          : accountingDocument // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocumentItem: null == accountingDocumentItem
          ? _value.accountingDocumentItem
          : accountingDocumentItem // ignore: cast_nullable_to_non_nullable
              as String,
      netDueDate: null == netDueDate
          ? _value.netDueDate
          : netDueDate // ignore: cast_nullable_to_non_nullable
              as String,
      postingDate: null == postingDate
          ? _value.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String,
      documentDate: null == documentDate
          ? _value.documentDate
          : documentDate // ignore: cast_nullable_to_non_nullable
              as String,
      transactionCurrency: null == transactionCurrency
          ? _value.transactionCurrency
          : transactionCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAmountInDisplayCrcy: null == paymentAmountInDisplayCrcy
          ? _value.paymentAmountInDisplayCrcy
          : paymentAmountInDisplayCrcy // ignore: cast_nullable_to_non_nullable
              as double,
      postingKeyName: null == postingKeyName
          ? _value.postingKeyName
          : postingKeyName // ignore: cast_nullable_to_non_nullable
              as String,
      documentReferenceID: null == documentReferenceID
          ? _value.documentReferenceID
          : documentReferenceID // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocumentType: null == accountingDocumentType
          ? _value.accountingDocumentType
          : accountingDocumentType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentItemDtoCopyWith<$Res>
    implements $PaymentItemDtoCopyWith<$Res> {
  factory _$$_PaymentItemDtoCopyWith(
          _$_PaymentItemDto value, $Res Function(_$_PaymentItemDto) then) =
      __$$_PaymentItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'accountingDocument', defaultValue: '')
      String accountingDocument,
      @JsonKey(name: 'accountingDocumentItem', defaultValue: '')
      String accountingDocumentItem,
      @JsonKey(name: 'netDueDate', defaultValue: '') String netDueDate,
      @JsonKey(name: 'postingDate', defaultValue: '') String postingDate,
      @JsonKey(name: 'documentDate', defaultValue: '') String documentDate,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      String transactionCurrency,
      @JsonKey(name: 'paymentAmountInDisplayCrcy', defaultValue: 0)
      double paymentAmountInDisplayCrcy,
      @JsonKey(name: 'postingKeyName', defaultValue: '') String postingKeyName,
      @JsonKey(name: 'documentReferenceID', defaultValue: '')
      String documentReferenceID,
      @JsonKey(name: 'accountingDocumentType', defaultValue: '')
      String accountingDocumentType});
}

/// @nodoc
class __$$_PaymentItemDtoCopyWithImpl<$Res>
    extends _$PaymentItemDtoCopyWithImpl<$Res, _$_PaymentItemDto>
    implements _$$_PaymentItemDtoCopyWith<$Res> {
  __$$_PaymentItemDtoCopyWithImpl(
      _$_PaymentItemDto _value, $Res Function(_$_PaymentItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountingDocument = null,
    Object? accountingDocumentItem = null,
    Object? netDueDate = null,
    Object? postingDate = null,
    Object? documentDate = null,
    Object? transactionCurrency = null,
    Object? paymentAmountInDisplayCrcy = null,
    Object? postingKeyName = null,
    Object? documentReferenceID = null,
    Object? accountingDocumentType = null,
  }) {
    return _then(_$_PaymentItemDto(
      accountingDocument: null == accountingDocument
          ? _value.accountingDocument
          : accountingDocument // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocumentItem: null == accountingDocumentItem
          ? _value.accountingDocumentItem
          : accountingDocumentItem // ignore: cast_nullable_to_non_nullable
              as String,
      netDueDate: null == netDueDate
          ? _value.netDueDate
          : netDueDate // ignore: cast_nullable_to_non_nullable
              as String,
      postingDate: null == postingDate
          ? _value.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String,
      documentDate: null == documentDate
          ? _value.documentDate
          : documentDate // ignore: cast_nullable_to_non_nullable
              as String,
      transactionCurrency: null == transactionCurrency
          ? _value.transactionCurrency
          : transactionCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAmountInDisplayCrcy: null == paymentAmountInDisplayCrcy
          ? _value.paymentAmountInDisplayCrcy
          : paymentAmountInDisplayCrcy // ignore: cast_nullable_to_non_nullable
              as double,
      postingKeyName: null == postingKeyName
          ? _value.postingKeyName
          : postingKeyName // ignore: cast_nullable_to_non_nullable
              as String,
      documentReferenceID: null == documentReferenceID
          ? _value.documentReferenceID
          : documentReferenceID // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocumentType: null == accountingDocumentType
          ? _value.accountingDocumentType
          : accountingDocumentType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentItemDto extends _PaymentItemDto {
  const _$_PaymentItemDto(
      {@JsonKey(name: 'accountingDocument', defaultValue: '')
      required this.accountingDocument,
      @JsonKey(name: 'accountingDocumentItem', defaultValue: '')
      required this.accountingDocumentItem,
      @JsonKey(name: 'netDueDate', defaultValue: '') required this.netDueDate,
      @JsonKey(name: 'postingDate', defaultValue: '') required this.postingDate,
      @JsonKey(name: 'documentDate', defaultValue: '')
      required this.documentDate,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      required this.transactionCurrency,
      @JsonKey(name: 'paymentAmountInDisplayCrcy', defaultValue: 0)
      required this.paymentAmountInDisplayCrcy,
      @JsonKey(name: 'postingKeyName', defaultValue: '')
      required this.postingKeyName,
      @JsonKey(name: 'documentReferenceID', defaultValue: '')
      required this.documentReferenceID,
      @JsonKey(name: 'accountingDocumentType', defaultValue: '')
      required this.accountingDocumentType})
      : super._();

  factory _$_PaymentItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentItemDtoFromJson(json);

  @override
  @JsonKey(name: 'accountingDocument', defaultValue: '')
  final String accountingDocument;
  @override
  @JsonKey(name: 'accountingDocumentItem', defaultValue: '')
  final String accountingDocumentItem;
  @override
  @JsonKey(name: 'netDueDate', defaultValue: '')
  final String netDueDate;
  @override
  @JsonKey(name: 'postingDate', defaultValue: '')
  final String postingDate;
  @override
  @JsonKey(name: 'documentDate', defaultValue: '')
  final String documentDate;
  @override
  @JsonKey(name: 'transactionCurrency', defaultValue: '')
  final String transactionCurrency;
  @override
  @JsonKey(name: 'paymentAmountInDisplayCrcy', defaultValue: 0)
  final double paymentAmountInDisplayCrcy;
  @override
  @JsonKey(name: 'postingKeyName', defaultValue: '')
  final String postingKeyName;
  @override
  @JsonKey(name: 'documentReferenceID', defaultValue: '')
  final String documentReferenceID;
  @override
  @JsonKey(name: 'accountingDocumentType', defaultValue: '')
  final String accountingDocumentType;

  @override
  String toString() {
    return 'PaymentItemDto(accountingDocument: $accountingDocument, accountingDocumentItem: $accountingDocumentItem, netDueDate: $netDueDate, postingDate: $postingDate, documentDate: $documentDate, transactionCurrency: $transactionCurrency, paymentAmountInDisplayCrcy: $paymentAmountInDisplayCrcy, postingKeyName: $postingKeyName, documentReferenceID: $documentReferenceID, accountingDocumentType: $accountingDocumentType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentItemDto &&
            (identical(other.accountingDocument, accountingDocument) ||
                other.accountingDocument == accountingDocument) &&
            (identical(other.accountingDocumentItem, accountingDocumentItem) ||
                other.accountingDocumentItem == accountingDocumentItem) &&
            (identical(other.netDueDate, netDueDate) ||
                other.netDueDate == netDueDate) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate) &&
            (identical(other.documentDate, documentDate) ||
                other.documentDate == documentDate) &&
            (identical(other.transactionCurrency, transactionCurrency) ||
                other.transactionCurrency == transactionCurrency) &&
            (identical(other.paymentAmountInDisplayCrcy,
                    paymentAmountInDisplayCrcy) ||
                other.paymentAmountInDisplayCrcy ==
                    paymentAmountInDisplayCrcy) &&
            (identical(other.postingKeyName, postingKeyName) ||
                other.postingKeyName == postingKeyName) &&
            (identical(other.documentReferenceID, documentReferenceID) ||
                other.documentReferenceID == documentReferenceID) &&
            (identical(other.accountingDocumentType, accountingDocumentType) ||
                other.accountingDocumentType == accountingDocumentType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountingDocument,
      accountingDocumentItem,
      netDueDate,
      postingDate,
      documentDate,
      transactionCurrency,
      paymentAmountInDisplayCrcy,
      postingKeyName,
      documentReferenceID,
      accountingDocumentType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentItemDtoCopyWith<_$_PaymentItemDto> get copyWith =>
      __$$_PaymentItemDtoCopyWithImpl<_$_PaymentItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentItemDtoToJson(
      this,
    );
  }
}

abstract class _PaymentItemDto extends PaymentItemDto {
  const factory _PaymentItemDto(
      {@JsonKey(name: 'accountingDocument', defaultValue: '')
      required final String accountingDocument,
      @JsonKey(name: 'accountingDocumentItem', defaultValue: '')
      required final String accountingDocumentItem,
      @JsonKey(name: 'netDueDate', defaultValue: '')
      required final String netDueDate,
      @JsonKey(name: 'postingDate', defaultValue: '')
      required final String postingDate,
      @JsonKey(name: 'documentDate', defaultValue: '')
      required final String documentDate,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      required final String transactionCurrency,
      @JsonKey(name: 'paymentAmountInDisplayCrcy', defaultValue: 0)
      required final double paymentAmountInDisplayCrcy,
      @JsonKey(name: 'postingKeyName', defaultValue: '')
      required final String postingKeyName,
      @JsonKey(name: 'documentReferenceID', defaultValue: '')
      required final String documentReferenceID,
      @JsonKey(name: 'accountingDocumentType', defaultValue: '')
      required final String accountingDocumentType}) = _$_PaymentItemDto;
  const _PaymentItemDto._() : super._();

  factory _PaymentItemDto.fromJson(Map<String, dynamic> json) =
      _$_PaymentItemDto.fromJson;

  @override
  @JsonKey(name: 'accountingDocument', defaultValue: '')
  String get accountingDocument;
  @override
  @JsonKey(name: 'accountingDocumentItem', defaultValue: '')
  String get accountingDocumentItem;
  @override
  @JsonKey(name: 'netDueDate', defaultValue: '')
  String get netDueDate;
  @override
  @JsonKey(name: 'postingDate', defaultValue: '')
  String get postingDate;
  @override
  @JsonKey(name: 'documentDate', defaultValue: '')
  String get documentDate;
  @override
  @JsonKey(name: 'transactionCurrency', defaultValue: '')
  String get transactionCurrency;
  @override
  @JsonKey(name: 'paymentAmountInDisplayCrcy', defaultValue: 0)
  double get paymentAmountInDisplayCrcy;
  @override
  @JsonKey(name: 'postingKeyName', defaultValue: '')
  String get postingKeyName;
  @override
  @JsonKey(name: 'documentReferenceID', defaultValue: '')
  String get documentReferenceID;
  @override
  @JsonKey(name: 'accountingDocumentType', defaultValue: '')
  String get accountingDocumentType;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentItemDtoCopyWith<_$_PaymentItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
