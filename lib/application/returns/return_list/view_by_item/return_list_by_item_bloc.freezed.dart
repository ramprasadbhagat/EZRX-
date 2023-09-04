// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_list_by_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnListByItemEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        autoSearchProduct,
    required TResult Function() loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)?
        autoSearchProduct,
    TResult? Function()? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)?
        autoSearchProduct,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnListByItemEventCopyWith<$Res> {
  factory $ReturnListByItemEventCopyWith(ReturnListByItemEvent value,
          $Res Function(ReturnListByItemEvent) then) =
      _$ReturnListByItemEventCopyWithImpl<$Res, ReturnListByItemEvent>;
}

/// @nodoc
class _$ReturnListByItemEventCopyWithImpl<$Res,
        $Val extends ReturnListByItemEvent>
    implements $ReturnListByItemEventCopyWith<$Res> {
  _$ReturnListByItemEventCopyWithImpl(this._value, this._then);

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
      {SalesOrg salesOrg,
      ShipToInfo shipInfo,
      CustomerCodeInfo customerCodeInfo,
      User user});

  $ShipToInfoCopyWith<$Res> get shipInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ReturnListByItemEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? shipInfo = null,
    Object? customerCodeInfo = null,
    Object? user = null,
  }) {
    return _then(_$_Initialized(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipInfo, (value) {
      return _then(_value.copyWith(shipInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
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

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.salesOrg,
      required this.shipInfo,
      required this.customerCodeInfo,
      required this.user});

  @override
  final SalesOrg salesOrg;
  @override
  final ShipToInfo shipInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'ReturnListByItemEvent.initialized(salesOrg: $salesOrg, shipInfo: $shipInfo, customerCodeInfo: $customerCodeInfo, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.shipInfo, shipInfo) ||
                other.shipInfo == shipInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrg, shipInfo, customerCodeInfo, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        autoSearchProduct,
    required TResult Function() loadMore,
  }) {
    return initialized(salesOrg, shipInfo, customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)?
        autoSearchProduct,
    TResult? Function()? loadMore,
  }) {
    return initialized?.call(salesOrg, shipInfo, customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)?
        autoSearchProduct,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrg, shipInfo, customerCodeInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ReturnListByItemEvent {
  const factory _Initialized(
      {required final SalesOrg salesOrg,
      required final ShipToInfo shipInfo,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user}) = _$_Initialized;

  SalesOrg get salesOrg;
  ShipToInfo get shipInfo;
  CustomerCodeInfo get customerCodeInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnFilter appliedFilter, SearchKey searchKey});

  $ReturnFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ReturnListByItemEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$_Fetch(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnFilterCopyWith<$Res> get appliedFilter {
    return $ReturnFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.appliedFilter, required this.searchKey});

  @override
  final ReturnFilter appliedFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ReturnListByItemEvent.fetch(appliedFilter: $appliedFilter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appliedFilter, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        autoSearchProduct,
    required TResult Function() loadMore,
  }) {
    return fetch(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)?
        autoSearchProduct,
    TResult? Function()? loadMore,
  }) {
    return fetch?.call(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)?
        autoSearchProduct,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(appliedFilter, searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ReturnListByItemEvent {
  const factory _Fetch(
      {required final ReturnFilter appliedFilter,
      required final SearchKey searchKey}) = _$_Fetch;

  ReturnFilter get appliedFilter;
  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AutoSearchProductCopyWith<$Res> {
  factory _$$_AutoSearchProductCopyWith(_$_AutoSearchProduct value,
          $Res Function(_$_AutoSearchProduct) then) =
      __$$_AutoSearchProductCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnFilter appliedFilter, SearchKey searchKey});

  $ReturnFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_AutoSearchProductCopyWithImpl<$Res>
    extends _$ReturnListByItemEventCopyWithImpl<$Res, _$_AutoSearchProduct>
    implements _$$_AutoSearchProductCopyWith<$Res> {
  __$$_AutoSearchProductCopyWithImpl(
      _$_AutoSearchProduct _value, $Res Function(_$_AutoSearchProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$_AutoSearchProduct(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnFilterCopyWith<$Res> get appliedFilter {
    return $ReturnFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$_AutoSearchProduct implements _AutoSearchProduct {
  const _$_AutoSearchProduct(
      {required this.appliedFilter, required this.searchKey});

  @override
  final ReturnFilter appliedFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ReturnListByItemEvent.autoSearchProduct(appliedFilter: $appliedFilter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoSearchProduct &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appliedFilter, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AutoSearchProductCopyWith<_$_AutoSearchProduct> get copyWith =>
      __$$_AutoSearchProductCopyWithImpl<_$_AutoSearchProduct>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        autoSearchProduct,
    required TResult Function() loadMore,
  }) {
    return autoSearchProduct(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)?
        autoSearchProduct,
    TResult? Function()? loadMore,
  }) {
    return autoSearchProduct?.call(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)?
        autoSearchProduct,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (autoSearchProduct != null) {
      return autoSearchProduct(appliedFilter, searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return autoSearchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return autoSearchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (autoSearchProduct != null) {
      return autoSearchProduct(this);
    }
    return orElse();
  }
}

abstract class _AutoSearchProduct implements ReturnListByItemEvent {
  const factory _AutoSearchProduct(
      {required final ReturnFilter appliedFilter,
      required final SearchKey searchKey}) = _$_AutoSearchProduct;

  ReturnFilter get appliedFilter;
  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$_AutoSearchProductCopyWith<_$_AutoSearchProduct> get copyWith =>
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
    extends _$ReturnListByItemEventCopyWithImpl<$Res, _$_LoadMore>
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
    return 'ReturnListByItemEvent.loadMore()';
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
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)
        autoSearchProduct,
    required TResult Function() loadMore,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult? Function(ReturnFilter appliedFilter, SearchKey searchKey)?
        autoSearchProduct,
    TResult? Function()? loadMore,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)? fetch,
    TResult Function(ReturnFilter appliedFilter, SearchKey searchKey)?
        autoSearchProduct,
    TResult Function()? loadMore,
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
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements ReturnListByItemEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
mixin _$ReturnListByItemState {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  ShipToInfo get shipInfo => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  List<ReturnItem> get returnItemList => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  ReturnFilter get appliedFilter => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnListByItemStateCopyWith<ReturnListByItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnListByItemStateCopyWith<$Res> {
  factory $ReturnListByItemStateCopyWith(ReturnListByItemState value,
          $Res Function(ReturnListByItemState) then) =
      _$ReturnListByItemStateCopyWithImpl<$Res, ReturnListByItemState>;
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      ShipToInfo shipInfo,
      CustomerCodeInfo customerCodeInfo,
      User user,
      List<ReturnItem> returnItemList,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isFetching,
      bool canLoadMore,
      ReturnFilter appliedFilter,
      SearchKey searchKey});

  $ShipToInfoCopyWith<$Res> get shipInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
  $ReturnFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$ReturnListByItemStateCopyWithImpl<$Res,
        $Val extends ReturnListByItemState>
    implements $ReturnListByItemStateCopyWith<$Res> {
  _$ReturnListByItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? shipInfo = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? returnItemList = null,
    Object? failureOrSuccessOption = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      returnItemList: null == returnItemList
          ? _value.returnItemList
          : returnItemList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItem>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipInfo, (value) {
      return _then(_value.copyWith(shipInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnFilterCopyWith<$Res> get appliedFilter {
    return $ReturnFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReturnListByItemStateCopyWith<$Res>
    implements $ReturnListByItemStateCopyWith<$Res> {
  factory _$$_ReturnListByItemStateCopyWith(_$_ReturnListByItemState value,
          $Res Function(_$_ReturnListByItemState) then) =
      __$$_ReturnListByItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      ShipToInfo shipInfo,
      CustomerCodeInfo customerCodeInfo,
      User user,
      List<ReturnItem> returnItemList,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isFetching,
      bool canLoadMore,
      ReturnFilter appliedFilter,
      SearchKey searchKey});

  @override
  $ShipToInfoCopyWith<$Res> get shipInfo;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $ReturnFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_ReturnListByItemStateCopyWithImpl<$Res>
    extends _$ReturnListByItemStateCopyWithImpl<$Res, _$_ReturnListByItemState>
    implements _$$_ReturnListByItemStateCopyWith<$Res> {
  __$$_ReturnListByItemStateCopyWithImpl(_$_ReturnListByItemState _value,
      $Res Function(_$_ReturnListByItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? shipInfo = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? returnItemList = null,
    Object? failureOrSuccessOption = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$_ReturnListByItemState(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      returnItemList: null == returnItemList
          ? _value._returnItemList
          : returnItemList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItem>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_ReturnListByItemState extends _ReturnListByItemState {
  const _$_ReturnListByItemState(
      {required this.salesOrg,
      required this.shipInfo,
      required this.customerCodeInfo,
      required this.user,
      required final List<ReturnItem> returnItemList,
      required this.failureOrSuccessOption,
      required this.isFetching,
      required this.canLoadMore,
      required this.appliedFilter,
      required this.searchKey})
      : _returnItemList = returnItemList,
        super._();

  @override
  final SalesOrg salesOrg;
  @override
  final ShipToInfo shipInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;
  final List<ReturnItem> _returnItemList;
  @override
  List<ReturnItem> get returnItemList {
    if (_returnItemList is EqualUnmodifiableListView) return _returnItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnItemList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final ReturnFilter appliedFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ReturnListByItemState(salesOrg: $salesOrg, shipInfo: $shipInfo, customerCodeInfo: $customerCodeInfo, user: $user, returnItemList: $returnItemList, failureOrSuccessOption: $failureOrSuccessOption, isFetching: $isFetching, canLoadMore: $canLoadMore, appliedFilter: $appliedFilter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnListByItemState &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.shipInfo, shipInfo) ||
                other.shipInfo == shipInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._returnItemList, _returnItemList) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrg,
      shipInfo,
      customerCodeInfo,
      user,
      const DeepCollectionEquality().hash(_returnItemList),
      failureOrSuccessOption,
      isFetching,
      canLoadMore,
      appliedFilter,
      searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnListByItemStateCopyWith<_$_ReturnListByItemState> get copyWith =>
      __$$_ReturnListByItemStateCopyWithImpl<_$_ReturnListByItemState>(
          this, _$identity);
}

abstract class _ReturnListByItemState extends ReturnListByItemState {
  const factory _ReturnListByItemState(
      {required final SalesOrg salesOrg,
      required final ShipToInfo shipInfo,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user,
      required final List<ReturnItem> returnItemList,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isFetching,
      required final bool canLoadMore,
      required final ReturnFilter appliedFilter,
      required final SearchKey searchKey}) = _$_ReturnListByItemState;
  const _ReturnListByItemState._() : super._();

  @override
  SalesOrg get salesOrg;
  @override
  ShipToInfo get shipInfo;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  User get user;
  @override
  List<ReturnItem> get returnItemList;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  ReturnFilter get appliedFilter;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnListByItemStateCopyWith<_$_ReturnListByItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
