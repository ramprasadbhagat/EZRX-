// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() passwordVisibilityChanged,
    required TResult Function() rememberCheckChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithOktaButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PasswordVisibleChanged value)
        passwordVisibilityChanged,
    required TResult Function(_RememberCheckChanged value) rememberCheckChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithOktaButtonPressed value)
        loginWithOktaButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormEventCopyWith<$Res> {
  factory $LoginFormEventCopyWith(
          LoginFormEvent value, $Res Function(LoginFormEvent) then) =
      _$LoginFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginFormEventCopyWithImpl<$Res>
    implements $LoginFormEventCopyWith<$Res> {
  _$LoginFormEventCopyWithImpl(this._value, this._then);

  final LoginFormEvent _value;
  // ignore: unused_field
  final $Res Function(LoginFormEvent) _then;
}

/// @nodoc
abstract class _$$_UsernameChangedCopyWith<$Res> {
  factory _$$_UsernameChangedCopyWith(
          _$_UsernameChanged value, $Res Function(_$_UsernameChanged) then) =
      __$$_UsernameChangedCopyWithImpl<$Res>;
  $Res call({String usernameStr});
}

/// @nodoc
class __$$_UsernameChangedCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res>
    implements _$$_UsernameChangedCopyWith<$Res> {
  __$$_UsernameChangedCopyWithImpl(
      _$_UsernameChanged _value, $Res Function(_$_UsernameChanged) _then)
      : super(_value, (v) => _then(v as _$_UsernameChanged));

  @override
  _$_UsernameChanged get _value => super._value as _$_UsernameChanged;

  @override
  $Res call({
    Object? usernameStr = freezed,
  }) {
    return _then(_$_UsernameChanged(
      usernameStr == freezed
          ? _value.usernameStr
          : usernameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UsernameChanged implements _UsernameChanged {
  const _$_UsernameChanged(this.usernameStr);

  @override
  final String usernameStr;

  @override
  String toString() {
    return 'LoginFormEvent.usernameChanged(usernameStr: $usernameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsernameChanged &&
            const DeepCollectionEquality()
                .equals(other.usernameStr, usernameStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(usernameStr));

  @JsonKey(ignore: true)
  @override
  _$$_UsernameChangedCopyWith<_$_UsernameChanged> get copyWith =>
      __$$_UsernameChangedCopyWithImpl<_$_UsernameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() passwordVisibilityChanged,
    required TResult Function() rememberCheckChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithOktaButtonPressed,
  }) {
    return usernameChanged(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
  }) {
    return usernameChanged?.call(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(usernameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PasswordVisibleChanged value)
        passwordVisibilityChanged,
    required TResult Function(_RememberCheckChanged value) rememberCheckChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithOktaButtonPressed value)
        loginWithOktaButtonPressed,
  }) {
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
  }) {
    return usernameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class _UsernameChanged implements LoginFormEvent {
  const factory _UsernameChanged(final String usernameStr) = _$_UsernameChanged;

  String get usernameStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_UsernameChangedCopyWith<_$_UsernameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordChangedCopyWith<$Res> {
  factory _$$_PasswordChangedCopyWith(
          _$_PasswordChanged value, $Res Function(_$_PasswordChanged) then) =
      __$$_PasswordChangedCopyWithImpl<$Res>;
  $Res call({String passwordStr});
}

/// @nodoc
class __$$_PasswordChangedCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res>
    implements _$$_PasswordChangedCopyWith<$Res> {
  __$$_PasswordChangedCopyWithImpl(
      _$_PasswordChanged _value, $Res Function(_$_PasswordChanged) _then)
      : super(_value, (v) => _then(v as _$_PasswordChanged));

  @override
  _$_PasswordChanged get _value => super._value as _$_PasswordChanged;

  @override
  $Res call({
    Object? passwordStr = freezed,
  }) {
    return _then(_$_PasswordChanged(
      passwordStr == freezed
          ? _value.passwordStr
          : passwordStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordChanged implements _PasswordChanged {
  const _$_PasswordChanged(this.passwordStr);

  @override
  final String passwordStr;

  @override
  String toString() {
    return 'LoginFormEvent.passwordChanged(passwordStr: $passwordStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordChanged &&
            const DeepCollectionEquality()
                .equals(other.passwordStr, passwordStr));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(passwordStr));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      __$$_PasswordChangedCopyWithImpl<_$_PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() passwordVisibilityChanged,
    required TResult Function() rememberCheckChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithOktaButtonPressed,
  }) {
    return passwordChanged(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
  }) {
    return passwordChanged?.call(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(passwordStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PasswordVisibleChanged value)
        passwordVisibilityChanged,
    required TResult Function(_RememberCheckChanged value) rememberCheckChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithOktaButtonPressed value)
        loginWithOktaButtonPressed,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements LoginFormEvent {
  const factory _PasswordChanged(final String passwordStr) = _$_PasswordChanged;

  String get passwordStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordVisibleChangedCopyWith<$Res> {
  factory _$$_PasswordVisibleChangedCopyWith(_$_PasswordVisibleChanged value,
          $Res Function(_$_PasswordVisibleChanged) then) =
      __$$_PasswordVisibleChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PasswordVisibleChangedCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res>
    implements _$$_PasswordVisibleChangedCopyWith<$Res> {
  __$$_PasswordVisibleChangedCopyWithImpl(_$_PasswordVisibleChanged _value,
      $Res Function(_$_PasswordVisibleChanged) _then)
      : super(_value, (v) => _then(v as _$_PasswordVisibleChanged));

  @override
  _$_PasswordVisibleChanged get _value =>
      super._value as _$_PasswordVisibleChanged;
}

/// @nodoc

class _$_PasswordVisibleChanged implements _PasswordVisibleChanged {
  const _$_PasswordVisibleChanged();

  @override
  String toString() {
    return 'LoginFormEvent.passwordVisibilityChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordVisibleChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() passwordVisibilityChanged,
    required TResult Function() rememberCheckChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithOktaButtonPressed,
  }) {
    return passwordVisibilityChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
  }) {
    return passwordVisibilityChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (passwordVisibilityChanged != null) {
      return passwordVisibilityChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PasswordVisibleChanged value)
        passwordVisibilityChanged,
    required TResult Function(_RememberCheckChanged value) rememberCheckChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithOktaButtonPressed value)
        loginWithOktaButtonPressed,
  }) {
    return passwordVisibilityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
  }) {
    return passwordVisibilityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (passwordVisibilityChanged != null) {
      return passwordVisibilityChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordVisibleChanged implements LoginFormEvent {
  const factory _PasswordVisibleChanged() = _$_PasswordVisibleChanged;
}

/// @nodoc
abstract class _$$_RememberCheckChangedCopyWith<$Res> {
  factory _$$_RememberCheckChangedCopyWith(_$_RememberCheckChanged value,
          $Res Function(_$_RememberCheckChanged) then) =
      __$$_RememberCheckChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RememberCheckChangedCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res>
    implements _$$_RememberCheckChangedCopyWith<$Res> {
  __$$_RememberCheckChangedCopyWithImpl(_$_RememberCheckChanged _value,
      $Res Function(_$_RememberCheckChanged) _then)
      : super(_value, (v) => _then(v as _$_RememberCheckChanged));

  @override
  _$_RememberCheckChanged get _value => super._value as _$_RememberCheckChanged;
}

/// @nodoc

class _$_RememberCheckChanged implements _RememberCheckChanged {
  const _$_RememberCheckChanged();

  @override
  String toString() {
    return 'LoginFormEvent.rememberCheckChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RememberCheckChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() passwordVisibilityChanged,
    required TResult Function() rememberCheckChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithOktaButtonPressed,
  }) {
    return rememberCheckChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
  }) {
    return rememberCheckChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (rememberCheckChanged != null) {
      return rememberCheckChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PasswordVisibleChanged value)
        passwordVisibilityChanged,
    required TResult Function(_RememberCheckChanged value) rememberCheckChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithOktaButtonPressed value)
        loginWithOktaButtonPressed,
  }) {
    return rememberCheckChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
  }) {
    return rememberCheckChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (rememberCheckChanged != null) {
      return rememberCheckChanged(this);
    }
    return orElse();
  }
}

abstract class _RememberCheckChanged implements LoginFormEvent {
  const factory _RememberCheckChanged() = _$_RememberCheckChanged;
}

/// @nodoc
abstract class _$$_LoginWithEmailAndPasswordPressedCopyWith<$Res> {
  factory _$$_LoginWithEmailAndPasswordPressedCopyWith(
          _$_LoginWithEmailAndPasswordPressed value,
          $Res Function(_$_LoginWithEmailAndPasswordPressed) then) =
      __$$_LoginWithEmailAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginWithEmailAndPasswordPressedCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res>
    implements _$$_LoginWithEmailAndPasswordPressedCopyWith<$Res> {
  __$$_LoginWithEmailAndPasswordPressedCopyWithImpl(
      _$_LoginWithEmailAndPasswordPressed _value,
      $Res Function(_$_LoginWithEmailAndPasswordPressed) _then)
      : super(_value, (v) => _then(v as _$_LoginWithEmailAndPasswordPressed));

  @override
  _$_LoginWithEmailAndPasswordPressed get _value =>
      super._value as _$_LoginWithEmailAndPasswordPressed;
}

/// @nodoc

class _$_LoginWithEmailAndPasswordPressed
    implements _LoginWithEmailAndPasswordPressed {
  const _$_LoginWithEmailAndPasswordPressed();

  @override
  String toString() {
    return 'LoginFormEvent.loginWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginWithEmailAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() passwordVisibilityChanged,
    required TResult Function() rememberCheckChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithOktaButtonPressed,
  }) {
    return loginWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
  }) {
    return loginWithEmailAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (loginWithEmailAndPasswordPressed != null) {
      return loginWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PasswordVisibleChanged value)
        passwordVisibilityChanged,
    required TResult Function(_RememberCheckChanged value) rememberCheckChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithOktaButtonPressed value)
        loginWithOktaButtonPressed,
  }) {
    return loginWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
  }) {
    return loginWithEmailAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (loginWithEmailAndPasswordPressed != null) {
      return loginWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class _LoginWithEmailAndPasswordPressed implements LoginFormEvent {
  const factory _LoginWithEmailAndPasswordPressed() =
      _$_LoginWithEmailAndPasswordPressed;
}

/// @nodoc
abstract class _$$_LoginWithOktaButtonPressedCopyWith<$Res> {
  factory _$$_LoginWithOktaButtonPressedCopyWith(
          _$_LoginWithOktaButtonPressed value,
          $Res Function(_$_LoginWithOktaButtonPressed) then) =
      __$$_LoginWithOktaButtonPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginWithOktaButtonPressedCopyWithImpl<$Res>
    extends _$LoginFormEventCopyWithImpl<$Res>
    implements _$$_LoginWithOktaButtonPressedCopyWith<$Res> {
  __$$_LoginWithOktaButtonPressedCopyWithImpl(
      _$_LoginWithOktaButtonPressed _value,
      $Res Function(_$_LoginWithOktaButtonPressed) _then)
      : super(_value, (v) => _then(v as _$_LoginWithOktaButtonPressed));

  @override
  _$_LoginWithOktaButtonPressed get _value =>
      super._value as _$_LoginWithOktaButtonPressed;
}

/// @nodoc

class _$_LoginWithOktaButtonPressed implements _LoginWithOktaButtonPressed {
  const _$_LoginWithOktaButtonPressed();

  @override
  String toString() {
    return 'LoginFormEvent.loginWithOktaButtonPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginWithOktaButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() passwordVisibilityChanged,
    required TResult Function() rememberCheckChanged,
    required TResult Function() loginWithEmailAndPasswordPressed,
    required TResult Function() loginWithOktaButtonPressed,
  }) {
    return loginWithOktaButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
  }) {
    return loginWithOktaButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? passwordVisibilityChanged,
    TResult Function()? rememberCheckChanged,
    TResult Function()? loginWithEmailAndPasswordPressed,
    TResult Function()? loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (loginWithOktaButtonPressed != null) {
      return loginWithOktaButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_PasswordVisibleChanged value)
        passwordVisibilityChanged,
    required TResult Function(_RememberCheckChanged value) rememberCheckChanged,
    required TResult Function(_LoginWithEmailAndPasswordPressed value)
        loginWithEmailAndPasswordPressed,
    required TResult Function(_LoginWithOktaButtonPressed value)
        loginWithOktaButtonPressed,
  }) {
    return loginWithOktaButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
  }) {
    return loginWithOktaButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_PasswordVisibleChanged value)? passwordVisibilityChanged,
    TResult Function(_RememberCheckChanged value)? rememberCheckChanged,
    TResult Function(_LoginWithEmailAndPasswordPressed value)?
        loginWithEmailAndPasswordPressed,
    TResult Function(_LoginWithOktaButtonPressed value)?
        loginWithOktaButtonPressed,
    required TResult orElse(),
  }) {
    if (loginWithOktaButtonPressed != null) {
      return loginWithOktaButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _LoginWithOktaButtonPressed implements LoginFormEvent {
  const factory _LoginWithOktaButtonPressed() = _$_LoginWithOktaButtonPressed;
}

/// @nodoc
mixin _$LoginFormState {
  Username get username => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  bool get passwordVisible => throw _privateConstructorUsedError;
  bool get rememberPassword => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, LoginV2>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormStateCopyWith<LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormStateCopyWith<$Res> {
  factory $LoginFormStateCopyWith(
          LoginFormState value, $Res Function(LoginFormState) then) =
      _$LoginFormStateCopyWithImpl<$Res>;
  $Res call(
      {Username username,
      Password password,
      bool passwordVisible,
      bool rememberPassword,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, LoginV2>> authFailureOrSuccessOption});
}

/// @nodoc
class _$LoginFormStateCopyWithImpl<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._value, this._then);

  final LoginFormState _value;
  // ignore: unused_field
  final $Res Function(LoginFormState) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
    Object? passwordVisible = freezed,
    Object? rememberPassword = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordVisible: passwordVisible == freezed
          ? _value.passwordVisible
          : passwordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      rememberPassword: rememberPassword == freezed
          ? _value.rememberPassword
          : rememberPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, LoginV2>>,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginFormStateCopyWith<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  factory _$$_LoginFormStateCopyWith(
          _$_LoginFormState value, $Res Function(_$_LoginFormState) then) =
      __$$_LoginFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Username username,
      Password password,
      bool passwordVisible,
      bool rememberPassword,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, LoginV2>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_LoginFormStateCopyWithImpl<$Res>
    extends _$LoginFormStateCopyWithImpl<$Res>
    implements _$$_LoginFormStateCopyWith<$Res> {
  __$$_LoginFormStateCopyWithImpl(
      _$_LoginFormState _value, $Res Function(_$_LoginFormState) _then)
      : super(_value, (v) => _then(v as _$_LoginFormState));

  @override
  _$_LoginFormState get _value => super._value as _$_LoginFormState;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
    Object? passwordVisible = freezed,
    Object? rememberPassword = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_LoginFormState(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordVisible: passwordVisible == freezed
          ? _value.passwordVisible
          : passwordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      rememberPassword: rememberPassword == freezed
          ? _value.rememberPassword
          : rememberPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, LoginV2>>,
    ));
  }
}

