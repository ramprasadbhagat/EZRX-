// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        fetchRecentlyOrderedProducts,
    required TResult Function(
            List<RecentOrderItem> productList, SalesOrganisationConfigs configs)
        fetchProductsFavouriteStatus,
    required TResult Function(MaterialNumber materialCode) addFavourite,
    required TResult Function(MaterialNumber materialCode) deleteFavourite,
    required TResult Function() getProductImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult? Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult? Function(MaterialNumber materialCode)? addFavourite,
    TResult? Function(MaterialNumber materialCode)? deleteFavourite,
    TResult? Function()? getProductImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult Function(MaterialNumber materialCode)? addFavourite,
    TResult Function(MaterialNumber materialCode)? deleteFavourite,
    TResult Function()? getProductImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRecentlyOrderedProducts value)
        fetchRecentlyOrderedProducts,
    required TResult Function(_FetchProductsFavouriteStatus value)
        fetchProductsFavouriteStatus,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_GetProductImages value) getProductImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult? Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_GetProductImages value)? getProductImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_GetProductImages value)? getProductImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentOrderEventCopyWith<$Res> {
  factory $RecentOrderEventCopyWith(
          RecentOrderEvent value, $Res Function(RecentOrderEvent) then) =
      _$RecentOrderEventCopyWithImpl<$Res, RecentOrderEvent>;
}

/// @nodoc
class _$RecentOrderEventCopyWithImpl<$Res, $Val extends RecentOrderEvent>
    implements $RecentOrderEventCopyWith<$Res> {
  _$RecentOrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchRecentlyOrderedProductsCopyWith<$Res> {
  factory _$$_FetchRecentlyOrderedProductsCopyWith(
          _$_FetchRecentlyOrderedProducts value,
          $Res Function(_$_FetchRecentlyOrderedProducts) then) =
      __$$_FetchRecentlyOrderedProductsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo});

  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_FetchRecentlyOrderedProductsCopyWithImpl<$Res>
    extends _$RecentOrderEventCopyWithImpl<$Res,
        _$_FetchRecentlyOrderedProducts>
    implements _$$_FetchRecentlyOrderedProductsCopyWith<$Res> {
  __$$_FetchRecentlyOrderedProductsCopyWithImpl(
      _$_FetchRecentlyOrderedProducts _value,
      $Res Function(_$_FetchRecentlyOrderedProducts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_FetchRecentlyOrderedProducts(
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

class _$_FetchRecentlyOrderedProducts implements _FetchRecentlyOrderedProducts {
  const _$_FetchRecentlyOrderedProducts(
      {required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo});

  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'RecentOrderEvent.fetchRecentlyOrderedProducts(configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchRecentlyOrderedProducts &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, configs, customerCodeInfo, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchRecentlyOrderedProductsCopyWith<_$_FetchRecentlyOrderedProducts>
      get copyWith => __$$_FetchRecentlyOrderedProductsCopyWithImpl<
          _$_FetchRecentlyOrderedProducts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        fetchRecentlyOrderedProducts,
    required TResult Function(
            List<RecentOrderItem> productList, SalesOrganisationConfigs configs)
        fetchProductsFavouriteStatus,
    required TResult Function(MaterialNumber materialCode) addFavourite,
    required TResult Function(MaterialNumber materialCode) deleteFavourite,
    required TResult Function() getProductImages,
  }) {
    return fetchRecentlyOrderedProducts(configs, customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult? Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult? Function(MaterialNumber materialCode)? addFavourite,
    TResult? Function(MaterialNumber materialCode)? deleteFavourite,
    TResult? Function()? getProductImages,
  }) {
    return fetchRecentlyOrderedProducts?.call(
        configs, customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult Function(MaterialNumber materialCode)? addFavourite,
    TResult Function(MaterialNumber materialCode)? deleteFavourite,
    TResult Function()? getProductImages,
    required TResult orElse(),
  }) {
    if (fetchRecentlyOrderedProducts != null) {
      return fetchRecentlyOrderedProducts(
          configs, customerCodeInfo, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRecentlyOrderedProducts value)
        fetchRecentlyOrderedProducts,
    required TResult Function(_FetchProductsFavouriteStatus value)
        fetchProductsFavouriteStatus,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_GetProductImages value) getProductImages,
  }) {
    return fetchRecentlyOrderedProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult? Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_GetProductImages value)? getProductImages,
  }) {
    return fetchRecentlyOrderedProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_GetProductImages value)? getProductImages,
    required TResult orElse(),
  }) {
    if (fetchRecentlyOrderedProducts != null) {
      return fetchRecentlyOrderedProducts(this);
    }
    return orElse();
  }
}

