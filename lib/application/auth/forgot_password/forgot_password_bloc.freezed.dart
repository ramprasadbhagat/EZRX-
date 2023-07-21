// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(Locale local) requestPasswordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(Locale local)? requestPasswordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(Locale local)? requestPasswordReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ForgotPasswordEvent value) usernameChanged,
    required TResult Function(_RequestPasswordReset value) requestPasswordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ForgotPasswordEvent value)? usernameChanged,
    TResult? Function(_RequestPasswordReset value)? requestPasswordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ForgotPasswordEvent value)? usernameChanged,
    TResult Function(_RequestPasswordReset value)? requestPasswordReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordEventCopyWith(
          ForgotPasswordEvent value, $Res Function(ForgotPasswordEvent) then) =
      _$ForgotPasswordEventCopyWithImpl<$Res, ForgotPasswordEvent>;
}

/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res, $Val extends ForgotPasswordEvent>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'ForgotPasswordEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(Locale local) requestPasswordReset,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(Locale local)? requestPasswordReset,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(Locale local)? requestPasswordReset,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ForgotPasswordEvent value) usernameChanged,
    required TResult Function(_RequestPasswordReset value) requestPasswordReset,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ForgotPasswordEvent value)? usernameChanged,
    TResult? Function(_RequestPasswordReset value)? requestPasswordReset,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ForgotPasswordEvent value)? usernameChanged,
    TResult Function(_RequestPasswordReset value)? requestPasswordReset,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ForgotPasswordEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_ForgotPasswordEventCopyWith<$Res> {
  factory _$$_ForgotPasswordEventCopyWith(_$_ForgotPasswordEvent value,
          $Res Function(_$_ForgotPasswordEvent) then) =
      __$$_ForgotPasswordEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String usernameStr});
}

/// @nodoc
class __$$_ForgotPasswordEventCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$_ForgotPasswordEvent>
    implements _$$_ForgotPasswordEventCopyWith<$Res> {
  __$$_ForgotPasswordEventCopyWithImpl(_$_ForgotPasswordEvent _value,
      $Res Function(_$_ForgotPasswordEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameStr = null,
  }) {
    return _then(_$_ForgotPasswordEvent(
      null == usernameStr
          ? _value.usernameStr
          : usernameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordEvent implements _ForgotPasswordEvent {
  const _$_ForgotPasswordEvent(this.usernameStr);

  @override
  final String usernameStr;

  @override
  String toString() {
    return 'ForgotPasswordEvent.usernameChanged(usernameStr: $usernameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordEvent &&
            (identical(other.usernameStr, usernameStr) ||
                other.usernameStr == usernameStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordEventCopyWith<_$_ForgotPasswordEvent> get copyWith =>
      __$$_ForgotPasswordEventCopyWithImpl<_$_ForgotPasswordEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(Locale local) requestPasswordReset,
  }) {
    return usernameChanged(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(Locale local)? requestPasswordReset,
  }) {
    return usernameChanged?.call(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(Locale local)? requestPasswordReset,
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
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ForgotPasswordEvent value) usernameChanged,
    required TResult Function(_RequestPasswordReset value) requestPasswordReset,
  }) {
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ForgotPasswordEvent value)? usernameChanged,
    TResult? Function(_RequestPasswordReset value)? requestPasswordReset,
  }) {
    return usernameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ForgotPasswordEvent value)? usernameChanged,
    TResult Function(_RequestPasswordReset value)? requestPasswordReset,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class _ForgotPasswordEvent implements ForgotPasswordEvent {
  const factory _ForgotPasswordEvent(final String usernameStr) =
      _$_ForgotPasswordEvent;

  String get usernameStr;
  @JsonKey(ignore: true)
  _$$_ForgotPasswordEventCopyWith<_$_ForgotPasswordEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RequestPasswordResetCopyWith<$Res> {
  factory _$$_RequestPasswordResetCopyWith(_$_RequestPasswordReset value,
          $Res Function(_$_RequestPasswordReset) then) =
      __$$_RequestPasswordResetCopyWithImpl<$Res>;
  @useResult
  $Res call({Locale local});
}

/// @nodoc
class __$$_RequestPasswordResetCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$_RequestPasswordReset>
    implements _$$_RequestPasswordResetCopyWith<$Res> {
  __$$_RequestPasswordResetCopyWithImpl(_$_RequestPasswordReset _value,
      $Res Function(_$_RequestPasswordReset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? local = null,
  }) {
    return _then(_$_RequestPasswordReset(
      null == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$_RequestPasswordReset implements _RequestPasswordReset {
  const _$_RequestPasswordReset(this.local);

  @override
  final Locale local;

  @override
  String toString() {
    return 'ForgotPasswordEvent.requestPasswordReset(local: $local)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestPasswordReset &&
            (identical(other.local, local) || other.local == local));
  }

  @override
  int get hashCode => Object.hash(runtimeType, local);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestPasswordResetCopyWith<_$_RequestPasswordReset> get copyWith =>
      __$$_RequestPasswordResetCopyWithImpl<_$_RequestPasswordReset>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(Locale local) requestPasswordReset,
  }) {
    return requestPasswordReset(local);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(Locale local)? requestPasswordReset,
  }) {
    return requestPasswordReset?.call(local);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(Locale local)? requestPasswordReset,
    required TResult orElse(),
  }) {
    if (requestPasswordReset != null) {
      return requestPasswordReset(local);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ForgotPasswordEvent value) usernameChanged,
    required TResult Function(_RequestPasswordReset value) requestPasswordReset,
  }) {
    return requestPasswordReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ForgotPasswordEvent value)? usernameChanged,
    TResult? Function(_RequestPasswordReset value)? requestPasswordReset,
  }) {
    return requestPasswordReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ForgotPasswordEvent value)? usernameChanged,
    TResult Function(_RequestPasswordReset value)? requestPasswordReset,
    required TResult orElse(),
  }) {
    if (requestPasswordReset != null) {
      return requestPasswordReset(this);
    }
    return orElse();
  }
}

