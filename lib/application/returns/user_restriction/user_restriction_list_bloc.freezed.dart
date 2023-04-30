// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_restriction_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserRestrictionListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrg salesOrg) fetch,
    required TResult Function(String searchKey) updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg)? fetch,
    TResult? Function(String searchKey)? updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg)? fetch,
    TResult Function(String searchKey)? updateSearchKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionListEventCopyWith<$Res> {
  factory $UserRestrictionListEventCopyWith(UserRestrictionListEvent value,
          $Res Function(UserRestrictionListEvent) then) =
      _$UserRestrictionListEventCopyWithImpl<$Res, UserRestrictionListEvent>;
}

/// @nodoc
class _$UserRestrictionListEventCopyWithImpl<$Res,
        $Val extends UserRestrictionListEvent>
    implements $UserRestrictionListEventCopyWith<$Res> {
  _$UserRestrictionListEventCopyWithImpl(this._value, this._then);

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
    extends _$UserRestrictionListEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'UserRestrictionListEvent.initialized()';
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
    required TResult Function(SalesOrg salesOrg) fetch,
    required TResult Function(String searchKey) updateSearchKey,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg)? fetch,
    TResult? Function(String searchKey)? updateSearchKey,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg)? fetch,
    TResult Function(String searchKey)? updateSearchKey,
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
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements UserRestrictionListEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$UserRestrictionListEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$_Fetch(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'UserRestrictionListEvent.fetch(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrg salesOrg) fetch,
    required TResult Function(String searchKey) updateSearchKey,
  }) {
    return fetch(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg)? fetch,
    TResult? Function(String searchKey)? updateSearchKey,
  }) {
    return fetch?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg)? fetch,
    TResult Function(String searchKey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements UserRestrictionListEvent {
  const factory _Fetch({required final SalesOrg salesOrg}) = _$_Fetch;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateSearchKeyCopyWith<$Res> {
  factory _$$_UpdateSearchKeyCopyWith(
          _$_UpdateSearchKey value, $Res Function(_$_UpdateSearchKey) then) =
      __$$_UpdateSearchKeyCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchKey});
}

/// @nodoc
class __$$_UpdateSearchKeyCopyWithImpl<$Res>
    extends _$UserRestrictionListEventCopyWithImpl<$Res, _$_UpdateSearchKey>
    implements _$$_UpdateSearchKeyCopyWith<$Res> {
  __$$_UpdateSearchKeyCopyWithImpl(
      _$_UpdateSearchKey _value, $Res Function(_$_UpdateSearchKey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$_UpdateSearchKey(
      null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateSearchKey implements _UpdateSearchKey {
  const _$_UpdateSearchKey(this.searchKey);

  @override
  final String searchKey;

  @override
  String toString() {
    return 'UserRestrictionListEvent.updateSearchKey(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateSearchKey &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateSearchKeyCopyWith<_$_UpdateSearchKey> get copyWith =>
      __$$_UpdateSearchKeyCopyWithImpl<_$_UpdateSearchKey>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrg salesOrg) fetch,
    required TResult Function(String searchKey) updateSearchKey,
  }) {
    return updateSearchKey(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg)? fetch,
    TResult? Function(String searchKey)? updateSearchKey,
  }) {
    return updateSearchKey?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg)? fetch,
    TResult Function(String searchKey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
  }) {
    return updateSearchKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
  }) {
    return updateSearchKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(this);
    }
    return orElse();
  }
}

abstract class _UpdateSearchKey implements UserRestrictionListEvent {
  const factory _UpdateSearchKey(final String searchKey) = _$_UpdateSearchKey;

  String get searchKey;
  @JsonKey(ignore: true)
  _$$_UpdateSearchKeyCopyWith<_$_UpdateSearchKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserRestrictionListState {
  bool get isFetching => throw _privateConstructorUsedError;
  String get searchKey => throw _privateConstructorUsedError;
  List<String> get usernames => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRestrictionListStateCopyWith<UserRestrictionListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionListStateCopyWith<$Res> {
  factory $UserRestrictionListStateCopyWith(UserRestrictionListState value,
          $Res Function(UserRestrictionListState) then) =
      _$UserRestrictionListStateCopyWithImpl<$Res, UserRestrictionListState>;
  @useResult
  $Res call(
      {bool isFetching,
      String searchKey,
      List<String> usernames,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});
}

/// @nodoc
class _$UserRestrictionListStateCopyWithImpl<$Res,
        $Val extends UserRestrictionListState>
    implements $UserRestrictionListStateCopyWith<$Res> {
  _$UserRestrictionListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? searchKey = null,
    Object? usernames = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      usernames: null == usernames
          ? _value.usernames
          : usernames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRestrictionStateCopyWith<$Res>
    implements $UserRestrictionListStateCopyWith<$Res> {
  factory _$$_UserRestrictionStateCopyWith(_$_UserRestrictionState value,
          $Res Function(_$_UserRestrictionState) then) =
      __$$_UserRestrictionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      String searchKey,
      List<String> usernames,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});
}

/// @nodoc
class __$$_UserRestrictionStateCopyWithImpl<$Res>
    extends _$UserRestrictionListStateCopyWithImpl<$Res,
        _$_UserRestrictionState>
    implements _$$_UserRestrictionStateCopyWith<$Res> {
  __$$_UserRestrictionStateCopyWithImpl(_$_UserRestrictionState _value,
      $Res Function(_$_UserRestrictionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? searchKey = null,
    Object? usernames = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$_UserRestrictionState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      usernames: null == usernames
          ? _value._usernames
          : usernames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_UserRestrictionState extends _UserRestrictionState {
  _$_UserRestrictionState(
      {required this.isFetching,
      required this.searchKey,
      required final List<String> usernames,
      required this.apiFailureOrSuccessOption})
      : _usernames = usernames,
        super._();

  @override
  final bool isFetching;
  @override
  final String searchKey;
  final List<String> _usernames;
  @override
  List<String> get usernames {
    if (_usernames is EqualUnmodifiableListView) return _usernames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usernames);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'UserRestrictionListState(isFetching: $isFetching, searchKey: $searchKey, usernames: $usernames, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRestrictionState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            const DeepCollectionEquality()
                .equals(other._usernames, _usernames) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      searchKey,
      const DeepCollectionEquality().hash(_usernames),
      apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRestrictionStateCopyWith<_$_UserRestrictionState> get copyWith =>
      __$$_UserRestrictionStateCopyWithImpl<_$_UserRestrictionState>(
          this, _$identity);
}

abstract class _UserRestrictionState extends UserRestrictionListState {
  factory _UserRestrictionState(
      {required final bool isFetching,
      required final String searchKey,
      required final List<String> usernames,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_UserRestrictionState;
  _UserRestrictionState._() : super._();

  @override
  bool get isFetching;
  @override
  String get searchKey;
  @override
  List<String> get usernames;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_UserRestrictionStateCopyWith<_$_UserRestrictionState> get copyWith =>
      throw _privateConstructorUsedError;
}
