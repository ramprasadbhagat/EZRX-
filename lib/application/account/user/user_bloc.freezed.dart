// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function() accptTnc,
    required TResult Function(
            String languagePreference, bool emailNotifications)
        updateNotificationSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? accptTnc,
    TResult? Function(String languagePreference, bool emailNotifications)?
        updateNotificationSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? accptTnc,
    TResult Function(String languagePreference, bool emailNotifications)?
        updateNotificationSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AccptTnc value) accptTnc,
    required TResult Function(_UpdateNotificationSettings value)
        updateNotificationSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AccptTnc value)? accptTnc,
    TResult? Function(_UpdateNotificationSettings value)?
        updateNotificationSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AccptTnc value)? accptTnc,
    TResult Function(_UpdateNotificationSettings value)?
        updateNotificationSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

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
    extends _$UserEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'UserEvent.initialized()';
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
    required TResult Function() fetch,
    required TResult Function() accptTnc,
    required TResult Function(
            String languagePreference, bool emailNotifications)
        updateNotificationSettings,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? accptTnc,
    TResult? Function(String languagePreference, bool emailNotifications)?
        updateNotificationSettings,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? accptTnc,
    TResult Function(String languagePreference, bool emailNotifications)?
        updateNotificationSettings,
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
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AccptTnc value) accptTnc,
    required TResult Function(_UpdateNotificationSettings value)
        updateNotificationSettings,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AccptTnc value)? accptTnc,
    TResult? Function(_UpdateNotificationSettings value)?
        updateNotificationSettings,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AccptTnc value)? accptTnc,
    TResult Function(_UpdateNotificationSettings value)?
        updateNotificationSettings,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements UserEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch();

  @override
  String toString() {
    return 'UserEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function() accptTnc,
    required TResult Function(
            String languagePreference, bool emailNotifications)
        updateNotificationSettings,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? accptTnc,
    TResult? Function(String languagePreference, bool emailNotifications)?
        updateNotificationSettings,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? accptTnc,
    TResult Function(String languagePreference, bool emailNotifications)?
        updateNotificationSettings,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AccptTnc value) accptTnc,
    required TResult Function(_UpdateNotificationSettings value)
        updateNotificationSettings,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AccptTnc value)? accptTnc,
    TResult? Function(_UpdateNotificationSettings value)?
        updateNotificationSettings,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AccptTnc value)? accptTnc,
    TResult Function(_UpdateNotificationSettings value)?
        updateNotificationSettings,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements UserEvent {
  const factory _Fetch() = _$_Fetch;
}

/// @nodoc
abstract class _$$_AccptTncCopyWith<$Res> {
  factory _$$_AccptTncCopyWith(
          _$_AccptTnc value, $Res Function(_$_AccptTnc) then) =
      __$$_AccptTncCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AccptTncCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_AccptTnc>
    implements _$$_AccptTncCopyWith<$Res> {
  __$$_AccptTncCopyWithImpl(
      _$_AccptTnc _value, $Res Function(_$_AccptTnc) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AccptTnc implements _AccptTnc {
  const _$_AccptTnc();

  @override
  String toString() {
    return 'UserEvent.accptTnc()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AccptTnc);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function() accptTnc,
    required TResult Function(
            String languagePreference, bool emailNotifications)
        updateNotificationSettings,
  }) {
    return accptTnc();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? accptTnc,
    TResult? Function(String languagePreference, bool emailNotifications)?
        updateNotificationSettings,
  }) {
    return accptTnc?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? accptTnc,
    TResult Function(String languagePreference, bool emailNotifications)?
        updateNotificationSettings,
    required TResult orElse(),
  }) {
    if (accptTnc != null) {
      return accptTnc();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AccptTnc value) accptTnc,
    required TResult Function(_UpdateNotificationSettings value)
        updateNotificationSettings,
  }) {
    return accptTnc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AccptTnc value)? accptTnc,
    TResult? Function(_UpdateNotificationSettings value)?
        updateNotificationSettings,
  }) {
    return accptTnc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AccptTnc value)? accptTnc,
    TResult Function(_UpdateNotificationSettings value)?
        updateNotificationSettings,
    required TResult orElse(),
  }) {
    if (accptTnc != null) {
      return accptTnc(this);
    }
    return orElse();
  }
}

abstract class _AccptTnc implements UserEvent {
  const factory _AccptTnc() = _$_AccptTnc;
}

/// @nodoc
abstract class _$$_UpdateNotificationSettingsCopyWith<$Res> {
  factory _$$_UpdateNotificationSettingsCopyWith(
          _$_UpdateNotificationSettings value,
          $Res Function(_$_UpdateNotificationSettings) then) =
      __$$_UpdateNotificationSettingsCopyWithImpl<$Res>;
  @useResult
  $Res call({String languagePreference, bool emailNotifications});
}

