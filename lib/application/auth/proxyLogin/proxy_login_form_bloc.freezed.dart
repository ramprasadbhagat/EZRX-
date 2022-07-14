// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'proxy_login_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProxyLoginFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function() loginWithADButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? loginWithADButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? loginWithADButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_LoginWithADButtonPressed value)
        loginWithADButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_LoginWithADButtonPressed value)? loginWithADButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_LoginWithADButtonPressed value)? loginWithADButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProxyLoginFormEventCopyWith<$Res> {
  factory $ProxyLoginFormEventCopyWith(
          ProxyLoginFormEvent value, $Res Function(ProxyLoginFormEvent) then) =
      _$ProxyLoginFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProxyLoginFormEventCopyWithImpl<$Res>
    implements $ProxyLoginFormEventCopyWith<$Res> {
  _$ProxyLoginFormEventCopyWithImpl(this._value, this._then);

  final ProxyLoginFormEvent _value;
  // ignore: unused_field
  final $Res Function(ProxyLoginFormEvent) _then;
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
    extends _$ProxyLoginFormEventCopyWithImpl<$Res>
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
    return 'ProxyLoginFormEvent.usernameChanged(usernameStr: $usernameStr)';
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
    required TResult Function() loginWithADButtonPressed,
  }) {
    return usernameChanged(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? loginWithADButtonPressed,
  }) {
    return usernameChanged?.call(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? loginWithADButtonPressed,
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
    required TResult Function(_LoginWithADButtonPressed value)
        loginWithADButtonPressed,
  }) {
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_LoginWithADButtonPressed value)? loginWithADButtonPressed,
  }) {
    return usernameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_LoginWithADButtonPressed value)? loginWithADButtonPressed,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class _UsernameChanged implements ProxyLoginFormEvent {
  const factory _UsernameChanged(final String usernameStr) = _$_UsernameChanged;

  String get usernameStr;
  @JsonKey(ignore: true)
  _$$_UsernameChangedCopyWith<_$_UsernameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoginWithADButtonPressedCopyWith<$Res> {
  factory _$$_LoginWithADButtonPressedCopyWith(
          _$_LoginWithADButtonPressed value,
          $Res Function(_$_LoginWithADButtonPressed) then) =
      __$$_LoginWithADButtonPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginWithADButtonPressedCopyWithImpl<$Res>
    extends _$ProxyLoginFormEventCopyWithImpl<$Res>
    implements _$$_LoginWithADButtonPressedCopyWith<$Res> {
  __$$_LoginWithADButtonPressedCopyWithImpl(_$_LoginWithADButtonPressed _value,
      $Res Function(_$_LoginWithADButtonPressed) _then)
      : super(_value, (v) => _then(v as _$_LoginWithADButtonPressed));

  @override
  _$_LoginWithADButtonPressed get _value =>
      super._value as _$_LoginWithADButtonPressed;
}

/// @nodoc

class _$_LoginWithADButtonPressed implements _LoginWithADButtonPressed {
  const _$_LoginWithADButtonPressed();

  @override
  String toString() {
    return 'ProxyLoginFormEvent.loginWithADButtonPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginWithADButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function() loginWithADButtonPressed,
  }) {
    return loginWithADButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? loginWithADButtonPressed,
  }) {
    return loginWithADButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function()? loginWithADButtonPressed,
    required TResult orElse(),
  }) {
    if (loginWithADButtonPressed != null) {
      return loginWithADButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_LoginWithADButtonPressed value)
        loginWithADButtonPressed,
  }) {
    return loginWithADButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_LoginWithADButtonPressed value)? loginWithADButtonPressed,
  }) {
    return loginWithADButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_LoginWithADButtonPressed value)? loginWithADButtonPressed,
    required TResult orElse(),
  }) {
    if (loginWithADButtonPressed != null) {
      return loginWithADButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _LoginWithADButtonPressed implements ProxyLoginFormEvent {
  const factory _LoginWithADButtonPressed() = _$_LoginWithADButtonPressed;
}

/// @nodoc
mixin _$ProxyLoginFormState {
  Username get username => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, dynamic>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProxyLoginFormStateCopyWith<ProxyLoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProxyLoginFormStateCopyWith<$Res> {
  factory $ProxyLoginFormStateCopyWith(
          ProxyLoginFormState value, $Res Function(ProxyLoginFormState) then) =
      _$ProxyLoginFormStateCopyWithImpl<$Res>;
  $Res call(
      {Username username,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, dynamic>> authFailureOrSuccessOption});
}

/// @nodoc
class _$ProxyLoginFormStateCopyWithImpl<$Res>
    implements $ProxyLoginFormStateCopyWith<$Res> {
  _$ProxyLoginFormStateCopyWithImpl(this._value, this._then);

  final ProxyLoginFormState _value;
  // ignore: unused_field
  final $Res Function(ProxyLoginFormState) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
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
              as Option<Either<AuthFailure, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$$_ProxyLoginFormStateCopyWith<$Res>
    implements $ProxyLoginFormStateCopyWith<$Res> {
  factory _$$_ProxyLoginFormStateCopyWith(_$_ProxyLoginFormState value,
          $Res Function(_$_ProxyLoginFormState) then) =
      __$$_ProxyLoginFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Username username,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, dynamic>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_ProxyLoginFormStateCopyWithImpl<$Res>
    extends _$ProxyLoginFormStateCopyWithImpl<$Res>
    implements _$$_ProxyLoginFormStateCopyWith<$Res> {
  __$$_ProxyLoginFormStateCopyWithImpl(_$_ProxyLoginFormState _value,
      $Res Function(_$_ProxyLoginFormState) _then)
      : super(_value, (v) => _then(v as _$_ProxyLoginFormState));

  @override
  _$_ProxyLoginFormState get _value => super._value as _$_ProxyLoginFormState;

  @override
  $Res call({
    Object? username = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_ProxyLoginFormState(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
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
              as Option<Either<AuthFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_ProxyLoginFormState implements _ProxyLoginFormState {
  const _$_ProxyLoginFormState(
      {required this.username,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Username username;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, dynamic>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'ProxyLoginFormState(username: $username, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProxyLoginFormState &&
            const DeepCollectionEquality().equals(other.username, username) &&
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
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_ProxyLoginFormStateCopyWith<_$_ProxyLoginFormState> get copyWith =>
      __$$_ProxyLoginFormStateCopyWithImpl<_$_ProxyLoginFormState>(
          this, _$identity);
}

abstract class _ProxyLoginFormState implements ProxyLoginFormState {
  const factory _ProxyLoginFormState(
      {required final Username username,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, dynamic>>
          authFailureOrSuccessOption}) = _$_ProxyLoginFormState;

  @override
  Username get username;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, dynamic>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ProxyLoginFormStateCopyWith<_$_ProxyLoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