abstract class _FetchRecentlyOrderedProducts implements RecentOrderEvent {
  const factory _FetchRecentlyOrderedProducts(
      {required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo}) = _$_FetchRecentlyOrderedProducts;

  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_FetchRecentlyOrderedProductsCopyWith<_$_FetchRecentlyOrderedProducts>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchProductsFavouriteStatusCopyWith<$Res> {
  factory _$$_FetchProductsFavouriteStatusCopyWith(
          _$_FetchProductsFavouriteStatus value,
          $Res Function(_$_FetchProductsFavouriteStatus) then) =
      __$$_FetchProductsFavouriteStatusCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<RecentOrderItem> productList, SalesOrganisationConfigs configs});

  $SalesOrganisationConfigsCopyWith<$Res> get configs;
}

/// @nodoc
class __$$_FetchProductsFavouriteStatusCopyWithImpl<$Res>
    extends _$RecentOrderEventCopyWithImpl<$Res,
        _$_FetchProductsFavouriteStatus>
    implements _$$_FetchProductsFavouriteStatusCopyWith<$Res> {
  __$$_FetchProductsFavouriteStatusCopyWithImpl(
      _$_FetchProductsFavouriteStatus _value,
      $Res Function(_$_FetchProductsFavouriteStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = null,
    Object? configs = null,
  }) {
    return _then(_$_FetchProductsFavouriteStatus(
      productList: null == productList
          ? _value._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<RecentOrderItem>,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get configs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.configs, (value) {
      return _then(_value.copyWith(configs: value));
    });
  }
}

/// @nodoc

class _$_FetchProductsFavouriteStatus implements _FetchProductsFavouriteStatus {
  _$_FetchProductsFavouriteStatus(
      {required final List<RecentOrderItem> productList, required this.configs})
      : _productList = productList;

  final List<RecentOrderItem> _productList;
  @override
  List<RecentOrderItem> get productList {
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  @override
  final SalesOrganisationConfigs configs;

  @override
  String toString() {
    return 'RecentOrderEvent.fetchProductsFavouriteStatus(productList: $productList, configs: $configs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchProductsFavouriteStatus &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList) &&
            (identical(other.configs, configs) || other.configs == configs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productList), configs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchProductsFavouriteStatusCopyWith<_$_FetchProductsFavouriteStatus>
      get copyWith => __$$_FetchProductsFavouriteStatusCopyWithImpl<
          _$_FetchProductsFavouriteStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        fetchRecentlyOrderedProducts,
    required TResult Function(
            List<RecentOrderItem> productList, SalesOrganisationConfigs configs)
        fetchProductsFavouriteStatus,
    required TResult Function(MaterialNumber materialCode) addFavourite,
    required TResult Function(MaterialNumber materialCode) deleteFavourite,
    required TResult Function() getProductImages,
  }) {
    return fetchProductsFavouriteStatus(productList, configs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult? Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult? Function(MaterialNumber materialCode)? addFavourite,
    TResult? Function(MaterialNumber materialCode)? deleteFavourite,
    TResult? Function()? getProductImages,
  }) {
    return fetchProductsFavouriteStatus?.call(productList, configs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult Function(MaterialNumber materialCode)? addFavourite,
    TResult Function(MaterialNumber materialCode)? deleteFavourite,
    TResult Function()? getProductImages,
    required TResult orElse(),
  }) {
    if (fetchProductsFavouriteStatus != null) {
      return fetchProductsFavouriteStatus(productList, configs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRecentlyOrderedProducts value)
        fetchRecentlyOrderedProducts,
    required TResult Function(_FetchProductsFavouriteStatus value)
        fetchProductsFavouriteStatus,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_GetProductImages value) getProductImages,
  }) {
    return fetchProductsFavouriteStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult? Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_GetProductImages value)? getProductImages,
  }) {
    return fetchProductsFavouriteStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_GetProductImages value)? getProductImages,
    required TResult orElse(),
  }) {
    if (fetchProductsFavouriteStatus != null) {
      return fetchProductsFavouriteStatus(this);
    }
    return orElse();
  }
}

