// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_invoice_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionInvoiceDto _$TransactionInvoiceDtoFromJson(
    Map<String, dynamic> json) {
  return _TransactionInvoiceDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionInvoiceDto {
  @JsonKey(name: 'documentDate', defaultValue: '')
  String get documentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentNo', defaultValue: '')
  String get documentNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentType', defaultValue: '')
  String get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount', defaultValue: 0.0)
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionInvoiceDtoCopyWith<TransactionInvoiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionInvoiceDtoCopyWith<$Res> {
  factory $TransactionInvoiceDtoCopyWith(TransactionInvoiceDto value,
          $Res Function(TransactionInvoiceDto) then) =
      _$TransactionInvoiceDtoCopyWithImpl<$Res, TransactionInvoiceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'documentDate', defaultValue: '') String documentDate,
      @JsonKey(name: 'documentNo', defaultValue: '') String documentNo,
      @JsonKey(name: 'documentType', defaultValue: '') String documentType,
      @JsonKey(name: 'amount', defaultValue: 0.0) double amount});
}

/// @nodoc
class _$TransactionInvoiceDtoCopyWithImpl<$Res,
        $Val extends TransactionInvoiceDto>
    implements $TransactionInvoiceDtoCopyWith<$Res> {
  _$TransactionInvoiceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentDate = null,
    Object? documentNo = null,
    Object? documentType = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      documentDate: null == documentDate
          ? _value.documentDate
          : documentDate // ignore: cast_nullable_to_non_nullable
              as String,
      documentNo: null == documentNo
          ? _value.documentNo
          : documentNo // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionInvoiceDtoCopyWith<$Res>
    implements $TransactionInvoiceDtoCopyWith<$Res> {
  factory _$$_TransactionInvoiceDtoCopyWith(_$_TransactionInvoiceDto value,
          $Res Function(_$_TransactionInvoiceDto) then) =
      __$$_TransactionInvoiceDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'documentDate', defaultValue: '') String documentDate,
      @JsonKey(name: 'documentNo', defaultValue: '') String documentNo,
      @JsonKey(name: 'documentType', defaultValue: '') String documentType,
      @JsonKey(name: 'amount', defaultValue: 0.0) double amount});
}

/// @nodoc
class __$$_TransactionInvoiceDtoCopyWithImpl<$Res>
    extends _$TransactionInvoiceDtoCopyWithImpl<$Res, _$_TransactionInvoiceDto>
    implements _$$_TransactionInvoiceDtoCopyWith<$Res> {
  __$$_TransactionInvoiceDtoCopyWithImpl(_$_TransactionInvoiceDto _value,
      $Res Function(_$_TransactionInvoiceDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentDate = null,
    Object? documentNo = null,
    Object? documentType = null,
    Object? amount = null,
  }) {
    return _then(_$_TransactionInvoiceDto(
      documentDate: null == documentDate
          ? _value.documentDate
          : documentDate // ignore: cast_nullable_to_non_nullable
              as String,
      documentNo: null == documentNo
          ? _value.documentNo
          : documentNo // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionInvoiceDto extends _TransactionInvoiceDto {
  const _$_TransactionInvoiceDto(
      {@JsonKey(name: 'documentDate', defaultValue: '')
      required this.documentDate,
      @JsonKey(name: 'documentNo', defaultValue: '') required this.documentNo,
      @JsonKey(name: 'documentType', defaultValue: '')
      required this.documentType,
      @JsonKey(name: 'amount', defaultValue: 0.0) required this.amount})
      : super._();

  factory _$_TransactionInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionInvoiceDtoFromJson(json);

  @override
  @JsonKey(name: 'documentDate', defaultValue: '')
  final String documentDate;
  @override
  @JsonKey(name: 'documentNo', defaultValue: '')
  final String documentNo;
  @override
  @JsonKey(name: 'documentType', defaultValue: '')
  final String documentType;
  @override
  @JsonKey(name: 'amount', defaultValue: 0.0)
  final double amount;

  @override
  String toString() {
    return 'TransactionInvoiceDto(documentDate: $documentDate, documentNo: $documentNo, documentType: $documentType, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionInvoiceDto &&
            (identical(other.documentDate, documentDate) ||
                other.documentDate == documentDate) &&
            (identical(other.documentNo, documentNo) ||
                other.documentNo == documentNo) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, documentDate, documentNo, documentType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionInvoiceDtoCopyWith<_$_TransactionInvoiceDto> get copyWith =>
      __$$_TransactionInvoiceDtoCopyWithImpl<_$_TransactionInvoiceDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionInvoiceDtoToJson(
      this,
    );
  }
}

abstract class _TransactionInvoiceDto extends TransactionInvoiceDto {
  const factory _TransactionInvoiceDto(
      {@JsonKey(name: 'documentDate', defaultValue: '')
      required final String documentDate,
      @JsonKey(name: 'documentNo', defaultValue: '')
      required final String documentNo,
      @JsonKey(name: 'documentType', defaultValue: '')
      required final String documentType,
      @JsonKey(name: 'amount', defaultValue: 0.0)
      required final double amount}) = _$_TransactionInvoiceDto;
  const _TransactionInvoiceDto._() : super._();

  factory _TransactionInvoiceDto.fromJson(Map<String, dynamic> json) =
      _$_TransactionInvoiceDto.fromJson;

  @override
  @JsonKey(name: 'documentDate', defaultValue: '')
  String get documentDate;
  @override
  @JsonKey(name: 'documentNo', defaultValue: '')
  String get documentNo;
  @override
  @JsonKey(name: 'documentType', defaultValue: '')
  String get documentType;
  @override
  @JsonKey(name: 'amount', defaultValue: 0.0)
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionInvoiceDtoCopyWith<_$_TransactionInvoiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
