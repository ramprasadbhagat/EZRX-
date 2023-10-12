// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_deal_material_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ComboDealMaterialDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function() clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function()? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, SalesOrganisationConfigs salesConfigs,
            Locale locale, MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealMaterialDetailEventCopyWith<$Res> {
  factory $ComboDealMaterialDetailEventCopyWith(
          ComboDealMaterialDetailEvent value,
          $Res Function(ComboDealMaterialDetailEvent) then) =
      _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
          ComboDealMaterialDetailEvent>;
}

/// @nodoc
class _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        $Val extends ComboDealMaterialDetailEvent>
    implements $ComboDealMaterialDetailEventCopyWith<$Res> {
  _$ComboDealMaterialDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializeCopyWith<$Res> {
  factory _$$_InitializeCopyWith(
          _$_Initialize value, $Res Function(_$_Initialize) then) =
      __$$_InitializeCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_InitializeCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res, _$_Initialize>
    implements _$$_InitializeCopyWith<$Res> {
  __$$_InitializeCopyWithImpl(
      _$_Initialize _value, $Res Function(_$_Initialize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_Initialize(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
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

class _$_Initialize implements _Initialize {
  const _$_Initialize(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.initialize(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialize &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganisation, customerCodeInfo, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializeCopyWith<_$_Initialize> get copyWith =>
      __$$_InitializeCopyWithImpl<_$_Initialize>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function() clearSearch,
  }) {
    return initialize(salesOrganisation, customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function()? clearSearch,
  }) {
    return initialize?.call(salesOrganisation, customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, SalesOrganisationConfigs salesConfigs,
            Locale locale, MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(salesOrganisation, customerCodeInfo, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ComboDealMaterialDetailEvent {
  const factory _Initialize(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo}) = _$_Initialize;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_InitializeCopyWith<_$_Initialize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InitFromCartComboDealItemsCopyWith<$Res> {
  factory _$$_InitFromCartComboDealItemsCopyWith(
          _$_InitFromCartComboDealItems value,
          $Res Function(_$_InitFromCartComboDealItems) then) =
      __$$_InitFromCartComboDealItemsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs});

  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
}

/// @nodoc
class __$$_InitFromCartComboDealItemsCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$_InitFromCartComboDealItems>
    implements _$$_InitFromCartComboDealItemsCopyWith<$Res> {
  __$$_InitFromCartComboDealItemsCopyWithImpl(
      _$_InitFromCartComboDealItems _value,
      $Res Function(_$_InitFromCartComboDealItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? salesConfigs = null,
  }) {
    return _then(_$_InitFromCartComboDealItems(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesConfigs,
        (value) {
      return _then(_value.copyWith(salesConfigs: value));
    });
  }
}

/// @nodoc

class _$_InitFromCartComboDealItems implements _InitFromCartComboDealItems {
  const _$_InitFromCartComboDealItems(
      {required final List<PriceAggregate> items, required this.salesConfigs})
      : _items = items;

  final List<PriceAggregate> _items;
  @override
  List<PriceAggregate> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final SalesOrganisationConfigs salesConfigs;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.initFromCartComboDealItems(items: $items, salesConfigs: $salesConfigs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitFromCartComboDealItems &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.salesConfigs, salesConfigs) ||
                other.salesConfigs == salesConfigs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), salesConfigs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitFromCartComboDealItemsCopyWith<_$_InitFromCartComboDealItems>
      get copyWith => __$$_InitFromCartComboDealItemsCopyWithImpl<
          _$_InitFromCartComboDealItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function() clearSearch,
  }) {
    return initFromCartComboDealItems(items, salesConfigs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function()? clearSearch,
  }) {
    return initFromCartComboDealItems?.call(items, salesConfigs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, SalesOrganisationConfigs salesConfigs,
            Locale locale, MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (initFromCartComboDealItems != null) {
      return initFromCartComboDealItems(items, salesConfigs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return initFromCartComboDealItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return initFromCartComboDealItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (initFromCartComboDealItems != null) {
      return initFromCartComboDealItems(this);
    }
    return orElse();
  }
}

abstract class _InitFromCartComboDealItems
    implements ComboDealMaterialDetailEvent {
  const factory _InitFromCartComboDealItems(
          {required final List<PriceAggregate> items,
          required final SalesOrganisationConfigs salesConfigs}) =
      _$_InitFromCartComboDealItems;

  List<PriceAggregate> get items;
  SalesOrganisationConfigs get salesConfigs;
  @JsonKey(ignore: true)
  _$$_InitFromCartComboDealItemsCopyWith<_$_InitFromCartComboDealItems>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetPriceInfoCopyWith<$Res> {
  factory _$$_SetPriceInfoCopyWith(
          _$_SetPriceInfo value, $Res Function(_$_SetPriceInfo) then) =
      __$$_SetPriceInfoCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<MaterialNumber, MaterialPriceDetail> priceMap});
}

/// @nodoc
class __$$_SetPriceInfoCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res, _$_SetPriceInfo>
    implements _$$_SetPriceInfoCopyWith<$Res> {
  __$$_SetPriceInfoCopyWithImpl(
      _$_SetPriceInfo _value, $Res Function(_$_SetPriceInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceMap = null,
  }) {
    return _then(_$_SetPriceInfo(
      priceMap: null == priceMap
          ? _value._priceMap
          : priceMap // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, MaterialPriceDetail>,
    ));
  }
}

/// @nodoc

class _$_SetPriceInfo implements _SetPriceInfo {
  const _$_SetPriceInfo(
      {required final Map<MaterialNumber, MaterialPriceDetail> priceMap})
      : _priceMap = priceMap;

  final Map<MaterialNumber, MaterialPriceDetail> _priceMap;
  @override
  Map<MaterialNumber, MaterialPriceDetail> get priceMap {
    if (_priceMap is EqualUnmodifiableMapView) return _priceMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_priceMap);
  }

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.setPriceInfo(priceMap: $priceMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetPriceInfo &&
            const DeepCollectionEquality().equals(other._priceMap, _priceMap));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_priceMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetPriceInfoCopyWith<_$_SetPriceInfo> get copyWith =>
      __$$_SetPriceInfoCopyWithImpl<_$_SetPriceInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function() clearSearch,
  }) {
    return setPriceInfo(priceMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function()? clearSearch,
  }) {
    return setPriceInfo?.call(priceMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, SalesOrganisationConfigs salesConfigs,
            Locale locale, MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (setPriceInfo != null) {
      return setPriceInfo(priceMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return setPriceInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return setPriceInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (setPriceInfo != null) {
      return setPriceInfo(this);
    }
    return orElse();
  }
}

abstract class _SetPriceInfo implements ComboDealMaterialDetailEvent {
  const factory _SetPriceInfo(
          {required final Map<MaterialNumber, MaterialPriceDetail> priceMap}) =
      _$_SetPriceInfo;

  Map<MaterialNumber, MaterialPriceDetail> get priceMap;
  @JsonKey(ignore: true)
  _$$_SetPriceInfoCopyWith<_$_SetPriceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateItemQuantityCopyWith<$Res> {
  factory _$$_UpdateItemQuantityCopyWith(_$_UpdateItemQuantity value,
          $Res Function(_$_UpdateItemQuantity) then) =
      __$$_UpdateItemQuantityCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber item, int qty});
}

/// @nodoc
class __$$_UpdateItemQuantityCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$_UpdateItemQuantity> implements _$$_UpdateItemQuantityCopyWith<$Res> {
  __$$_UpdateItemQuantityCopyWithImpl(
      _$_UpdateItemQuantity _value, $Res Function(_$_UpdateItemQuantity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? qty = null,
  }) {
    return _then(_$_UpdateItemQuantity(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UpdateItemQuantity implements _UpdateItemQuantity {
  const _$_UpdateItemQuantity({required this.item, required this.qty});

  @override
  final MaterialNumber item;
  @override
  final int qty;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.updateItemQuantity(item: $item, qty: $qty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateItemQuantity &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateItemQuantityCopyWith<_$_UpdateItemQuantity> get copyWith =>
      __$$_UpdateItemQuantityCopyWithImpl<_$_UpdateItemQuantity>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function() clearSearch,
  }) {
    return updateItemQuantity(item, qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function()? clearSearch,
  }) {
    return updateItemQuantity?.call(item, qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, SalesOrganisationConfigs salesConfigs,
            Locale locale, MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (updateItemQuantity != null) {
      return updateItemQuantity(item, qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return updateItemQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return updateItemQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (updateItemQuantity != null) {
      return updateItemQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateItemQuantity implements ComboDealMaterialDetailEvent {
  const factory _UpdateItemQuantity(
      {required final MaterialNumber item,
      required final int qty}) = _$_UpdateItemQuantity;

  MaterialNumber get item;
  int get qty;
  @JsonKey(ignore: true)
  _$$_UpdateItemQuantityCopyWith<_$_UpdateItemQuantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateItemSelectionCopyWith<$Res> {
  factory _$$_UpdateItemSelectionCopyWith(_$_UpdateItemSelection value,
          $Res Function(_$_UpdateItemSelection) then) =
      __$$_UpdateItemSelectionCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber item});
}

/// @nodoc
class __$$_UpdateItemSelectionCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$_UpdateItemSelection>
    implements _$$_UpdateItemSelectionCopyWith<$Res> {
  __$$_UpdateItemSelectionCopyWithImpl(_$_UpdateItemSelection _value,
      $Res Function(_$_UpdateItemSelection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_UpdateItemSelection(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$_UpdateItemSelection implements _UpdateItemSelection {
  const _$_UpdateItemSelection({required this.item});

  @override
  final MaterialNumber item;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.updateItemSelection(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateItemSelection &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateItemSelectionCopyWith<_$_UpdateItemSelection> get copyWith =>
      __$$_UpdateItemSelectionCopyWithImpl<_$_UpdateItemSelection>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function() clearSearch,
  }) {
    return updateItemSelection(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function()? clearSearch,
  }) {
    return updateItemSelection?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, SalesOrganisationConfigs salesConfigs,
            Locale locale, MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (updateItemSelection != null) {
      return updateItemSelection(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return updateItemSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return updateItemSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (updateItemSelection != null) {
      return updateItemSelection(this);
    }
    return orElse();
  }
}

abstract class _UpdateItemSelection implements ComboDealMaterialDetailEvent {
  const factory _UpdateItemSelection({required final MaterialNumber item}) =
      _$_UpdateItemSelection;

  MaterialNumber get item;
  @JsonKey(ignore: true)
  _$$_UpdateItemSelectionCopyWith<_$_UpdateItemSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchComboDealDetailCopyWith<$Res> {
  factory _$$_FetchComboDealDetailCopyWith(_$_FetchComboDealDetail value,
          $Res Function(_$_FetchComboDealDetail) then) =
      __$$_FetchComboDealDetailCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ComboDeal comboDeal,
      SalesOrganisationConfigs salesConfigs,
      Locale locale,
      MaterialNumber parentMaterialNumber});

  $ComboDealCopyWith<$Res> get comboDeal;
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
}

/// @nodoc
class __$$_FetchComboDealDetailCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$_FetchComboDealDetail>
    implements _$$_FetchComboDealDetailCopyWith<$Res> {
  __$$_FetchComboDealDetailCopyWithImpl(_$_FetchComboDealDetail _value,
      $Res Function(_$_FetchComboDealDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comboDeal = null,
    Object? salesConfigs = null,
    Object? locale = null,
    Object? parentMaterialNumber = null,
  }) {
    return _then(_$_FetchComboDealDetail(
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as ComboDeal,
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      parentMaterialNumber: null == parentMaterialNumber
          ? _value.parentMaterialNumber
          : parentMaterialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ComboDealCopyWith<$Res> get comboDeal {
    return $ComboDealCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesConfigs,
        (value) {
      return _then(_value.copyWith(salesConfigs: value));
    });
  }
}

/// @nodoc

class _$_FetchComboDealDetail implements _FetchComboDealDetail {
  const _$_FetchComboDealDetail(
      {required this.comboDeal,
      required this.salesConfigs,
      required this.locale,
      required this.parentMaterialNumber});

  @override
  final ComboDeal comboDeal;
  @override
  final SalesOrganisationConfigs salesConfigs;
  @override
  final Locale locale;
  @override
  final MaterialNumber parentMaterialNumber;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.fetchComboDealDetail(comboDeal: $comboDeal, salesConfigs: $salesConfigs, locale: $locale, parentMaterialNumber: $parentMaterialNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchComboDealDetail &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            (identical(other.salesConfigs, salesConfigs) ||
                other.salesConfigs == salesConfigs) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.parentMaterialNumber, parentMaterialNumber) ||
                other.parentMaterialNumber == parentMaterialNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, comboDeal, salesConfigs, locale, parentMaterialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchComboDealDetailCopyWith<_$_FetchComboDealDetail> get copyWith =>
      __$$_FetchComboDealDetailCopyWithImpl<_$_FetchComboDealDetail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function() clearSearch,
  }) {
    return fetchComboDealDetail(
        comboDeal, salesConfigs, locale, parentMaterialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function()? clearSearch,
  }) {
    return fetchComboDealDetail?.call(
        comboDeal, salesConfigs, locale, parentMaterialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, SalesOrganisationConfigs salesConfigs,
            Locale locale, MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (fetchComboDealDetail != null) {
      return fetchComboDealDetail(
          comboDeal, salesConfigs, locale, parentMaterialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return fetchComboDealDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return fetchComboDealDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (fetchComboDealDetail != null) {
      return fetchComboDealDetail(this);
    }
    return orElse();
  }
}

abstract class _FetchComboDealDetail implements ComboDealMaterialDetailEvent {
  const factory _FetchComboDealDetail(
          {required final ComboDeal comboDeal,
          required final SalesOrganisationConfigs salesConfigs,
          required final Locale locale,
          required final MaterialNumber parentMaterialNumber}) =
      _$_FetchComboDealDetail;

  ComboDeal get comboDeal;
  SalesOrganisationConfigs get salesConfigs;
  Locale get locale;
  MaterialNumber get parentMaterialNumber;
  @JsonKey(ignore: true)
  _$$_FetchComboDealDetailCopyWith<_$_FetchComboDealDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchCopyWith<$Res> {
  factory _$$_SearchCopyWith(_$_Search value, $Res Function(_$_Search) then) =
      __$$_SearchCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey});
}

/// @nodoc
class __$$_SearchCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res, _$_Search>
    implements _$$_SearchCopyWith<$Res> {
  __$$_SearchCopyWithImpl(_$_Search _value, $Res Function(_$_Search) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$_Search(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_Search implements _Search {
  const _$_Search({required this.searchKey});

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.search(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Search &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      __$$_SearchCopyWithImpl<_$_Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function() clearSearch,
  }) {
    return search(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function()? clearSearch,
  }) {
    return search?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, SalesOrganisationConfigs salesConfigs,
            Locale locale, MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements ComboDealMaterialDetailEvent {
  const factory _Search({required final SearchKey searchKey}) = _$_Search;

  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$_SearchCopyWith<_$_Search> get copyWith =>
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
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res, _$_ClearSearch>
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
    return 'ComboDealMaterialDetailEvent.clearSearch()';
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
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function() clearSearch,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(
            ComboDeal comboDeal,
            SalesOrganisationConfigs salesConfigs,
            Locale locale,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function()? clearSearch,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, SalesOrganisationConfigs salesConfigs,
            Locale locale, MaterialNumber parentMaterialNumber)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
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
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements ComboDealMaterialDetailEvent {
  const factory _ClearSearch() = _$_ClearSearch;
}

/// @nodoc
mixin _$ComboDealMaterialDetailState {
  Map<MaterialNumber, PriceAggregate> get items =>
      throw _privateConstructorUsedError;
  Map<MaterialNumber, bool> get selectedItems =>
      throw _privateConstructorUsedError;
  bool get isFetchingPrice => throw _privateConstructorUsedError;
  bool get isFetchingComboInfo => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComboDealMaterialDetailStateCopyWith<ComboDealMaterialDetailState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealMaterialDetailStateCopyWith<$Res> {
  factory $ComboDealMaterialDetailStateCopyWith(
          ComboDealMaterialDetailState value,
          $Res Function(ComboDealMaterialDetailState) then) =
      _$ComboDealMaterialDetailStateCopyWithImpl<$Res,
          ComboDealMaterialDetailState>;
  @useResult
  $Res call(
      {Map<MaterialNumber, PriceAggregate> items,
      Map<MaterialNumber, bool> selectedItems,
      bool isFetchingPrice,
      bool isFetchingComboInfo,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      SearchKey searchKey});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class _$ComboDealMaterialDetailStateCopyWithImpl<$Res,
        $Val extends ComboDealMaterialDetailState>
    implements $ComboDealMaterialDetailStateCopyWith<$Res> {
  _$ComboDealMaterialDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? selectedItems = null,
    Object? isFetchingPrice = null,
    Object? isFetchingComboInfo = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? apiFailureOrSuccessOption = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, PriceAggregate>,
      selectedItems: null == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, bool>,
      isFetchingPrice: null == isFetchingPrice
          ? _value.isFetchingPrice
          : isFetchingPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingComboInfo: null == isFetchingComboInfo
          ? _value.isFetchingComboInfo
          : isFetchingComboInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
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

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
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
abstract class _$$_ComboDealDetailStateCopyWith<$Res>
    implements $ComboDealMaterialDetailStateCopyWith<$Res> {
  factory _$$_ComboDealDetailStateCopyWith(_$_ComboDealDetailState value,
          $Res Function(_$_ComboDealDetailState) then) =
      __$$_ComboDealDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<MaterialNumber, PriceAggregate> items,
      Map<MaterialNumber, bool> selectedItems,
      bool isFetchingPrice,
      bool isFetchingComboInfo,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      SearchKey searchKey});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_ComboDealDetailStateCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailStateCopyWithImpl<$Res,
        _$_ComboDealDetailState>
    implements _$$_ComboDealDetailStateCopyWith<$Res> {
  __$$_ComboDealDetailStateCopyWithImpl(_$_ComboDealDetailState _value,
      $Res Function(_$_ComboDealDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? selectedItems = null,
    Object? isFetchingPrice = null,
    Object? isFetchingComboInfo = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? apiFailureOrSuccessOption = null,
    Object? searchKey = null,
  }) {
    return _then(_$_ComboDealDetailState(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, PriceAggregate>,
      selectedItems: null == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, bool>,
      isFetchingPrice: null == isFetchingPrice
          ? _value.isFetchingPrice
          : isFetchingPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingComboInfo: null == isFetchingComboInfo
          ? _value.isFetchingComboInfo
          : isFetchingComboInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
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

class _$_ComboDealDetailState extends _ComboDealDetailState {
  const _$_ComboDealDetailState(
      {required final Map<MaterialNumber, PriceAggregate> items,
      required final Map<MaterialNumber, bool> selectedItems,
      required this.isFetchingPrice,
      required this.isFetchingComboInfo,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.apiFailureOrSuccessOption,
      required this.searchKey})
      : _items = items,
        _selectedItems = selectedItems,
        super._();

  final Map<MaterialNumber, PriceAggregate> _items;
  @override
  Map<MaterialNumber, PriceAggregate> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  final Map<MaterialNumber, bool> _selectedItems;
  @override
  Map<MaterialNumber, bool> get selectedItems {
    if (_selectedItems is EqualUnmodifiableMapView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedItems);
  }

  @override
  final bool isFetchingPrice;
  @override
  final bool isFetchingComboInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ComboDealMaterialDetailState(items: $items, selectedItems: $selectedItems, isFetchingPrice: $isFetchingPrice, isFetchingComboInfo: $isFetchingComboInfo, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComboDealDetailState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems) &&
            (identical(other.isFetchingPrice, isFetchingPrice) ||
                other.isFetchingPrice == isFetchingPrice) &&
            (identical(other.isFetchingComboInfo, isFetchingComboInfo) ||
                other.isFetchingComboInfo == isFetchingComboInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_selectedItems),
      isFetchingPrice,
      isFetchingComboInfo,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      apiFailureOrSuccessOption,
      searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComboDealDetailStateCopyWith<_$_ComboDealDetailState> get copyWith =>
      __$$_ComboDealDetailStateCopyWithImpl<_$_ComboDealDetailState>(
          this, _$identity);
}

abstract class _ComboDealDetailState extends ComboDealMaterialDetailState {
  const factory _ComboDealDetailState(
      {required final Map<MaterialNumber, PriceAggregate> items,
      required final Map<MaterialNumber, bool> selectedItems,
      required final bool isFetchingPrice,
      required final bool isFetchingComboInfo,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final SearchKey searchKey}) = _$_ComboDealDetailState;
  const _ComboDealDetailState._() : super._();

  @override
  Map<MaterialNumber, PriceAggregate> get items;
  @override
  Map<MaterialNumber, bool> get selectedItems;
  @override
  bool get isFetchingPrice;
  @override
  bool get isFetchingComboInfo;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$_ComboDealDetailStateCopyWith<_$_ComboDealDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
