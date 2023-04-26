// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_aggregate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceAggregate {
  Price get price => throw _privateConstructorUsedError;
  MaterialInfo get materialInfo => throw _privateConstructorUsedError;
  Bundle get bundle => throw _privateConstructorUsedError;
  BannerItem get banner => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesOrgConfig =>
      throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get discountedMaterialCount => throw _privateConstructorUsedError;
  List<MaterialItemBonus> get addedBonusList =>
      throw _privateConstructorUsedError;
  StockInfo get stockInfo => throw _privateConstructorUsedError;
  TenderContract get tenderContract => throw _privateConstructorUsedError;
  ComboDeal get comboDeal => throw _privateConstructorUsedError;
  bool get isSpecialOrderType => throw _privateConstructorUsedError;
  List<StockInfo> get stockInfoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceAggregateCopyWith<PriceAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceAggregateCopyWith<$Res> {
  factory $PriceAggregateCopyWith(
          PriceAggregate value, $Res Function(PriceAggregate) then) =
      _$PriceAggregateCopyWithImpl<$Res, PriceAggregate>;
  @useResult
  $Res call(
      {Price price,
      MaterialInfo materialInfo,
      Bundle bundle,
      BannerItem banner,
      SalesOrganisationConfigs salesOrgConfig,
      int quantity,
      int discountedMaterialCount,
      List<MaterialItemBonus> addedBonusList,
      StockInfo stockInfo,
      TenderContract tenderContract,
      ComboDeal comboDeal,
      bool isSpecialOrderType,
      List<StockInfo> stockInfoList});

  $PriceCopyWith<$Res> get price;
  $MaterialInfoCopyWith<$Res> get materialInfo;
  $BundleCopyWith<$Res> get bundle;
  $BannerItemCopyWith<$Res> get banner;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
  $StockInfoCopyWith<$Res> get stockInfo;
  $TenderContractCopyWith<$Res> get tenderContract;
  $ComboDealCopyWith<$Res> get comboDeal;
}

