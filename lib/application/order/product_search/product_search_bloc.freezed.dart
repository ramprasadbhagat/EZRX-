// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(SearchKey searchKey) searchProduct,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() fetchProductSearchSuggestionHistory,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(SearchKey searchKey)? searchProduct,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? fetchProductSearchSuggestionHistory,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(SearchKey searchKey)? searchProduct,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? fetchProductSearchSuggestionHistory,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchProductSearchSuggestionHistory value)
        fetchProductSearchSuggestionHistory,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSearchEventCopyWith<$Res> {
  factory $ProductSearchEventCopyWith(
          ProductSearchEvent value, $Res Function(ProductSearchEvent) then) =
      _$ProductSearchEventCopyWithImpl<$Res, ProductSearchEvent>;
}

/// @nodoc
class _$ProductSearchEventCopyWithImpl<$Res, $Val extends ProductSearchEvent>
    implements $ProductSearchEventCopyWith<$Res> {
  _$ProductSearchEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisation salesOrganization,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_Initialized(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get configs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.configs, (value) {
      return _then(_value.copyWith(configs: value));
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
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.salesOrganization,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'ProductSearchEvent.initialized(salesOrganization: $salesOrganization, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganization, configs, customerCodeInfo, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(SearchKey searchKey) searchProduct,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() fetchProductSearchSuggestionHistory,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return initialized(
        salesOrganization, configs, customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(SearchKey searchKey)? searchProduct,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? fetchProductSearchSuggestionHistory,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return initialized?.call(
        salesOrganization, configs, customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(SearchKey searchKey)? searchProduct,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? fetchProductSearchSuggestionHistory,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(
          salesOrganization, configs, customerCodeInfo, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchProductSearchSuggestionHistory value)
        fetchProductSearchSuggestionHistory,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ProductSearchEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganization,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo}) = _$_Initialized;

  SalesOrganisation get salesOrganization;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
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
    extends _$ProductSearchEventCopyWithImpl<$Res, _$_AutoSearchProduct>
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
    return 'ProductSearchEvent.autoSearchProduct(searchKey: $searchKey)';
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
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(SearchKey searchKey) searchProduct,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() fetchProductSearchSuggestionHistory,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return autoSearchProduct(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(SearchKey searchKey)? searchProduct,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? fetchProductSearchSuggestionHistory,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return autoSearchProduct?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(SearchKey searchKey)? searchProduct,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? fetchProductSearchSuggestionHistory,
    TResult Function()? clearProductSearchSuggestionHistory,
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
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchProductSearchSuggestionHistory value)
        fetchProductSearchSuggestionHistory,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return autoSearchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return autoSearchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (autoSearchProduct != null) {
      return autoSearchProduct(this);
    }
    return orElse();
  }
}

abstract class _AutoSearchProduct implements ProductSearchEvent {
  const factory _AutoSearchProduct({required final SearchKey searchKey}) =
      _$_AutoSearchProduct;

  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$_AutoSearchProductCopyWith<_$_AutoSearchProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchProductCopyWith<$Res> {
  factory _$$_SearchProductCopyWith(
          _$_SearchProduct value, $Res Function(_$_SearchProduct) then) =
      __$$_SearchProductCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey});
}