/// @nodoc

class _$_LoginFormState implements _LoginFormState {
  const _$_LoginFormState(
      {required this.username,
      required this.password,
      required this.passwordVisible,
      required this.rememberPassword,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Username username;
  @override
  final Password password;
  @override
  final bool passwordVisible;
  @override
  final bool rememberPassword;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, LoginV2>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'LoginFormState(username: $username, password: $password, passwordVisible: $passwordVisible, rememberPassword: $rememberPassword, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginFormState &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.passwordVisible, passwordVisible) &&
            const DeepCollectionEquality()
                .equals(other.rememberPassword, rememberPassword) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(passwordVisible),
      const DeepCollectionEquality().hash(rememberPassword),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_LoginFormStateCopyWith<_$_LoginFormState> get copyWith =>
      __$$_LoginFormStateCopyWithImpl<_$_LoginFormState>(this, _$identity);
}

abstract class _LoginFormState implements LoginFormState {
  const factory _LoginFormState(
      {required final Username username,
      required final Password password,
      required final bool passwordVisible,
      required final bool rememberPassword,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, LoginV2>>
          authFailureOrSuccessOption}) = _$_LoginFormState;

  @override
  Username get username => throw _privateConstructorUsedError;
  @override
  Password get password => throw _privateConstructorUsedError;
  @override
  bool get passwordVisible => throw _privateConstructorUsedError;
  @override
  bool get rememberPassword => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  Option<Either<AuthFailure, LoginV2>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFormStateCopyWith<_$_LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
