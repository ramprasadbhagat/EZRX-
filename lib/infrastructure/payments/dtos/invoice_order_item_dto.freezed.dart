// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_order_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvoiceOrderItemDto _$InvoiceOrderItemDtoFromJson(Map<String, dynamic> json) {
  return _InvoiceOrderItemDto.fromJson(json);
}

/// @nodoc
mixin _$InvoiceOrderItemDto {
  @JsonKey(name: 'invoice', defaultValue: '')
  String get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderId', defaultValue: '')
  String get orderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceOrderItemDtoCopyWith<InvoiceOrderItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceOrderItemDtoCopyWith<$Res> {
  factory $InvoiceOrderItemDtoCopyWith(
          InvoiceOrderItemDto value, $Res Function(InvoiceOrderItemDto) then) =
      _$InvoiceOrderItemDtoCopyWithImpl<$Res, InvoiceOrderItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoice', defaultValue: '') String invoiceId,
      @JsonKey(name: 'orderId', defaultValue: '') String orderId});
}

/// @nodoc
class _$InvoiceOrderItemDtoCopyWithImpl<$Res, $Val extends InvoiceOrderItemDto>
    implements $InvoiceOrderItemDtoCopyWith<$Res> {
  _$InvoiceOrderItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? orderId = null,
  }) {
    return _then(_value.copyWith(
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvoiceOrderItemDtoCopyWith<$Res>
    implements $InvoiceOrderItemDtoCopyWith<$Res> {
  factory _$$_InvoiceOrderItemDtoCopyWith(_$_InvoiceOrderItemDto value,
          $Res Function(_$_InvoiceOrderItemDto) then) =
      __$$_InvoiceOrderItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoice', defaultValue: '') String invoiceId,
      @JsonKey(name: 'orderId', defaultValue: '') String orderId});
}

/// @nodoc
class __$$_InvoiceOrderItemDtoCopyWithImpl<$Res>
    extends _$InvoiceOrderItemDtoCopyWithImpl<$Res, _$_InvoiceOrderItemDto>
    implements _$$_InvoiceOrderItemDtoCopyWith<$Res> {
  __$$_InvoiceOrderItemDtoCopyWithImpl(_$_InvoiceOrderItemDto _value,
      $Res Function(_$_InvoiceOrderItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? orderId = null,
  }) {
    return _then(_$_InvoiceOrderItemDto(
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvoiceOrderItemDto extends _InvoiceOrderItemDto {
  _$_InvoiceOrderItemDto(
      {@JsonKey(name: 'invoice', defaultValue: '') required this.invoiceId,
      @JsonKey(name: 'orderId', defaultValue: '') required this.orderId})
      : super._();

  factory _$_InvoiceOrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_InvoiceOrderItemDtoFromJson(json);

  @override
  @JsonKey(name: 'invoice', defaultValue: '')
  final String invoiceId;
  @override
  @JsonKey(name: 'orderId', defaultValue: '')
  final String orderId;

  @override
  String toString() {
    return 'InvoiceOrderItemDto(invoiceId: $invoiceId, orderId: $orderId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceOrderItemDto &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, invoiceId, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceOrderItemDtoCopyWith<_$_InvoiceOrderItemDto> get copyWith =>
      __$$_InvoiceOrderItemDtoCopyWithImpl<_$_InvoiceOrderItemDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvoiceOrderItemDtoToJson(
      this,
    );
  }
}

abstract class _InvoiceOrderItemDto extends InvoiceOrderItemDto {
  factory _InvoiceOrderItemDto(
      {@JsonKey(name: 'invoice', defaultValue: '')
      required final String invoiceId,
      @JsonKey(name: 'orderId', defaultValue: '')
      required final String orderId}) = _$_InvoiceOrderItemDto;
  _InvoiceOrderItemDto._() : super._();

  factory _InvoiceOrderItemDto.fromJson(Map<String, dynamic> json) =
      _$_InvoiceOrderItemDto.fromJson;

  @override
  @JsonKey(name: 'invoice', defaultValue: '')
  String get invoiceId;
  @override
  @JsonKey(name: 'orderId', defaultValue: '')
  String get orderId;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceOrderItemDtoCopyWith<_$_InvoiceOrderItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