abstract class _FetchProductsFavouriteStatus implements RecentOrderEvent {
  factory _FetchProductsFavouriteStatus(
          {required final List<RecentOrderItem> productList,
          required final SalesOrganisationConfigs configs}) =
      _$_FetchProductsFavouriteStatus;

  List<RecentOrderItem> get productList;
  SalesOrganisationConfigs get configs;
  @JsonKey(ignore: true)
  _$$_FetchProductsFavouriteStatusCopyWith<_$_FetchProductsFavouriteStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddFavouriteCopyWith<$Res> {
  factory _$$_AddFavouriteCopyWith(
          _$_AddFavourite value, $Res Function(_$_AddFavourite) then) =
      __$$_AddFavouriteCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber materialCode});
}

/// @nodoc
class __$$_AddFavouriteCopyWithImpl<$Res>
    extends _$RecentOrderEventCopyWithImpl<$Res, _$_AddFavourite>
    implements _$$_AddFavouriteCopyWith<$Res> {
  __$$_AddFavouriteCopyWithImpl(
      _$_AddFavourite _value, $Res Function(_$_AddFavourite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialCode = null,
  }) {
    return _then(_$_AddFavourite(
      materialCode: null == materialCode
          ? _value.materialCode
          : materialCode // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$_AddFavourite implements _AddFavourite {
  _$_AddFavourite({required this.materialCode});

  @override
  final MaterialNumber materialCode;

  @override
  String toString() {
    return 'RecentOrderEvent.addFavourite(materialCode: $materialCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddFavourite &&
            (identical(other.materialCode, materialCode) ||
                other.materialCode == materialCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFavouriteCopyWith<_$_AddFavourite> get copyWith =>
      __$$_AddFavouriteCopyWithImpl<_$_AddFavourite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        fetchRecentlyOrderedProducts,
    required TResult Function(
            List<RecentOrderItem> productList, SalesOrganisationConfigs configs)
        fetchProductsFavouriteStatus,
    required TResult Function(MaterialNumber materialCode) addFavourite,
    required TResult Function(MaterialNumber materialCode) deleteFavourite,
    required TResult Function() getProductImages,
  }) {
    return addFavourite(materialCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult? Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult? Function(MaterialNumber materialCode)? addFavourite,
    TResult? Function(MaterialNumber materialCode)? deleteFavourite,
    TResult? Function()? getProductImages,
  }) {
    return addFavourite?.call(materialCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult Function(MaterialNumber materialCode)? addFavourite,
    TResult Function(MaterialNumber materialCode)? deleteFavourite,
    TResult Function()? getProductImages,
    required TResult orElse(),
  }) {
    if (addFavourite != null) {
      return addFavourite(materialCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRecentlyOrderedProducts value)
        fetchRecentlyOrderedProducts,
    required TResult Function(_FetchProductsFavouriteStatus value)
        fetchProductsFavouriteStatus,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_GetProductImages value) getProductImages,
  }) {
    return addFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult? Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_GetProductImages value)? getProductImages,
  }) {
    return addFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_GetProductImages value)? getProductImages,
    required TResult orElse(),
  }) {
    if (addFavourite != null) {
      return addFavourite(this);
    }
    return orElse();
  }
}

abstract class _AddFavourite implements RecentOrderEvent {
  factory _AddFavourite({required final MaterialNumber materialCode}) =
      _$_AddFavourite;

  MaterialNumber get materialCode;
  @JsonKey(ignore: true)
  _$$_AddFavouriteCopyWith<_$_AddFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteFavouriteCopyWith<$Res> {
  factory _$$_DeleteFavouriteCopyWith(
          _$_DeleteFavourite value, $Res Function(_$_DeleteFavourite) then) =
      __$$_DeleteFavouriteCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber materialCode});
}

