// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_shipping_information_invoices_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryDetailsInvoicesDto _$OrderHistoryDetailsInvoicesDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsInvoicesDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsInvoicesDto {
  @JsonKey(name: 'InvoiceNumber', defaultValue: '')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'InvoiceDate', defaultValue: '')
  String get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'InvoicePrice', defaultValue: '')
  String get invoicePrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsInvoicesDtoCopyWith<OrderHistoryDetailsInvoicesDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsInvoicesDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsInvoicesDtoCopyWith(
          OrderHistoryDetailsInvoicesDto value,
          $Res Function(OrderHistoryDetailsInvoicesDto) then) =
      _$OrderHistoryDetailsInvoicesDtoCopyWithImpl<$Res,
          OrderHistoryDetailsInvoicesDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'InvoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'InvoiceDate', defaultValue: '') String invoiceDate,
      @JsonKey(name: 'InvoicePrice', defaultValue: '') String invoicePrice});
}

/// @nodoc
class _$OrderHistoryDetailsInvoicesDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsInvoicesDto>
    implements $OrderHistoryDetailsInvoicesDtoCopyWith<$Res> {
  _$OrderHistoryDetailsInvoicesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
    Object? invoicePrice = null,
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
      invoicePrice: null == invoicePrice
          ? _value.invoicePrice
          : invoicePrice // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsInvoicesDtoCopyWith<$Res>
    implements $OrderHistoryDetailsInvoicesDtoCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsInvoicesDtoCopyWith(
          _$_OrderHistoryDetailsInvoicesDto value,
          $Res Function(_$_OrderHistoryDetailsInvoicesDto) then) =
      __$$_OrderHistoryDetailsInvoicesDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'InvoiceNumber', defaultValue: '') String invoiceNumber,
      @JsonKey(name: 'InvoiceDate', defaultValue: '') String invoiceDate,
      @JsonKey(name: 'InvoicePrice', defaultValue: '') String invoicePrice});
}

/// @nodoc
class __$$_OrderHistoryDetailsInvoicesDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsInvoicesDtoCopyWithImpl<$Res,
        _$_OrderHistoryDetailsInvoicesDto>
    implements _$$_OrderHistoryDetailsInvoicesDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsInvoicesDtoCopyWithImpl(
      _$_OrderHistoryDetailsInvoicesDto _value,
      $Res Function(_$_OrderHistoryDetailsInvoicesDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? invoiceDate = null,
    Object? invoicePrice = null,
  }) {
    return _then(_$_OrderHistoryDetailsInvoicesDto(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
      invoicePrice: null == invoicePrice
          ? _value.invoicePrice
          : invoicePrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryDetailsInvoicesDto
    extends _OrderHistoryDetailsInvoicesDto {
  const _$_OrderHistoryDetailsInvoicesDto(
      {@JsonKey(name: 'InvoiceNumber', defaultValue: '')
      required this.invoiceNumber,
      @JsonKey(name: 'InvoiceDate', defaultValue: '') required this.invoiceDate,
      @JsonKey(name: 'InvoicePrice', defaultValue: '')
      required this.invoicePrice})
      : super._();

  factory _$_OrderHistoryDetailsInvoicesDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsInvoicesDtoFromJson(json);

  @override
  @JsonKey(name: 'InvoiceNumber', defaultValue: '')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'InvoiceDate', defaultValue: '')
  final String invoiceDate;
  @override
  @JsonKey(name: 'InvoicePrice', defaultValue: '')
  final String invoicePrice;

  @override
  String toString() {
    return 'OrderHistoryDetailsInvoicesDto(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, invoicePrice: $invoicePrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsInvoicesDto &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.invoicePrice, invoicePrice) ||
                other.invoicePrice == invoicePrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, invoiceNumber, invoiceDate, invoicePrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryDetailsInvoicesDtoCopyWith<_$_OrderHistoryDetailsInvoicesDto>
      get copyWith => __$$_OrderHistoryDetailsInvoicesDtoCopyWithImpl<
          _$_OrderHistoryDetailsInvoicesDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryDetailsInvoicesDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsInvoicesDto
    extends OrderHistoryDetailsInvoicesDto {
  const factory _OrderHistoryDetailsInvoicesDto(
      {@JsonKey(name: 'InvoiceNumber', defaultValue: '')
      required final String invoiceNumber,
      @JsonKey(name: 'InvoiceDate', defaultValue: '')
      required final String invoiceDate,
      @JsonKey(name: 'InvoicePrice', defaultValue: '')
      required final String invoicePrice}) = _$_OrderHistoryDetailsInvoicesDto;
  const _OrderHistoryDetailsInvoicesDto._() : super._();

  factory _OrderHistoryDetailsInvoicesDto.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryDetailsInvoicesDto.fromJson;

  @override
  @JsonKey(name: 'InvoiceNumber', defaultValue: '')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'InvoiceDate', defaultValue: '')
  String get invoiceDate;
  @override
  @JsonKey(name: 'InvoicePrice', defaultValue: '')
  String get invoicePrice;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsInvoicesDtoCopyWith<_$_OrderHistoryDetailsInvoicesDto>
      get copyWith => throw _privateConstructorUsedError;
}