/// @nodoc
class __$$_SearchProductCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res, _$_SearchProduct>
    implements _$$_SearchProductCopyWith<$Res> {
  __$$_SearchProductCopyWithImpl(
      _$_SearchProduct _value, $Res Function(_$_SearchProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$_SearchProduct(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_SearchProduct implements _SearchProduct {
  const _$_SearchProduct({required this.searchKey});

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ProductSearchEvent.searchProduct(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchProduct &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchProductCopyWith<_$_SearchProduct> get copyWith =>
      __$$_SearchProductCopyWithImpl<_$_SearchProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(SearchKey searchKey) searchProduct,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() fetchProductSearchSuggestionHistory,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return searchProduct(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(SearchKey searchKey)? searchProduct,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? fetchProductSearchSuggestionHistory,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return searchProduct?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(SearchKey searchKey)? searchProduct,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? fetchProductSearchSuggestionHistory,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchProductSearchSuggestionHistory value)
        fetchProductSearchSuggestionHistory,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return searchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return searchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(this);
    }
    return orElse();
  }
}

abstract class _SearchProduct implements ProductSearchEvent {
  const factory _SearchProduct({required final SearchKey searchKey}) =
      _$_SearchProduct;

  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$_SearchProductCopyWith<_$_SearchProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreProductListCopyWith<$Res> {
  factory _$$_LoadMoreProductListCopyWith(_$_LoadMoreProductList value,
          $Res Function(_$_LoadMoreProductList) then) =
      __$$_LoadMoreProductListCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadMoreProductListCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res, _$_LoadMoreProductList>
    implements _$$_LoadMoreProductListCopyWith<$Res> {
  __$$_LoadMoreProductListCopyWithImpl(_$_LoadMoreProductList _value,
      $Res Function(_$_LoadMoreProductList) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadMoreProductList implements _LoadMoreProductList {
  const _$_LoadMoreProductList();

  @override
  String toString() {
    return 'ProductSearchEvent.loadMoreProductList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadMoreProductList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(SearchKey searchKey) searchProduct,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() fetchProductSearchSuggestionHistory,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return loadMoreProductList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(SearchKey searchKey)? searchProduct,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? fetchProductSearchSuggestionHistory,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return loadMoreProductList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(SearchKey searchKey)? searchProduct,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? fetchProductSearchSuggestionHistory,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (loadMoreProductList != null) {
      return loadMoreProductList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchProductSearchSuggestionHistory value)
        fetchProductSearchSuggestionHistory,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return loadMoreProductList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return loadMoreProductList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (loadMoreProductList != null) {
      return loadMoreProductList(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreProductList implements ProductSearchEvent {
  const factory _LoadMoreProductList() = _$_LoadMoreProductList;
}

/// @nodoc
abstract class _$$_ClearSearchCopyWith<$Res> {
  factory _$$_ClearSearchCopyWith(
          _$_ClearSearch value, $Res Function(_$_ClearSearch) then) =
      __$$_ClearSearchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearSearchCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res, _$_ClearSearch>
    implements _$$_ClearSearchCopyWith<$Res> {
  __$$_ClearSearchCopyWithImpl(
      _$_ClearSearch _value, $Res Function(_$_ClearSearch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearSearch implements _ClearSearch {
  const _$_ClearSearch();

  @override
  String toString() {
    return 'ProductSearchEvent.clearSearch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearSearch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(SearchKey searchKey) searchProduct,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() fetchProductSearchSuggestionHistory,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(SearchKey searchKey)? searchProduct,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? fetchProductSearchSuggestionHistory,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(SearchKey searchKey)? searchProduct,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? fetchProductSearchSuggestionHistory,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchProductSearchSuggestionHistory value)
        fetchProductSearchSuggestionHistory,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements ProductSearchEvent {
  const factory _ClearSearch() = _$_ClearSearch;
}

/// @nodoc
abstract class _$$_FetchProductSearchSuggestionHistoryCopyWith<$Res> {
  factory _$$_FetchProductSearchSuggestionHistoryCopyWith(
          _$_FetchProductSearchSuggestionHistory value,
          $Res Function(_$_FetchProductSearchSuggestionHistory) then) =
      __$$_FetchProductSearchSuggestionHistoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchProductSearchSuggestionHistoryCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res,
        _$_FetchProductSearchSuggestionHistory>
    implements _$$_FetchProductSearchSuggestionHistoryCopyWith<$Res> {
  __$$_FetchProductSearchSuggestionHistoryCopyWithImpl(
      _$_FetchProductSearchSuggestionHistory _value,
      $Res Function(_$_FetchProductSearchSuggestionHistory) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchProductSearchSuggestionHistory
    implements _FetchProductSearchSuggestionHistory {
  const _$_FetchProductSearchSuggestionHistory();

  @override
  String toString() {
    return 'ProductSearchEvent.fetchProductSearchSuggestionHistory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchProductSearchSuggestionHistory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(SearchKey searchKey) searchProduct,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() fetchProductSearchSuggestionHistory,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return fetchProductSearchSuggestionHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(SearchKey searchKey)? searchProduct,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? fetchProductSearchSuggestionHistory,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return fetchProductSearchSuggestionHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(SearchKey searchKey)? searchProduct,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? fetchProductSearchSuggestionHistory,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (fetchProductSearchSuggestionHistory != null) {
      return fetchProductSearchSuggestionHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchProductSearchSuggestionHistory value)
        fetchProductSearchSuggestionHistory,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return fetchProductSearchSuggestionHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return fetchProductSearchSuggestionHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (fetchProductSearchSuggestionHistory != null) {
      return fetchProductSearchSuggestionHistory(this);
    }
    return orElse();
  }
}

abstract class _FetchProductSearchSuggestionHistory
    implements ProductSearchEvent {
  const factory _FetchProductSearchSuggestionHistory() =
      _$_FetchProductSearchSuggestionHistory;
}

/// @nodoc
abstract class _$$_ClearProductSearchSuggestionHistoryCopyWith<$Res> {
  factory _$$_ClearProductSearchSuggestionHistoryCopyWith(
          _$_ClearProductSearchSuggestionHistory value,
          $Res Function(_$_ClearProductSearchSuggestionHistory) then) =
      __$$_ClearProductSearchSuggestionHistoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearProductSearchSuggestionHistoryCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res,
        _$_ClearProductSearchSuggestionHistory>
    implements _$$_ClearProductSearchSuggestionHistoryCopyWith<$Res> {
  __$$_ClearProductSearchSuggestionHistoryCopyWithImpl(
      _$_ClearProductSearchSuggestionHistory _value,
      $Res Function(_$_ClearProductSearchSuggestionHistory) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearProductSearchSuggestionHistory
    implements _ClearProductSearchSuggestionHistory {
  const _$_ClearProductSearchSuggestionHistory();

  @override
  String toString() {
    return 'ProductSearchEvent.clearProductSearchSuggestionHistory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClearProductSearchSuggestionHistory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(SearchKey searchKey) searchProduct,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() fetchProductSearchSuggestionHistory,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return clearProductSearchSuggestionHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(SearchKey searchKey)? searchProduct,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? fetchProductSearchSuggestionHistory,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return clearProductSearchSuggestionHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(SearchKey searchKey)? searchProduct,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? fetchProductSearchSuggestionHistory,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (clearProductSearchSuggestionHistory != null) {
      return clearProductSearchSuggestionHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchProductSearchSuggestionHistory value)
        fetchProductSearchSuggestionHistory,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return clearProductSearchSuggestionHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return clearProductSearchSuggestionHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchProductSearchSuggestionHistory value)?
        fetchProductSearchSuggestionHistory,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (clearProductSearchSuggestionHistory != null) {
      return clearProductSearchSuggestionHistory(this);
    }
    return orElse();
  }
}

abstract class _ClearProductSearchSuggestionHistory
    implements ProductSearchEvent {
  const factory _ClearProductSearchSuggestionHistory() =
      _$_ClearProductSearchSuggestionHistory;
}

/// @nodoc
mixin _$ProductSearchState {
  bool get isSearching => throw _privateConstructorUsedError;
  List<MaterialInfo> get suggestedProductList =>
      throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  ProductSuggestionHistory get productSuggestionHistory =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganization => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get configs => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductSearchStateCopyWith<ProductSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSearchStateCopyWith<$Res> {
  factory $ProductSearchStateCopyWith(
          ProductSearchState value, $Res Function(ProductSearchState) then) =
      _$ProductSearchStateCopyWithImpl<$Res, ProductSearchState>;
  @useResult
  $Res call(
      {bool isSearching,
      List<MaterialInfo> suggestedProductList,
      bool canLoadMore,
      ProductSuggestionHistory productSuggestionHistory,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      SearchKey searchKey,
      SalesOrganisation salesOrganization,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo});

  $ProductSuggestionHistoryCopyWith<$Res> get productSuggestionHistory;
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class _$ProductSearchStateCopyWithImpl<$Res, $Val extends ProductSearchState>
    implements $ProductSearchStateCopyWith<$Res> {
  _$ProductSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? suggestedProductList = null,
    Object? canLoadMore = null,
    Object? productSuggestionHistory = null,
    Object? apiFailureOrSuccessOption = null,
    Object? searchKey = null,
    Object? salesOrganization = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
  }) {
    return _then(_value.copyWith(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestedProductList: null == suggestedProductList
          ? _value.suggestedProductList
          : suggestedProductList // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      productSuggestionHistory: null == productSuggestionHistory
          ? _value.productSuggestionHistory
          : productSuggestionHistory // ignore: cast_nullable_to_non_nullable
              as ProductSuggestionHistory,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductSuggestionHistoryCopyWith<$Res> get productSuggestionHistory {
    return $ProductSuggestionHistoryCopyWith<$Res>(
        _value.productSuggestionHistory, (value) {
      return _then(_value.copyWith(productSuggestionHistory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get configs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.configs, (value) {
      return _then(_value.copyWith(configs: value) as $Val);
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
}

/// @nodoc
abstract class _$$_ProductSearchStateCopyWith<$Res>
    implements $ProductSearchStateCopyWith<$Res> {
  factory _$$_ProductSearchStateCopyWith(_$_ProductSearchState value,
          $Res Function(_$_ProductSearchState) then) =
      __$$_ProductSearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      List<MaterialInfo> suggestedProductList,
      bool canLoadMore,
      ProductSuggestionHistory productSuggestionHistory,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      SearchKey searchKey,
      SalesOrganisation salesOrganization,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo});

  @override
  $ProductSuggestionHistoryCopyWith<$Res> get productSuggestionHistory;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_ProductSearchStateCopyWithImpl<$Res>
    extends _$ProductSearchStateCopyWithImpl<$Res, _$_ProductSearchState>
    implements _$$_ProductSearchStateCopyWith<$Res> {
  __$$_ProductSearchStateCopyWithImpl(
      _$_ProductSearchState _value, $Res Function(_$_ProductSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? suggestedProductList = null,
    Object? canLoadMore = null,
    Object? productSuggestionHistory = null,
    Object? apiFailureOrSuccessOption = null,
    Object? searchKey = null,
    Object? salesOrganization = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_ProductSearchState(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestedProductList: null == suggestedProductList
          ? _value._suggestedProductList
          : suggestedProductList // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      productSuggestionHistory: null == productSuggestionHistory
          ? _value.productSuggestionHistory
          : productSuggestionHistory // ignore: cast_nullable_to_non_nullable
              as ProductSuggestionHistory,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }
}

/// @nodoc

class _$_ProductSearchState implements _ProductSearchState {
  const _$_ProductSearchState(
      {required this.isSearching,
      required final List<MaterialInfo> suggestedProductList,
      required this.canLoadMore,
      required this.productSuggestionHistory,
      required this.apiFailureOrSuccessOption,
      required this.searchKey,
      required this.salesOrganization,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo})
      : _suggestedProductList = suggestedProductList;

  @override
  final bool isSearching;
  final List<MaterialInfo> _suggestedProductList;
  @override
  List<MaterialInfo> get suggestedProductList {
    if (_suggestedProductList is EqualUnmodifiableListView)
      return _suggestedProductList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedProductList);
  }

  @override
  final bool canLoadMore;
  @override
  final ProductSuggestionHistory productSuggestionHistory;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final SearchKey searchKey;
  @override
  final SalesOrganisation salesOrganization;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'ProductSearchState(isSearching: $isSearching, suggestedProductList: $suggestedProductList, canLoadMore: $canLoadMore, productSuggestionHistory: $productSuggestionHistory, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, searchKey: $searchKey, salesOrganization: $salesOrganization, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductSearchState &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            const DeepCollectionEquality()
                .equals(other._suggestedProductList, _suggestedProductList) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(
                    other.productSuggestionHistory, productSuggestionHistory) ||
                other.productSuggestionHistory == productSuggestionHistory) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSearching,
      const DeepCollectionEquality().hash(_suggestedProductList),
      canLoadMore,
      productSuggestionHistory,
      apiFailureOrSuccessOption,
      searchKey,
      salesOrganization,
      configs,
      customerCodeInfo,
      shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductSearchStateCopyWith<_$_ProductSearchState> get copyWith =>
      __$$_ProductSearchStateCopyWithImpl<_$_ProductSearchState>(
          this, _$identity);
}

abstract class _ProductSearchState implements ProductSearchState {
  const factory _ProductSearchState(
      {required final bool isSearching,
      required final List<MaterialInfo> suggestedProductList,
      required final bool canLoadMore,
      required final ProductSuggestionHistory productSuggestionHistory,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final SearchKey searchKey,
      required final SalesOrganisation salesOrganization,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo}) = _$_ProductSearchState;

  @override
  bool get isSearching;
  @override
  List<MaterialInfo> get suggestedProductList;
  @override
  bool get canLoadMore;
  @override
  ProductSuggestionHistory get productSuggestionHistory;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  SearchKey get searchKey;
  @override
  SalesOrganisation get salesOrganization;
  @override
  SalesOrganisationConfigs get configs;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  @JsonKey(ignore: true)
  _$$_ProductSearchStateCopyWith<_$_ProductSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
