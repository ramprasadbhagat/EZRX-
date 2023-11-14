// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InvoiceOrderItem {
  StringValue get invoiceId => throw _privateConstructorUsedError;
  StringValue get orderId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceOrderItemCopyWith<InvoiceOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceOrderItemCopyWith<$Res> {
  factory $InvoiceOrderItemCopyWith(
          InvoiceOrderItem value, $Res Function(InvoiceOrderItem) then) =
      _$InvoiceOrderItemCopyWithImpl<$Res, InvoiceOrderItem>;
  @useResult
  $Res call({StringValue invoiceId, StringValue orderId});
}

/// @nodoc
class _$InvoiceOrderItemCopyWithImpl<$Res, $Val extends InvoiceOrderItem>
    implements $InvoiceOrderItemCopyWith<$Res> {
  _$InvoiceOrderItemCopyWithImpl(this._value, this._then);

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
              as StringValue,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvoiceOrderItemCopyWith<$Res>
    implements $InvoiceOrderItemCopyWith<$Res> {
  factory _$$_InvoiceOrderItemCopyWith(
          _$_InvoiceOrderItem value, $Res Function(_$_InvoiceOrderItem) then) =
      __$$_InvoiceOrderItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StringValue invoiceId, StringValue orderId});
}

/// @nodoc
class __$$_InvoiceOrderItemCopyWithImpl<$Res>
    extends _$InvoiceOrderItemCopyWithImpl<$Res, _$_InvoiceOrderItem>
    implements _$$_InvoiceOrderItemCopyWith<$Res> {
  __$$_InvoiceOrderItemCopyWithImpl(
      _$_InvoiceOrderItem _value, $Res Function(_$_InvoiceOrderItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? orderId = null,
  }) {
    return _then(_$_InvoiceOrderItem(
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as StringValue,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_InvoiceOrderItem implements _InvoiceOrderItem {
  _$_InvoiceOrderItem({required this.invoiceId, required this.orderId});

  @override
  final StringValue invoiceId;
  @override
  final StringValue orderId;

  @override
  String toString() {
    return 'InvoiceOrderItem(invoiceId: $invoiceId, orderId: $orderId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceOrderItem &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceId, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceOrderItemCopyWith<_$_InvoiceOrderItem> get copyWith =>
      __$$_InvoiceOrderItemCopyWithImpl<_$_InvoiceOrderItem>(this, _$identity);
}

abstract class _InvoiceOrderItem implements InvoiceOrderItem {
  factory _InvoiceOrderItem(
      {required final StringValue invoiceId,
      required final StringValue orderId}) = _$_InvoiceOrderItem;

  @override
  StringValue get invoiceId;
  @override
  StringValue get orderId;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceOrderItemCopyWith<_$_InvoiceOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}