/// @nodoc
class _$PriceAggregateCopyWithImpl<$Res, $Val extends PriceAggregate>
    implements $PriceAggregateCopyWith<$Res> {
  _$PriceAggregateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? materialInfo = null,
    Object? bundle = null,
    Object? banner = null,
    Object? salesOrgConfig = null,
    Object? quantity = null,
    Object? discountedMaterialCount = null,
    Object? addedBonusList = null,
    Object? stockInfo = null,
    Object? tenderContract = null,
    Object? comboDeal = null,
    Object? isSpecialOrderType = null,
    Object? stockInfoList = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      materialInfo: null == materialInfo
          ? _value.materialInfo
          : materialInfo // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as Bundle,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as BannerItem,
      salesOrgConfig: null == salesOrgConfig
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      discountedMaterialCount: null == discountedMaterialCount
          ? _value.discountedMaterialCount
          : discountedMaterialCount // ignore: cast_nullable_to_non_nullable
              as int,
      addedBonusList: null == addedBonusList
          ? _value.addedBonusList
          : addedBonusList // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonus>,
      stockInfo: null == stockInfo
          ? _value.stockInfo
          : stockInfo // ignore: cast_nullable_to_non_nullable
              as StockInfo,
      tenderContract: null == tenderContract
          ? _value.tenderContract
          : tenderContract // ignore: cast_nullable_to_non_nullable
              as TenderContract,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as ComboDeal,
      isSpecialOrderType: null == isSpecialOrderType
          ? _value.isSpecialOrderType
          : isSpecialOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      stockInfoList: null == stockInfoList
          ? _value.stockInfoList
          : stockInfoList // ignore: cast_nullable_to_non_nullable
              as List<StockInfo>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res> get price {
    return $PriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get materialInfo {
    return $MaterialInfoCopyWith<$Res>(_value.materialInfo, (value) {
      return _then(_value.copyWith(materialInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BundleCopyWith<$Res> get bundle {
    return $BundleCopyWith<$Res>(_value.bundle, (value) {
      return _then(_value.copyWith(bundle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BannerItemCopyWith<$Res> get banner {
    return $BannerItemCopyWith<$Res>(_value.banner, (value) {
      return _then(_value.copyWith(banner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfig,
        (value) {
      return _then(_value.copyWith(salesOrgConfig: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StockInfoCopyWith<$Res> get stockInfo {
    return $StockInfoCopyWith<$Res>(_value.stockInfo, (value) {
      return _then(_value.copyWith(stockInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TenderContractCopyWith<$Res> get tenderContract {
    return $TenderContractCopyWith<$Res>(_value.tenderContract, (value) {
      return _then(_value.copyWith(tenderContract: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ComboDealCopyWith<$Res> get comboDeal {
    return $ComboDealCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PriceAggregateCopyWith<$Res>
    implements $PriceAggregateCopyWith<$Res> {
  factory _$$_PriceAggregateCopyWith(
          _$_PriceAggregate value, $Res Function(_$_PriceAggregate) then) =
      __$$_PriceAggregateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Price price,
      MaterialInfo materialInfo,
      Bundle bundle,
      BannerItem banner,
      SalesOrganisationConfigs salesOrgConfig,
      int quantity,
      int discountedMaterialCount,
      List<MaterialItemBonus> addedBonusList,
      StockInfo stockInfo,
      TenderContract tenderContract,
      ComboDeal comboDeal,
      bool isSpecialOrderType,
      List<StockInfo> stockInfoList});

  @override
  $PriceCopyWith<$Res> get price;
  @override
  $MaterialInfoCopyWith<$Res> get materialInfo;
  @override
  $BundleCopyWith<$Res> get bundle;
  @override
  $BannerItemCopyWith<$Res> get banner;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
  @override
  $StockInfoCopyWith<$Res> get stockInfo;
  @override
  $TenderContractCopyWith<$Res> get tenderContract;
  @override
  $ComboDealCopyWith<$Res> get comboDeal;
}

/// @nodoc
class __$$_PriceAggregateCopyWithImpl<$Res>
    extends _$PriceAggregateCopyWithImpl<$Res, _$_PriceAggregate>
    implements _$$_PriceAggregateCopyWith<$Res> {
  __$$_PriceAggregateCopyWithImpl(
      _$_PriceAggregate _value, $Res Function(_$_PriceAggregate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? materialInfo = null,
    Object? bundle = null,
    Object? banner = null,
    Object? salesOrgConfig = null,
    Object? quantity = null,
    Object? discountedMaterialCount = null,
    Object? addedBonusList = null,
    Object? stockInfo = null,
    Object? tenderContract = null,
    Object? comboDeal = null,
    Object? isSpecialOrderType = null,
    Object? stockInfoList = null,
  }) {
    return _then(_$_PriceAggregate(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      materialInfo: null == materialInfo
          ? _value.materialInfo
          : materialInfo // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as Bundle,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as BannerItem,
      salesOrgConfig: null == salesOrgConfig
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      discountedMaterialCount: null == discountedMaterialCount
          ? _value.discountedMaterialCount
          : discountedMaterialCount // ignore: cast_nullable_to_non_nullable
              as int,
      addedBonusList: null == addedBonusList
          ? _value._addedBonusList
          : addedBonusList // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonus>,
      stockInfo: null == stockInfo
          ? _value.stockInfo
          : stockInfo // ignore: cast_nullable_to_non_nullable
              as StockInfo,
      tenderContract: null == tenderContract
          ? _value.tenderContract
          : tenderContract // ignore: cast_nullable_to_non_nullable
              as TenderContract,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as ComboDeal,
      isSpecialOrderType: null == isSpecialOrderType
          ? _value.isSpecialOrderType
          : isSpecialOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      stockInfoList: null == stockInfoList
          ? _value._stockInfoList
          : stockInfoList // ignore: cast_nullable_to_non_nullable
              as List<StockInfo>,
    ));
  }
}

/// @nodoc

class _$_PriceAggregate extends _PriceAggregate {
  const _$_PriceAggregate(
      {required this.price,
      required this.materialInfo,
      required this.bundle,
      required this.banner,
      required this.salesOrgConfig,
      required this.quantity,
      this.discountedMaterialCount = 0,
      required final List<MaterialItemBonus> addedBonusList,
      required this.stockInfo,
      required this.tenderContract,
      required this.comboDeal,
      this.isSpecialOrderType = false,
      final List<StockInfo> stockInfoList = const <StockInfo>[]})
      : _addedBonusList = addedBonusList,
        _stockInfoList = stockInfoList,
        super._();

  @override
  final Price price;
  @override
  final MaterialInfo materialInfo;
  @override
  final Bundle bundle;
  @override
  final BannerItem banner;
  @override
  final SalesOrganisationConfigs salesOrgConfig;
  @override
  final int quantity;
  @override
  @JsonKey()
  final int discountedMaterialCount;
  final List<MaterialItemBonus> _addedBonusList;
  @override
  List<MaterialItemBonus> get addedBonusList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addedBonusList);
  }

  @override
  final StockInfo stockInfo;
  @override
  final TenderContract tenderContract;
  @override
  final ComboDeal comboDeal;
  @override
  @JsonKey()
  final bool isSpecialOrderType;
  final List<StockInfo> _stockInfoList;
  @override
  @JsonKey()
  List<StockInfo> get stockInfoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stockInfoList);
  }

  @override
  String toString() {
    return 'PriceAggregate(price: $price, materialInfo: $materialInfo, bundle: $bundle, banner: $banner, salesOrgConfig: $salesOrgConfig, quantity: $quantity, discountedMaterialCount: $discountedMaterialCount, addedBonusList: $addedBonusList, stockInfo: $stockInfo, tenderContract: $tenderContract, comboDeal: $comboDeal, isSpecialOrderType: $isSpecialOrderType, stockInfoList: $stockInfoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceAggregate &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.materialInfo, materialInfo) ||
                other.materialInfo == materialInfo) &&
            (identical(other.bundle, bundle) || other.bundle == bundle) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.salesOrgConfig, salesOrgConfig) ||
                other.salesOrgConfig == salesOrgConfig) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(
                    other.discountedMaterialCount, discountedMaterialCount) ||
                other.discountedMaterialCount == discountedMaterialCount) &&
            const DeepCollectionEquality()
                .equals(other._addedBonusList, _addedBonusList) &&
            (identical(other.stockInfo, stockInfo) ||
                other.stockInfo == stockInfo) &&
            (identical(other.tenderContract, tenderContract) ||
                other.tenderContract == tenderContract) &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            (identical(other.isSpecialOrderType, isSpecialOrderType) ||
                other.isSpecialOrderType == isSpecialOrderType) &&
            const DeepCollectionEquality()
                .equals(other._stockInfoList, _stockInfoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      price,
      materialInfo,
      bundle,
      banner,
      salesOrgConfig,
      quantity,
      discountedMaterialCount,
      const DeepCollectionEquality().hash(_addedBonusList),
      stockInfo,
      tenderContract,
      comboDeal,
      isSpecialOrderType,
      const DeepCollectionEquality().hash(_stockInfoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceAggregateCopyWith<_$_PriceAggregate> get copyWith =>
      __$$_PriceAggregateCopyWithImpl<_$_PriceAggregate>(this, _$identity);
}

abstract class _PriceAggregate extends PriceAggregate {
  const factory _PriceAggregate(
      {required final Price price,
      required final MaterialInfo materialInfo,
      required final Bundle bundle,
      required final BannerItem banner,
      required final SalesOrganisationConfigs salesOrgConfig,
      required final int quantity,
      final int discountedMaterialCount,
      required final List<MaterialItemBonus> addedBonusList,
      required final StockInfo stockInfo,
      required final TenderContract tenderContract,
      required final ComboDeal comboDeal,
      final bool isSpecialOrderType,
      final List<StockInfo> stockInfoList}) = _$_PriceAggregate;
  const _PriceAggregate._() : super._();

  @override
  Price get price;
  @override
  MaterialInfo get materialInfo;
  @override
  Bundle get bundle;
  @override
  BannerItem get banner;
  @override
  SalesOrganisationConfigs get salesOrgConfig;
  @override
  int get quantity;
  @override
  int get discountedMaterialCount;
  @override
  List<MaterialItemBonus> get addedBonusList;
  @override
  StockInfo get stockInfo;
  @override
  TenderContract get tenderContract;
  @override
  ComboDeal get comboDeal;
  @override
  bool get isSpecialOrderType;
  @override
  List<StockInfo> get stockInfoList;
  @override
  @JsonKey(ignore: true)
  _$$_PriceAggregateCopyWith<_$_PriceAggregate> get copyWith =>
      throw _privateConstructorUsedError;
}
