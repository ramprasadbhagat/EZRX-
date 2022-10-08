// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() resetPasswordPressed,
    required TResult Function() onRestart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? resetPasswordPressed,
    TResult Function()? onRestart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? resetPasswordPressed,
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
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(_OnRestart value)? onRestart,
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
      _$ResetPasswordEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResetPasswordEventCopyWithImpl<$Res>
    implements $ResetPasswordEventCopyWith<$Res> {
  _$ResetPasswordEventCopyWithImpl(this._value, this._then);

  final ResetPasswordEvent _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordEvent) _then;
}

/// @nodoc
abstract class _$$_PasswordVisibilityCopyWith<$Res> {
  factory _$$_PasswordVisibilityCopyWith(_$_PasswordVisibility value,
          $Res Function(_$_PasswordVisibility) then) =
      __$$_PasswordVisibilityCopyWithImpl<$Res>;
  $Res call({PasswordFieldType fieldType, bool toggleValue});
}

/// @nodoc
class __$$_PasswordVisibilityCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res>
    implements _$$_PasswordVisibilityCopyWith<$Res> {
  __$$_PasswordVisibilityCopyWithImpl(
      _$_PasswordVisibility _value, $Res Function(_$_PasswordVisibility) _then)
      : super(_value, (v) => _then(v as _$_PasswordVisibility));

  @override
  _$_PasswordVisibility get _value => super._value as _$_PasswordVisibility;

  @override
  $Res call({
    Object? fieldType = freezed,
    Object? toggleValue = freezed,
  }) {
    return _then(_$_PasswordVisibility(
      fieldType == freezed
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as PasswordFieldType,
      toggleValue == freezed
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
            const DeepCollectionEquality().equals(other.fieldType, fieldType) &&
            const DeepCollectionEquality()
                .equals(other.toggleValue, toggleValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fieldType),
      const DeepCollectionEquality().hash(toggleValue));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordVisibilityCopyWith<_$_PasswordVisibility> get copyWith =>
      __$$_PasswordVisibilityCopyWithImpl<_$_PasswordVisibility>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() resetPasswordPressed,
    required TResult Function() onRestart,
  }) {
    return togglePasswordVisibility(fieldType, toggleValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? resetPasswordPressed,
    TResult Function()? onRestart,
  }) {
    return togglePasswordVisibility?.call(fieldType, toggleValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? resetPasswordPressed,
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
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(_OnRestart value)? onRestart,
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
  $Res call({PasswordFieldType fieldType, String newValue});
}

/// @nodoc
class __$$_PasswordTextOnChangeCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res>
    implements _$$_PasswordTextOnChangeCopyWith<$Res> {
  __$$_PasswordTextOnChangeCopyWithImpl(_$_PasswordTextOnChange _value,
      $Res Function(_$_PasswordTextOnChange) _then)
      : super(_value, (v) => _then(v as _$_PasswordTextOnChange));

  @override
  _$_PasswordTextOnChange get _value => super._value as _$_PasswordTextOnChange;

  @override
  $Res call({
    Object? fieldType = freezed,
    Object? newValue = freezed,
  }) {
    return _then(_$_PasswordTextOnChange(
      fieldType == freezed
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as PasswordFieldType,
      newValue == freezed
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordTextOnChange implements _PasswordTextOnChange {
  const _$_PasswordTextOnChange(this.fieldType, this.newValue);

  @override
  final PasswordFieldType fieldType;
  @override
  final String newValue;

  @override
  String toString() {
    return 'ResetPasswordEvent.onTextChange(fieldType: $fieldType, newValue: $newValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordTextOnChange &&
            const DeepCollectionEquality().equals(other.fieldType, fieldType) &&
            const DeepCollectionEquality().equals(other.newValue, newValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fieldType),
      const DeepCollectionEquality().hash(newValue));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordTextOnChangeCopyWith<_$_PasswordTextOnChange> get copyWith =>
      __$$_PasswordTextOnChangeCopyWithImpl<_$_PasswordTextOnChange>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() resetPasswordPressed,
    required TResult Function() onRestart,
  }) {
    return onTextChange(fieldType, newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? resetPasswordPressed,
    TResult Function()? onRestart,
  }) {
    return onTextChange?.call(fieldType, newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? resetPasswordPressed,
    TResult Function()? onRestart,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(fieldType, newValue);
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
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(_OnRestart value)? onRestart,
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
  const factory _PasswordTextOnChange(
          final PasswordFieldType fieldType, final String newValue) =
      _$_PasswordTextOnChange;

  PasswordFieldType get fieldType;
  String get newValue;
  @JsonKey(ignore: true)
  _$$_PasswordTextOnChangeCopyWith<_$_PasswordTextOnChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetPasswordPressedCopyWith<$Res> {
  factory _$$_ResetPasswordPressedCopyWith(_$_ResetPasswordPressed value,
          $Res Function(_$_ResetPasswordPressed) then) =
      __$$_ResetPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetPasswordPressedCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res>
    implements _$$_ResetPasswordPressedCopyWith<$Res> {
  __$$_ResetPasswordPressedCopyWithImpl(_$_ResetPasswordPressed _value,
      $Res Function(_$_ResetPasswordPressed) _then)
      : super(_value, (v) => _then(v as _$_ResetPasswordPressed));

  @override
  _$_ResetPasswordPressed get _value => super._value as _$_ResetPasswordPressed;
}

/// @nodoc

class _$_ResetPasswordPressed implements _ResetPasswordPressed {
  const _$_ResetPasswordPressed();

  @override
  String toString() {
    return 'ResetPasswordEvent.resetPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResetPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() resetPasswordPressed,
    required TResult Function() onRestart,
  }) {
    return resetPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? resetPasswordPressed,
    TResult Function()? onRestart,
  }) {
    return resetPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? resetPasswordPressed,
    TResult Function()? onRestart,
    required TResult orElse(),
  }) {
    if (resetPasswordPressed != null) {
      return resetPasswordPressed();
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
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(_OnRestart value)? onRestart,
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
  const factory _ResetPasswordPressed() = _$_ResetPasswordPressed;
}

/// @nodoc
abstract class _$$_OnRestartCopyWith<$Res> {
  factory _$$_OnRestartCopyWith(
          _$_OnRestart value, $Res Function(_$_OnRestart) then) =
      __$$_OnRestartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnRestartCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res>
    implements _$$_OnRestartCopyWith<$Res> {
  __$$_OnRestartCopyWithImpl(
      _$_OnRestart _value, $Res Function(_$_OnRestart) _then)
      : super(_value, (v) => _then(v as _$_OnRestart));

  @override
  _$_OnRestart get _value => super._value as _$_OnRestart;
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
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() resetPasswordPressed,
    required TResult Function() onRestart,
  }) {
    return onRestart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? resetPasswordPressed,
    TResult Function()? onRestart,
  }) {
    return onRestart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? resetPasswordPressed,
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
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(_OnRestart value)? onRestart,
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
      _$ResetPasswordStateCopyWithImpl<$Res>;
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
class _$ResetPasswordStateCopyWithImpl<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  final ResetPasswordState _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordState) _then;

  @override
  $Res call({
    Object? isOldPasswordObscure = freezed,
    Object? isNewPasswordObscure = freezed,
    Object? isConfirmPasswordObscure = freezed,
    Object? oldPassword = freezed,
    Object? newPassword = freezed,
    Object? confirmPassword = freezed,
    Object? isSubmitting = freezed,
    Object? passwordResetFailureOrSuccessOption = freezed,
    Object? showErrorMessages = freezed,
  }) {
    return _then(_value.copyWith(
      isOldPasswordObscure: isOldPasswordObscure == freezed
          ? _value.isOldPasswordObscure
          : isOldPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewPasswordObscure: isNewPasswordObscure == freezed
          ? _value.isNewPasswordObscure
          : isNewPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordObscure: isConfirmPasswordObscure == freezed
          ? _value.isConfirmPasswordObscure
          : isConfirmPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordResetFailureOrSuccessOption: passwordResetFailureOrSuccessOption ==
              freezed
          ? _value.passwordResetFailureOrSuccessOption
          : passwordResetFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, ResetPassword>>,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ResetPasswordCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$_ResetPasswordCopyWith(
          _$_ResetPassword value, $Res Function(_$_ResetPassword) then) =
      __$$_ResetPasswordCopyWithImpl<$Res>;
  @override
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
    extends _$ResetPasswordStateCopyWithImpl<$Res>
    implements _$$_ResetPasswordCopyWith<$Res> {
  __$$_ResetPasswordCopyWithImpl(
      _$_ResetPassword _value, $Res Function(_$_ResetPassword) _then)
      : super(_value, (v) => _then(v as _$_ResetPassword));

  @override
  _$_ResetPassword get _value => super._value as _$_ResetPassword;

  @override
  $Res call({
    Object? isOldPasswordObscure = freezed,
    Object? isNewPasswordObscure = freezed,
    Object? isConfirmPasswordObscure = freezed,
    Object? oldPassword = freezed,
    Object? newPassword = freezed,
    Object? confirmPassword = freezed,
    Object? isSubmitting = freezed,
    Object? passwordResetFailureOrSuccessOption = freezed,
    Object? showErrorMessages = freezed,
  }) {
    return _then(_$_ResetPassword(
      isOldPasswordObscure: isOldPasswordObscure == freezed
          ? _value.isOldPasswordObscure
          : isOldPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewPasswordObscure: isNewPasswordObscure == freezed
          ? _value.isNewPasswordObscure
          : isNewPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordObscure: isConfirmPasswordObscure == freezed
          ? _value.isConfirmPasswordObscure
          : isConfirmPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      oldPassword: oldPassword == freezed
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      newPassword: newPassword == freezed
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordResetFailureOrSuccessOption: passwordResetFailureOrSuccessOption ==
              freezed
          ? _value.passwordResetFailureOrSuccessOption
          : passwordResetFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, ResetPassword>>,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ResetPassword implements _ResetPassword {
  const _$_ResetPassword(
      {required this.isOldPasswordObscure,
      required this.isNewPasswordObscure,
      required this.isConfirmPasswordObscure,
      required this.oldPassword,
      required this.newPassword,
      required this.confirmPassword,
      required this.isSubmitting,
      required this.passwordResetFailureOrSuccessOption,
      required this.showErrorMessages});

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
            const DeepCollectionEquality()
                .equals(other.isOldPasswordObscure, isOldPasswordObscure) &&
            const DeepCollectionEquality()
                .equals(other.isNewPasswordObscure, isNewPasswordObscure) &&
            const DeepCollectionEquality().equals(
                other.isConfirmPasswordObscure, isConfirmPasswordObscure) &&
            const DeepCollectionEquality()
                .equals(other.oldPassword, oldPassword) &&
            const DeepCollectionEquality()
                .equals(other.newPassword, newPassword) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.passwordResetFailureOrSuccessOption,
                passwordResetFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isOldPasswordObscure),
      const DeepCollectionEquality().hash(isNewPasswordObscure),
      const DeepCollectionEquality().hash(isConfirmPasswordObscure),
      const DeepCollectionEquality().hash(oldPassword),
      const DeepCollectionEquality().hash(newPassword),
      const DeepCollectionEquality().hash(confirmPassword),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(passwordResetFailureOrSuccessOption),
      const DeepCollectionEquality().hash(showErrorMessages));

  @JsonKey(ignore: true)
  @override
  _$$_ResetPasswordCopyWith<_$_ResetPassword> get copyWith =>
      __$$_ResetPasswordCopyWithImpl<_$_ResetPassword>(this, _$identity);
}

abstract class _ResetPassword implements ResetPasswordState {
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
