// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    required TResult Function() initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initComboDealItems,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)
        setPriceInfo,
    required TResult Function(ComboDeal comboDealInfo) setComboDealInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult? Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitComboDealItems value) initComboDealItems,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_SetComboDealInfo value) setComboDealInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitComboDealItems value)? initComboDealItems,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitComboDealItems value)? initComboDealItems,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
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
}

/// @nodoc
class __$$_InitializeCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res, _$_Initialize>
    implements _$$_InitializeCopyWith<$Res> {
  __$$_InitializeCopyWithImpl(
      _$_Initialize _value, $Res Function(_$_Initialize) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialize implements _Initialize {
  const _$_Initialize();

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initComboDealItems,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)
        setPriceInfo,
    required TResult Function(ComboDeal comboDealInfo) setComboDealInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult? Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitComboDealItems value) initComboDealItems,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_SetComboDealInfo value) setComboDealInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitComboDealItems value)? initComboDealItems,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitComboDealItems value)? initComboDealItems,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ComboDealMaterialDetailEvent {
  const factory _Initialize() = _$_Initialize;
}

/// @nodoc
abstract class _$$_InitComboDealItemsCopyWith<$Res> {
  factory _$$_InitComboDealItemsCopyWith(_$_InitComboDealItems value,
          $Res Function(_$_InitComboDealItems) then) =
      __$$_InitComboDealItemsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs});

  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
}

/// @nodoc
class __$$_InitComboDealItemsCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$_InitComboDealItems> implements _$$_InitComboDealItemsCopyWith<$Res> {
  __$$_InitComboDealItemsCopyWithImpl(
      _$_InitComboDealItems _value, $Res Function(_$_InitComboDealItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? salesConfigs = null,
  }) {
    return _then(_$_InitComboDealItems(
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

class _$_InitComboDealItems implements _InitComboDealItems {
  const _$_InitComboDealItems(
      {required final List<PriceAggregate> items, required this.salesConfigs})
      : _items = items;

  final List<PriceAggregate> _items;
  @override
  List<PriceAggregate> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final SalesOrganisationConfigs salesConfigs;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.initComboDealItems(items: $items, salesConfigs: $salesConfigs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitComboDealItems &&
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
  _$$_InitComboDealItemsCopyWith<_$_InitComboDealItems> get copyWith =>
      __$$_InitComboDealItemsCopyWithImpl<_$_InitComboDealItems>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initComboDealItems,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)
        setPriceInfo,
    required TResult Function(ComboDeal comboDealInfo) setComboDealInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
  }) {
    return initComboDealItems(items, salesConfigs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult? Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
  }) {
    return initComboDealItems?.call(items, salesConfigs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    required TResult orElse(),
  }) {
    if (initComboDealItems != null) {
      return initComboDealItems(items, salesConfigs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitComboDealItems value) initComboDealItems,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_SetComboDealInfo value) setComboDealInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
  }) {
    return initComboDealItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitComboDealItems value)? initComboDealItems,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
  }) {
    return initComboDealItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitComboDealItems value)? initComboDealItems,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    required TResult orElse(),
  }) {
    if (initComboDealItems != null) {
      return initComboDealItems(this);
    }
    return orElse();
  }
}

abstract class _InitComboDealItems implements ComboDealMaterialDetailEvent {
  const factory _InitComboDealItems(
          {required final List<PriceAggregate> items,
          required final SalesOrganisationConfigs salesConfigs}) =
      _$_InitComboDealItems;

  List<PriceAggregate> get items;
  SalesOrganisationConfigs get salesConfigs;
  @JsonKey(ignore: true)
  _$$_InitComboDealItemsCopyWith<_$_InitComboDealItems> get copyWith =>
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
    required TResult Function() initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initComboDealItems,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)
        setPriceInfo,
    required TResult Function(ComboDeal comboDealInfo) setComboDealInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
  }) {
    return initFromCartComboDealItems(items, salesConfigs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult? Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
  }) {
    return initFromCartComboDealItems?.call(items, salesConfigs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
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
    required TResult Function(_InitComboDealItems value) initComboDealItems,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_SetComboDealInfo value) setComboDealInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
  }) {
    return initFromCartComboDealItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitComboDealItems value)? initComboDealItems,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
  }) {
    return initFromCartComboDealItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitComboDealItems value)? initComboDealItems,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
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
  $Res call(
      {Map<MaterialNumber, MaterialPriceDetail> priceMap,
      PriceComboDeal comboDeal});

  $PriceComboDealCopyWith<$Res> get comboDeal;
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
    Object? comboDeal = null,
  }) {
    return _then(_$_SetPriceInfo(
      priceMap: null == priceMap
          ? _value._priceMap
          : priceMap // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, MaterialPriceDetail>,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDeal,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealCopyWith<$Res> get comboDeal {
    return $PriceComboDealCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value));
    });
  }
}

