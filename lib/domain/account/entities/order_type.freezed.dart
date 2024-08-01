// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderType {
  String get categoryId => throw _privateConstructorUsedError;
  DocumentType get orderType => throw _privateConstructorUsedError;
  StringValue get description => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderTypeCopyWith<OrderType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTypeCopyWith<$Res> {
  factory $OrderTypeCopyWith(OrderType value, $Res Function(OrderType) then) =
      _$OrderTypeCopyWithImpl<$Res, OrderType>;
  @useResult
  $Res call(
      {String categoryId,
      DocumentType orderType,
      StringValue description,
      bool enabled});
}

/// @nodoc
class _$OrderTypeCopyWithImpl<$Res, $Val extends OrderType>
    implements $OrderTypeCopyWith<$Res> {
  _$OrderTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? orderType = null,
    Object? description = null,
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as StringValue,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderTypeCopyWith<$Res> implements $OrderTypeCopyWith<$Res> {
  factory _$$_OrderTypeCopyWith(
          _$_OrderType value, $Res Function(_$_OrderType) then) =
      __$$_OrderTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryId,
      DocumentType orderType,
      StringValue description,
      bool enabled});
}

/// @nodoc
class __$$_OrderTypeCopyWithImpl<$Res>
    extends _$OrderTypeCopyWithImpl<$Res, _$_OrderType>
    implements _$$_OrderTypeCopyWith<$Res> {
  __$$_OrderTypeCopyWithImpl(
      _$_OrderType _value, $Res Function(_$_OrderType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? orderType = null,
    Object? description = null,
    Object? enabled = null,
  }) {
    return _then(_$_OrderType(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as StringValue,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderType extends _OrderType {
  const _$_OrderType(
      {required this.categoryId,
      required this.orderType,
      required this.description,
      required this.enabled})
      : super._();

  @override
  final String categoryId;
  @override
  final DocumentType orderType;
  @override
  final StringValue description;
  @override
  final bool enabled;

  @override
  String toString() {
    return 'OrderType(categoryId: $categoryId, orderType: $orderType, description: $description, enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderType &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, orderType, description, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderTypeCopyWith<_$_OrderType> get copyWith =>
      __$$_OrderTypeCopyWithImpl<_$_OrderType>(this, _$identity);
}

abstract class _OrderType extends OrderType {
  const factory _OrderType(
      {required final String categoryId,
      required final DocumentType orderType,
      required final StringValue description,
      required final bool enabled}) = _$_OrderType;
  const _OrderType._() : super._();

  @override
  String get categoryId;
  @override
  DocumentType get orderType;
  @override
  StringValue get description;
  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTypeCopyWith<_$_OrderType> get copyWith =>
      throw _privateConstructorUsedError;
}
