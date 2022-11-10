// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  @JsonKey(name: 'InvoiceNumber')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'InvoiceDate')
  String get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'InvoicePrice')
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
      _$OrderHistoryDetailsInvoicesDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'InvoiceNumber') String invoiceNumber,
      @JsonKey(name: 'InvoiceDate') String invoiceDate,
      @JsonKey(name: 'InvoicePrice') String invoicePrice});
}

/// @nodoc
class _$OrderHistoryDetailsInvoicesDtoCopyWithImpl<$Res>
    implements $OrderHistoryDetailsInvoicesDtoCopyWith<$Res> {
  _$OrderHistoryDetailsInvoicesDtoCopyWithImpl(this._value, this._then);

  final OrderHistoryDetailsInvoicesDto _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryDetailsInvoicesDto) _then;

  @override
  $Res call({
    Object? invoiceNumber = freezed,
    Object? invoiceDate = freezed,
    Object? invoicePrice = freezed,
  }) {
    return _then(_value.copyWith(
      invoiceNumber: invoiceNumber == freezed
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: invoiceDate == freezed
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
      invoicePrice: invoicePrice == freezed
          ? _value.invoicePrice
          : invoicePrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
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
  $Res call(
      {@JsonKey(name: 'InvoiceNumber') String invoiceNumber,
      @JsonKey(name: 'InvoiceDate') String invoiceDate,
      @JsonKey(name: 'InvoicePrice') String invoicePrice});
}

/// @nodoc
class __$$_OrderHistoryDetailsInvoicesDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsInvoicesDtoCopyWithImpl<$Res>
    implements _$$_OrderHistoryDetailsInvoicesDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsInvoicesDtoCopyWithImpl(
      _$_OrderHistoryDetailsInvoicesDto _value,
      $Res Function(_$_OrderHistoryDetailsInvoicesDto) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryDetailsInvoicesDto));

  @override
  _$_OrderHistoryDetailsInvoicesDto get _value =>
      super._value as _$_OrderHistoryDetailsInvoicesDto;

  @override
  $Res call({
    Object? invoiceNumber = freezed,
    Object? invoiceDate = freezed,
    Object? invoicePrice = freezed,
  }) {
    return _then(_$_OrderHistoryDetailsInvoicesDto(
      invoiceNumber: invoiceNumber == freezed
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: invoiceDate == freezed
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
      invoicePrice: invoicePrice == freezed
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
      {@JsonKey(name: 'InvoiceNumber') required this.invoiceNumber,
      @JsonKey(name: 'InvoiceDate') required this.invoiceDate,
      @JsonKey(name: 'InvoicePrice') required this.invoicePrice})
      : super._();

  factory _$_OrderHistoryDetailsInvoicesDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsInvoicesDtoFromJson(json);

  @override
  @JsonKey(name: 'InvoiceNumber')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'InvoiceDate')
  final String invoiceDate;
  @override
  @JsonKey(name: 'InvoicePrice')
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
            const DeepCollectionEquality()
                .equals(other.invoiceNumber, invoiceNumber) &&
            const DeepCollectionEquality()
                .equals(other.invoiceDate, invoiceDate) &&
            const DeepCollectionEquality()
                .equals(other.invoicePrice, invoicePrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(invoiceNumber),
      const DeepCollectionEquality().hash(invoiceDate),
      const DeepCollectionEquality().hash(invoicePrice));

  @JsonKey(ignore: true)
  @override
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
          {@JsonKey(name: 'InvoiceNumber') required final String invoiceNumber,
          @JsonKey(name: 'InvoiceDate') required final String invoiceDate,
          @JsonKey(name: 'InvoicePrice') required final String invoicePrice}) =
      _$_OrderHistoryDetailsInvoicesDto;
  const _OrderHistoryDetailsInvoicesDto._() : super._();

  factory _OrderHistoryDetailsInvoicesDto.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryDetailsInvoicesDto.fromJson;

  @override
  @JsonKey(name: 'InvoiceNumber')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'InvoiceDate')
  String get invoiceDate;
  @override
  @JsonKey(name: 'InvoicePrice')
  String get invoicePrice;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsInvoicesDtoCopyWith<_$_OrderHistoryDetailsInvoicesDto>
      get copyWith => throw _privateConstructorUsedError;
}
