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
            ShipToInfo shipToInfo,
            String searchKey)
        autoSearchProduct,
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)
        searchProduct,
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        loadMoreProductList,
    required TResult Function() clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        autoSearchProduct,
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        searchProduct,
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        loadMoreProductList,
    TResult? Function()? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        autoSearchProduct,
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        searchProduct,
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        loadMoreProductList,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
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
abstract class _$$_AutoSearchProductCopyWith<$Res> {
  factory _$$_AutoSearchProductCopyWith(_$_AutoSearchProduct value,
          $Res Function(_$_AutoSearchProduct) then) =
      __$$_AutoSearchProductCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      String searchKey});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
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
    Object? salesOrganization = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? searchKey = null,
  }) {
    return _then(_$_AutoSearchProduct(
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
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_AutoSearchProduct implements _AutoSearchProduct {
  const _$_AutoSearchProduct(
      {required this.salesOrganization,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.searchKey});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final String searchKey;

  @override
  String toString() {
    return 'ProductSearchEvent.autoSearchProduct(salesOrganization: $salesOrganization, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoSearchProduct &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganization, configs,
      customerCodeInfo, shipToInfo, searchKey);

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
            ShipToInfo shipToInfo,
            String searchKey)
        autoSearchProduct,
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)
        searchProduct,
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        loadMoreProductList,
    required TResult Function() clearSearch,
  }) {
    return autoSearchProduct(
        salesOrganization, configs, customerCodeInfo, shipToInfo, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        autoSearchProduct,
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        searchProduct,
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        loadMoreProductList,
    TResult? Function()? clearSearch,
  }) {
    return autoSearchProduct?.call(
        salesOrganization, configs, customerCodeInfo, shipToInfo, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        autoSearchProduct,
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        searchProduct,
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        loadMoreProductList,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (autoSearchProduct != null) {
      return autoSearchProduct(
          salesOrganization, configs, customerCodeInfo, shipToInfo, searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return autoSearchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return autoSearchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (autoSearchProduct != null) {
      return autoSearchProduct(this);
    }
    return orElse();
  }
}

abstract class _AutoSearchProduct implements ProductSearchEvent {
  const factory _AutoSearchProduct(
      {required final SalesOrganisation salesOrganization,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final String searchKey}) = _$_AutoSearchProduct;

  SalesOrganisation get salesOrganization;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  String get searchKey;
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
  $Res call(
      {SalesOrganisation salesOrganization,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      String searchKey});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
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
    Object? salesOrganization = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? searchKey = null,
  }) {
    return _then(_$_SearchProduct(
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
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_SearchProduct implements _SearchProduct {
  const _$_SearchProduct(
      {required this.salesOrganization,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.searchKey});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final String searchKey;

  @override
  String toString() {
    return 'ProductSearchEvent.searchProduct(salesOrganization: $salesOrganization, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchProduct &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganization, configs,
      customerCodeInfo, shipToInfo, searchKey);

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
            ShipToInfo shipToInfo,
            String searchKey)
        autoSearchProduct,
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)
        searchProduct,
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        loadMoreProductList,
    required TResult Function() clearSearch,
  }) {
    return searchProduct(
        salesOrganization, configs, customerCodeInfo, shipToInfo, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        autoSearchProduct,
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        searchProduct,
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        loadMoreProductList,
    TResult? Function()? clearSearch,
  }) {
    return searchProduct?.call(
        salesOrganization, configs, customerCodeInfo, shipToInfo, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        autoSearchProduct,
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        searchProduct,
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        loadMoreProductList,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(
          salesOrganization, configs, customerCodeInfo, shipToInfo, searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return searchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return searchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(this);
    }
    return orElse();
  }
}

abstract class _SearchProduct implements ProductSearchEvent {
  const factory _SearchProduct(
      {required final SalesOrganisation salesOrganization,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final String searchKey}) = _$_SearchProduct;

  SalesOrganisation get salesOrganization;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  String get searchKey;
  @JsonKey(ignore: true)
  _$$_SearchProductCopyWith<_$_SearchProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreProductListCopyWith<$Res> {
  factory _$$_LoadMoreProductListCopyWith(_$_LoadMoreProductList value,
          $Res Function(_$_LoadMoreProductList) then) =
      __$$_LoadMoreProductListCopyWithImpl<$Res>;
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
class __$$_LoadMoreProductListCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res, _$_LoadMoreProductList>
    implements _$$_LoadMoreProductListCopyWith<$Res> {
  __$$_LoadMoreProductListCopyWithImpl(_$_LoadMoreProductList _value,
      $Res Function(_$_LoadMoreProductList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_LoadMoreProductList(
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

class _$_LoadMoreProductList implements _LoadMoreProductList {
  const _$_LoadMoreProductList(
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
    return 'ProductSearchEvent.loadMoreProductList(salesOrganization: $salesOrganization, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMoreProductList &&
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
  _$$_LoadMoreProductListCopyWith<_$_LoadMoreProductList> get copyWith =>
      __$$_LoadMoreProductListCopyWithImpl<_$_LoadMoreProductList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)
        autoSearchProduct,
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)
        searchProduct,
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        loadMoreProductList,
    required TResult Function() clearSearch,
  }) {
    return loadMoreProductList(
        salesOrganization, configs, customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        autoSearchProduct,
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        searchProduct,
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        loadMoreProductList,
    TResult? Function()? clearSearch,
  }) {
    return loadMoreProductList?.call(
        salesOrganization, configs, customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        autoSearchProduct,
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        searchProduct,
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        loadMoreProductList,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (loadMoreProductList != null) {
      return loadMoreProductList(
          salesOrganization, configs, customerCodeInfo, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadMoreProductList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadMoreProductList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadMoreProductList != null) {
      return loadMoreProductList(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreProductList implements ProductSearchEvent {
  const factory _LoadMoreProductList(
      {required final SalesOrganisation salesOrganization,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo}) = _$_LoadMoreProductList;

  SalesOrganisation get salesOrganization;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_LoadMoreProductListCopyWith<_$_LoadMoreProductList> get copyWith =>
      throw _privateConstructorUsedError;
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
            ShipToInfo shipToInfo,
            String searchKey)
        autoSearchProduct,
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)
        searchProduct,
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)
        loadMoreProductList,
    required TResult Function() clearSearch,
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
            ShipToInfo shipToInfo,
            String searchKey)?
        autoSearchProduct,
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        searchProduct,
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        loadMoreProductList,
    TResult? Function()? clearSearch,
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
            ShipToInfo shipToInfo,
            String searchKey)?
        autoSearchProduct,
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            String searchKey)?
        searchProduct,
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo)?
        loadMoreProductList,
    TResult Function()? clearSearch,
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
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
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
mixin _$ProductSearchState {
  bool get isSearching => throw _privateConstructorUsedError;
  List<MaterialInfo> get suggestedProductList =>
      throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

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
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      SearchKey searchKey});
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
    Object? apiFailureOrSuccessOption = null,
    Object? searchKey = null,
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
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
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
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      SearchKey searchKey});
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
    Object? apiFailureOrSuccessOption = null,
    Object? searchKey = null,
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
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_ProductSearchState implements _ProductSearchState {
  const _$_ProductSearchState(
      {required this.isSearching,
      required final List<MaterialInfo> suggestedProductList,
      required this.canLoadMore,
      required this.apiFailureOrSuccessOption,
      required this.searchKey})
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
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ProductSearchState(isSearching: $isSearching, suggestedProductList: $suggestedProductList, canLoadMore: $canLoadMore, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, searchKey: $searchKey)';
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
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSearching,
      const DeepCollectionEquality().hash(_suggestedProductList),
      canLoadMore,
      apiFailureOrSuccessOption,
      searchKey);

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
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final SearchKey searchKey}) = _$_ProductSearchState;

  @override
  bool get isSearching;
  @override
  List<MaterialInfo> get suggestedProductList;
  @override
  bool get canLoadMore;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$_ProductSearchStateCopyWith<_$_ProductSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
