// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryDetailsMessages {
  String get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsMessagesCopyWith<OrderHistoryDetailsMessages>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsMessagesCopyWith<$Res> {
  factory $OrderHistoryDetailsMessagesCopyWith(
          OrderHistoryDetailsMessages value,
          $Res Function(OrderHistoryDetailsMessages) then) =
      _$OrderHistoryDetailsMessagesCopyWithImpl<$Res>;
  $Res call({String type, String message});
}

/// @nodoc
class _$OrderHistoryDetailsMessagesCopyWithImpl<$Res>
    implements $OrderHistoryDetailsMessagesCopyWith<$Res> {
  _$OrderHistoryDetailsMessagesCopyWithImpl(this._value, this._then);

  final OrderHistoryDetailsMessages _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryDetailsMessages) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsMessagesCopyWith<$Res>
    implements $OrderHistoryDetailsMessagesCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsMessagesCopyWith(
          _$_OrderHistoryDetailsMessages value,
          $Res Function(_$_OrderHistoryDetailsMessages) then) =
      __$$_OrderHistoryDetailsMessagesCopyWithImpl<$Res>;
  @override
  $Res call({String type, String message});
}

/// @nodoc
class __$$_OrderHistoryDetailsMessagesCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsMessagesCopyWithImpl<$Res>
    implements _$$_OrderHistoryDetailsMessagesCopyWith<$Res> {
  __$$_OrderHistoryDetailsMessagesCopyWithImpl(
      _$_OrderHistoryDetailsMessages _value,
      $Res Function(_$_OrderHistoryDetailsMessages) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryDetailsMessages));

  @override
  _$_OrderHistoryDetailsMessages get _value =>
      super._value as _$_OrderHistoryDetailsMessages;

  @override
  $Res call({
    Object? type = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_OrderHistoryDetailsMessages(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OrderHistoryDetailsMessages extends _OrderHistoryDetailsMessages {
  _$_OrderHistoryDetailsMessages({required this.type, required this.message})
      : super._();

  @override
  final String type;
  @override
  final String message;

  @override
  String toString() {
    return 'OrderHistoryDetailsMessages(type: $type, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsMessages &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryDetailsMessagesCopyWith<_$_OrderHistoryDetailsMessages>
      get copyWith => __$$_OrderHistoryDetailsMessagesCopyWithImpl<
          _$_OrderHistoryDetailsMessages>(this, _$identity);
}

abstract class _OrderHistoryDetailsMessages
    extends OrderHistoryDetailsMessages {
  factory _OrderHistoryDetailsMessages(
      {required final String type,
      required final String message}) = _$_OrderHistoryDetailsMessages;
  _OrderHistoryDetailsMessages._() : super._();

  @override
  String get type;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsMessagesCopyWith<_$_OrderHistoryDetailsMessages>
      get copyWith => throw _privateConstructorUsedError;
}
