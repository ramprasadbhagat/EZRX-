// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(
            PasswordFieldType fieldType, String newValue, User user)
        onTextChange,
    required TResult Function(User user) resetPasswordPressed,
    required TResult Function() onRestart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult? Function(User user)? resetPasswordPressed,
    TResult? Function()? onRestart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult Function(User user)? resetPasswordPressed,
    TResult Function()? onRestart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(_OnRestart value) onRestart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult? Function(_OnRestart value)? onRestart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(_OnRestart value)? onRestart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordEventCopyWith<$Res> {
  factory $ResetPasswordEventCopyWith(
          ResetPasswordEvent value, $Res Function(ResetPasswordEvent) then) =
      _$ResetPasswordEventCopyWithImpl<$Res, ResetPasswordEvent>;
}

/// @nodoc
class _$ResetPasswordEventCopyWithImpl<$Res, $Val extends ResetPasswordEvent>
    implements $ResetPasswordEventCopyWith<$Res> {
  _$ResetPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PasswordVisibilityCopyWith<$Res> {
  factory _$$_PasswordVisibilityCopyWith(_$_PasswordVisibility value,
          $Res Function(_$_PasswordVisibility) then) =
      __$$_PasswordVisibilityCopyWithImpl<$Res>;
  @useResult
  $Res call({PasswordFieldType fieldType, bool toggleValue});
}

/// @nodoc
class __$$_PasswordVisibilityCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$_PasswordVisibility>
    implements _$$_PasswordVisibilityCopyWith<$Res> {
  __$$_PasswordVisibilityCopyWithImpl(
      _$_PasswordVisibility _value, $Res Function(_$_PasswordVisibility) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldType = null,
    Object? toggleValue = null,
  }) {
    return _then(_$_PasswordVisibility(
      null == fieldType
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as PasswordFieldType,
      null == toggleValue
          ? _value.toggleValue
          : toggleValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PasswordVisibility implements _PasswordVisibility {
  const _$_PasswordVisibility(this.fieldType, this.toggleValue);

  @override
  final PasswordFieldType fieldType;
  @override
  final bool toggleValue;

  @override
  String toString() {
    return 'ResetPasswordEvent.togglePasswordVisibility(fieldType: $fieldType, toggleValue: $toggleValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordVisibility &&
            (identical(other.fieldType, fieldType) ||
                other.fieldType == fieldType) &&
            (identical(other.toggleValue, toggleValue) ||
                other.toggleValue == toggleValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fieldType, toggleValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordVisibilityCopyWith<_$_PasswordVisibility> get copyWith =>
      __$$_PasswordVisibilityCopyWithImpl<_$_PasswordVisibility>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(
            PasswordFieldType fieldType, String newValue, User user)
        onTextChange,
    required TResult Function(User user) resetPasswordPressed,
    required TResult Function() onRestart,
  }) {
    return togglePasswordVisibility(fieldType, toggleValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult? Function(User user)? resetPasswordPressed,
    TResult? Function()? onRestart,
  }) {
    return togglePasswordVisibility?.call(fieldType, toggleValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult Function(User user)? resetPasswordPressed,
    TResult Function()? onRestart,
    required TResult orElse(),
  }) {
    if (togglePasswordVisibility != null) {
      return togglePasswordVisibility(fieldType, toggleValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(_OnRestart value) onRestart,
  }) {
    return togglePasswordVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult? Function(_OnRestart value)? onRestart,
  }) {
    return togglePasswordVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(_OnRestart value)? onRestart,
    required TResult orElse(),
  }) {
    if (togglePasswordVisibility != null) {
      return togglePasswordVisibility(this);
    }
    return orElse();
  }
}

abstract class _PasswordVisibility implements ResetPasswordEvent {
  const factory _PasswordVisibility(
          final PasswordFieldType fieldType, final bool toggleValue) =
      _$_PasswordVisibility;

  PasswordFieldType get fieldType;
  bool get toggleValue;
  @JsonKey(ignore: true)
  _$$_PasswordVisibilityCopyWith<_$_PasswordVisibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordTextOnChangeCopyWith<$Res> {
  factory _$$_PasswordTextOnChangeCopyWith(_$_PasswordTextOnChange value,
          $Res Function(_$_PasswordTextOnChange) then) =
      __$$_PasswordTextOnChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({PasswordFieldType fieldType, String newValue, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_PasswordTextOnChangeCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$_PasswordTextOnChange>
    implements _$$_PasswordTextOnChangeCopyWith<$Res> {
  __$$_PasswordTextOnChangeCopyWithImpl(_$_PasswordTextOnChange _value,
      $Res Function(_$_PasswordTextOnChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldType = null,
    Object? newValue = null,
    Object? user = null,
  }) {
    return _then(_$_PasswordTextOnChange(
      null == fieldType
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as PasswordFieldType,
      null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_PasswordTextOnChange implements _PasswordTextOnChange {
  const _$_PasswordTextOnChange(this.fieldType, this.newValue, this.user);

  @override
  final PasswordFieldType fieldType;
  @override
  final String newValue;
  @override
  final User user;

  @override
  String toString() {
    return 'ResetPasswordEvent.onTextChange(fieldType: $fieldType, newValue: $newValue, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordTextOnChange &&
            (identical(other.fieldType, fieldType) ||
                other.fieldType == fieldType) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fieldType, newValue, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordTextOnChangeCopyWith<_$_PasswordTextOnChange> get copyWith =>
      __$$_PasswordTextOnChangeCopyWithImpl<_$_PasswordTextOnChange>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(
            PasswordFieldType fieldType, String newValue, User user)
        onTextChange,
    required TResult Function(User user) resetPasswordPressed,
    required TResult Function() onRestart,
  }) {
    return onTextChange(fieldType, newValue, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult? Function(User user)? resetPasswordPressed,
    TResult? Function()? onRestart,
  }) {
    return onTextChange?.call(fieldType, newValue, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult Function(User user)? resetPasswordPressed,
    TResult Function()? onRestart,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(fieldType, newValue, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(_OnRestart value) onRestart,
  }) {
    return onTextChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult? Function(_OnRestart value)? onRestart,
  }) {
    return onTextChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(_OnRestart value)? onRestart,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(this);
    }
    return orElse();
  }
}

abstract class _PasswordTextOnChange implements ResetPasswordEvent {
  const factory _PasswordTextOnChange(final PasswordFieldType fieldType,
      final String newValue, final User user) = _$_PasswordTextOnChange;

  PasswordFieldType get fieldType;
  String get newValue;
  User get user;
  @JsonKey(ignore: true)
  _$$_PasswordTextOnChangeCopyWith<_$_PasswordTextOnChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetPasswordPressedCopyWith<$Res> {
  factory _$$_ResetPasswordPressedCopyWith(_$_ResetPasswordPressed value,
          $Res Function(_$_ResetPasswordPressed) then) =
      __$$_ResetPasswordPressedCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_ResetPasswordPressedCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$_ResetPasswordPressed>
    implements _$$_ResetPasswordPressedCopyWith<$Res> {
  __$$_ResetPasswordPressedCopyWithImpl(_$_ResetPasswordPressed _value,
      $Res Function(_$_ResetPasswordPressed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_ResetPasswordPressed(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_ResetPasswordPressed implements _ResetPasswordPressed {
  const _$_ResetPasswordPressed({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'ResetPasswordEvent.resetPasswordPressed(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordPressed &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordPressedCopyWith<_$_ResetPasswordPressed> get copyWith =>
      __$$_ResetPasswordPressedCopyWithImpl<_$_ResetPasswordPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(
            PasswordFieldType fieldType, String newValue, User user)
        onTextChange,
    required TResult Function(User user) resetPasswordPressed,
    required TResult Function() onRestart,
  }) {
    return resetPasswordPressed(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult? Function(User user)? resetPasswordPressed,
    TResult? Function()? onRestart,
  }) {
    return resetPasswordPressed?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult Function(User user)? resetPasswordPressed,
    TResult Function()? onRestart,
    required TResult orElse(),
  }) {
    if (resetPasswordPressed != null) {
      return resetPasswordPressed(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(_OnRestart value) onRestart,
  }) {
    return resetPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult? Function(_OnRestart value)? onRestart,
  }) {
    return resetPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(_OnRestart value)? onRestart,
    required TResult orElse(),
  }) {
    if (resetPasswordPressed != null) {
      return resetPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class _ResetPasswordPressed implements ResetPasswordEvent {
  const factory _ResetPasswordPressed({required final User user}) =
      _$_ResetPasswordPressed;

  User get user;
  @JsonKey(ignore: true)
  _$$_ResetPasswordPressedCopyWith<_$_ResetPasswordPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnRestartCopyWith<$Res> {
  factory _$$_OnRestartCopyWith(
          _$_OnRestart value, $Res Function(_$_OnRestart) then) =
      __$$_OnRestartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnRestartCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$_OnRestart>
    implements _$$_OnRestartCopyWith<$Res> {
  __$$_OnRestartCopyWithImpl(
      _$_OnRestart _value, $Res Function(_$_OnRestart) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OnRestart implements _OnRestart {
  const _$_OnRestart();

  @override
  String toString() {
    return 'ResetPasswordEvent.onRestart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnRestart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(
            PasswordFieldType fieldType, String newValue, User user)
        onTextChange,
    required TResult Function(User user) resetPasswordPressed,
    required TResult Function() onRestart,
  }) {
    return onRestart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult? Function(User user)? resetPasswordPressed,
    TResult? Function()? onRestart,
  }) {
    return onRestart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult Function(User user)? resetPasswordPressed,
    TResult Function()? onRestart,
    required TResult orElse(),
  }) {
    if (onRestart != null) {
      return onRestart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(_OnRestart value) onRestart,
  }) {
    return onRestart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult? Function(_OnRestart value)? onRestart,
  }) {
    return onRestart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(_OnRestart value)? onRestart,
    required TResult orElse(),
  }) {
    if (onRestart != null) {
      return onRestart(this);
    }
    return orElse();
  }
}

abstract class _OnRestart implements ResetPasswordEvent {
  const factory _OnRestart() = _$_OnRestart;
}

/// @nodoc
mixin _$ResetPasswordState {
  bool get isOldPasswordObscure => throw _privateConstructorUsedError;
  bool get isNewPasswordObscure => throw _privateConstructorUsedError;
  bool get isConfirmPasswordObscure => throw _privateConstructorUsedError;
  Password get oldPassword => throw _privateConstructorUsedError;
  Password get newPassword => throw _privateConstructorUsedError;
  Password get confirmPassword => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, ResetPassword>>
      get passwordResetFailureOrSuccessOption =>
          throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res, ResetPasswordState>;
  @useResult
  $Res call(
      {bool isOldPasswordObscure,
      bool isNewPasswordObscure,
      bool isConfirmPasswordObscure,
      Password oldPassword,
      Password newPassword,
      Password confirmPassword,
      bool isSubmitting,
      Option<Either<ApiFailure, ResetPassword>>
          passwordResetFailureOrSuccessOption,
      bool showErrorMessages});
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res, $Val extends ResetPasswordState>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOldPasswordObscure = null,
    Object? isNewPasswordObscure = null,
    Object? isConfirmPasswordObscure = null,
    Object? oldPassword = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
    Object? isSubmitting = null,
    Object? passwordResetFailureOrSuccessOption = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_value.copyWith(
      isOldPasswordObscure: null == isOldPasswordObscure
          ? _value.isOldPasswordObscure
          : isOldPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewPasswordObscure: null == isNewPasswordObscure
          ? _value.isNewPasswordObscure
          : isNewPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordObscure: null == isConfirmPasswordObscure
          ? _value.isConfirmPasswordObscure
          : isConfirmPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordResetFailureOrSuccessOption: null ==
              passwordResetFailureOrSuccessOption
          ? _value.passwordResetFailureOrSuccessOption
          : passwordResetFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, ResetPassword>>,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPasswordCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$_ResetPasswordCopyWith(
          _$_ResetPassword value, $Res Function(_$_ResetPassword) then) =
      __$$_ResetPasswordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isOldPasswordObscure,
      bool isNewPasswordObscure,
      bool isConfirmPasswordObscure,
      Password oldPassword,
      Password newPassword,
      Password confirmPassword,
      bool isSubmitting,
      Option<Either<ApiFailure, ResetPassword>>
          passwordResetFailureOrSuccessOption,
      bool showErrorMessages});
}

/// @nodoc
class __$$_ResetPasswordCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$_ResetPassword>
    implements _$$_ResetPasswordCopyWith<$Res> {
  __$$_ResetPasswordCopyWithImpl(
      _$_ResetPassword _value, $Res Function(_$_ResetPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOldPasswordObscure = null,
    Object? isNewPasswordObscure = null,
    Object? isConfirmPasswordObscure = null,
    Object? oldPassword = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
    Object? isSubmitting = null,
    Object? passwordResetFailureOrSuccessOption = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_$_ResetPassword(
      isOldPasswordObscure: null == isOldPasswordObscure
          ? _value.isOldPasswordObscure
          : isOldPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewPasswordObscure: null == isNewPasswordObscure
          ? _value.isNewPasswordObscure
          : isNewPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordObscure: null == isConfirmPasswordObscure
          ? _value.isConfirmPasswordObscure
          : isConfirmPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordResetFailureOrSuccessOption: null ==
              passwordResetFailureOrSuccessOption
          ? _value.passwordResetFailureOrSuccessOption
          : passwordResetFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, ResetPassword>>,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ResetPassword extends _ResetPassword {
  const _$_ResetPassword(
      {required this.isOldPasswordObscure,
      required this.isNewPasswordObscure,
      required this.isConfirmPasswordObscure,
      required this.oldPassword,
      required this.newPassword,
      required this.confirmPassword,
      required this.isSubmitting,
      required this.passwordResetFailureOrSuccessOption,
      required this.showErrorMessages})
      : super._();

  @override
  final bool isOldPasswordObscure;
  @override
  final bool isNewPasswordObscure;
  @override
  final bool isConfirmPasswordObscure;
  @override
  final Password oldPassword;
  @override
  final Password newPassword;
  @override
  final Password confirmPassword;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ApiFailure, ResetPassword>>
      passwordResetFailureOrSuccessOption;
  @override
  final bool showErrorMessages;

  @override
  String toString() {
    return 'ResetPasswordState(isOldPasswordObscure: $isOldPasswordObscure, isNewPasswordObscure: $isNewPasswordObscure, isConfirmPasswordObscure: $isConfirmPasswordObscure, oldPassword: $oldPassword, newPassword: $newPassword, confirmPassword: $confirmPassword, isSubmitting: $isSubmitting, passwordResetFailureOrSuccessOption: $passwordResetFailureOrSuccessOption, showErrorMessages: $showErrorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPassword &&
            (identical(other.isOldPasswordObscure, isOldPasswordObscure) ||
                other.isOldPasswordObscure == isOldPasswordObscure) &&
            (identical(other.isNewPasswordObscure, isNewPasswordObscure) ||
                other.isNewPasswordObscure == isNewPasswordObscure) &&
            (identical(
                    other.isConfirmPasswordObscure, isConfirmPasswordObscure) ||
                other.isConfirmPasswordObscure == isConfirmPasswordObscure) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.passwordResetFailureOrSuccessOption,
                    passwordResetFailureOrSuccessOption) ||
                other.passwordResetFailureOrSuccessOption ==
                    passwordResetFailureOrSuccessOption) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isOldPasswordObscure,
      isNewPasswordObscure,
      isConfirmPasswordObscure,
      oldPassword,
      newPassword,
      confirmPassword,
      isSubmitting,
      passwordResetFailureOrSuccessOption,
      showErrorMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordCopyWith<_$_ResetPassword> get copyWith =>
      __$$_ResetPasswordCopyWithImpl<_$_ResetPassword>(this, _$identity);
}

abstract class _ResetPassword extends ResetPasswordState {
  const factory _ResetPassword(
      {required final bool isOldPasswordObscure,
      required final bool isNewPasswordObscure,
      required final bool isConfirmPasswordObscure,
      required final Password oldPassword,
      required final Password newPassword,
      required final Password confirmPassword,
      required final bool isSubmitting,
      required final Option<Either<ApiFailure, ResetPassword>>
          passwordResetFailureOrSuccessOption,
      required final bool showErrorMessages}) = _$_ResetPassword;
  const _ResetPassword._() : super._();

  @override
  bool get isOldPasswordObscure;
  @override
  bool get isNewPasswordObscure;
  @override
  bool get isConfirmPasswordObscure;
  @override
  Password get oldPassword;
  @override
  Password get newPassword;
  @override
  Password get confirmPassword;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ApiFailure, ResetPassword>>
      get passwordResetFailureOrSuccessOption;
  @override
  bool get showErrorMessages;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordCopyWith<_$_ResetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}
