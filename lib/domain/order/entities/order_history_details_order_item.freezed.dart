// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderItem {
  MaterialNumber get materialCode => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  String get defaultMaterialDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {MaterialNumber materialCode,
      String materialDescription,
      String defaultMaterialDescription});
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialCode = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
  }) {
    return _then(_value.copyWith(
      materialCode: null == materialCode
          ? _value.materialCode
          : materialCode // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$$_OrderItemCopyWith(
          _$_OrderItem value, $Res Function(_$_OrderItem) then) =
      __$$_OrderItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialCode,
      String materialDescription,
      String defaultMaterialDescription});
}

/// @nodoc
class __$$_OrderItemCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$_OrderItem>
    implements _$$_OrderItemCopyWith<$Res> {
  __$$_OrderItemCopyWithImpl(
      _$_OrderItem _value, $Res Function(_$_OrderItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialCode = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
  }) {
    return _then(_$_OrderItem(
      materialCode: null == materialCode
          ? _value.materialCode
          : materialCode // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OrderItem extends _OrderItem {
  _$_OrderItem(
      {required this.materialCode,
      required this.materialDescription,
      required this.defaultMaterialDescription})
      : super._();

  @override
  final MaterialNumber materialCode;
  @override
  final String materialDescription;
  @override
  final String defaultMaterialDescription;

  @override
  String toString() {
    return 'OrderItem(materialCode: $materialCode, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderItem &&
            (identical(other.materialCode, materialCode) ||
                other.materialCode == materialCode) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialCode,
      materialDescription, defaultMaterialDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderItemCopyWith<_$_OrderItem> get copyWith =>
      __$$_OrderItemCopyWithImpl<_$_OrderItem>(this, _$identity);
}

abstract class _OrderItem extends OrderItem {
  factory _OrderItem(
      {required final MaterialNumber materialCode,
      required final String materialDescription,
      required final String defaultMaterialDescription}) = _$_OrderItem;
  _OrderItem._() : super._();

  @override
  MaterialNumber get materialCode;
  @override
  String get materialDescription;
  @override
  String get defaultMaterialDescription;
  @override
  @JsonKey(ignore: true)
  _$$_OrderItemCopyWith<_$_OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}
