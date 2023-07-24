// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_encryption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderEncryption {
  String get data => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderEncryptionCopyWith<OrderEncryption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEncryptionCopyWith<$Res> {
  factory $OrderEncryptionCopyWith(
          OrderEncryption value, $Res Function(OrderEncryption) then) =
      _$OrderEncryptionCopyWithImpl<$Res, OrderEncryption>;
  @useResult
  $Res call({String data, String hash});
}

/// @nodoc
class _$OrderEncryptionCopyWithImpl<$Res, $Val extends OrderEncryption>
    implements $OrderEncryptionCopyWith<$Res> {
  _$OrderEncryptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderEncryptionCopyWith<$Res>
    implements $OrderEncryptionCopyWith<$Res> {
  factory _$$_OrderEncryptionCopyWith(
          _$_OrderEncryption value, $Res Function(_$_OrderEncryption) then) =
      __$$_OrderEncryptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String data, String hash});
}

/// @nodoc
class __$$_OrderEncryptionCopyWithImpl<$Res>
    extends _$OrderEncryptionCopyWithImpl<$Res, _$_OrderEncryption>
    implements _$$_OrderEncryptionCopyWith<$Res> {
  __$$_OrderEncryptionCopyWithImpl(
      _$_OrderEncryption _value, $Res Function(_$_OrderEncryption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? hash = null,
  }) {
    return _then(_$_OrderEncryption(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OrderEncryption extends _OrderEncryption {
  _$_OrderEncryption({required this.data, required this.hash}) : super._();

  @override
  final String data;
  @override
  final String hash;

  @override
  String toString() {
    return 'OrderEncryption(data: $data, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderEncryption &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderEncryptionCopyWith<_$_OrderEncryption> get copyWith =>
      __$$_OrderEncryptionCopyWithImpl<_$_OrderEncryption>(this, _$identity);
}

abstract class _OrderEncryption extends OrderEncryption {
  factory _OrderEncryption(
      {required final String data,
      required final String hash}) = _$_OrderEncryption;
  _OrderEncryption._() : super._();

  @override
  String get data;
  @override
  String get hash;
  @override
  @JsonKey(ignore: true)
  _$$_OrderEncryptionCopyWith<_$_OrderEncryption> get copyWith =>
      throw _privateConstructorUsedError;
}
