// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerCodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(String searchText) fetch,
    required TResult Function(SearchKey searchValue) search,
    required TResult Function() loadMore,
    required TResult Function(String searchText) deletedSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(String searchText)? fetch,
    TResult? Function(SearchKey searchValue)? search,
    TResult? Function()? loadMore,
    TResult? Function(String searchText)? deletedSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(String searchText)? fetch,
    TResult Function(SearchKey searchValue)? search,
    TResult Function()? loadMore,
    TResult Function(String searchText)? deletedSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DeletedSearch value) deletedSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DeletedSearch value)? deletedSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DeletedSearch value)? deletedSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCodeEventCopyWith<$Res> {
  factory $CustomerCodeEventCopyWith(
          CustomerCodeEvent value, $Res Function(CustomerCodeEvent) then) =
      _$CustomerCodeEventCopyWithImpl<$Res, CustomerCodeEvent>;
}

/// @nodoc
class _$CustomerCodeEventCopyWithImpl<$Res, $Val extends CustomerCodeEvent>
    implements $CustomerCodeEventCopyWith<$Res> {
  _$CustomerCodeEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call(
      {bool hideCustomer, User userInfo, SalesOrganisation selectedSalesOrg});

  $UserCopyWith<$Res> get userInfo;
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrg;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$CustomerCodeEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideCustomer = null,
    Object? userInfo = null,
    Object? selectedSalesOrg = null,
  }) {
    return _then(_$_Initialized(
      hideCustomer: null == hideCustomer
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
      selectedSalesOrg: null == selectedSalesOrg
          ? _value.selectedSalesOrg
          : selectedSalesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get userInfo {
    return $UserCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrg {
    return $SalesOrganisationCopyWith<$Res>(_value.selectedSalesOrg, (value) {
      return _then(_value.copyWith(selectedSalesOrg: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.hideCustomer,
      required this.userInfo,
      required this.selectedSalesOrg});

  @override
  final bool hideCustomer;
  @override
  final User userInfo;
  @override
  final SalesOrganisation selectedSalesOrg;

  @override
  String toString() {
    return 'CustomerCodeEvent.initialized(hideCustomer: $hideCustomer, userInfo: $userInfo, selectedSalesOrg: $selectedSalesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.hideCustomer, hideCustomer) ||
                other.hideCustomer == hideCustomer) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.selectedSalesOrg, selectedSalesOrg) ||
                other.selectedSalesOrg == selectedSalesOrg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hideCustomer, userInfo, selectedSalesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(String searchText) fetch,
    required TResult Function(SearchKey searchValue) search,
    required TResult Function() loadMore,
    required TResult Function(String searchText) deletedSearch,
  }) {
    return initialized(hideCustomer, userInfo, selectedSalesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(String searchText)? fetch,
    TResult? Function(SearchKey searchValue)? search,
    TResult? Function()? loadMore,
    TResult? Function(String searchText)? deletedSearch,
  }) {
    return initialized?.call(hideCustomer, userInfo, selectedSalesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(String searchText)? fetch,
    TResult Function(SearchKey searchValue)? search,
    TResult Function()? loadMore,
    TResult Function(String searchText)? deletedSearch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(hideCustomer, userInfo, selectedSalesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DeletedSearch value) deletedSearch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DeletedSearch value)? deletedSearch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DeletedSearch value)? deletedSearch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CustomerCodeEvent {
  const factory _Initialized(
      {required final bool hideCustomer,
      required final User userInfo,
      required final SalesOrganisation selectedSalesOrg}) = _$_Initialized;

  bool get hideCustomer;
  User get userInfo;
  SalesOrganisation get selectedSalesOrg;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$CustomerCodeEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$_Fetch(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({this.searchText = ''});

  @override
  @JsonKey()
  final String searchText;

  @override
  String toString() {
    return 'CustomerCodeEvent.fetch(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(String searchText) fetch,
    required TResult Function(SearchKey searchValue) search,
    required TResult Function() loadMore,
    required TResult Function(String searchText) deletedSearch,
  }) {
    return fetch(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(String searchText)? fetch,
    TResult? Function(SearchKey searchValue)? search,
    TResult? Function()? loadMore,
    TResult? Function(String searchText)? deletedSearch,
  }) {
    return fetch?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(String searchText)? fetch,
    TResult Function(SearchKey searchValue)? search,
    TResult Function()? loadMore,
    TResult Function(String searchText)? deletedSearch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DeletedSearch value) deletedSearch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DeletedSearch value)? deletedSearch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DeletedSearch value)? deletedSearch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements CustomerCodeEvent {
  const factory _Fetch({final String searchText}) = _$_Fetch;

  String get searchText;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchCopyWith<$Res> {
  factory _$$_SearchCopyWith(_$_Search value, $Res Function(_$_Search) then) =
      __$$_SearchCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchValue});
}

/// @nodoc
class __$$_SearchCopyWithImpl<$Res>
    extends _$CustomerCodeEventCopyWithImpl<$Res, _$_Search>
    implements _$$_SearchCopyWith<$Res> {
  __$$_SearchCopyWithImpl(_$_Search _value, $Res Function(_$_Search) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchValue = null,
  }) {
    return _then(_$_Search(
      searchValue: null == searchValue
          ? _value.searchValue
          : searchValue // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_Search implements _Search {
  const _$_Search({required this.searchValue});

  @override
  final SearchKey searchValue;

  @override
  String toString() {
    return 'CustomerCodeEvent.search(searchValue: $searchValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Search &&
            (identical(other.searchValue, searchValue) ||
                other.searchValue == searchValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      __$$_SearchCopyWithImpl<_$_Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(String searchText) fetch,
    required TResult Function(SearchKey searchValue) search,
    required TResult Function() loadMore,
    required TResult Function(String searchText) deletedSearch,
  }) {
    return search(searchValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(String searchText)? fetch,
    TResult? Function(SearchKey searchValue)? search,
    TResult? Function()? loadMore,
    TResult? Function(String searchText)? deletedSearch,
  }) {
    return search?.call(searchValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(String searchText)? fetch,
    TResult Function(SearchKey searchValue)? search,
    TResult Function()? loadMore,
    TResult Function(String searchText)? deletedSearch,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DeletedSearch value) deletedSearch,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DeletedSearch value)? deletedSearch,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DeletedSearch value)? deletedSearch,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements CustomerCodeEvent {
  const factory _Search({required final SearchKey searchValue}) = _$_Search;

  SearchKey get searchValue;
  @JsonKey(ignore: true)
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$CustomerCodeEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore();

  @override
  String toString() {
    return 'CustomerCodeEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(String searchText) fetch,
    required TResult Function(SearchKey searchValue) search,
    required TResult Function() loadMore,
    required TResult Function(String searchText) deletedSearch,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(String searchText)? fetch,
    TResult? Function(SearchKey searchValue)? search,
    TResult? Function()? loadMore,
    TResult? Function(String searchText)? deletedSearch,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(String searchText)? fetch,
    TResult Function(SearchKey searchValue)? search,
    TResult Function()? loadMore,
    TResult Function(String searchText)? deletedSearch,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DeletedSearch value) deletedSearch,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DeletedSearch value)? deletedSearch,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DeletedSearch value)? deletedSearch,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements CustomerCodeEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
abstract class _$$_DeletedSearchCopyWith<$Res> {
  factory _$$_DeletedSearchCopyWith(
          _$_DeletedSearch value, $Res Function(_$_DeletedSearch) then) =
      __$$_DeletedSearchCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchText});
}

/// @nodoc
class __$$_DeletedSearchCopyWithImpl<$Res>
    extends _$CustomerCodeEventCopyWithImpl<$Res, _$_DeletedSearch>
    implements _$$_DeletedSearchCopyWith<$Res> {
  __$$_DeletedSearchCopyWithImpl(
      _$_DeletedSearch _value, $Res Function(_$_DeletedSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$_DeletedSearch(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeletedSearch implements _DeletedSearch {
  const _$_DeletedSearch({this.searchText = ''});

  @override
  @JsonKey()
  final String searchText;

  @override
  String toString() {
    return 'CustomerCodeEvent.deletedSearch(searchText: $searchText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeletedSearch &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeletedSearchCopyWith<_$_DeletedSearch> get copyWith =>
      __$$_DeletedSearchCopyWithImpl<_$_DeletedSearch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(String searchText) fetch,
    required TResult Function(SearchKey searchValue) search,
    required TResult Function() loadMore,
    required TResult Function(String searchText) deletedSearch,
  }) {
    return deletedSearch(searchText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(String searchText)? fetch,
    TResult? Function(SearchKey searchValue)? search,
    TResult? Function()? loadMore,
    TResult? Function(String searchText)? deletedSearch,
  }) {
    return deletedSearch?.call(searchText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(String searchText)? fetch,
    TResult Function(SearchKey searchValue)? search,
    TResult Function()? loadMore,
    TResult Function(String searchText)? deletedSearch,
    required TResult orElse(),
  }) {
    if (deletedSearch != null) {
      return deletedSearch(searchText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Search value) search,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_DeletedSearch value) deletedSearch,
  }) {
    return deletedSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Search value)? search,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_DeletedSearch value)? deletedSearch,
  }) {
    return deletedSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Search value)? search,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_DeletedSearch value)? deletedSearch,
    required TResult orElse(),
  }) {
    if (deletedSearch != null) {
      return deletedSearch(this);
    }
    return orElse();
  }
}

