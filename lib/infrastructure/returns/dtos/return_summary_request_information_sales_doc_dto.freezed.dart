// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_information_sales_doc_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesDocDto _$SalesDocDtoFromJson(Map<String, dynamic> json) {
  return _SalesDocDto.fromJson(json);
}

/// @nodoc
mixin _$SalesDocDto {
  @JsonKey(name: 'invoiceNo', defaultValue: '')
  String get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  String get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'bapiSalesDoc', defaultValue: '')
  String get bapiSalesDoc => throw _privateConstructorUsedError;
  @JsonKey(name: 'ezrxNumber', defaultValue: '')
  String get ezrxNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'creditNotes', defaultValue: [])
  List<CreditNotesDto> get creditNotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesDocDtoCopyWith<SalesDocDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesDocDtoCopyWith<$Res> {
  factory $SalesDocDtoCopyWith(
          SalesDocDto value, $Res Function(SalesDocDto) then) =
      _$SalesDocDtoCopyWithImpl<$Res, SalesDocDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceNo', defaultValue: '')
          String invoiceNo,
      @JsonKey(name: 'invoiceDate', defaultValue: '')
          String invoiceDate,
      @JsonKey(name: 'bapiSalesDoc', defaultValue: '')
          String bapiSalesDoc,
      @JsonKey(name: 'ezrxNumber', defaultValue: '')
          String ezrxNumber,
      @JsonKey(name: 'creditNotes', defaultValue: [])
          List<CreditNotesDto> creditNotes});
}

/// @nodoc
class _$SalesDocDtoCopyWithImpl<$Res, $Val extends SalesDocDto>
    implements $SalesDocDtoCopyWith<$Res> {
  _$SalesDocDtoCopyWithImpl(this._value, this._then);

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
              as List<CreditNotesDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesDocDtoCopyWith<$Res>
    implements $SalesDocDtoCopyWith<$Res> {
  factory _$$_SalesDocDtoCopyWith(
          _$_SalesDocDto value, $Res Function(_$_SalesDocDto) then) =
      __$$_SalesDocDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceNo', defaultValue: '')
          String invoiceNo,
      @JsonKey(name: 'invoiceDate', defaultValue: '')
          String invoiceDate,
      @JsonKey(name: 'bapiSalesDoc', defaultValue: '')
          String bapiSalesDoc,
      @JsonKey(name: 'ezrxNumber', defaultValue: '')
          String ezrxNumber,
      @JsonKey(name: 'creditNotes', defaultValue: [])
          List<CreditNotesDto> creditNotes});
}

/// @nodoc
class __$$_SalesDocDtoCopyWithImpl<$Res>
    extends _$SalesDocDtoCopyWithImpl<$Res, _$_SalesDocDto>
    implements _$$_SalesDocDtoCopyWith<$Res> {
  __$$_SalesDocDtoCopyWithImpl(
      _$_SalesDocDto _value, $Res Function(_$_SalesDocDto) _then)
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
    return _then(_$_SalesDocDto(
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
              as List<CreditNotesDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalesDocDto extends _SalesDocDto {
  const _$_SalesDocDto(
      {@JsonKey(name: 'invoiceNo', defaultValue: '')
          required this.invoiceNo,
      @JsonKey(name: 'invoiceDate', defaultValue: '')
          required this.invoiceDate,
      @JsonKey(name: 'bapiSalesDoc', defaultValue: '')
          required this.bapiSalesDoc,
      @JsonKey(name: 'ezrxNumber', defaultValue: '')
          required this.ezrxNumber,
      @JsonKey(name: 'creditNotes', defaultValue: [])
          required final List<CreditNotesDto> creditNotes})
      : _creditNotes = creditNotes,
        super._();

  factory _$_SalesDocDto.fromJson(Map<String, dynamic> json) =>
      _$$_SalesDocDtoFromJson(json);

  @override
  @JsonKey(name: 'invoiceNo', defaultValue: '')
  final String invoiceNo;
  @override
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  final String invoiceDate;
  @override
  @JsonKey(name: 'bapiSalesDoc', defaultValue: '')
  final String bapiSalesDoc;
  @override
  @JsonKey(name: 'ezrxNumber', defaultValue: '')
  final String ezrxNumber;
  final List<CreditNotesDto> _creditNotes;
  @override
  @JsonKey(name: 'creditNotes', defaultValue: [])
  List<CreditNotesDto> get creditNotes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creditNotes);
  }

  @override
  String toString() {
    return 'SalesDocDto(invoiceNo: $invoiceNo, invoiceDate: $invoiceDate, bapiSalesDoc: $bapiSalesDoc, ezrxNumber: $ezrxNumber, creditNotes: $creditNotes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesDocDto &&
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

  @JsonKey(ignore: true)
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
  _$$_SalesDocDtoCopyWith<_$_SalesDocDto> get copyWith =>
      __$$_SalesDocDtoCopyWithImpl<_$_SalesDocDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesDocDtoToJson(
      this,
    );
  }
}

abstract class _SalesDocDto extends SalesDocDto {
  const factory _SalesDocDto(
      {@JsonKey(name: 'invoiceNo', defaultValue: '')
          required final String invoiceNo,
      @JsonKey(name: 'invoiceDate', defaultValue: '')
          required final String invoiceDate,
      @JsonKey(name: 'bapiSalesDoc', defaultValue: '')
          required final String bapiSalesDoc,
      @JsonKey(name: 'ezrxNumber', defaultValue: '')
          required final String ezrxNumber,
      @JsonKey(name: 'creditNotes', defaultValue: [])
          required final List<CreditNotesDto> creditNotes}) = _$_SalesDocDto;
  const _SalesDocDto._() : super._();

  factory _SalesDocDto.fromJson(Map<String, dynamic> json) =
      _$_SalesDocDto.fromJson;

  @override
  @JsonKey(name: 'invoiceNo', defaultValue: '')
  String get invoiceNo;
  @override
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  String get invoiceDate;
  @override
  @JsonKey(name: 'bapiSalesDoc', defaultValue: '')
  String get bapiSalesDoc;
  @override
  @JsonKey(name: 'ezrxNumber', defaultValue: '')
  String get ezrxNumber;
  @override
  @JsonKey(name: 'creditNotes', defaultValue: [])
  List<CreditNotesDto> get creditNotes;
  @override
  @JsonKey(ignore: true)
  _$$_SalesDocDtoCopyWith<_$_SalesDocDto> get copyWith =>
      throw _privateConstructorUsedError;
}