/// @nodoc
class __$$_DeleteFavouriteCopyWithImpl<$Res>
    extends _$RecentOrderEventCopyWithImpl<$Res, _$_DeleteFavourite>
    implements _$$_DeleteFavouriteCopyWith<$Res> {
  __$$_DeleteFavouriteCopyWithImpl(
      _$_DeleteFavourite _value, $Res Function(_$_DeleteFavourite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialCode = null,
  }) {
    return _then(_$_DeleteFavourite(
      materialCode: null == materialCode
          ? _value.materialCode
          : materialCode // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$_DeleteFavourite implements _DeleteFavourite {
  _$_DeleteFavourite({required this.materialCode});

  @override
  final MaterialNumber materialCode;

  @override
  String toString() {
    return 'RecentOrderEvent.deleteFavourite(materialCode: $materialCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteFavourite &&
            (identical(other.materialCode, materialCode) ||
                other.materialCode == materialCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteFavouriteCopyWith<_$_DeleteFavourite> get copyWith =>
      __$$_DeleteFavouriteCopyWithImpl<_$_DeleteFavourite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        fetchRecentlyOrderedProducts,
    required TResult Function(
            List<RecentOrderItem> productList, SalesOrganisationConfigs configs)
        fetchProductsFavouriteStatus,
    required TResult Function(MaterialNumber materialCode) addFavourite,
    required TResult Function(MaterialNumber materialCode) deleteFavourite,
    required TResult Function() getProductImages,
  }) {
    return deleteFavourite(materialCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult? Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult? Function(MaterialNumber materialCode)? addFavourite,
    TResult? Function(MaterialNumber materialCode)? deleteFavourite,
    TResult? Function()? getProductImages,
  }) {
    return deleteFavourite?.call(materialCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult Function(MaterialNumber materialCode)? addFavourite,
    TResult Function(MaterialNumber materialCode)? deleteFavourite,
    TResult Function()? getProductImages,
    required TResult orElse(),
  }) {
    if (deleteFavourite != null) {
      return deleteFavourite(materialCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRecentlyOrderedProducts value)
        fetchRecentlyOrderedProducts,
    required TResult Function(_FetchProductsFavouriteStatus value)
        fetchProductsFavouriteStatus,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_GetProductImages value) getProductImages,
  }) {
    return deleteFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult? Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_GetProductImages value)? getProductImages,
  }) {
    return deleteFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_GetProductImages value)? getProductImages,
    required TResult orElse(),
  }) {
    if (deleteFavourite != null) {
      return deleteFavourite(this);
    }
    return orElse();
  }
}

abstract class _DeleteFavourite implements RecentOrderEvent {
  factory _DeleteFavourite({required final MaterialNumber materialCode}) =
      _$_DeleteFavourite;

  MaterialNumber get materialCode;
  @JsonKey(ignore: true)
  _$$_DeleteFavouriteCopyWith<_$_DeleteFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetProductImagesCopyWith<$Res> {
  factory _$$_GetProductImagesCopyWith(
          _$_GetProductImages value, $Res Function(_$_GetProductImages) then) =
      __$$_GetProductImagesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetProductImagesCopyWithImpl<$Res>
    extends _$RecentOrderEventCopyWithImpl<$Res, _$_GetProductImages>
    implements _$$_GetProductImagesCopyWith<$Res> {
  __$$_GetProductImagesCopyWithImpl(
      _$_GetProductImages _value, $Res Function(_$_GetProductImages) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetProductImages implements _GetProductImages {
  _$_GetProductImages();

  @override
  String toString() {
    return 'RecentOrderEvent.getProductImages()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetProductImages);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        fetchRecentlyOrderedProducts,
    required TResult Function(
            List<RecentOrderItem> productList, SalesOrganisationConfigs configs)
        fetchProductsFavouriteStatus,
    required TResult Function(MaterialNumber materialCode) addFavourite,
    required TResult Function(MaterialNumber materialCode) deleteFavourite,
    required TResult Function() getProductImages,
  }) {
    return getProductImages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult? Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult? Function(MaterialNumber materialCode)? addFavourite,
    TResult? Function(MaterialNumber materialCode)? deleteFavourite,
    TResult? Function()? getProductImages,
  }) {
    return getProductImages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        fetchRecentlyOrderedProducts,
    TResult Function(List<RecentOrderItem> productList,
            SalesOrganisationConfigs configs)?
        fetchProductsFavouriteStatus,
    TResult Function(MaterialNumber materialCode)? addFavourite,
    TResult Function(MaterialNumber materialCode)? deleteFavourite,
    TResult Function()? getProductImages,
    required TResult orElse(),
  }) {
    if (getProductImages != null) {
      return getProductImages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRecentlyOrderedProducts value)
        fetchRecentlyOrderedProducts,
    required TResult Function(_FetchProductsFavouriteStatus value)
        fetchProductsFavouriteStatus,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_GetProductImages value) getProductImages,
  }) {
    return getProductImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult? Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_GetProductImages value)? getProductImages,
  }) {
    return getProductImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRecentlyOrderedProducts value)?
        fetchRecentlyOrderedProducts,
    TResult Function(_FetchProductsFavouriteStatus value)?
        fetchProductsFavouriteStatus,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_GetProductImages value)? getProductImages,
    required TResult orElse(),
  }) {
    if (getProductImages != null) {
      return getProductImages(this);
    }
    return orElse();
  }
}

