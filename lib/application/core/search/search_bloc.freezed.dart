// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) searchTextChanged,
    required TResult Function(String searchText) searchTextSubmitted,
    required TResult Function() clearSearchText,
    required TResult Function(bool isSearchInProgress) resetSearchInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? searchTextChanged,
    TResult Function(String searchText)? searchTextSubmitted,
    TResult Function()? clearSearchText,
    TResult Function(bool isSearchInProgress)? resetSearchInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? searchTextChanged,
    TResult Function(String searchText)? searchTextSubmitted,
    TResult Function()? clearSearchText,
    TResult Function(bool isSearchInProgress)? resetSearchInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchTextChanged value) searchTextChanged,
    required TResult Function(_SearchTextSubmitted value) searchTextSubmitted,
    required TResult Function(_ClearSearchText value) clearSearchText,
    required TResult Function(_ResetSearchInProgress value)
        resetSearchInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchTextChanged value)? searchTextChanged,
    TResult Function(_SearchTextSubmitted value)? searchTextSubmitted,
    TResult Function(_ClearSearchText value)? clearSearchText,
    TResult Function(_ResetSearchInProgress value)? resetSearchInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchTextChanged value)? searchTextChanged,
    TResult Function(_SearchTextSubmitted value)? searchTextSubmitted,
    TResult Function(_ClearSearchText value)? clearSearchText,
    TResult Function(_ResetSearchInProgress value)? resetSearchInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res> implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  final SearchEvent _value;
  // ignore: unused_field
  final $Res Function(SearchEvent) _then;
}

/// @nodoc
abstract class _$$_SearchTextChangedCopyWith<$Res> {
  factory _$$_SearchTextChangedCopyWith(_$_SearchTextChanged value,
          $Res Function(_$_SearchTextChanged) then) =
      __$$_SearchTextChangedCopyWithImpl<$Res>;
  $Res call({String searchText});
}

/// @nodoc
class __$$_SearchTextChangedCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_SearchTextChangedCopyWith<$Res> {
  __$$_SearchTextChangedCopyWithImpl(
      _$_SearchTextChanged _value, $Res Function(_$_SearchTextChanged) _then)
      : super(_value, (v) => _then(v as _$_SearchTextChanged));

  @override
  _$_SearchTextChanged get _value => super._value as _$_SearchTextChanged;

  @override
  $Res call({
    Object? searchText = freezed,
  }) {
    return _then(_$_SearchTextChanged(
      searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchTextChanged implements _SearchTextChanged {
  const _$_SearchTextChanged(this.searchText);

  @override
  final String searchText;

  @override
  String toString() {
    return 'SearchEvent.searchTextChanged(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchTextChanged &&
            const DeepCollectionEquality()
                .equals(other.searchText, searchText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(searchText));

  @JsonKey(ignore: true)
  @override
  _$$_SearchTextChangedCopyWith<_$_SearchTextChanged> get copyWith =>
      __$$_SearchTextChangedCopyWithImpl<_$_SearchTextChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) searchTextChanged,
    required TResult Function(String searchText) searchTextSubmitted,
    required TResult Function() clearSearchText,
    required TResult Function(bool isSearchInProgress) resetSearchInProgress,
  }) {
    return searchTextChanged(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? searchTextChanged,
    TResult Function(String searchText)? searchTextSubmitted,
    TResult Function()? clearSearchText,
    TResult Function(bool isSearchInProgress)? resetSearchInProgress,
  }) {
    return searchTextChanged?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? searchTextChanged,
    TResult Function(String searchText)? searchTextSubmitted,
    TResult Function()? clearSearchText,
    TResult Function(bool isSearchInProgress)? resetSearchInProgress,
    required TResult orElse(),
  }) {
    if (searchTextChanged != null) {
      return searchTextChanged(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchTextChanged value) searchTextChanged,
    required TResult Function(_SearchTextSubmitted value) searchTextSubmitted,
    required TResult Function(_ClearSearchText value) clearSearchText,
    required TResult Function(_ResetSearchInProgress value)
        resetSearchInProgress,
  }) {
    return searchTextChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchTextChanged value)? searchTextChanged,
    TResult Function(_SearchTextSubmitted value)? searchTextSubmitted,
    TResult Function(_ClearSearchText value)? clearSearchText,
    TResult Function(_ResetSearchInProgress value)? resetSearchInProgress,
  }) {
    return searchTextChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchTextChanged value)? searchTextChanged,
    TResult Function(_SearchTextSubmitted value)? searchTextSubmitted,
    TResult Function(_ClearSearchText value)? clearSearchText,
    TResult Function(_ResetSearchInProgress value)? resetSearchInProgress,
    required TResult orElse(),
  }) {
    if (searchTextChanged != null) {
      return searchTextChanged(this);
    }
    return orElse();
  }
}

