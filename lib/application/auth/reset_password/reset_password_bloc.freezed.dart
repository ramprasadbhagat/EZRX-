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
    required TResult Function(User user) changePassword,
    required TResult Function() clear,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        addResetPasswordCred,
    required TResult Function() resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult? Function(User user)? changePassword,
    TResult? Function()? clear,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        addResetPasswordCred,
    TResult? Function()? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult Function(User user)? changePassword,
    TResult Function()? clear,
    TResult Function(ResetPasswordCred resetPasswordCred)? addResetPasswordCred,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_AddResetPasswordCred value) addResetPasswordCred,
    required TResult Function(_ResetPasswords value) resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult? Function(_ResetPasswords value)? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult Function(_ResetPasswords value)? resetPassword,
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
    required TResult Function(User user) changePassword,
    required TResult Function() clear,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        addResetPasswordCred,
    required TResult Function() resetPassword,
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
    TResult? Function(User user)? changePassword,
    TResult? Function()? clear,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        addResetPasswordCred,
    TResult? Function()? resetPassword,
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
    TResult Function(User user)? changePassword,
    TResult Function()? clear,
    TResult Function(ResetPasswordCred resetPasswordCred)? addResetPasswordCred,
    TResult Function()? resetPassword,
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
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_AddResetPasswordCred value) addResetPasswordCred,
    required TResult Function(_ResetPasswords value) resetPassword,
  }) {
    return togglePasswordVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult? Function(_ResetPasswords value)? resetPassword,
  }) {
    return togglePasswordVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult Function(_ResetPasswords value)? resetPassword,
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
    required TResult Function(User user) changePassword,
    required TResult Function() clear,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        addResetPasswordCred,
    required TResult Function() resetPassword,
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
    TResult? Function(User user)? changePassword,
    TResult? Function()? clear,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        addResetPasswordCred,
    TResult? Function()? resetPassword,
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
    TResult Function(User user)? changePassword,
    TResult Function()? clear,
    TResult Function(ResetPasswordCred resetPasswordCred)? addResetPasswordCred,
    TResult Function()? resetPassword,
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
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_AddResetPasswordCred value) addResetPasswordCred,
    required TResult Function(_ResetPasswords value) resetPassword,
  }) {
    return onTextChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult? Function(_ResetPasswords value)? resetPassword,
  }) {
    return onTextChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult Function(_ResetPasswords value)? resetPassword,
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
abstract class _$$_ChangePasswordCopyWith<$Res> {
  factory _$$_ChangePasswordCopyWith(
          _$_ChangePassword value, $Res Function(_$_ChangePassword) then) =
      __$$_ChangePasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_ChangePasswordCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$_ChangePassword>
    implements _$$_ChangePasswordCopyWith<$Res> {
  __$$_ChangePasswordCopyWithImpl(
      _$_ChangePassword _value, $Res Function(_$_ChangePassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_ChangePassword(
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

class _$_ChangePassword implements _ChangePassword {
  const _$_ChangePassword({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'ResetPasswordEvent.changePassword(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePassword &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangePasswordCopyWith<_$_ChangePassword> get copyWith =>
      __$$_ChangePasswordCopyWithImpl<_$_ChangePassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(
            PasswordFieldType fieldType, String newValue, User user)
        onTextChange,
    required TResult Function(User user) changePassword,
    required TResult Function() clear,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        addResetPasswordCred,
    required TResult Function() resetPassword,
  }) {
    return changePassword(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult? Function(User user)? changePassword,
    TResult? Function()? clear,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        addResetPasswordCred,
    TResult? Function()? resetPassword,
  }) {
    return changePassword?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult Function(User user)? changePassword,
    TResult Function()? clear,
    TResult Function(ResetPasswordCred resetPasswordCred)? addResetPasswordCred,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_AddResetPasswordCred value) addResetPasswordCred,
    required TResult Function(_ResetPasswords value) resetPassword,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult? Function(_ResetPasswords value)? resetPassword,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult Function(_ResetPasswords value)? resetPassword,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePassword implements ResetPasswordEvent {
  const factory _ChangePassword({required final User user}) = _$_ChangePassword;

  User get user;
  @JsonKey(ignore: true)
  _$$_ChangePasswordCopyWith<_$_ChangePassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearCopyWith<$Res> {
  factory _$$_ClearCopyWith(_$_Clear value, $Res Function(_$_Clear) then) =
      __$$_ClearCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$_Clear>
    implements _$$_ClearCopyWith<$Res> {
  __$$_ClearCopyWithImpl(_$_Clear _value, $Res Function(_$_Clear) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Clear implements _Clear {
  const _$_Clear();

  @override
  String toString() {
    return 'ResetPasswordEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Clear);
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
    required TResult Function(User user) changePassword,
    required TResult Function() clear,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        addResetPasswordCred,
    required TResult Function() resetPassword,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult? Function(User user)? changePassword,
    TResult? Function()? clear,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        addResetPasswordCred,
    TResult? Function()? resetPassword,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult Function(User user)? changePassword,
    TResult Function()? clear,
    TResult Function(ResetPasswordCred resetPasswordCred)? addResetPasswordCred,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_AddResetPasswordCred value) addResetPasswordCred,
    required TResult Function(_ResetPasswords value) resetPassword,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult? Function(_ResetPasswords value)? resetPassword,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult Function(_ResetPasswords value)? resetPassword,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements ResetPasswordEvent {
  const factory _Clear() = _$_Clear;
}

/// @nodoc
abstract class _$$_AddResetPasswordCredCopyWith<$Res> {
  factory _$$_AddResetPasswordCredCopyWith(_$_AddResetPasswordCred value,
          $Res Function(_$_AddResetPasswordCred) then) =
      __$$_AddResetPasswordCredCopyWithImpl<$Res>;
  @useResult
  $Res call({ResetPasswordCred resetPasswordCred});

  $ResetPasswordCredCopyWith<$Res> get resetPasswordCred;
}

/// @nodoc
class __$$_AddResetPasswordCredCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$_AddResetPasswordCred>
    implements _$$_AddResetPasswordCredCopyWith<$Res> {
  __$$_AddResetPasswordCredCopyWithImpl(_$_AddResetPasswordCred _value,
      $Res Function(_$_AddResetPasswordCred) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetPasswordCred = null,
  }) {
    return _then(_$_AddResetPasswordCred(
      resetPasswordCred: null == resetPasswordCred
          ? _value.resetPasswordCred
          : resetPasswordCred // ignore: cast_nullable_to_non_nullable
              as ResetPasswordCred,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ResetPasswordCredCopyWith<$Res> get resetPasswordCred {
    return $ResetPasswordCredCopyWith<$Res>(_value.resetPasswordCred, (value) {
      return _then(_value.copyWith(resetPasswordCred: value));
    });
  }
}

/// @nodoc

class _$_AddResetPasswordCred implements _AddResetPasswordCred {
  const _$_AddResetPasswordCred({required this.resetPasswordCred});

  @override
  final ResetPasswordCred resetPasswordCred;

  @override
  String toString() {
    return 'ResetPasswordEvent.addResetPasswordCred(resetPasswordCred: $resetPasswordCred)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddResetPasswordCred &&
            (identical(other.resetPasswordCred, resetPasswordCred) ||
                other.resetPasswordCred == resetPasswordCred));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resetPasswordCred);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddResetPasswordCredCopyWith<_$_AddResetPasswordCred> get copyWith =>
      __$$_AddResetPasswordCredCopyWithImpl<_$_AddResetPasswordCred>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(
            PasswordFieldType fieldType, String newValue, User user)
        onTextChange,
    required TResult Function(User user) changePassword,
    required TResult Function() clear,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        addResetPasswordCred,
    required TResult Function() resetPassword,
  }) {
    return addResetPasswordCred(resetPasswordCred);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult? Function(User user)? changePassword,
    TResult? Function()? clear,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        addResetPasswordCred,
    TResult? Function()? resetPassword,
  }) {
    return addResetPasswordCred?.call(resetPasswordCred);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult Function(User user)? changePassword,
    TResult Function()? clear,
    TResult Function(ResetPasswordCred resetPasswordCred)? addResetPasswordCred,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (addResetPasswordCred != null) {
      return addResetPasswordCred(resetPasswordCred);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_AddResetPasswordCred value) addResetPasswordCred,
    required TResult Function(_ResetPasswords value) resetPassword,
  }) {
    return addResetPasswordCred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult? Function(_ResetPasswords value)? resetPassword,
  }) {
    return addResetPasswordCred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult Function(_ResetPasswords value)? resetPassword,
    required TResult orElse(),
  }) {
    if (addResetPasswordCred != null) {
      return addResetPasswordCred(this);
    }
    return orElse();
  }
}

abstract class _AddResetPasswordCred implements ResetPasswordEvent {
  const factory _AddResetPasswordCred(
          {required final ResetPasswordCred resetPasswordCred}) =
      _$_AddResetPasswordCred;

  ResetPasswordCred get resetPasswordCred;
  @JsonKey(ignore: true)
  _$$_AddResetPasswordCredCopyWith<_$_AddResetPasswordCred> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetPasswordsCopyWith<$Res> {
  factory _$$_ResetPasswordsCopyWith(
          _$_ResetPasswords value, $Res Function(_$_ResetPasswords) then) =
      __$$_ResetPasswordsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetPasswordsCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$_ResetPasswords>
    implements _$$_ResetPasswordsCopyWith<$Res> {
  __$$_ResetPasswordsCopyWithImpl(
      _$_ResetPasswords _value, $Res Function(_$_ResetPasswords) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResetPasswords implements _ResetPasswords {
  const _$_ResetPasswords();

  @override
  String toString() {
    return 'ResetPasswordEvent.resetPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResetPasswords);
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
    required TResult Function(User user) changePassword,
    required TResult Function() clear,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        addResetPasswordCred,
    required TResult Function() resetPassword,
  }) {
    return resetPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult? Function(User user)? changePassword,
    TResult? Function()? clear,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        addResetPasswordCred,
    TResult? Function()? resetPassword,
  }) {
    return resetPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue, User user)?
        onTextChange,
    TResult Function(User user)? changePassword,
    TResult Function()? clear,
    TResult Function(ResetPasswordCred resetPasswordCred)? addResetPasswordCred,
    TResult Function()? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_AddResetPasswordCred value) addResetPasswordCred,
    required TResult Function(_ResetPasswords value) resetPassword,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult? Function(_ResetPasswords value)? resetPassword,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_AddResetPasswordCred value)? addResetPasswordCred,
    TResult Function(_ResetPasswords value)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPasswords implements ResetPasswordEvent {
  const factory _ResetPasswords() = _$_ResetPasswords;
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
  ResetPasswordCred get resetPasswordCred => throw _privateConstructorUsedError;
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
      ResetPasswordCred resetPasswordCred,
      bool showErrorMessages});

  $ResetPasswordCredCopyWith<$Res> get resetPasswordCred;
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
    Object? resetPasswordCred = null,
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
      resetPasswordCred: null == resetPasswordCred
          ? _value.resetPasswordCred
          : resetPasswordCred // ignore: cast_nullable_to_non_nullable
              as ResetPasswordCred,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResetPasswordCredCopyWith<$Res> get resetPasswordCred {
    return $ResetPasswordCredCopyWith<$Res>(_value.resetPasswordCred, (value) {
      return _then(_value.copyWith(resetPasswordCred: value) as $Val);
    });
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
      ResetPasswordCred resetPasswordCred,
      bool showErrorMessages});

  @override
  $ResetPasswordCredCopyWith<$Res> get resetPasswordCred;
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
    Object? resetPasswordCred = null,
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
      resetPasswordCred: null == resetPasswordCred
          ? _value.resetPasswordCred
          : resetPasswordCred // ignore: cast_nullable_to_non_nullable
              as ResetPasswordCred,
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
      required this.resetPasswordCred,
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
  final ResetPasswordCred resetPasswordCred;
  @override
  final bool showErrorMessages;

  @override
  String toString() {
    return 'ResetPasswordState(isOldPasswordObscure: $isOldPasswordObscure, isNewPasswordObscure: $isNewPasswordObscure, isConfirmPasswordObscure: $isConfirmPasswordObscure, oldPassword: $oldPassword, newPassword: $newPassword, confirmPassword: $confirmPassword, isSubmitting: $isSubmitting, passwordResetFailureOrSuccessOption: $passwordResetFailureOrSuccessOption, resetPasswordCred: $resetPasswordCred, showErrorMessages: $showErrorMessages)';
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
            (identical(other.resetPasswordCred, resetPasswordCred) ||
                other.resetPasswordCred == resetPasswordCred) &&
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
      resetPasswordCred,
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
      required final ResetPasswordCred resetPasswordCred,
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
  ResetPasswordCred get resetPasswordCred;
  @override
  bool get showErrorMessages;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordCopyWith<_$_ResetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}
