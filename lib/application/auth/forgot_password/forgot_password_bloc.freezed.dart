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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(Language language) requestPasswordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(Language language)? requestPasswordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(Language language)? requestPasswordReset,
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
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl();

  @override
  String toString() {
    return 'ForgotPasswordEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(Language language) requestPasswordReset,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(Language language)? requestPasswordReset,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(Language language)? requestPasswordReset,
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
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$ForgotPasswordEventImplCopyWith<$Res> {
  factory _$$ForgotPasswordEventImplCopyWith(_$ForgotPasswordEventImpl value,
          $Res Function(_$ForgotPasswordEventImpl) then) =
      __$$ForgotPasswordEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String usernameStr});
}

/// @nodoc
class __$$ForgotPasswordEventImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$ForgotPasswordEventImpl>
    implements _$$ForgotPasswordEventImplCopyWith<$Res> {
  __$$ForgotPasswordEventImplCopyWithImpl(_$ForgotPasswordEventImpl _value,
      $Res Function(_$ForgotPasswordEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameStr = null,
  }) {
    return _then(_$ForgotPasswordEventImpl(
      null == usernameStr
          ? _value.usernameStr
          : usernameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordEventImpl implements _ForgotPasswordEvent {
  const _$ForgotPasswordEventImpl(this.usernameStr);

  @override
  final String usernameStr;

  @override
  String toString() {
    return 'ForgotPasswordEvent.usernameChanged(usernameStr: $usernameStr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordEventImpl &&
            (identical(other.usernameStr, usernameStr) ||
                other.usernameStr == usernameStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordEventImplCopyWith<_$ForgotPasswordEventImpl> get copyWith =>
      __$$ForgotPasswordEventImplCopyWithImpl<_$ForgotPasswordEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(Language language) requestPasswordReset,
  }) {
    return usernameChanged(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(Language language)? requestPasswordReset,
  }) {
    return usernameChanged?.call(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(Language language)? requestPasswordReset,
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
      _$ForgotPasswordEventImpl;

  String get usernameStr;
  @JsonKey(ignore: true)
  _$$ForgotPasswordEventImplCopyWith<_$ForgotPasswordEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestPasswordResetImplCopyWith<$Res> {
  factory _$$RequestPasswordResetImplCopyWith(_$RequestPasswordResetImpl value,
          $Res Function(_$RequestPasswordResetImpl) then) =
      __$$RequestPasswordResetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Language language});
}

/// @nodoc
class __$$RequestPasswordResetImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$RequestPasswordResetImpl>
    implements _$$RequestPasswordResetImplCopyWith<$Res> {
  __$$RequestPasswordResetImplCopyWithImpl(_$RequestPasswordResetImpl _value,
      $Res Function(_$RequestPasswordResetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$RequestPasswordResetImpl(
      null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
    ));
  }
}

/// @nodoc

class _$RequestPasswordResetImpl implements _RequestPasswordReset {
  const _$RequestPasswordResetImpl(this.language);

  @override
  final Language language;

  @override
  String toString() {
    return 'ForgotPasswordEvent.requestPasswordReset(language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestPasswordResetImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestPasswordResetImplCopyWith<_$RequestPasswordResetImpl>
      get copyWith =>
          __$$RequestPasswordResetImplCopyWithImpl<_$RequestPasswordResetImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(Language language) requestPasswordReset,
  }) {
    return requestPasswordReset(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(Language language)? requestPasswordReset,
  }) {
    return requestPasswordReset?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(Language language)? requestPasswordReset,
    required TResult orElse(),
  }) {
    if (requestPasswordReset != null) {
      return requestPasswordReset(language);
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
  const factory _RequestPasswordReset(final Language language) =
      _$RequestPasswordResetImpl;

  Language get language;
  @JsonKey(ignore: true)
  _$$RequestPasswordResetImplCopyWith<_$RequestPasswordResetImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$ForgotPasswordStateImplCopyWith<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$$ForgotPasswordStateImplCopyWith(_$ForgotPasswordStateImpl value,
          $Res Function(_$ForgotPasswordStateImpl) then) =
      __$$ForgotPasswordStateImplCopyWithImpl<$Res>;
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
class __$$ForgotPasswordStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$ForgotPasswordStateImpl>
    implements _$$ForgotPasswordStateImplCopyWith<$Res> {
  __$$ForgotPasswordStateImplCopyWithImpl(_$ForgotPasswordStateImpl _value,
      $Res Function(_$ForgotPasswordStateImpl) _then)
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
    return _then(_$ForgotPasswordStateImpl(
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

class _$ForgotPasswordStateImpl implements _ForgotPasswordState {
  const _$ForgotPasswordStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordStateImpl &&
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
  _$$ForgotPasswordStateImplCopyWith<_$ForgotPasswordStateImpl> get copyWith =>
      __$$ForgotPasswordStateImplCopyWithImpl<_$ForgotPasswordStateImpl>(
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
      _$ForgotPasswordStateImpl;

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
  _$$ForgotPasswordStateImplCopyWith<_$ForgotPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