abstract class _SearchTextChanged implements SearchEvent {
  const factory _SearchTextChanged(final String searchText) =
      _$_SearchTextChanged;

  String get searchText;
  @JsonKey(ignore: true)
  _$$_SearchTextChangedCopyWith<_$_SearchTextChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchTextSubmittedCopyWith<$Res> {
  factory _$$_SearchTextSubmittedCopyWith(_$_SearchTextSubmitted value,
          $Res Function(_$_SearchTextSubmitted) then) =
      __$$_SearchTextSubmittedCopyWithImpl<$Res>;
  $Res call({String searchText});
}

/// @nodoc
class __$$_SearchTextSubmittedCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_SearchTextSubmittedCopyWith<$Res> {
  __$$_SearchTextSubmittedCopyWithImpl(_$_SearchTextSubmitted _value,
      $Res Function(_$_SearchTextSubmitted) _then)
      : super(_value, (v) => _then(v as _$_SearchTextSubmitted));

  @override
  _$_SearchTextSubmitted get _value => super._value as _$_SearchTextSubmitted;

  @override
  $Res call({
    Object? searchText = freezed,
  }) {
    return _then(_$_SearchTextSubmitted(
      searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchTextSubmitted implements _SearchTextSubmitted {
  const _$_SearchTextSubmitted(this.searchText);

  @override
  final String searchText;

  @override
  String toString() {
    return 'SearchEvent.searchTextSubmitted(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchTextSubmitted &&
            const DeepCollectionEquality()
                .equals(other.searchText, searchText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(searchText));

  @JsonKey(ignore: true)
  @override
  _$$_SearchTextSubmittedCopyWith<_$_SearchTextSubmitted> get copyWith =>
      __$$_SearchTextSubmittedCopyWithImpl<_$_SearchTextSubmitted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) searchTextChanged,
    required TResult Function(String searchText) searchTextSubmitted,
    required TResult Function() clearSearchText,
    required TResult Function(bool isSearchInProgress) resetSearchInProgress,
  }) {
    return searchTextSubmitted(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? searchTextChanged,
    TResult Function(String searchText)? searchTextSubmitted,
    TResult Function()? clearSearchText,
    TResult Function(bool isSearchInProgress)? resetSearchInProgress,
  }) {
    return searchTextSubmitted?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? searchTextChanged,
    TResult Function(String searchText)? searchTextSubmitted,
    TResult Function()? clearSearchText,
    TResult Function(bool isSearchInProgress)? resetSearchInProgress,
    required TResult orElse(),
  }) {
    if (searchTextSubmitted != null) {
      return searchTextSubmitted(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchTextChanged value) searchTextChanged,
    required TResult Function(_SearchTextSubmitted value) searchTextSubmitted,
    required TResult Function(_ClearSearchText value) clearSearchText,
    required TResult Function(_ResetSearchInProgress value)
        resetSearchInProgress,
  }) {
    return searchTextSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchTextChanged value)? searchTextChanged,
    TResult Function(_SearchTextSubmitted value)? searchTextSubmitted,
    TResult Function(_ClearSearchText value)? clearSearchText,
    TResult Function(_ResetSearchInProgress value)? resetSearchInProgress,
  }) {
    return searchTextSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchTextChanged value)? searchTextChanged,
    TResult Function(_SearchTextSubmitted value)? searchTextSubmitted,
    TResult Function(_ClearSearchText value)? clearSearchText,
    TResult Function(_ResetSearchInProgress value)? resetSearchInProgress,
    required TResult orElse(),
  }) {
    if (searchTextSubmitted != null) {
      return searchTextSubmitted(this);
    }
    return orElse();
  }
}

abstract class _SearchTextSubmitted implements SearchEvent {
  const factory _SearchTextSubmitted(final String searchText) =
      _$_SearchTextSubmitted;