/// @nodoc
class __$$_UpdateNotificationSettingsCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_UpdateNotificationSettings>
    implements _$$_UpdateNotificationSettingsCopyWith<$Res> {
  __$$_UpdateNotificationSettingsCopyWithImpl(
      _$_UpdateNotificationSettings _value,
      $Res Function(_$_UpdateNotificationSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languagePreference = null,
    Object? emailNotifications = null,
  }) {
    return _then(_$_UpdateNotificationSettings(
      languagePreference: null == languagePreference
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpdateNotificationSettings implements _UpdateNotificationSettings {
  const _$_UpdateNotificationSettings(
      {required this.languagePreference, required this.emailNotifications});

  @override
  final String languagePreference;
  @override
  final bool emailNotifications;

  @override
  String toString() {
    return 'UserEvent.updateNotificationSettings(languagePreference: $languagePreference, emailNotifications: $emailNotifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateNotificationSettings &&
            (identical(other.languagePreference, languagePreference) ||
                other.languagePreference == languagePreference) &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, languagePreference, emailNotifications);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateNotificationSettingsCopyWith<_$_UpdateNotificationSettings>
      get copyWith => __$$_UpdateNotificationSettingsCopyWithImpl<
          _$_UpdateNotificationSettings>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function() accptTnc,
    required TResult Function(
            String languagePreference, bool emailNotifications)
        updateNotificationSettings,
  }) {
    return updateNotificationSettings(languagePreference, emailNotifications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? fetch,
    TResult? Function()? accptTnc,
    TResult? Function(String languagePreference, bool emailNotifications)?
        updateNotificationSettings,
  }) {
    return updateNotificationSettings?.call(
        languagePreference, emailNotifications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function()? accptTnc,
    TResult Function(String languagePreference, bool emailNotifications)?
        updateNotificationSettings,
    required TResult orElse(),
  }) {
    if (updateNotificationSettings != null) {
      return updateNotificationSettings(languagePreference, emailNotifications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AccptTnc value) accptTnc,
    required TResult Function(_UpdateNotificationSettings value)
        updateNotificationSettings,
  }) {
    return updateNotificationSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AccptTnc value)? accptTnc,
    TResult? Function(_UpdateNotificationSettings value)?
        updateNotificationSettings,
  }) {
    return updateNotificationSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AccptTnc value)? accptTnc,
    TResult Function(_UpdateNotificationSettings value)?
        updateNotificationSettings,
    required TResult orElse(),
  }) {
    if (updateNotificationSettings != null) {
      return updateNotificationSettings(this);
    }
    return orElse();
  }
}

abstract class _UpdateNotificationSettings implements UserEvent {
  const factory _UpdateNotificationSettings(
      {required final String languagePreference,
      required final bool emailNotifications}) = _$_UpdateNotificationSettings;

  String get languagePreference;
  bool get emailNotifications;
  @JsonKey(ignore: true)
  _$$_UpdateNotificationSettingsCopyWith<_$_UpdateNotificationSettings>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  User get user => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get userFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {User user,
      Option<Either<ApiFailure, dynamic>> userFailureOrSuccessOption});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? userFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      userFailureOrSuccessOption: null == userFailureOrSuccessOption
          ? _value.userFailureOrSuccessOption
          : userFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$$_UserStateCopyWith(
          _$_UserState value, $Res Function(_$_UserState) then) =
      __$$_UserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      Option<Either<ApiFailure, dynamic>> userFailureOrSuccessOption});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_UserStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_UserState>
    implements _$$_UserStateCopyWith<$Res> {
  __$$_UserStateCopyWithImpl(
      _$_UserState _value, $Res Function(_$_UserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? userFailureOrSuccessOption = null,
  }) {
    return _then(_$_UserState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      userFailureOrSuccessOption: null == userFailureOrSuccessOption
          ? _value.userFailureOrSuccessOption
          : userFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_UserState extends _UserState {
  const _$_UserState(
      {required this.user, required this.userFailureOrSuccessOption})
      : super._();

  @override
  final User user;
  @override
  final Option<Either<ApiFailure, dynamic>> userFailureOrSuccessOption;

  @override
  String toString() {
    return 'UserState(user: $user, userFailureOrSuccessOption: $userFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userFailureOrSuccessOption,
                    userFailureOrSuccessOption) ||
                other.userFailureOrSuccessOption ==
                    userFailureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, userFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      __$$_UserStateCopyWithImpl<_$_UserState>(this, _$identity);
}

abstract class _UserState extends UserState {
  const factory _UserState(
      {required final User user,
      required final Option<Either<ApiFailure, dynamic>>
          userFailureOrSuccessOption}) = _$_UserState;
  const _UserState._() : super._();

  @override
  User get user;
  @override
  Option<Either<ApiFailure, dynamic>> get userFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}
