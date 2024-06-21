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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$UserRestrictionListEventCopyWithImpl<$Res, _$InitializedImpl>
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
    return 'UserRestrictionListEvent.initialized()';
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
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$UserRestrictionListEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$FetchImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'UserRestrictionListEvent.fetch(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

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
  const factory _Fetch({required final SalesOrg salesOrg}) = _$FetchImpl;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSearchKeyImplCopyWith<$Res> {
  factory _$$UpdateSearchKeyImplCopyWith(_$UpdateSearchKeyImpl value,
          $Res Function(_$UpdateSearchKeyImpl) then) =
      __$$UpdateSearchKeyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchKey});
}

/// @nodoc
class __$$UpdateSearchKeyImplCopyWithImpl<$Res>
    extends _$UserRestrictionListEventCopyWithImpl<$Res, _$UpdateSearchKeyImpl>
    implements _$$UpdateSearchKeyImplCopyWith<$Res> {
  __$$UpdateSearchKeyImplCopyWithImpl(
      _$UpdateSearchKeyImpl _value, $Res Function(_$UpdateSearchKeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$UpdateSearchKeyImpl(
      null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateSearchKeyImpl implements _UpdateSearchKey {
  const _$UpdateSearchKeyImpl(this.searchKey);

  @override
  final String searchKey;

  @override
  String toString() {
    return 'UserRestrictionListEvent.updateSearchKey(searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSearchKeyImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSearchKeyImplCopyWith<_$UpdateSearchKeyImpl> get copyWith =>
      __$$UpdateSearchKeyImplCopyWithImpl<_$UpdateSearchKeyImpl>(
          this, _$identity);

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
  const factory _UpdateSearchKey(final String searchKey) =
      _$UpdateSearchKeyImpl;

  String get searchKey;
  @JsonKey(ignore: true)
  _$$UpdateSearchKeyImplCopyWith<_$UpdateSearchKeyImpl> get copyWith =>
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
abstract class _$$UserRestrictionStateImplCopyWith<$Res>
    implements $UserRestrictionListStateCopyWith<$Res> {
  factory _$$UserRestrictionStateImplCopyWith(_$UserRestrictionStateImpl value,
          $Res Function(_$UserRestrictionStateImpl) then) =
      __$$UserRestrictionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      String searchKey,
      List<String> usernames,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});
}

/// @nodoc
class __$$UserRestrictionStateImplCopyWithImpl<$Res>
    extends _$UserRestrictionListStateCopyWithImpl<$Res,
        _$UserRestrictionStateImpl>
    implements _$$UserRestrictionStateImplCopyWith<$Res> {
  __$$UserRestrictionStateImplCopyWithImpl(_$UserRestrictionStateImpl _value,
      $Res Function(_$UserRestrictionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? searchKey = null,
    Object? usernames = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$UserRestrictionStateImpl(
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

class _$UserRestrictionStateImpl extends _UserRestrictionState {
  _$UserRestrictionStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRestrictionStateImpl &&
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
  _$$UserRestrictionStateImplCopyWith<_$UserRestrictionStateImpl>
      get copyWith =>
          __$$UserRestrictionStateImplCopyWithImpl<_$UserRestrictionStateImpl>(
              this, _$identity);
}

abstract class _UserRestrictionState extends UserRestrictionListState {
  factory _UserRestrictionState(
      {required final bool isFetching,
      required final String searchKey,
      required final List<String> usernames,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$UserRestrictionStateImpl;
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
  _$$UserRestrictionStateImplCopyWith<_$UserRestrictionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
