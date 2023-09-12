// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByItemsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function() loadMore,
    required TResult Function() fetchProductImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function()? loadMore,
    TResult? Function()? fetchProductImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function()? loadMore,
    TResult Function()? fetchProductImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchProductImage value) fetchProductImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemsEventCopyWith<$Res> {
  factory $ViewByItemsEventCopyWith(
          ViewByItemsEvent value, $Res Function(ViewByItemsEvent) then) =
      _$ViewByItemsEventCopyWithImpl<$Res, ViewByItemsEvent>;
}

/// @nodoc
class _$ViewByItemsEventCopyWithImpl<$Res, $Val extends ViewByItemsEvent>
    implements $ViewByItemsEventCopyWith<$Res> {
  _$ViewByItemsEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SalesOrganisation salesOrganisation});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ViewByItemsEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? salesOrganisation = null,
  }) {
    return _then(_$_Initialized(
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value));
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.salesOrgConfigs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.salesOrganisation});

  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'ViewByItemsEvent.initialized(salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrgConfigs,
      customerCodeInfo, shipToInfo, user, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function() loadMore,
    required TResult Function() fetchProductImage,
  }) {
    return initialized(
        salesOrgConfigs, customerCodeInfo, shipToInfo, user, salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function()? loadMore,
    TResult? Function()? fetchProductImage,
  }) {
    return initialized?.call(
        salesOrgConfigs, customerCodeInfo, shipToInfo, user, salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function()? loadMore,
    TResult Function()? fetchProductImage,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrgConfigs, customerCodeInfo, shipToInfo, user,
          salesOrganisation);
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
    required TResult Function(_FetchProductImage value) fetchProductImage,
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
    TResult? Function(_FetchProductImage value)? fetchProductImage,
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
    TResult Function(_FetchProductImage value)? fetchProductImage,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ViewByItemsEvent {
  const factory _Initialized(
      {required final SalesOrganisationConfigs salesOrgConfigs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final SalesOrganisation salesOrganisation}) = _$_Initialized;

  SalesOrganisationConfigs get salesOrgConfigs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({ViewByItemFilter viewByItemFilter, SearchKey searchKey});

  $ViewByItemFilterCopyWith<$Res> get viewByItemFilter;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ViewByItemsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewByItemFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$_Fetch(
      viewByItemFilter: null == viewByItemFilter
          ? _value.viewByItemFilter
          : viewByItemFilter // ignore: cast_nullable_to_non_nullable
              as ViewByItemFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByItemFilterCopyWith<$Res> get viewByItemFilter {
    return $ViewByItemFilterCopyWith<$Res>(_value.viewByItemFilter, (value) {
      return _then(_value.copyWith(viewByItemFilter: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.viewByItemFilter, required this.searchKey});

  @override
  final ViewByItemFilter viewByItemFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ViewByItemsEvent.fetch(viewByItemFilter: $viewByItemFilter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.viewByItemFilter, viewByItemFilter) ||
                other.viewByItemFilter == viewByItemFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewByItemFilter, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function() loadMore,
    required TResult Function() fetchProductImage,
  }) {
    return fetch(viewByItemFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function()? loadMore,
    TResult? Function()? fetchProductImage,
  }) {
    return fetch?.call(viewByItemFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function()? loadMore,
    TResult Function()? fetchProductImage,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(viewByItemFilter, searchKey);
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
    required TResult Function(_FetchProductImage value) fetchProductImage,
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
    TResult? Function(_FetchProductImage value)? fetchProductImage,
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
    TResult Function(_FetchProductImage value)? fetchProductImage,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ViewByItemsEvent {
  const factory _Fetch(
      {required final ViewByItemFilter viewByItemFilter,
      required final SearchKey searchKey}) = _$_Fetch;

  ViewByItemFilter get viewByItemFilter;
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
  $Res call({SearchKey searchKey});
}

/// @nodoc
class __$$_AutoSearchProductCopyWithImpl<$Res>
    extends _$ViewByItemsEventCopyWithImpl<$Res, _$_AutoSearchProduct>
    implements _$$_AutoSearchProductCopyWith<$Res> {
  __$$_AutoSearchProductCopyWithImpl(
      _$_AutoSearchProduct _value, $Res Function(_$_AutoSearchProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$_AutoSearchProduct(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_AutoSearchProduct implements _AutoSearchProduct {
  const _$_AutoSearchProduct({required this.searchKey});

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ViewByItemsEvent.autoSearchProduct(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoSearchProduct &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AutoSearchProductCopyWith<_$_AutoSearchProduct> get copyWith =>
      __$$_AutoSearchProductCopyWithImpl<_$_AutoSearchProduct>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function() loadMore,
    required TResult Function() fetchProductImage,
  }) {
    return autoSearchProduct(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function()? loadMore,
    TResult? Function()? fetchProductImage,
  }) {
    return autoSearchProduct?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function()? loadMore,
    TResult Function()? fetchProductImage,
    required TResult orElse(),
  }) {
    if (autoSearchProduct != null) {
      return autoSearchProduct(searchKey);
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
    required TResult Function(_FetchProductImage value) fetchProductImage,
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
    TResult? Function(_FetchProductImage value)? fetchProductImage,
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
    TResult Function(_FetchProductImage value)? fetchProductImage,
    required TResult orElse(),
  }) {
    if (autoSearchProduct != null) {
      return autoSearchProduct(this);
    }
    return orElse();
  }
}

abstract class _AutoSearchProduct implements ViewByItemsEvent {
  const factory _AutoSearchProduct({required final SearchKey searchKey}) =
      _$_AutoSearchProduct;

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
    extends _$ViewByItemsEventCopyWithImpl<$Res, _$_LoadMore>
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
    return 'ViewByItemsEvent.loadMore()';
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
    required TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function() loadMore,
    required TResult Function() fetchProductImage,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function()? loadMore,
    TResult? Function()? fetchProductImage,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function()? loadMore,
    TResult Function()? fetchProductImage,
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
    required TResult Function(_FetchProductImage value) fetchProductImage,
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
    TResult? Function(_FetchProductImage value)? fetchProductImage,
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
    TResult Function(_FetchProductImage value)? fetchProductImage,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements ViewByItemsEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
abstract class _$$_FetchProductImageCopyWith<$Res> {
  factory _$$_FetchProductImageCopyWith(_$_FetchProductImage value,
          $Res Function(_$_FetchProductImage) then) =
      __$$_FetchProductImageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchProductImageCopyWithImpl<$Res>
    extends _$ViewByItemsEventCopyWithImpl<$Res, _$_FetchProductImage>
    implements _$$_FetchProductImageCopyWith<$Res> {
  __$$_FetchProductImageCopyWithImpl(
      _$_FetchProductImage _value, $Res Function(_$_FetchProductImage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchProductImage implements _FetchProductImage {
  const _$_FetchProductImage();

  @override
  String toString() {
    return 'ViewByItemsEvent.fetchProductImage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchProductImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)
        initialized,
    required TResult Function(
            ViewByItemFilter viewByItemFilter, SearchKey searchKey)
        fetch,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function() loadMore,
    required TResult Function() fetchProductImage,
  }) {
    return fetchProductImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult? Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function()? loadMore,
    TResult? Function()? fetchProductImage,
  }) {
    return fetchProductImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisation salesOrganisation)?
        initialized,
    TResult Function(ViewByItemFilter viewByItemFilter, SearchKey searchKey)?
        fetch,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function()? loadMore,
    TResult Function()? fetchProductImage,
    required TResult orElse(),
  }) {
    if (fetchProductImage != null) {
      return fetchProductImage();
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
    required TResult Function(_FetchProductImage value) fetchProductImage,
  }) {
    return fetchProductImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
  }) {
    return fetchProductImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    required TResult orElse(),
  }) {
    if (fetchProductImage != null) {
      return fetchProductImage(this);
    }
    return orElse();
  }
}

abstract class _FetchProductImage implements ViewByItemsEvent {
  const factory _FetchProductImage() = _$_FetchProductImage;
}

/// @nodoc
mixin _$ViewByItemsState {
  SalesOrganisationConfigs get salesOrgConfigs =>
      throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  OrderHistory get orderHistoryList => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  int get nextPageIndex => throw _privateConstructorUsedError;
  ViewByItemFilter get appliedFilter => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByItemsStateCopyWith<ViewByItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemsStateCopyWith<$Res> {
  factory $ViewByItemsStateCopyWith(
          ViewByItemsState value, $Res Function(ViewByItemsState) then) =
      _$ViewByItemsStateCopyWithImpl<$Res, ViewByItemsState>;
  @useResult
  $Res call(
      {SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SalesOrganisation salesOrganisation,
      OrderHistory orderHistoryList,
      bool canLoadMore,
      bool isFetching,
      int nextPageIndex,
      ViewByItemFilter appliedFilter,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $OrderHistoryCopyWith<$Res> get orderHistoryList;
  $ViewByItemFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$ViewByItemsStateCopyWithImpl<$Res, $Val extends ViewByItemsState>
    implements $ViewByItemsStateCopyWith<$Res> {
  _$ViewByItemsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? salesOrganisation = null,
    Object? orderHistoryList = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? nextPageIndex = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      orderHistoryList: null == orderHistoryList
          ? _value.orderHistoryList
          : orderHistoryList // ignore: cast_nullable_to_non_nullable
              as OrderHistory,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ViewByItemFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value) as $Val);
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryCopyWith<$Res> get orderHistoryList {
    return $OrderHistoryCopyWith<$Res>(_value.orderHistoryList, (value) {
      return _then(_value.copyWith(orderHistoryList: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByItemFilterCopyWith<$Res> get appliedFilter {
    return $ViewByItemFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ViewByItemsStateCopyWith<$Res>
    implements $ViewByItemsStateCopyWith<$Res> {
  factory _$$_ViewByItemsStateCopyWith(
          _$_ViewByItemsState value, $Res Function(_$_ViewByItemsState) then) =
      __$$_ViewByItemsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SalesOrganisation salesOrganisation,
      OrderHistory orderHistoryList,
      bool canLoadMore,
      bool isFetching,
      int nextPageIndex,
      ViewByItemFilter appliedFilter,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $OrderHistoryCopyWith<$Res> get orderHistoryList;
  @override
  $ViewByItemFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_ViewByItemsStateCopyWithImpl<$Res>
    extends _$ViewByItemsStateCopyWithImpl<$Res, _$_ViewByItemsState>
    implements _$$_ViewByItemsStateCopyWith<$Res> {
  __$$_ViewByItemsStateCopyWithImpl(
      _$_ViewByItemsState _value, $Res Function(_$_ViewByItemsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? salesOrganisation = null,
    Object? orderHistoryList = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? nextPageIndex = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_ViewByItemsState(
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      orderHistoryList: null == orderHistoryList
          ? _value.orderHistoryList
          : orderHistoryList // ignore: cast_nullable_to_non_nullable
              as OrderHistory,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ViewByItemFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_ViewByItemsState extends _ViewByItemsState {
  const _$_ViewByItemsState(
      {required this.salesOrgConfigs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.salesOrganisation,
      required this.orderHistoryList,
      required this.canLoadMore,
      required this.isFetching,
      required this.nextPageIndex,
      required this.appliedFilter,
      required this.searchKey,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final OrderHistory orderHistoryList;
  @override
  final bool canLoadMore;
  @override
  final bool isFetching;
  @override
  final int nextPageIndex;
  @override
  final ViewByItemFilter appliedFilter;
  @override
  final SearchKey searchKey;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ViewByItemsState(salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, salesOrganisation: $salesOrganisation, orderHistoryList: $orderHistoryList, canLoadMore: $canLoadMore, isFetching: $isFetching, nextPageIndex: $nextPageIndex, appliedFilter: $appliedFilter, searchKey: $searchKey, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByItemsState &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.orderHistoryList, orderHistoryList) ||
                other.orderHistoryList == orderHistoryList) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.nextPageIndex, nextPageIndex) ||
                other.nextPageIndex == nextPageIndex) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrgConfigs,
      customerCodeInfo,
      shipToInfo,
      user,
      salesOrganisation,
      orderHistoryList,
      canLoadMore,
      isFetching,
      nextPageIndex,
      appliedFilter,
      searchKey,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByItemsStateCopyWith<_$_ViewByItemsState> get copyWith =>
      __$$_ViewByItemsStateCopyWithImpl<_$_ViewByItemsState>(this, _$identity);
}

abstract class _ViewByItemsState extends ViewByItemsState {
  const factory _ViewByItemsState(
      {required final SalesOrganisationConfigs salesOrgConfigs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final SalesOrganisation salesOrganisation,
      required final OrderHistory orderHistoryList,
      required final bool canLoadMore,
      required final bool isFetching,
      required final int nextPageIndex,
      required final ViewByItemFilter appliedFilter,
      required final SearchKey searchKey,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_ViewByItemsState;
  const _ViewByItemsState._() : super._();

  @override
  SalesOrganisationConfigs get salesOrgConfigs;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  User get user;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  OrderHistory get orderHistoryList;
  @override
  bool get canLoadMore;
  @override
  bool get isFetching;
  @override
  int get nextPageIndex;
  @override
  ViewByItemFilter get appliedFilter;
  @override
  SearchKey get searchKey;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByItemsStateCopyWith<_$_ViewByItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}
