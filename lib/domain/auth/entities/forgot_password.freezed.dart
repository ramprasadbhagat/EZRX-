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
  bool get success => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

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
  $Res call({bool success, String email});
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
    Object? success = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({bool success, String email});
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
    Object? success = null,
    Object? email = null,
  }) {
    return _then(_$_ForgotPassword(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForgotPassword extends _ForgotPassword {
  _$_ForgotPassword({required this.success, required this.email}) : super._();

  @override
  final bool success;
  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPassword(success: $success, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPassword &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordCopyWith<_$_ForgotPassword> get copyWith =>
      __$$_ForgotPasswordCopyWithImpl<_$_ForgotPassword>(this, _$identity);
}

abstract class _ForgotPassword extends ForgotPassword {
  factory _ForgotPassword(
      {required final bool success,
      required final String email}) = _$_ForgotPassword;
  _ForgotPassword._() : super._();

  @override
  bool get success;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordCopyWith<_$_ForgotPassword> get copyWith =>
      throw _privateConstructorUsedError;
}
