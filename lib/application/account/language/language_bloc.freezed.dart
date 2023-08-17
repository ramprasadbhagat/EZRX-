// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LanguageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            List<Language> languages, Language defaultLanguage)
        setLanguages,
    required TResult Function(Language language) changeLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<Language> languages, Language defaultLanguage)?
        setLanguages,
    TResult? Function(Language language)? changeLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<Language> languages, Language defaultLanguage)?
        setLanguages,
    TResult Function(Language language)? changeLanguage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SetLanguages value) setLanguages,
    required TResult Function(_ChangeLanguage value) changeLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SetLanguages value)? setLanguages,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SetLanguages value)? setLanguages,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageEventCopyWith<$Res> {
  factory $LanguageEventCopyWith(
          LanguageEvent value, $Res Function(LanguageEvent) then) =
      _$LanguageEventCopyWithImpl<$Res, LanguageEvent>;
}

/// @nodoc
class _$LanguageEventCopyWithImpl<$Res, $Val extends LanguageEvent>
    implements $LanguageEventCopyWith<$Res> {
  _$LanguageEventCopyWithImpl(this._value, this._then);

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
    extends _$LanguageEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'LanguageEvent.initialized()';
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
    required TResult Function(
            List<Language> languages, Language defaultLanguage)
        setLanguages,
    required TResult Function(Language language) changeLanguage,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<Language> languages, Language defaultLanguage)?
        setLanguages,
    TResult? Function(Language language)? changeLanguage,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<Language> languages, Language defaultLanguage)?
        setLanguages,
    TResult Function(Language language)? changeLanguage,
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
    required TResult Function(_SetLanguages value) setLanguages,
    required TResult Function(_ChangeLanguage value) changeLanguage,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SetLanguages value)? setLanguages,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SetLanguages value)? setLanguages,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements LanguageEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_SetLanguagesCopyWith<$Res> {
  factory _$$_SetLanguagesCopyWith(
          _$_SetLanguages value, $Res Function(_$_SetLanguages) then) =
      __$$_SetLanguagesCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Language> languages, Language defaultLanguage});

  $LanguageCopyWith<$Res> get defaultLanguage;
}

/// @nodoc
class __$$_SetLanguagesCopyWithImpl<$Res>
    extends _$LanguageEventCopyWithImpl<$Res, _$_SetLanguages>
    implements _$$_SetLanguagesCopyWith<$Res> {
  __$$_SetLanguagesCopyWithImpl(
      _$_SetLanguages _value, $Res Function(_$_SetLanguages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = null,
    Object? defaultLanguage = null,
  }) {
    return _then(_$_SetLanguages(
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      defaultLanguage: null == defaultLanguage
          ? _value.defaultLanguage
          : defaultLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageCopyWith<$Res> get defaultLanguage {
    return $LanguageCopyWith<$Res>(_value.defaultLanguage, (value) {
      return _then(_value.copyWith(defaultLanguage: value));
    });
  }
}

/// @nodoc

class _$_SetLanguages implements _SetLanguages {
  const _$_SetLanguages(
      {required final List<Language> languages, required this.defaultLanguage})
      : _languages = languages;

  final List<Language> _languages;
  @override
  List<Language> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  final Language defaultLanguage;

  @override
  String toString() {
    return 'LanguageEvent.setLanguages(languages: $languages, defaultLanguage: $defaultLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetLanguages &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.defaultLanguage, defaultLanguage) ||
                other.defaultLanguage == defaultLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_languages), defaultLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetLanguagesCopyWith<_$_SetLanguages> get copyWith =>
      __$$_SetLanguagesCopyWithImpl<_$_SetLanguages>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            List<Language> languages, Language defaultLanguage)
        setLanguages,
    required TResult Function(Language language) changeLanguage,
  }) {
    return setLanguages(languages, defaultLanguage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<Language> languages, Language defaultLanguage)?
        setLanguages,
    TResult? Function(Language language)? changeLanguage,
  }) {
    return setLanguages?.call(languages, defaultLanguage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<Language> languages, Language defaultLanguage)?
        setLanguages,
    TResult Function(Language language)? changeLanguage,
    required TResult orElse(),
  }) {
    if (setLanguages != null) {
      return setLanguages(languages, defaultLanguage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SetLanguages value) setLanguages,
    required TResult Function(_ChangeLanguage value) changeLanguage,
  }) {
    return setLanguages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SetLanguages value)? setLanguages,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
  }) {
    return setLanguages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SetLanguages value)? setLanguages,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    required TResult orElse(),
  }) {
    if (setLanguages != null) {
      return setLanguages(this);
    }
    return orElse();
  }
}

abstract class _SetLanguages implements LanguageEvent {
  const factory _SetLanguages(
      {required final List<Language> languages,
      required final Language defaultLanguage}) = _$_SetLanguages;