/// @nodoc

class _$_SetPriceInfo implements _SetPriceInfo {
  const _$_SetPriceInfo(
      {required final Map<MaterialNumber, MaterialPriceDetail> priceMap,
      required this.comboDeal})
      : _priceMap = priceMap;

  final Map<MaterialNumber, MaterialPriceDetail> _priceMap;
  @override
  Map<MaterialNumber, MaterialPriceDetail> get priceMap {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_priceMap);
  }

  @override
  final PriceComboDeal comboDeal;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.setPriceInfo(priceMap: $priceMap, comboDeal: $comboDeal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetPriceInfo &&
            const DeepCollectionEquality().equals(other._priceMap, _priceMap) &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_priceMap), comboDeal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetPriceInfoCopyWith<_$_SetPriceInfo> get copyWith =>
      __$$_SetPriceInfoCopyWithImpl<_$_SetPriceInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initComboDealItems,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)
        setPriceInfo,
    required TResult Function(ComboDeal comboDealInfo) setComboDealInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
  }) {
    return setPriceInfo(priceMap, comboDeal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult? Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
  }) {
    return setPriceInfo?.call(priceMap, comboDeal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    required TResult orElse(),
  }) {
    if (setPriceInfo != null) {
      return setPriceInfo(priceMap, comboDeal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitComboDealItems value) initComboDealItems,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_SetComboDealInfo value) setComboDealInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
  }) {
    return setPriceInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitComboDealItems value)? initComboDealItems,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
  }) {
    return setPriceInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitComboDealItems value)? initComboDealItems,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
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
      {required final Map<MaterialNumber, MaterialPriceDetail> priceMap,
      required final PriceComboDeal comboDeal}) = _$_SetPriceInfo;

  Map<MaterialNumber, MaterialPriceDetail> get priceMap;
  PriceComboDeal get comboDeal;
  @JsonKey(ignore: true)
  _$$_SetPriceInfoCopyWith<_$_SetPriceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetComboDealInfoCopyWith<$Res> {
  factory _$$_SetComboDealInfoCopyWith(
          _$_SetComboDealInfo value, $Res Function(_$_SetComboDealInfo) then) =
      __$$_SetComboDealInfoCopyWithImpl<$Res>;
  @useResult
  $Res call({ComboDeal comboDealInfo});

  $ComboDealCopyWith<$Res> get comboDealInfo;
}

/// @nodoc
class __$$_SetComboDealInfoCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$_SetComboDealInfo> implements _$$_SetComboDealInfoCopyWith<$Res> {
  __$$_SetComboDealInfoCopyWithImpl(
      _$_SetComboDealInfo _value, $Res Function(_$_SetComboDealInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comboDealInfo = null,
  }) {
    return _then(_$_SetComboDealInfo(
      comboDealInfo: null == comboDealInfo
          ? _value.comboDealInfo
          : comboDealInfo // ignore: cast_nullable_to_non_nullable
              as ComboDeal,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ComboDealCopyWith<$Res> get comboDealInfo {
    return $ComboDealCopyWith<$Res>(_value.comboDealInfo, (value) {
      return _then(_value.copyWith(comboDealInfo: value));
    });
  }
}

/// @nodoc

class _$_SetComboDealInfo implements _SetComboDealInfo {
  const _$_SetComboDealInfo({required this.comboDealInfo});

  @override
  final ComboDeal comboDealInfo;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.setComboDealInfo(comboDealInfo: $comboDealInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetComboDealInfo &&
            (identical(other.comboDealInfo, comboDealInfo) ||
                other.comboDealInfo == comboDealInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comboDealInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetComboDealInfoCopyWith<_$_SetComboDealInfo> get copyWith =>
      __$$_SetComboDealInfoCopyWithImpl<_$_SetComboDealInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initComboDealItems,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)
        setPriceInfo,
    required TResult Function(ComboDeal comboDealInfo) setComboDealInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
  }) {
    return setComboDealInfo(comboDealInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult? Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
  }) {
    return setComboDealInfo?.call(comboDealInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    required TResult orElse(),
  }) {
    if (setComboDealInfo != null) {
      return setComboDealInfo(comboDealInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_InitComboDealItems value) initComboDealItems,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_SetComboDealInfo value) setComboDealInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
  }) {
    return setComboDealInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitComboDealItems value)? initComboDealItems,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
  }) {
    return setComboDealInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitComboDealItems value)? initComboDealItems,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    required TResult orElse(),
  }) {
    if (setComboDealInfo != null) {
      return setComboDealInfo(this);
    }
    return orElse();
  }
}

