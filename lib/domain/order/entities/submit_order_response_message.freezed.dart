// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_order_response_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubmitOrderResponseMessage {
  String get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitOrderResponseMessageCopyWith<SubmitOrderResponseMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitOrderResponseMessageCopyWith<$Res> {
  factory $SubmitOrderResponseMessageCopyWith(SubmitOrderResponseMessage value,
          $Res Function(SubmitOrderResponseMessage) then) =
      _$SubmitOrderResponseMessageCopyWithImpl<$Res,
          SubmitOrderResponseMessage>;
  @useResult
  $Res call({String type, String message});
}

/// @nodoc
class _$SubmitOrderResponseMessageCopyWithImpl<$Res,
        $Val extends SubmitOrderResponseMessage>
    implements $SubmitOrderResponseMessageCopyWith<$Res> {
  _$SubmitOrderResponseMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitOrderResponseMessageCopyWith<$Res>
    implements $SubmitOrderResponseMessageCopyWith<$Res> {
  factory _$$_SubmitOrderResponseMessageCopyWith(
          _$_SubmitOrderResponseMessage value,
          $Res Function(_$_SubmitOrderResponseMessage) then) =
      __$$_SubmitOrderResponseMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String message});
}

/// @nodoc
class __$$_SubmitOrderResponseMessageCopyWithImpl<$Res>
    extends _$SubmitOrderResponseMessageCopyWithImpl<$Res,
        _$_SubmitOrderResponseMessage>
    implements _$$_SubmitOrderResponseMessageCopyWith<$Res> {
  __$$_SubmitOrderResponseMessageCopyWithImpl(
      _$_SubmitOrderResponseMessage _value,
      $Res Function(_$_SubmitOrderResponseMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_$_SubmitOrderResponseMessage(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SubmitOrderResponseMessage extends _SubmitOrderResponseMessage {
  const _$_SubmitOrderResponseMessage(
      {required this.type, required this.message})
      : super._();

  @override
  final String type;
  @override
  final String message;

  @override
  String toString() {
    return 'SubmitOrderResponseMessage(type: $type, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitOrderResponseMessage &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitOrderResponseMessageCopyWith<_$_SubmitOrderResponseMessage>
      get copyWith => __$$_SubmitOrderResponseMessageCopyWithImpl<
          _$_SubmitOrderResponseMessage>(this, _$identity);
}

abstract class _SubmitOrderResponseMessage extends SubmitOrderResponseMessage {
  const factory _SubmitOrderResponseMessage(
      {required final String type,
      required final String message}) = _$_SubmitOrderResponseMessage;
  const _SubmitOrderResponseMessage._() : super._();

  @override
  String get type;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitOrderResponseMessageCopyWith<_$_SubmitOrderResponseMessage>
      get copyWith => throw _privateConstructorUsedError;
}
