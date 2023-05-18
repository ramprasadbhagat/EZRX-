// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_document_header_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerDocumentHeaderDto _$CustomerDocumentHeaderDtoFromJson(
    Map<String, dynamic> json) {
  return _CustomerDocumentHeaderDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerDocumentHeaderDto {
  @JsonKey(
      name: 'documentHeaderList', defaultValue: <CreditAndInvoiceItemDto>[])
  List<CreditAndInvoiceItemDto> get invoices =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'totalCount', defaultValue: 0)
  int get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerDocumentHeaderDtoCopyWith<CustomerDocumentHeaderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDocumentHeaderDtoCopyWith<$Res> {
  factory $CustomerDocumentHeaderDtoCopyWith(CustomerDocumentHeaderDto value,
          $Res Function(CustomerDocumentHeaderDto) then) =
      _$CustomerDocumentHeaderDtoCopyWithImpl<$Res, CustomerDocumentHeaderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'documentHeaderList', defaultValue: <CreditAndInvoiceItemDto>[])
          List<CreditAndInvoiceItemDto> invoices,
      @JsonKey(name: 'totalCount', defaultValue: 0)
          int totalCount});
}

/// @nodoc
class _$CustomerDocumentHeaderDtoCopyWithImpl<$Res,
        $Val extends CustomerDocumentHeaderDto>
    implements $CustomerDocumentHeaderDtoCopyWith<$Res> {
  _$CustomerDocumentHeaderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoices = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      invoices: null == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItemDto>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerDocumentHeaderDtoCopyWith<$Res>
    implements $CustomerDocumentHeaderDtoCopyWith<$Res> {
  factory _$$_CustomerDocumentHeaderDtoCopyWith(
          _$_CustomerDocumentHeaderDto value,
          $Res Function(_$_CustomerDocumentHeaderDto) then) =
      __$$_CustomerDocumentHeaderDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'documentHeaderList', defaultValue: <CreditAndInvoiceItemDto>[])
          List<CreditAndInvoiceItemDto> invoices,
      @JsonKey(name: 'totalCount', defaultValue: 0)
          int totalCount});
}

/// @nodoc
class __$$_CustomerDocumentHeaderDtoCopyWithImpl<$Res>
    extends _$CustomerDocumentHeaderDtoCopyWithImpl<$Res,
        _$_CustomerDocumentHeaderDto>
    implements _$$_CustomerDocumentHeaderDtoCopyWith<$Res> {
  __$$_CustomerDocumentHeaderDtoCopyWithImpl(
      _$_CustomerDocumentHeaderDto _value,
      $Res Function(_$_CustomerDocumentHeaderDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoices = null,
    Object? totalCount = null,
  }) {
    return _then(_$_CustomerDocumentHeaderDto(
      invoices: null == invoices
          ? _value._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItemDto>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerDocumentHeaderDto extends _CustomerDocumentHeaderDto {
  _$_CustomerDocumentHeaderDto(
      {@JsonKey(name: 'documentHeaderList', defaultValue: <CreditAndInvoiceItemDto>[])
          required final List<CreditAndInvoiceItemDto> invoices,
      @JsonKey(name: 'totalCount', defaultValue: 0)
          required this.totalCount})
      : _invoices = invoices,
        super._();

  factory _$_CustomerDocumentHeaderDto.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerDocumentHeaderDtoFromJson(json);

  final List<CreditAndInvoiceItemDto> _invoices;
  @override
  @JsonKey(
      name: 'documentHeaderList', defaultValue: <CreditAndInvoiceItemDto>[])
  List<CreditAndInvoiceItemDto> get invoices {
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoices);
  }

  @override
  @JsonKey(name: 'totalCount', defaultValue: 0)
  final int totalCount;

  @override
  String toString() {
    return 'CustomerDocumentHeaderDto(invoices: $invoices, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerDocumentHeaderDto &&
            const DeepCollectionEquality().equals(other._invoices, _invoices) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_invoices), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerDocumentHeaderDtoCopyWith<_$_CustomerDocumentHeaderDto>
      get copyWith => __$$_CustomerDocumentHeaderDtoCopyWithImpl<
          _$_CustomerDocumentHeaderDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerDocumentHeaderDtoToJson(
      this,
    );
  }
}

abstract class _CustomerDocumentHeaderDto extends CustomerDocumentHeaderDto {
  factory _CustomerDocumentHeaderDto(
      {@JsonKey(name: 'documentHeaderList', defaultValue: <CreditAndInvoiceItemDto>[])
          required final List<CreditAndInvoiceItemDto> invoices,
      @JsonKey(name: 'totalCount', defaultValue: 0)
          required final int totalCount}) = _$_CustomerDocumentHeaderDto;
  _CustomerDocumentHeaderDto._() : super._();

  factory _CustomerDocumentHeaderDto.fromJson(Map<String, dynamic> json) =
      _$_CustomerDocumentHeaderDto.fromJson;

  @override
  @JsonKey(
      name: 'documentHeaderList', defaultValue: <CreditAndInvoiceItemDto>[])
  List<CreditAndInvoiceItemDto> get invoices;
  @override
  @JsonKey(name: 'totalCount', defaultValue: 0)
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerDocumentHeaderDtoCopyWith<_$_CustomerDocumentHeaderDto>
      get copyWith => throw _privateConstructorUsedError;
}