abstract class _DeletedSearch implements CustomerCodeEvent {
  const factory _DeletedSearch({final String searchText}) = _$_DeletedSearch;

  String get searchText;
  @JsonKey(ignore: true)
  _$$_DeletedSearchCopyWith<_$_DeletedSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerCodeState {
  bool get hideCustomer => throw _privateConstructorUsedError;
  User get userInfo => throw _privateConstructorUsedError;
  SalesOrganisation get selectedSalesOrg => throw _privateConstructorUsedError;
  List<CustomerCodeInfo> get customerCodeList =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get isSearchActive => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerCodeStateCopyWith<CustomerCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCodeStateCopyWith<$Res> {
  factory $CustomerCodeStateCopyWith(
          CustomerCodeState value, $Res Function(CustomerCodeState) then) =
      _$CustomerCodeStateCopyWithImpl<$Res, CustomerCodeState>;
  @useResult
  $Res call(
      {bool hideCustomer,
      User userInfo,
      SalesOrganisation selectedSalesOrg,
      List<CustomerCodeInfo> customerCodeList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool canLoadMore,
      bool isFetching,
      bool isSearchActive,
      SearchKey searchKey});

  $UserCopyWith<$Res> get userInfo;
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrg;
}

/// @nodoc
class _$CustomerCodeStateCopyWithImpl<$Res, $Val extends CustomerCodeState>
    implements $CustomerCodeStateCopyWith<$Res> {
  _$CustomerCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideCustomer = null,
    Object? userInfo = null,
    Object? selectedSalesOrg = null,
    Object? customerCodeList = null,
    Object? apiFailureOrSuccessOption = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? isSearchActive = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      hideCustomer: null == hideCustomer
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
      selectedSalesOrg: null == selectedSalesOrg
          ? _value.selectedSalesOrg
          : selectedSalesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeList: null == customerCodeList
          ? _value.customerCodeList
          : customerCodeList // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeInfo>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchActive: null == isSearchActive
          ? _value.isSearchActive
          : isSearchActive // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get userInfo {
    return $UserCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrg {
    return $SalesOrganisationCopyWith<$Res>(_value.selectedSalesOrg, (value) {
      return _then(_value.copyWith(selectedSalesOrg: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomerCodeStateCopyWith<$Res>
    implements $CustomerCodeStateCopyWith<$Res> {
  factory _$$_CustomerCodeStateCopyWith(_$_CustomerCodeState value,
          $Res Function(_$_CustomerCodeState) then) =
      __$$_CustomerCodeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hideCustomer,
      User userInfo,
      SalesOrganisation selectedSalesOrg,
      List<CustomerCodeInfo> customerCodeList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool canLoadMore,
      bool isFetching,
      bool isSearchActive,
      SearchKey searchKey});

  @override
  $UserCopyWith<$Res> get userInfo;
  @override
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrg;
}

/// @nodoc
class __$$_CustomerCodeStateCopyWithImpl<$Res>
    extends _$CustomerCodeStateCopyWithImpl<$Res, _$_CustomerCodeState>
    implements _$$_CustomerCodeStateCopyWith<$Res> {
  __$$_CustomerCodeStateCopyWithImpl(
      _$_CustomerCodeState _value, $Res Function(_$_CustomerCodeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideCustomer = null,
    Object? userInfo = null,
    Object? selectedSalesOrg = null,
    Object? customerCodeList = null,
    Object? apiFailureOrSuccessOption = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? isSearchActive = null,
    Object? searchKey = null,
  }) {
    return _then(_$_CustomerCodeState(
      hideCustomer: null == hideCustomer
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
      selectedSalesOrg: null == selectedSalesOrg
          ? _value.selectedSalesOrg
          : selectedSalesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeList: null == customerCodeList
          ? _value._customerCodeList
          : customerCodeList // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeInfo>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchActive: null == isSearchActive
          ? _value.isSearchActive
          : isSearchActive // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_CustomerCodeState extends _CustomerCodeState {
  const _$_CustomerCodeState(
      {required this.hideCustomer,
      required this.userInfo,
      required this.selectedSalesOrg,
      required final List<CustomerCodeInfo> customerCodeList,
      required this.apiFailureOrSuccessOption,
      required this.canLoadMore,
      required this.isFetching,
      required this.isSearchActive,
      required this.searchKey})
      : _customerCodeList = customerCodeList,
        super._();

  @override
  final bool hideCustomer;
  @override
  final User userInfo;
  @override
  final SalesOrganisation selectedSalesOrg;
  final List<CustomerCodeInfo> _customerCodeList;
  @override
  List<CustomerCodeInfo> get customerCodeList {
    if (_customerCodeList is EqualUnmodifiableListView)
      return _customerCodeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerCodeList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool canLoadMore;
  @override
  final bool isFetching;
  @override
  final bool isSearchActive;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'CustomerCodeState(hideCustomer: $hideCustomer, userInfo: $userInfo, selectedSalesOrg: $selectedSalesOrg, customerCodeList: $customerCodeList, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, canLoadMore: $canLoadMore, isFetching: $isFetching, isSearchActive: $isSearchActive, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerCodeState &&
            (identical(other.hideCustomer, hideCustomer) ||
                other.hideCustomer == hideCustomer) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.selectedSalesOrg, selectedSalesOrg) ||
                other.selectedSalesOrg == selectedSalesOrg) &&
            const DeepCollectionEquality()
                .equals(other._customerCodeList, _customerCodeList) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.isSearchActive, isSearchActive) ||
                other.isSearchActive == isSearchActive) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      hideCustomer,
      userInfo,
      selectedSalesOrg,
      const DeepCollectionEquality().hash(_customerCodeList),
      apiFailureOrSuccessOption,
      canLoadMore,
      isFetching,
      isSearchActive,
      searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerCodeStateCopyWith<_$_CustomerCodeState> get copyWith =>
      __$$_CustomerCodeStateCopyWithImpl<_$_CustomerCodeState>(
          this, _$identity);
}

abstract class _CustomerCodeState extends CustomerCodeState {
  const factory _CustomerCodeState(
      {required final bool hideCustomer,
      required final User userInfo,
      required final SalesOrganisation selectedSalesOrg,
      required final List<CustomerCodeInfo> customerCodeList,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool canLoadMore,
      required final bool isFetching,
      required final bool isSearchActive,
      required final SearchKey searchKey}) = _$_CustomerCodeState;
  const _CustomerCodeState._() : super._();

  @override
  bool get hideCustomer;
  @override
  User get userInfo;
  @override
  SalesOrganisation get selectedSalesOrg;
  @override
  List<CustomerCodeInfo> get customerCodeList;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get canLoadMore;
  @override
  bool get isFetching;
  @override
  bool get isSearchActive;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerCodeStateCopyWith<_$_CustomerCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}
