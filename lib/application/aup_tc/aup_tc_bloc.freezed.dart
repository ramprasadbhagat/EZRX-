// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aup_tc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AupTcEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) show,
    required TResult Function(bool newValue) termsOfUseConsent,
    required TResult Function(bool newValue) privacyPolicyConsent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? show,
    TResult? Function(bool newValue)? termsOfUseConsent,
    TResult? Function(bool newValue)? privacyPolicyConsent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? show,
    TResult Function(bool newValue)? termsOfUseConsent,
    TResult Function(bool newValue)? privacyPolicyConsent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Show value) show,
    required TResult Function(_TermsOfUseConsent value) termsOfUseConsent,
    required TResult Function(_PrivacyPolicyConsent value) privacyPolicyConsent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Show value)? show,
    TResult? Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult? Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Show value)? show,
    TResult Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AupTcEventCopyWith<$Res> {
  factory $AupTcEventCopyWith(
          AupTcEvent value, $Res Function(AupTcEvent) then) =
      _$AupTcEventCopyWithImpl<$Res, AupTcEvent>;
}

/// @nodoc
class _$AupTcEventCopyWithImpl<$Res, $Val extends AupTcEvent>
    implements $AupTcEventCopyWith<$Res> {
  _$AupTcEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ShowCopyWith<$Res> {
  factory _$$_ShowCopyWith(_$_Show value, $Res Function(_$_Show) then) =
      __$$_ShowCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_ShowCopyWithImpl<$Res>
    extends _$AupTcEventCopyWithImpl<$Res, _$_Show>
    implements _$$_ShowCopyWith<$Res> {
  __$$_ShowCopyWithImpl(_$_Show _value, $Res Function(_$_Show) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_Show(
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

class _$_Show implements _Show {
  const _$_Show(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AupTcEvent.show(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Show &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShowCopyWith<_$_Show> get copyWith =>
      __$$_ShowCopyWithImpl<_$_Show>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) show,
    required TResult Function(bool newValue) termsOfUseConsent,
    required TResult Function(bool newValue) privacyPolicyConsent,
  }) {
    return show(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? show,
    TResult? Function(bool newValue)? termsOfUseConsent,
    TResult? Function(bool newValue)? privacyPolicyConsent,
  }) {
    return show?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? show,
    TResult Function(bool newValue)? termsOfUseConsent,
    TResult Function(bool newValue)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (show != null) {
      return show(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Show value) show,
    required TResult Function(_TermsOfUseConsent value) termsOfUseConsent,
    required TResult Function(_PrivacyPolicyConsent value) privacyPolicyConsent,
  }) {
    return show(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Show value)? show,
    TResult? Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult? Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
  }) {
    return show?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Show value)? show,
    TResult Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (show != null) {
      return show(this);
    }
    return orElse();
  }
}

abstract class _Show implements AupTcEvent {
  const factory _Show(final User user) = _$_Show;

  User get user;
  @JsonKey(ignore: true)
  _$$_ShowCopyWith<_$_Show> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TermsOfUseConsentCopyWith<$Res> {
  factory _$$_TermsOfUseConsentCopyWith(_$_TermsOfUseConsent value,
          $Res Function(_$_TermsOfUseConsent) then) =
      __$$_TermsOfUseConsentCopyWithImpl<$Res>;
  @useResult
  $Res call({bool newValue});
}

/// @nodoc
class __$$_TermsOfUseConsentCopyWithImpl<$Res>
    extends _$AupTcEventCopyWithImpl<$Res, _$_TermsOfUseConsent>
    implements _$$_TermsOfUseConsentCopyWith<$Res> {
  __$$_TermsOfUseConsentCopyWithImpl(
      _$_TermsOfUseConsent _value, $Res Function(_$_TermsOfUseConsent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$_TermsOfUseConsent(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TermsOfUseConsent implements _TermsOfUseConsent {
  const _$_TermsOfUseConsent({required this.newValue});

  @override
  final bool newValue;

  @override
  String toString() {
    return 'AupTcEvent.termsOfUseConsent(newValue: $newValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TermsOfUseConsent &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TermsOfUseConsentCopyWith<_$_TermsOfUseConsent> get copyWith =>
      __$$_TermsOfUseConsentCopyWithImpl<_$_TermsOfUseConsent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) show,
    required TResult Function(bool newValue) termsOfUseConsent,
    required TResult Function(bool newValue) privacyPolicyConsent,
  }) {
    return termsOfUseConsent(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? show,
    TResult? Function(bool newValue)? termsOfUseConsent,
    TResult? Function(bool newValue)? privacyPolicyConsent,
  }) {
    return termsOfUseConsent?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? show,
    TResult Function(bool newValue)? termsOfUseConsent,
    TResult Function(bool newValue)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (termsOfUseConsent != null) {
      return termsOfUseConsent(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Show value) show,
    required TResult Function(_TermsOfUseConsent value) termsOfUseConsent,
    required TResult Function(_PrivacyPolicyConsent value) privacyPolicyConsent,
  }) {
    return termsOfUseConsent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Show value)? show,
    TResult? Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult? Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
  }) {
    return termsOfUseConsent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Show value)? show,
    TResult Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (termsOfUseConsent != null) {
      return termsOfUseConsent(this);
    }
    return orElse();
  }
}

abstract class _TermsOfUseConsent implements AupTcEvent {
  const factory _TermsOfUseConsent({required final bool newValue}) =
      _$_TermsOfUseConsent;

  bool get newValue;
  @JsonKey(ignore: true)
  _$$_TermsOfUseConsentCopyWith<_$_TermsOfUseConsent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PrivacyPolicyConsentCopyWith<$Res> {
  factory _$$_PrivacyPolicyConsentCopyWith(_$_PrivacyPolicyConsent value,
          $Res Function(_$_PrivacyPolicyConsent) then) =
      __$$_PrivacyPolicyConsentCopyWithImpl<$Res>;
  @useResult
  $Res call({bool newValue});
}

/// @nodoc
class __$$_PrivacyPolicyConsentCopyWithImpl<$Res>
    extends _$AupTcEventCopyWithImpl<$Res, _$_PrivacyPolicyConsent>
    implements _$$_PrivacyPolicyConsentCopyWith<$Res> {
  __$$_PrivacyPolicyConsentCopyWithImpl(_$_PrivacyPolicyConsent _value,
      $Res Function(_$_PrivacyPolicyConsent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$_PrivacyPolicyConsent(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PrivacyPolicyConsent implements _PrivacyPolicyConsent {
  const _$_PrivacyPolicyConsent({required this.newValue});

  @override
  final bool newValue;

  @override
  String toString() {
    return 'AupTcEvent.privacyPolicyConsent(newValue: $newValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrivacyPolicyConsent &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrivacyPolicyConsentCopyWith<_$_PrivacyPolicyConsent> get copyWith =>
      __$$_PrivacyPolicyConsentCopyWithImpl<_$_PrivacyPolicyConsent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) show,
    required TResult Function(bool newValue) termsOfUseConsent,
    required TResult Function(bool newValue) privacyPolicyConsent,
  }) {
    return privacyPolicyConsent(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? show,
    TResult? Function(bool newValue)? termsOfUseConsent,
    TResult? Function(bool newValue)? privacyPolicyConsent,
  }) {
    return privacyPolicyConsent?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? show,
    TResult Function(bool newValue)? termsOfUseConsent,
    TResult Function(bool newValue)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (privacyPolicyConsent != null) {
      return privacyPolicyConsent(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Show value) show,
    required TResult Function(_TermsOfUseConsent value) termsOfUseConsent,
    required TResult Function(_PrivacyPolicyConsent value) privacyPolicyConsent,
  }) {
    return privacyPolicyConsent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Show value)? show,
    TResult? Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult? Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
  }) {
    return privacyPolicyConsent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Show value)? show,
    TResult Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (privacyPolicyConsent != null) {
      return privacyPolicyConsent(this);
    }
    return orElse();
  }
}

abstract class _PrivacyPolicyConsent implements AupTcEvent {
  const factory _PrivacyPolicyConsent({required final bool newValue}) =
      _$_PrivacyPolicyConsent;

  bool get newValue;
  @JsonKey(ignore: true)
  _$$_PrivacyPolicyConsentCopyWith<_$_PrivacyPolicyConsent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AupTcState {
  String get tncFile => throw _privateConstructorUsedError;
  String get privacyFile => throw _privateConstructorUsedError;
  bool get tncConsent => throw _privateConstructorUsedError;
  bool get privacyConsent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AupTcStateCopyWith<AupTcState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AupTcStateCopyWith<$Res> {
  factory $AupTcStateCopyWith(
          AupTcState value, $Res Function(AupTcState) then) =
      _$AupTcStateCopyWithImpl<$Res, AupTcState>;
  @useResult
  $Res call(
      {String tncFile,
      String privacyFile,
      bool tncConsent,
      bool privacyConsent});
}

/// @nodoc
class _$AupTcStateCopyWithImpl<$Res, $Val extends AupTcState>
    implements $AupTcStateCopyWith<$Res> {
  _$AupTcStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tncFile = null,
    Object? privacyFile = null,
    Object? tncConsent = null,
    Object? privacyConsent = null,
  }) {
    return _then(_value.copyWith(
      tncFile: null == tncFile
          ? _value.tncFile
          : tncFile // ignore: cast_nullable_to_non_nullable
              as String,
      privacyFile: null == privacyFile
          ? _value.privacyFile
          : privacyFile // ignore: cast_nullable_to_non_nullable
              as String,
      tncConsent: null == tncConsent
          ? _value.tncConsent
          : tncConsent // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyConsent: null == privacyConsent
          ? _value.privacyConsent
          : privacyConsent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AupTcStateCopyWith<$Res>
    implements $AupTcStateCopyWith<$Res> {
  factory _$$_AupTcStateCopyWith(
          _$_AupTcState value, $Res Function(_$_AupTcState) then) =
      __$$_AupTcStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tncFile,
      String privacyFile,
      bool tncConsent,
      bool privacyConsent});
}

/// @nodoc
class __$$_AupTcStateCopyWithImpl<$Res>
    extends _$AupTcStateCopyWithImpl<$Res, _$_AupTcState>
    implements _$$_AupTcStateCopyWith<$Res> {
  __$$_AupTcStateCopyWithImpl(
      _$_AupTcState _value, $Res Function(_$_AupTcState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tncFile = null,
    Object? privacyFile = null,
    Object? tncConsent = null,
    Object? privacyConsent = null,
  }) {
    return _then(_$_AupTcState(
      tncFile: null == tncFile
          ? _value.tncFile
          : tncFile // ignore: cast_nullable_to_non_nullable
              as String,
      privacyFile: null == privacyFile
          ? _value.privacyFile
          : privacyFile // ignore: cast_nullable_to_non_nullable
              as String,
      tncConsent: null == tncConsent
          ? _value.tncConsent
          : tncConsent // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyConsent: null == privacyConsent
          ? _value.privacyConsent
          : privacyConsent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AupTcState implements _AupTcState {
  const _$_AupTcState(
      {required this.tncFile,
      required this.privacyFile,
      required this.tncConsent,
      required this.privacyConsent});

  @override
  final String tncFile;
  @override
  final String privacyFile;
  @override
  final bool tncConsent;
  @override
  final bool privacyConsent;

  @override
  String toString() {
    return 'AupTcState(tncFile: $tncFile, privacyFile: $privacyFile, tncConsent: $tncConsent, privacyConsent: $privacyConsent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AupTcState &&
            (identical(other.tncFile, tncFile) || other.tncFile == tncFile) &&
            (identical(other.privacyFile, privacyFile) ||
                other.privacyFile == privacyFile) &&
            (identical(other.tncConsent, tncConsent) ||
                other.tncConsent == tncConsent) &&
            (identical(other.privacyConsent, privacyConsent) ||
                other.privacyConsent == privacyConsent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, tncFile, privacyFile, tncConsent, privacyConsent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AupTcStateCopyWith<_$_AupTcState> get copyWith =>
      __$$_AupTcStateCopyWithImpl<_$_AupTcState>(this, _$identity);
}

abstract class _AupTcState implements AupTcState {
  const factory _AupTcState(
      {required final String tncFile,
      required final String privacyFile,
      required final bool tncConsent,
      required final bool privacyConsent}) = _$_AupTcState;

  @override
  String get tncFile;
  @override
  String get privacyFile;
  @override
  bool get tncConsent;
  @override
  bool get privacyConsent;
  @override
  @JsonKey(ignore: true)
  _$$_AupTcStateCopyWith<_$_AupTcState> get copyWith =>
      throw _privateConstructorUsedError;
}
