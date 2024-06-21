// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_cred.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetPasswordCred {
  Username get username => throw _privateConstructorUsedError;
  StringValue get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordCredCopyWith<ResetPasswordCred> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordCredCopyWith<$Res> {
  factory $ResetPasswordCredCopyWith(
          ResetPasswordCred value, $Res Function(ResetPasswordCred) then) =
      _$ResetPasswordCredCopyWithImpl<$Res, ResetPasswordCred>;
  @useResult
  $Res call({Username username, StringValue token});
}

/// @nodoc
class _$ResetPasswordCredCopyWithImpl<$Res, $Val extends ResetPasswordCred>
    implements $ResetPasswordCredCopyWith<$Res> {
  _$ResetPasswordCredCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordCredImplCopyWith<$Res>
    implements $ResetPasswordCredCopyWith<$Res> {
  factory _$$ResetPasswordCredImplCopyWith(_$ResetPasswordCredImpl value,
          $Res Function(_$ResetPasswordCredImpl) then) =
      __$$ResetPasswordCredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Username username, StringValue token});
}

/// @nodoc
class __$$ResetPasswordCredImplCopyWithImpl<$Res>
    extends _$ResetPasswordCredCopyWithImpl<$Res, _$ResetPasswordCredImpl>
    implements _$$ResetPasswordCredImplCopyWith<$Res> {
  __$$ResetPasswordCredImplCopyWithImpl(_$ResetPasswordCredImpl _value,
      $Res Function(_$ResetPasswordCredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? token = null,
  }) {
    return _then(_$ResetPasswordCredImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$ResetPasswordCredImpl extends _ResetPasswordCred {
  const _$ResetPasswordCredImpl({required this.username, required this.token})
      : super._();

  @override
  final Username username;
  @override
  final StringValue token;

  @override
  String toString() {
    return 'ResetPasswordCred(username: $username, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordCredImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordCredImplCopyWith<_$ResetPasswordCredImpl> get copyWith =>
      __$$ResetPasswordCredImplCopyWithImpl<_$ResetPasswordCredImpl>(
          this, _$identity);
}

abstract class _ResetPasswordCred extends ResetPasswordCred {
  const factory _ResetPasswordCred(
      {required final Username username,
      required final StringValue token}) = _$ResetPasswordCredImpl;
  const _ResetPasswordCred._() : super._();

  @override
  Username get username;
  @override
  StringValue get token;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordCredImplCopyWith<_$ResetPasswordCredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