  String get searchText;
  @JsonKey(ignore: true)
  _$$_SearchTextSubmittedCopyWith<_$_SearchTextSubmitted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearSearchTextCopyWith<$Res> {
  factory _$$_ClearSearchTextCopyWith(
          _$_ClearSearchText value, $Res Function(_$_ClearSearchText) then) =
      __$$_ClearSearchTextCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearSearchTextCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_ClearSearchTextCopyWith<$Res> {
  __$$_ClearSearchTextCopyWithImpl(
      _$_ClearSearchText _value, $Res Function(_$_ClearSearchText) _then)
      : super(_value, (v) => _then(v as _$_ClearSearchText));

  @override
  _$_ClearSearchText get _value => super._value as _$_ClearSearchText;
}

/// @nodoc

class _$_ClearSearchText implements _ClearSearchText {
  const _$_ClearSearchText();

  @override
  String toString() {
    return 'SearchEvent.clearSearchText()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearSearchText);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) searchTextChanged,
    required TResult Function(String searchText) searchTextSubmitted,
    required TResult Function() clearSearchText,
    required TResult Function(bool isSearchInProgress) resetSearchInProgress,
  }) {
    return clearSearchText();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? searchTextChanged,
    TResult Function(String searchText)? searchTextSubmitted,
    TResult Function()? clearSearchText,
    TResult Function(bool isSearchInProgress)? resetSearchInProgress,
  }) {
    return clearSearchText?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? searchTextChanged,
    TResult Function(String searchText)? searchTextSubmitted,
    TResult Function()? clearSearchText,
    TResult Function(bool isSearchInProgress)? resetSearchInProgress,
    required TResult orElse(),
  }) {
    if (clearSearchText != null) {
      return clearSearchText();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchTextChanged value) searchTextChanged,
    required TResult Function(_SearchTextSubmitted value) searchTextSubmitted,
    required TResult Function(_ClearSearchText value) clearSearchText,
    required TResult Function(_ResetSearchInProgress value)
        resetSearchInProgress,
  }) {
    return clearSearchText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchTextChanged value)? searchTextChanged,
    TResult Function(_SearchTextSubmitted value)? searchTextSubmitted,
    TResult Function(_ClearSearchText value)? clearSearchText,
    TResult Function(_ResetSearchInProgress value)? resetSearchInProgress,
  }) {
    return clearSearchText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchTextChanged value)? searchTextChanged,
    TResult Function(_SearchTextSubmitted value)? searchTextSubmitted,
    TResult Function(_ClearSearchText value)? clearSearchText,
    TResult Function(_ResetSearchInProgress value)? resetSearchInProgress,
    required TResult orElse(),
  }) {
    if (clearSearchText != null) {
      return clearSearchText(this);
    }
    return orElse();
  }
}

abstract class _ClearSearchText implements SearchEvent {
  const factory _ClearSearchText() = _$_ClearSearchText;
}

/// @nodoc
abstract class _$$_ResetSearchInProgressCopyWith<$Res> {
  factory _$$_ResetSearchInProgressCopyWith(_$_ResetSearchInProgress value,
          $Res Function(_$_ResetSearchInProgress) then) =
      __$$_ResetSearchInProgressCopyWithImpl<$Res>;
  $Res call({bool isSearchInProgress});
}

/// @nodoc
class __$$_ResetSearchInProgressCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_ResetSearchInProgressCopyWith<$Res> {
  __$$_ResetSearchInProgressCopyWithImpl(_$_ResetSearchInProgress _value,
      $Res Function(_$_ResetSearchInProgress) _then)
      : super(_value, (v) => _then(v as _$_ResetSearchInProgress));

  @override
  _$_ResetSearchInProgress get _value =>
      super._value as _$_ResetSearchInProgress;

