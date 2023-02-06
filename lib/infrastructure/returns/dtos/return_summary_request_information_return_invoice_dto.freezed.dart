// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_summary_request_information_return_invoice_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnInvoiceDto _$ReturnInvoiceDtoFromJson(Map<String, dynamic> json) {
  return _ReturnInvoiceDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnInvoiceDto {
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  String get invoiceDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnInvoiceDtoCopyWith<ReturnInvoiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnInvoiceDtoCopyWith<$Res> {
  factory $ReturnInvoiceDtoCopyWith(
          ReturnInvoiceDto value, $Res Function(ReturnInvoiceDto) then) =
      _$ReturnInvoiceDtoCopyWithImpl<$Res, ReturnInvoiceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'invoiceDate', defaultValue: '') String invoiceDate});
}

/// @nodoc
class _$ReturnInvoiceDtoCopyWithImpl<$Res, $Val extends ReturnInvoiceDto>
    implements $ReturnInvoiceDtoCopyWith<$Res> {
  _$ReturnInvoiceDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_ReturnInvoiceDtoCopyWith<$Res>
    implements $ReturnInvoiceDtoCopyWith<$Res> {
  factory _$$_ReturnInvoiceDtoCopyWith(
          _$_ReturnInvoiceDto value, $Res Function(_$_ReturnInvoiceDto) then) =
      __$$_ReturnInvoiceDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'invoiceDate', defaultValue: '') String invoiceDate});
}

/// @nodoc
class __$$_ReturnInvoiceDtoCopyWithImpl<$Res>
    extends _$ReturnInvoiceDtoCopyWithImpl<$Res, _$_ReturnInvoiceDto>
    implements _$$_ReturnInvoiceDtoCopyWith<$Res> {
  __$$_ReturnInvoiceDtoCopyWithImpl(
      _$_ReturnInvoiceDto _value, $Res Function(_$_ReturnInvoiceDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
  }) {
    return _then(_$_ReturnInvoiceDto(
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
@JsonSerializable()
class _$_ReturnInvoiceDto extends _ReturnInvoiceDto {
  const _$_ReturnInvoiceDto(
      {@JsonKey(name: 'invoiceNumber', defaultValue: '')
          required this.invoiceNumber,
      @JsonKey(name: 'invoiceDate', defaultValue: '')
          required this.invoiceDate})
      : super._();

  factory _$_ReturnInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnInvoiceDtoFromJson(json);

  @override
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  final String invoiceDate;

  @override
  String toString() {
    return 'ReturnInvoiceDto(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnInvoiceDto &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, invoiceNumber, invoiceDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnInvoiceDtoCopyWith<_$_ReturnInvoiceDto> get copyWith =>
      __$$_ReturnInvoiceDtoCopyWithImpl<_$_ReturnInvoiceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnInvoiceDtoToJson(
      this,
    );
  }
}

abstract class _ReturnInvoiceDto extends ReturnInvoiceDto {
  const factory _ReturnInvoiceDto(
      {@JsonKey(name: 'invoiceNumber', defaultValue: '')
          required final String invoiceNumber,
      @JsonKey(name: 'invoiceDate', defaultValue: '')
          required final String invoiceDate}) = _$_ReturnInvoiceDto;
  const _ReturnInvoiceDto._() : super._();

  factory _ReturnInvoiceDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnInvoiceDto.fromJson;

  @override
  @JsonKey(name: 'invoiceNumber', defaultValue: '')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  String get invoiceDate;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnInvoiceDtoCopyWith<_$_ReturnInvoiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
