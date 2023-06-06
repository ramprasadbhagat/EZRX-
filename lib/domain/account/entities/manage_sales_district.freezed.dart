// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_sales_district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesDistrictResponseMessage {
  StringValue get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesDistrictResponseMessageCopyWith<SalesDistrictResponseMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesDistrictResponseMessageCopyWith<$Res> {
  factory $SalesDistrictResponseMessageCopyWith(
          SalesDistrictResponseMessage value,
          $Res Function(SalesDistrictResponseMessage) then) =
      _$SalesDistrictResponseMessageCopyWithImpl<$Res,
          SalesDistrictResponseMessage>;
  @useResult
  $Res call({StringValue message});
}

/// @nodoc
class _$SalesDistrictResponseMessageCopyWithImpl<$Res,
        $Val extends SalesDistrictResponseMessage>
    implements $SalesDistrictResponseMessageCopyWith<$Res> {
  _$SalesDistrictResponseMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesDistrictResponseMessageCopyWith<$Res>
    implements $SalesDistrictResponseMessageCopyWith<$Res> {
  factory _$$_SalesDistrictResponseMessageCopyWith(
          _$_SalesDistrictResponseMessage value,
          $Res Function(_$_SalesDistrictResponseMessage) then) =
      __$$_SalesDistrictResponseMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StringValue message});
}

/// @nodoc
class __$$_SalesDistrictResponseMessageCopyWithImpl<$Res>
    extends _$SalesDistrictResponseMessageCopyWithImpl<$Res,
        _$_SalesDistrictResponseMessage>
    implements _$$_SalesDistrictResponseMessageCopyWith<$Res> {
  __$$_SalesDistrictResponseMessageCopyWithImpl(
      _$_SalesDistrictResponseMessage _value,
      $Res Function(_$_SalesDistrictResponseMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_SalesDistrictResponseMessage(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_SalesDistrictResponseMessage extends _SalesDistrictResponseMessage {
  const _$_SalesDistrictResponseMessage({required this.message}) : super._();

  @override
  final StringValue message;

  @override
  String toString() {
    return 'SalesDistrictResponseMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesDistrictResponseMessage &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesDistrictResponseMessageCopyWith<_$_SalesDistrictResponseMessage>
      get copyWith => __$$_SalesDistrictResponseMessageCopyWithImpl<
          _$_SalesDistrictResponseMessage>(this, _$identity);
}

abstract class _SalesDistrictResponseMessage
    extends SalesDistrictResponseMessage {
  const factory _SalesDistrictResponseMessage(
      {required final StringValue message}) = _$_SalesDistrictResponseMessage;
  const _SalesDistrictResponseMessage._() : super._();

  @override
  StringValue get message;
  @override
  @JsonKey(ignore: true)
  _$$_SalesDistrictResponseMessageCopyWith<_$_SalesDistrictResponseMessage>
      get copyWith => throw _privateConstructorUsedError;
}