abstract class _SetComboDealInfo implements ComboDealMaterialDetailEvent {
  const factory _SetComboDealInfo({required final ComboDeal comboDealInfo}) =
      _$_SetComboDealInfo;

  ComboDeal get comboDealInfo;
  @JsonKey(ignore: true)
  _$$_SetComboDealInfoCopyWith<_$_SetComboDealInfo> get copyWith =>
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
    required TResult Function() initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initComboDealItems,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)
        setPriceInfo,
    required TResult Function(ComboDeal comboDealInfo) setComboDealInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
  }) {
    return updateItemQuantity(item, qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult? Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
  }) {
    return updateItemQuantity?.call(item, qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
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
    required TResult Function(_InitComboDealItems value) initComboDealItems,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_SetComboDealInfo value) setComboDealInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
  }) {
    return updateItemQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitComboDealItems value)? initComboDealItems,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
  }) {
    return updateItemQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitComboDealItems value)? initComboDealItems,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
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
    required TResult Function() initialize,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initComboDealItems,
    required TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)
        initFromCartComboDealItems,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)
        setPriceInfo,
    required TResult Function(ComboDeal comboDealInfo) setComboDealInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
  }) {
    return updateItemSelection(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult? Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult? Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
  }) {
    return updateItemSelection?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initComboDealItems,
    TResult Function(
            List<PriceAggregate> items, SalesOrganisationConfigs salesConfigs)?
        initFromCartComboDealItems,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap,
            PriceComboDeal comboDeal)?
        setPriceInfo,
    TResult Function(ComboDeal comboDealInfo)? setComboDealInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
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
    required TResult Function(_InitComboDealItems value) initComboDealItems,
    required TResult Function(_InitFromCartComboDealItems value)
        initFromCartComboDealItems,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_SetComboDealInfo value) setComboDealInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
  }) {
    return updateItemSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_InitComboDealItems value)? initComboDealItems,
    TResult? Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
  }) {
    return updateItemSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_InitComboDealItems value)? initComboDealItems,
    TResult Function(_InitFromCartComboDealItems value)?
        initFromCartComboDealItems,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_SetComboDealInfo value)? setComboDealInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
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
mixin _$ComboDealMaterialDetailState {
  Map<MaterialNumber, PriceAggregate> get items =>
      throw _privateConstructorUsedError;
  Map<MaterialNumber, bool> get selectedItems =>
      throw _privateConstructorUsedError;
  bool get isFetchingPrice => throw _privateConstructorUsedError;
  bool get isFetchingComboInfo => throw _privateConstructorUsedError;

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
      bool isFetchingComboInfo});
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
    ) as $Val);
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
      bool isFetchingComboInfo});
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
    ));
  }
}

/// @nodoc

class _$_ComboDealDetailState extends _ComboDealDetailState {
  const _$_ComboDealDetailState(
      {required final Map<MaterialNumber, PriceAggregate> items,
      required final Map<MaterialNumber, bool> selectedItems,
      required this.isFetchingPrice,
      required this.isFetchingComboInfo})
      : _items = items,
        _selectedItems = selectedItems,
        super._();

  final Map<MaterialNumber, PriceAggregate> _items;
  @override
  Map<MaterialNumber, PriceAggregate> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  final Map<MaterialNumber, bool> _selectedItems;
  @override
  Map<MaterialNumber, bool> get selectedItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedItems);
  }

  @override
  final bool isFetchingPrice;
  @override
  final bool isFetchingComboInfo;

  @override
  String toString() {
    return 'ComboDealMaterialDetailState(items: $items, selectedItems: $selectedItems, isFetchingPrice: $isFetchingPrice, isFetchingComboInfo: $isFetchingComboInfo)';
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
                other.isFetchingComboInfo == isFetchingComboInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_selectedItems),
      isFetchingPrice,
      isFetchingComboInfo);

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
      required final bool isFetchingComboInfo}) = _$_ComboDealDetailState;
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
  @JsonKey(ignore: true)
  _$$_ComboDealDetailStateCopyWith<_$_ComboDealDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
