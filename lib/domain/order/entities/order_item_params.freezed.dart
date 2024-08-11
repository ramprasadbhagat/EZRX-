// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderItemParams {
  OrderNumber get orderNumber => throw _privateConstructorUsedError;
  LineNumber get lineNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderItemParamsCopyWith<OrderItemParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemParamsCopyWith<$Res> {
  factory $OrderItemParamsCopyWith(
          OrderItemParams value, $Res Function(OrderItemParams) then) =
      _$OrderItemParamsCopyWithImpl<$Res, OrderItemParams>;
  @useResult
  $Res call({OrderNumber orderNumber, LineNumber lineNumber});
}

/// @nodoc
class _$OrderItemParamsCopyWithImpl<$Res, $Val extends OrderItemParams>
    implements $OrderItemParamsCopyWith<$Res> {
  _$OrderItemParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
    Object? lineNumber = null,
  }) {
    return _then(_value.copyWith(
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as LineNumber,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemParamsImplCopyWith<$Res>
    implements $OrderItemParamsCopyWith<$Res> {
  factory _$$OrderItemParamsImplCopyWith(_$OrderItemParamsImpl value,
          $Res Function(_$OrderItemParamsImpl) then) =
      __$$OrderItemParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderNumber orderNumber, LineNumber lineNumber});
}

/// @nodoc
class __$$OrderItemParamsImplCopyWithImpl<$Res>
    extends _$OrderItemParamsCopyWithImpl<$Res, _$OrderItemParamsImpl>
    implements _$$OrderItemParamsImplCopyWith<$Res> {
  __$$OrderItemParamsImplCopyWithImpl(
      _$OrderItemParamsImpl _value, $Res Function(_$OrderItemParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
    Object? lineNumber = null,
  }) {
    return _then(_$OrderItemParamsImpl(
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as LineNumber,
    ));
  }
}

/// @nodoc

class _$OrderItemParamsImpl extends _OrderItemParams {
  _$OrderItemParamsImpl({required this.orderNumber, required this.lineNumber})
      : super._();

  @override
  final OrderNumber orderNumber;
  @override
  final LineNumber lineNumber;

  @override
  String toString() {
    return 'OrderItemParams(orderNumber: $orderNumber, lineNumber: $lineNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemParamsImpl &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderNumber, lineNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemParamsImplCopyWith<_$OrderItemParamsImpl> get copyWith =>
      __$$OrderItemParamsImplCopyWithImpl<_$OrderItemParamsImpl>(
          this, _$identity);
}

abstract class _OrderItemParams extends OrderItemParams {
  factory _OrderItemParams(
      {required final OrderNumber orderNumber,
      required final LineNumber lineNumber}) = _$OrderItemParamsImpl;
  _OrderItemParams._() : super._();

  @override
  OrderNumber get orderNumber;
  @override
  LineNumber get lineNumber;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemParamsImplCopyWith<_$OrderItemParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