  List<Language> get languages;
  Language get defaultLanguage;
  @JsonKey(ignore: true)
  _$$_SetLanguagesCopyWith<_$_SetLanguages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeLanguageCopyWith<$Res> {
  factory _$$_ChangeLanguageCopyWith(
          _$_ChangeLanguage value, $Res Function(_$_ChangeLanguage) then) =
      __$$_ChangeLanguageCopyWithImpl<$Res>;
  @useResult
  $Res call({Language language});

  $LanguageCopyWith<$Res> get language;
}

/// @nodoc
class __$$_ChangeLanguageCopyWithImpl<$Res>
    extends _$LanguageEventCopyWithImpl<$Res, _$_ChangeLanguage>
    implements _$$_ChangeLanguageCopyWith<$Res> {
  __$$_ChangeLanguageCopyWithImpl(
      _$_ChangeLanguage _value, $Res Function(_$_ChangeLanguage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$_ChangeLanguage(
      null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageCopyWith<$Res> get language {
    return $LanguageCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value));
    });
  }
}

/// @nodoc

class _$_ChangeLanguage implements _ChangeLanguage {
  const _$_ChangeLanguage(this.language);

  @override
  final Language language;

  @override
  String toString() {
    return 'LanguageEvent.changeLanguage(language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeLanguage &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeLanguageCopyWith<_$_ChangeLanguage> get copyWith =>
      __$$_ChangeLanguageCopyWithImpl<_$_ChangeLanguage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            List<Language> languages, Language defaultLanguage)
        setLanguages,
    required TResult Function(Language language) changeLanguage,
  }) {
    return changeLanguage(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<Language> languages, Language defaultLanguage)?
        setLanguages,
    TResult? Function(Language language)? changeLanguage,
  }) {
    return changeLanguage?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<Language> languages, Language defaultLanguage)?
        setLanguages,
    TResult Function(Language language)? changeLanguage,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SetLanguages value) setLanguages,
    required TResult Function(_ChangeLanguage value) changeLanguage,
  }) {
    return changeLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SetLanguages value)? setLanguages,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
  }) {
    return changeLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SetLanguages value)? setLanguages,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(this);
    }
    return orElse();
  }
}

abstract class _ChangeLanguage implements LanguageEvent {
  const factory _ChangeLanguage(final Language language) = _$_ChangeLanguage;

  Language get language;
  @JsonKey(ignore: true)
  _$$_ChangeLanguageCopyWith<_$_ChangeLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LanguageState {
  List<Language> get languages => throw _privateConstructorUsedError;
  Language get activeLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LanguageStateCopyWith<LanguageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageStateCopyWith<$Res> {
  factory $LanguageStateCopyWith(
          LanguageState value, $Res Function(LanguageState) then) =
      _$LanguageStateCopyWithImpl<$Res, LanguageState>;
  @useResult
  $Res call({List<Language> languages, Language activeLanguage});

  $LanguageCopyWith<$Res> get activeLanguage;
}

/// @nodoc
class _$LanguageStateCopyWithImpl<$Res, $Val extends LanguageState>
    implements $LanguageStateCopyWith<$Res> {
  _$LanguageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = null,
    Object? activeLanguage = null,
  }) {
    return _then(_value.copyWith(
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      activeLanguage: null == activeLanguage
          ? _value.activeLanguage
          : activeLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageCopyWith<$Res> get activeLanguage {
    return $LanguageCopyWith<$Res>(_value.activeLanguage, (value) {
      return _then(_value.copyWith(activeLanguage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LanguageStateCopyWith<$Res>
    implements $LanguageStateCopyWith<$Res> {
  factory _$$_LanguageStateCopyWith(
          _$_LanguageState value, $Res Function(_$_LanguageState) then) =
      __$$_LanguageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Language> languages, Language activeLanguage});

  @override
  $LanguageCopyWith<$Res> get activeLanguage;
}

/// @nodoc
class __$$_LanguageStateCopyWithImpl<$Res>
    extends _$LanguageStateCopyWithImpl<$Res, _$_LanguageState>
    implements _$$_LanguageStateCopyWith<$Res> {
  __$$_LanguageStateCopyWithImpl(
      _$_LanguageState _value, $Res Function(_$_LanguageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = null,
    Object? activeLanguage = null,
  }) {
    return _then(_$_LanguageState(
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      activeLanguage: null == activeLanguage
          ? _value.activeLanguage
          : activeLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
    ));
  }
}

/// @nodoc

class _$_LanguageState implements _LanguageState {
  const _$_LanguageState(
      {required final List<Language> languages, required this.activeLanguage})
      : _languages = languages;

  final List<Language> _languages;
  @override
  List<Language> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  final Language activeLanguage;

  @override
  String toString() {
    return 'LanguageState(languages: $languages, activeLanguage: $activeLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LanguageState &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.activeLanguage, activeLanguage) ||
                other.activeLanguage == activeLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_languages), activeLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanguageStateCopyWith<_$_LanguageState> get copyWith =>
      __$$_LanguageStateCopyWithImpl<_$_LanguageState>(this, _$identity);
}

abstract class _LanguageState implements LanguageState {
  const factory _LanguageState(
      {required final List<Language> languages,
      required final Language activeLanguage}) = _$_LanguageState;

  @override
  List<Language> get languages;
  @override
  Language get activeLanguage;
  @override
  @JsonKey(ignore: true)
  _$$_LanguageStateCopyWith<_$_LanguageState> get copyWith =>
      throw _privateConstructorUsedError;
}