abstract class _RequestPasswordReset implements ForgotPasswordEvent {
  const factory _RequestPasswordReset(final Locale local) =
      _$_RequestPasswordReset;

  Locale get local;
  @JsonKey(ignore: true)
  _$$_RequestPasswordResetCopyWith<_$_RequestPasswordReset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordState {
  Username get username => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get resetPasswordFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  ForgotPassword get resetPasswordResponse =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
  @useResult
  $Res call(
      {Username username,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<ApiFailure, dynamic>> resetPasswordFailureOrSuccessOption,
      ForgotPassword resetPasswordResponse});

  $ForgotPasswordCopyWith<$Res> get resetPasswordResponse;
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? isSubmitting = null,
    Object? showErrorMessages = null,
    Object? resetPasswordFailureOrSuccessOption = null,
    Object? resetPasswordResponse = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      resetPasswordFailureOrSuccessOption: null ==
              resetPasswordFailureOrSuccessOption
          ? _value.resetPasswordFailureOrSuccessOption
          : resetPasswordFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      resetPasswordResponse: null == resetPasswordResponse
          ? _value.resetPasswordResponse
          : resetPasswordResponse // ignore: cast_nullable_to_non_nullable
              as ForgotPassword,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ForgotPasswordCopyWith<$Res> get resetPasswordResponse {
    return $ForgotPasswordCopyWith<$Res>(_value.resetPasswordResponse, (value) {
      return _then(_value.copyWith(resetPasswordResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordStateCopyWith<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$$_ForgotPasswordStateCopyWith(_$_ForgotPasswordState value,
          $Res Function(_$_ForgotPasswordState) then) =
      __$$_ForgotPasswordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Username username,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<ApiFailure, dynamic>> resetPasswordFailureOrSuccessOption,
      ForgotPassword resetPasswordResponse});

  @override
  $ForgotPasswordCopyWith<$Res> get resetPasswordResponse;
}

/// @nodoc
class __$$_ForgotPasswordStateCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$_ForgotPasswordState>
    implements _$$_ForgotPasswordStateCopyWith<$Res> {
  __$$_ForgotPasswordStateCopyWithImpl(_$_ForgotPasswordState _value,
      $Res Function(_$_ForgotPasswordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? isSubmitting = null,
    Object? showErrorMessages = null,
    Object? resetPasswordFailureOrSuccessOption = null,
    Object? resetPasswordResponse = null,
  }) {
    return _then(_$_ForgotPasswordState(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      resetPasswordFailureOrSuccessOption: null ==
              resetPasswordFailureOrSuccessOption
          ? _value.resetPasswordFailureOrSuccessOption
          : resetPasswordFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      resetPasswordResponse: null == resetPasswordResponse
          ? _value.resetPasswordResponse
          : resetPasswordResponse // ignore: cast_nullable_to_non_nullable
              as ForgotPassword,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordState implements _ForgotPasswordState {
  const _$_ForgotPasswordState(
      {required this.username,
      required this.isSubmitting,
      required this.showErrorMessages,
      required this.resetPasswordFailureOrSuccessOption,
      required this.resetPasswordResponse});

  @override
  final Username username;
  @override
  final bool isSubmitting;
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<ApiFailure, dynamic>> resetPasswordFailureOrSuccessOption;
  @override
  final ForgotPassword resetPasswordResponse;

  @override
  String toString() {
    return 'ForgotPasswordState(username: $username, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, resetPasswordFailureOrSuccessOption: $resetPasswordFailureOrSuccessOption, resetPasswordResponse: $resetPasswordResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordState &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.resetPasswordFailureOrSuccessOption,
                    resetPasswordFailureOrSuccessOption) ||
                other.resetPasswordFailureOrSuccessOption ==
                    resetPasswordFailureOrSuccessOption) &&
            (identical(other.resetPasswordResponse, resetPasswordResponse) ||
                other.resetPasswordResponse == resetPasswordResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      isSubmitting,
      showErrorMessages,
      resetPasswordFailureOrSuccessOption,
      resetPasswordResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordStateCopyWith<_$_ForgotPasswordState> get copyWith =>
      __$$_ForgotPasswordStateCopyWithImpl<_$_ForgotPasswordState>(
          this, _$identity);
}

abstract class _ForgotPasswordState implements ForgotPasswordState {
  const factory _ForgotPasswordState(
          {required final Username username,
          required final bool isSubmitting,
          required final bool showErrorMessages,
          required final Option<Either<ApiFailure, dynamic>>
              resetPasswordFailureOrSuccessOption,
          required final ForgotPassword resetPasswordResponse}) =
      _$_ForgotPasswordState;

  @override
  Username get username;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<ApiFailure, dynamic>> get resetPasswordFailureOrSuccessOption;
  @override
  ForgotPassword get resetPasswordResponse;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordStateCopyWith<_$_ForgotPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