  @override
  $Res call({
    Object? isSearchInProgress = freezed,
  }) {
    return _then(_$_ResetSearchInProgress(
      isSearchInProgress == freezed
          ? _value.isSearchInProgress
          : isSearchInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ResetSearchInProgress implements _ResetSearchInProgress {
  const _$_ResetSearchInProgress(this.isSearchInProgress);

  @override
  final bool isSearchInProgress;

  @override
  String toString() {
    return 'SearchEvent.resetSearchInProgress(isSearchInProgress: $isSearchInProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetSearchInProgress &&
            const DeepCollectionEquality()
                .equals(other.isSearchInProgress, isSearchInProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isSearchInProgress));

  @JsonKey(ignore: true)
  @override
  _$$_ResetSearchInProgressCopyWith<_$_ResetSearchInProgress> get copyWith =>
      __$$_ResetSearchInProgressCopyWithImpl<_$_ResetSearchInProgress>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchText) searchTextChanged,
    required TResult Function(String searchText) searchTextSubmitted,
    required TResult Function() clearSearchText,
    required TResult Function(bool isSearchInProgress) resetSearchInProgress,
  }) {
    return resetSearchInProgress(isSearchInProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String searchText)? searchTextChanged,
    TResult Function(String searchText)? searchTextSubmitted,
    TResult Function()? clearSearchText,
    TResult Function(bool isSearchInProgress)? resetSearchInProgress,
  }) {
    return resetSearchInProgress?.call(isSearchInProgress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchText)? searchTextChanged,
    TResult Function(String searchText)? searchTextSubmitted,
    TResult Function()? clearSearchText,
    TResult Function(bool isSearchInProgress)? resetSearchInProgress,
    required TResult orElse(),
  }) {
    if (resetSearchInProgress != null) {
      return resetSearchInProgress(isSearchInProgress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchTextChanged value) searchTextChanged,
    required TResult Function(_SearchTextSubmitted value) searchTextSubmitted,
    required TResult Function(_ClearSearchText value) clearSearchText,
    required TResult Function(_ResetSearchInProgress value)
        resetSearchInProgress,
  }) {
    return resetSearchInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchTextChanged value)? searchTextChanged,
    TResult Function(_SearchTextSubmitted value)? searchTextSubmitted,
    TResult Function(_ClearSearchText value)? clearSearchText,
    TResult Function(_ResetSearchInProgress value)? resetSearchInProgress,
  }) {
    return resetSearchInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchTextChanged value)? searchTextChanged,
    TResult Function(_SearchTextSubmitted value)? searchTextSubmitted,
    TResult Function(_ClearSearchText value)? clearSearchText,
    TResult Function(_ResetSearchInProgress value)? resetSearchInProgress,
    required TResult orElse(),
  }) {
    if (resetSearchInProgress != null) {
      return resetSearchInProgress(this);
    }
    return orElse();
  }
}

abstract class _ResetSearchInProgress implements SearchEvent {
  const factory _ResetSearchInProgress(final bool isSearchInProgress) =
      _$_ResetSearchInProgress;

  bool get isSearchInProgress;
  @JsonKey(ignore: true)
  _$$_ResetSearchInProgressCopyWith<_$_ResetSearchInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  String get searchText => throw _privateConstructorUsedError;
  bool get isSearchInProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call({String searchText, bool isSearchInProgress});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? searchText = freezed,
    Object? isSearchInProgress = freezed,
  }) {
    return _then(_value.copyWith(
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      isSearchInProgress: isSearchInProgress == freezed
          ? _value.isSearchInProgress
          : isSearchInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  $Res call({String searchText, bool isSearchInProgress});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, (v) => _then(v as _$_SearchState));

  @override
  _$_SearchState get _value => super._value as _$_SearchState;

  @override
  $Res call({
    Object? searchText = freezed,
    Object? isSearchInProgress = freezed,
  }) {
    return _then(_$_SearchState(
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      isSearchInProgress: isSearchInProgress == freezed
          ? _value.isSearchInProgress
          : isSearchInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {required this.searchText, required this.isSearchInProgress});

  @override
  final String searchText;
  @override
  final bool isSearchInProgress;

  @override
  String toString() {
    return 'SearchState(searchText: $searchText, isSearchInProgress: $isSearchInProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            const DeepCollectionEquality()
                .equals(other.searchText, searchText) &&
            const DeepCollectionEquality()
                .equals(other.isSearchInProgress, isSearchInProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(searchText),
      const DeepCollectionEquality().hash(isSearchInProgress));

  @JsonKey(ignore: true)
  @override
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required final String searchText,
      required final bool isSearchInProgress}) = _$_SearchState;

  @override
  String get searchText;
  @override
  bool get isSearchInProgress;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
