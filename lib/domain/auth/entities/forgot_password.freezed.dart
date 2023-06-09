// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPassword {
  bool get requestResetPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordCopyWith<ForgotPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordCopyWith<$Res> {
  factory $ForgotPasswordCopyWith(
          ForgotPassword value, $Res Function(ForgotPassword) then) =
      _$ForgotPasswordCopyWithImpl<$Res, ForgotPassword>;
  @useResult
  $Res call({bool requestResetPassword});
}

/// @nodoc
class _$ForgotPasswordCopyWithImpl<$Res, $Val extends ForgotPassword>
    implements $ForgotPasswordCopyWith<$Res> {
  _$ForgotPasswordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestResetPassword = null,
  }) {
    return _then(_value.copyWith(
      requestResetPassword: null == requestResetPassword
          ? _value.requestResetPassword
          : requestResetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordCopyWith<$Res>
    implements $ForgotPasswordCopyWith<$Res> {
  factory _$$_ForgotPasswordCopyWith(
          _$_ForgotPassword value, $Res Function(_$_ForgotPassword) then) =
      __$$_ForgotPasswordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool requestResetPassword});
}

/// @nodoc
class __$$_ForgotPasswordCopyWithImpl<$Res>
    extends _$ForgotPasswordCopyWithImpl<$Res, _$_ForgotPassword>
    implements _$$_ForgotPasswordCopyWith<$Res> {
  __$$_ForgotPasswordCopyWithImpl(
      _$_ForgotPassword _value, $Res Function(_$_ForgotPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestResetPassword = null,
  }) {
    return _then(_$_ForgotPassword(
      requestResetPassword: null == requestResetPassword
          ? _value.requestResetPassword
          : requestResetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ForgotPassword implements _ForgotPassword {
  _$_ForgotPassword({required this.requestResetPassword});

  @override
  final bool requestResetPassword;

  @override
  String toString() {
    return 'ForgotPassword(requestResetPassword: $requestResetPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPassword &&
            (identical(other.requestResetPassword, requestResetPassword) ||
                other.requestResetPassword == requestResetPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestResetPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordCopyWith<_$_ForgotPassword> get copyWith =>
      __$$_ForgotPasswordCopyWithImpl<_$_ForgotPassword>(this, _$identity);
}

abstract class _ForgotPassword implements ForgotPassword {
  factory _ForgotPassword({required final bool requestResetPassword}) =
      _$_ForgotPassword;

  @override
  bool get requestResetPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordCopyWith<_$_ForgotPassword> get copyWith =>
      throw _privateConstructorUsedError;
}
