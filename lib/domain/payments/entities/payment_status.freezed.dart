// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentStatus {
  Uri get uri => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStatusCopyWith<PaymentStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStatusCopyWith<$Res> {
  factory $PaymentStatusCopyWith(
          PaymentStatus value, $Res Function(PaymentStatus) then) =
      _$PaymentStatusCopyWithImpl<$Res, PaymentStatus>;
  @useResult
  $Res call({Uri uri});
}

/// @nodoc
class _$PaymentStatusCopyWithImpl<$Res, $Val extends PaymentStatus>
    implements $PaymentStatusCopyWith<$Res> {
  _$PaymentStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
  }) {
    return _then(_value.copyWith(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentStatusCopyWith<$Res>
    implements $PaymentStatusCopyWith<$Res> {
  factory _$$_PaymentStatusCopyWith(
          _$_PaymentStatus value, $Res Function(_$_PaymentStatus) then) =
      __$$_PaymentStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uri uri});
}

/// @nodoc
class __$$_PaymentStatusCopyWithImpl<$Res>
    extends _$PaymentStatusCopyWithImpl<$Res, _$_PaymentStatus>
    implements _$$_PaymentStatusCopyWith<$Res> {
  __$$_PaymentStatusCopyWithImpl(
      _$_PaymentStatus _value, $Res Function(_$_PaymentStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
  }) {
    return _then(_$_PaymentStatus(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_PaymentStatus extends _PaymentStatus {
  const _$_PaymentStatus({required this.uri}) : super._();

  @override
  final Uri uri;

  @override
  String toString() {
    return 'PaymentStatus(uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentStatus &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentStatusCopyWith<_$_PaymentStatus> get copyWith =>
      __$$_PaymentStatusCopyWithImpl<_$_PaymentStatus>(this, _$identity);
}

abstract class _PaymentStatus extends PaymentStatus {
  const factory _PaymentStatus({required final Uri uri}) = _$_PaymentStatus;
  const _PaymentStatus._() : super._();

  @override
  Uri get uri;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentStatusCopyWith<_$_PaymentStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