abstract class _GetProductImages implements RecentOrderEvent {
  factory _GetProductImages() = _$_GetProductImages;
}

/// @nodoc
mixin _$RecentOrderState {
  bool get isFetching => throw _privateConstructorUsedError;
  List<RecentOrderItem> get recentlyOrderedProducts =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentOrderStateCopyWith<RecentOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentOrderStateCopyWith<$Res> {
  factory $RecentOrderStateCopyWith(
          RecentOrderState value, $Res Function(RecentOrderState) then) =
      _$RecentOrderStateCopyWithImpl<$Res, RecentOrderState>;
  @useResult
  $Res call(
      {bool isFetching,
      List<RecentOrderItem> recentlyOrderedProducts,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});
}

/// @nodoc
class _$RecentOrderStateCopyWithImpl<$Res, $Val extends RecentOrderState>
    implements $RecentOrderStateCopyWith<$Res> {
  _$RecentOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? recentlyOrderedProducts = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      recentlyOrderedProducts: null == recentlyOrderedProducts
          ? _value.recentlyOrderedProducts
          : recentlyOrderedProducts // ignore: cast_nullable_to_non_nullable
              as List<RecentOrderItem>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecentOrderStateCopyWith<$Res>
    implements $RecentOrderStateCopyWith<$Res> {
  factory _$$_RecentOrderStateCopyWith(
          _$_RecentOrderState value, $Res Function(_$_RecentOrderState) then) =
      __$$_RecentOrderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      List<RecentOrderItem> recentlyOrderedProducts,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});
}

/// @nodoc
class __$$_RecentOrderStateCopyWithImpl<$Res>
    extends _$RecentOrderStateCopyWithImpl<$Res, _$_RecentOrderState>
    implements _$$_RecentOrderStateCopyWith<$Res> {
  __$$_RecentOrderStateCopyWithImpl(
      _$_RecentOrderState _value, $Res Function(_$_RecentOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? recentlyOrderedProducts = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$_RecentOrderState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      recentlyOrderedProducts: null == recentlyOrderedProducts
          ? _value._recentlyOrderedProducts
          : recentlyOrderedProducts // ignore: cast_nullable_to_non_nullable
              as List<RecentOrderItem>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_RecentOrderState extends _RecentOrderState {
  const _$_RecentOrderState(
      {required this.isFetching,
      required final List<RecentOrderItem> recentlyOrderedProducts,
      required this.apiFailureOrSuccessOption})
      : _recentlyOrderedProducts = recentlyOrderedProducts,
        super._();

  @override
  final bool isFetching;
  final List<RecentOrderItem> _recentlyOrderedProducts;
  @override
  List<RecentOrderItem> get recentlyOrderedProducts {
    if (_recentlyOrderedProducts is EqualUnmodifiableListView)
      return _recentlyOrderedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentlyOrderedProducts);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'RecentOrderState(isFetching: $isFetching, recentlyOrderedProducts: $recentlyOrderedProducts, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentOrderState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            const DeepCollectionEquality().equals(
                other._recentlyOrderedProducts, _recentlyOrderedProducts) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      const DeepCollectionEquality().hash(_recentlyOrderedProducts),
      apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentOrderStateCopyWith<_$_RecentOrderState> get copyWith =>
      __$$_RecentOrderStateCopyWithImpl<_$_RecentOrderState>(this, _$identity);
}

abstract class _RecentOrderState extends RecentOrderState {
  const factory _RecentOrderState(
      {required final bool isFetching,
      required final List<RecentOrderItem> recentlyOrderedProducts,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_RecentOrderState;
  const _RecentOrderState._() : super._();

  @override
  bool get isFetching;
  @override
  List<RecentOrderItem> get recentlyOrderedProducts;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_RecentOrderStateCopyWith<_$_RecentOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
