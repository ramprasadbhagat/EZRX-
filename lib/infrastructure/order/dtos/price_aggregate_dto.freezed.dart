// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_aggregate_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceAggregateDto {
  @HiveField(0, defaultValue: _emptyConstMaterialDto)
  MaterialDto get materialDto => throw _privateConstructorUsedError;
  @HiveField(1, defaultValue: 1)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(2, defaultValue: _emptyPriceDto)
  PriceDto get priceDto => throw _privateConstructorUsedError;
  @HiveField(3, defaultValue: _emptySalesOrganisationConfigsDto)
  SalesOrganisationConfigsDto get salesOrganisationConfigsDto =>
      throw _privateConstructorUsedError;
  @HiveField(4, defaultValue: 0)
  int get zmgMaterialCountOnCart => throw _privateConstructorUsedError;
  @HiveField(5, defaultValue: _emptyBundleDto)
  BundleDto get bundleDto => throw _privateConstructorUsedError;
  @HiveField(6, defaultValue: [])
  List<MaterialItemBonusDto> get bonusItem =>
      throw _privateConstructorUsedError;
  @HiveField(7, defaultValue: _emptyStockInfoDto)
  StockInfoDto get stockInfoDto => throw _privateConstructorUsedError;
  @HiveField(8, defaultValue: _emptyTenderContractDto)
  TenderContractDto get tenderContractDto => throw _privateConstructorUsedError;
  @HiveField(9, defaultValue: ComboDealDto.empty)
  ComboDealDto get comboDealDto => throw _privateConstructorUsedError;
  @HiveField(10, defaultValue: false)
  bool get isSpecialOrderType => throw _privateConstructorUsedError;
  @HiveField(11, defaultValue: [])
  List<StockInfoDto> get stockInfoDtoList => throw _privateConstructorUsedError;
  @HiveField(12, defaultValue: BannerDto.empty)
  BannerDto get bannerDto => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceAggregateDtoCopyWith<PriceAggregateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceAggregateDtoCopyWith<$Res> {
  factory $PriceAggregateDtoCopyWith(
          PriceAggregateDto value, $Res Function(PriceAggregateDto) then) =
      _$PriceAggregateDtoCopyWithImpl<$Res, PriceAggregateDto>;
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: _emptyConstMaterialDto)
          MaterialDto materialDto,
      @HiveField(1, defaultValue: 1)
          int quantity,
      @HiveField(2, defaultValue: _emptyPriceDto)
          PriceDto priceDto,
      @HiveField(3, defaultValue: _emptySalesOrganisationConfigsDto)
          SalesOrganisationConfigsDto salesOrganisationConfigsDto,
      @HiveField(4, defaultValue: 0)
          int zmgMaterialCountOnCart,
      @HiveField(5, defaultValue: _emptyBundleDto)
          BundleDto bundleDto,
      @HiveField(6, defaultValue: [])
          List<MaterialItemBonusDto> bonusItem,
      @HiveField(7, defaultValue: _emptyStockInfoDto)
          StockInfoDto stockInfoDto,
      @HiveField(8, defaultValue: _emptyTenderContractDto)
          TenderContractDto tenderContractDto,
      @HiveField(9, defaultValue: ComboDealDto.empty)
          ComboDealDto comboDealDto,
      @HiveField(10, defaultValue: false)
          bool isSpecialOrderType,
      @HiveField(11, defaultValue: [])
          List<StockInfoDto> stockInfoDtoList,
      @HiveField(12, defaultValue: BannerDto.empty)
          BannerDto bannerDto});

  $MaterialDtoCopyWith<$Res> get materialDto;
  $PriceDtoCopyWith<$Res> get priceDto;
  $SalesOrganisationConfigsDtoCopyWith<$Res> get salesOrganisationConfigsDto;
  $BundleDtoCopyWith<$Res> get bundleDto;
  $StockInfoDtoCopyWith<$Res> get stockInfoDto;
  $TenderContractDtoCopyWith<$Res> get tenderContractDto;
  $ComboDealDtoCopyWith<$Res> get comboDealDto;
  $BannerDtoCopyWith<$Res> get bannerDto;
}

/// @nodoc
class _$PriceAggregateDtoCopyWithImpl<$Res, $Val extends PriceAggregateDto>
    implements $PriceAggregateDtoCopyWith<$Res> {
  _$PriceAggregateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialDto = null,
    Object? quantity = null,
    Object? priceDto = null,
    Object? salesOrganisationConfigsDto = null,
    Object? zmgMaterialCountOnCart = null,
    Object? bundleDto = null,
    Object? bonusItem = null,
    Object? stockInfoDto = null,
    Object? tenderContractDto = null,
    Object? comboDealDto = null,
    Object? isSpecialOrderType = null,
    Object? stockInfoDtoList = null,
    Object? bannerDto = null,
  }) {
    return _then(_value.copyWith(
      materialDto: null == materialDto
          ? _value.materialDto
          : materialDto // ignore: cast_nullable_to_non_nullable
              as MaterialDto,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      priceDto: null == priceDto
          ? _value.priceDto
          : priceDto // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      salesOrganisationConfigsDto: null == salesOrganisationConfigsDto
          ? _value.salesOrganisationConfigsDto
          : salesOrganisationConfigsDto // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigsDto,
      zmgMaterialCountOnCart: null == zmgMaterialCountOnCart
          ? _value.zmgMaterialCountOnCart
          : zmgMaterialCountOnCart // ignore: cast_nullable_to_non_nullable
              as int,
      bundleDto: null == bundleDto
          ? _value.bundleDto
          : bundleDto // ignore: cast_nullable_to_non_nullable
              as BundleDto,
      bonusItem: null == bonusItem
          ? _value.bonusItem
          : bonusItem // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonusDto>,
      stockInfoDto: null == stockInfoDto
          ? _value.stockInfoDto
          : stockInfoDto // ignore: cast_nullable_to_non_nullable
              as StockInfoDto,
      tenderContractDto: null == tenderContractDto
          ? _value.tenderContractDto
          : tenderContractDto // ignore: cast_nullable_to_non_nullable
              as TenderContractDto,
      comboDealDto: null == comboDealDto
          ? _value.comboDealDto
          : comboDealDto // ignore: cast_nullable_to_non_nullable
              as ComboDealDto,
      isSpecialOrderType: null == isSpecialOrderType
          ? _value.isSpecialOrderType
          : isSpecialOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      stockInfoDtoList: null == stockInfoDtoList
          ? _value.stockInfoDtoList
          : stockInfoDtoList // ignore: cast_nullable_to_non_nullable
              as List<StockInfoDto>,
      bannerDto: null == bannerDto
          ? _value.bannerDto
          : bannerDto // ignore: cast_nullable_to_non_nullable
              as BannerDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialDtoCopyWith<$Res> get materialDto {
    return $MaterialDtoCopyWith<$Res>(_value.materialDto, (value) {
      return _then(_value.copyWith(materialDto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceDtoCopyWith<$Res> get priceDto {
    return $PriceDtoCopyWith<$Res>(_value.priceDto, (value) {
      return _then(_value.copyWith(priceDto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsDtoCopyWith<$Res> get salesOrganisationConfigsDto {
    return $SalesOrganisationConfigsDtoCopyWith<$Res>(
        _value.salesOrganisationConfigsDto, (value) {
      return _then(_value.copyWith(salesOrganisationConfigsDto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BundleDtoCopyWith<$Res> get bundleDto {
    return $BundleDtoCopyWith<$Res>(_value.bundleDto, (value) {
      return _then(_value.copyWith(bundleDto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StockInfoDtoCopyWith<$Res> get stockInfoDto {
    return $StockInfoDtoCopyWith<$Res>(_value.stockInfoDto, (value) {
      return _then(_value.copyWith(stockInfoDto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TenderContractDtoCopyWith<$Res> get tenderContractDto {
    return $TenderContractDtoCopyWith<$Res>(_value.tenderContractDto, (value) {
      return _then(_value.copyWith(tenderContractDto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ComboDealDtoCopyWith<$Res> get comboDealDto {
    return $ComboDealDtoCopyWith<$Res>(_value.comboDealDto, (value) {
      return _then(_value.copyWith(comboDealDto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BannerDtoCopyWith<$Res> get bannerDto {
    return $BannerDtoCopyWith<$Res>(_value.bannerDto, (value) {
      return _then(_value.copyWith(bannerDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PriceAggregateDtoCopyWith<$Res>
    implements $PriceAggregateDtoCopyWith<$Res> {
  factory _$$_PriceAggregateDtoCopyWith(_$_PriceAggregateDto value,
          $Res Function(_$_PriceAggregateDto) then) =
      __$$_PriceAggregateDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: _emptyConstMaterialDto)
          MaterialDto materialDto,
      @HiveField(1, defaultValue: 1)
          int quantity,
      @HiveField(2, defaultValue: _emptyPriceDto)
          PriceDto priceDto,
      @HiveField(3, defaultValue: _emptySalesOrganisationConfigsDto)
          SalesOrganisationConfigsDto salesOrganisationConfigsDto,
      @HiveField(4, defaultValue: 0)
          int zmgMaterialCountOnCart,
      @HiveField(5, defaultValue: _emptyBundleDto)
          BundleDto bundleDto,
      @HiveField(6, defaultValue: [])
          List<MaterialItemBonusDto> bonusItem,
      @HiveField(7, defaultValue: _emptyStockInfoDto)
          StockInfoDto stockInfoDto,
      @HiveField(8, defaultValue: _emptyTenderContractDto)
          TenderContractDto tenderContractDto,
      @HiveField(9, defaultValue: ComboDealDto.empty)
          ComboDealDto comboDealDto,
      @HiveField(10, defaultValue: false)
          bool isSpecialOrderType,
      @HiveField(11, defaultValue: [])
          List<StockInfoDto> stockInfoDtoList,
      @HiveField(12, defaultValue: BannerDto.empty)
          BannerDto bannerDto});

  @override
  $MaterialDtoCopyWith<$Res> get materialDto;
  @override
  $PriceDtoCopyWith<$Res> get priceDto;
  @override
  $SalesOrganisationConfigsDtoCopyWith<$Res> get salesOrganisationConfigsDto;
  @override
  $BundleDtoCopyWith<$Res> get bundleDto;
  @override
  $StockInfoDtoCopyWith<$Res> get stockInfoDto;
  @override
  $TenderContractDtoCopyWith<$Res> get tenderContractDto;
  @override
  $ComboDealDtoCopyWith<$Res> get comboDealDto;
  @override
  $BannerDtoCopyWith<$Res> get bannerDto;
}

/// @nodoc
class __$$_PriceAggregateDtoCopyWithImpl<$Res>
    extends _$PriceAggregateDtoCopyWithImpl<$Res, _$_PriceAggregateDto>
    implements _$$_PriceAggregateDtoCopyWith<$Res> {
  __$$_PriceAggregateDtoCopyWithImpl(
      _$_PriceAggregateDto _value, $Res Function(_$_PriceAggregateDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialDto = null,
    Object? quantity = null,
    Object? priceDto = null,
    Object? salesOrganisationConfigsDto = null,
    Object? zmgMaterialCountOnCart = null,
    Object? bundleDto = null,
    Object? bonusItem = null,
    Object? stockInfoDto = null,
    Object? tenderContractDto = null,
    Object? comboDealDto = null,
    Object? isSpecialOrderType = null,
    Object? stockInfoDtoList = null,
    Object? bannerDto = null,
  }) {
    return _then(_$_PriceAggregateDto(
      materialDto: null == materialDto
          ? _value.materialDto
          : materialDto // ignore: cast_nullable_to_non_nullable
              as MaterialDto,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      priceDto: null == priceDto
          ? _value.priceDto
          : priceDto // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      salesOrganisationConfigsDto: null == salesOrganisationConfigsDto
          ? _value.salesOrganisationConfigsDto
          : salesOrganisationConfigsDto // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigsDto,
      zmgMaterialCountOnCart: null == zmgMaterialCountOnCart
          ? _value.zmgMaterialCountOnCart
          : zmgMaterialCountOnCart // ignore: cast_nullable_to_non_nullable
              as int,
      bundleDto: null == bundleDto
          ? _value.bundleDto
          : bundleDto // ignore: cast_nullable_to_non_nullable
              as BundleDto,
      bonusItem: null == bonusItem
          ? _value._bonusItem
          : bonusItem // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonusDto>,
      stockInfoDto: null == stockInfoDto
          ? _value.stockInfoDto
          : stockInfoDto // ignore: cast_nullable_to_non_nullable
              as StockInfoDto,
      tenderContractDto: null == tenderContractDto
          ? _value.tenderContractDto
          : tenderContractDto // ignore: cast_nullable_to_non_nullable
              as TenderContractDto,
      comboDealDto: null == comboDealDto
          ? _value.comboDealDto
          : comboDealDto // ignore: cast_nullable_to_non_nullable
              as ComboDealDto,
      isSpecialOrderType: null == isSpecialOrderType
          ? _value.isSpecialOrderType
          : isSpecialOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      stockInfoDtoList: null == stockInfoDtoList
          ? _value._stockInfoDtoList
          : stockInfoDtoList // ignore: cast_nullable_to_non_nullable
              as List<StockInfoDto>,
      bannerDto: null == bannerDto
          ? _value.bannerDto
          : bannerDto // ignore: cast_nullable_to_non_nullable
              as BannerDto,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 2, adapterName: 'PriceAggregateDtoAdapter')
class _$_PriceAggregateDto extends _PriceAggregateDto {
  const _$_PriceAggregateDto(
      {@HiveField(0, defaultValue: _emptyConstMaterialDto)
          required this.materialDto,
      @HiveField(1, defaultValue: 1)
          required this.quantity,
      @HiveField(2, defaultValue: _emptyPriceDto)
          required this.priceDto,
      @HiveField(3, defaultValue: _emptySalesOrganisationConfigsDto)
          required this.salesOrganisationConfigsDto,
      @HiveField(4, defaultValue: 0)
          required this.zmgMaterialCountOnCart,
      @HiveField(5, defaultValue: _emptyBundleDto)
          required this.bundleDto,
      @HiveField(6, defaultValue: [])
          required final List<MaterialItemBonusDto> bonusItem,
      @HiveField(7, defaultValue: _emptyStockInfoDto)
          required this.stockInfoDto,
      @HiveField(8, defaultValue: _emptyTenderContractDto)
          required this.tenderContractDto,
      @HiveField(9, defaultValue: ComboDealDto.empty)
          required this.comboDealDto,
      @HiveField(10, defaultValue: false)
          required this.isSpecialOrderType,
      @HiveField(11, defaultValue: [])
          required final List<StockInfoDto> stockInfoDtoList,
      @HiveField(12, defaultValue: BannerDto.empty)
          required this.bannerDto})
      : _bonusItem = bonusItem,
        _stockInfoDtoList = stockInfoDtoList,
        super._();

  @override
  @HiveField(0, defaultValue: _emptyConstMaterialDto)
  final MaterialDto materialDto;
  @override
  @HiveField(1, defaultValue: 1)
  final int quantity;
  @override
  @HiveField(2, defaultValue: _emptyPriceDto)
  final PriceDto priceDto;
  @override
  @HiveField(3, defaultValue: _emptySalesOrganisationConfigsDto)
  final SalesOrganisationConfigsDto salesOrganisationConfigsDto;
  @override
  @HiveField(4, defaultValue: 0)
  final int zmgMaterialCountOnCart;
  @override
  @HiveField(5, defaultValue: _emptyBundleDto)
  final BundleDto bundleDto;
  final List<MaterialItemBonusDto> _bonusItem;
  @override
  @HiveField(6, defaultValue: [])
  List<MaterialItemBonusDto> get bonusItem {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusItem);
  }

  @override
  @HiveField(7, defaultValue: _emptyStockInfoDto)
  final StockInfoDto stockInfoDto;
  @override
  @HiveField(8, defaultValue: _emptyTenderContractDto)
  final TenderContractDto tenderContractDto;
  @override
  @HiveField(9, defaultValue: ComboDealDto.empty)
  final ComboDealDto comboDealDto;
  @override
  @HiveField(10, defaultValue: false)
  final bool isSpecialOrderType;
  final List<StockInfoDto> _stockInfoDtoList;
  @override
  @HiveField(11, defaultValue: [])
  List<StockInfoDto> get stockInfoDtoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stockInfoDtoList);
  }

  @override
  @HiveField(12, defaultValue: BannerDto.empty)
  final BannerDto bannerDto;

  @override
  String toString() {
    return 'PriceAggregateDto(materialDto: $materialDto, quantity: $quantity, priceDto: $priceDto, salesOrganisationConfigsDto: $salesOrganisationConfigsDto, zmgMaterialCountOnCart: $zmgMaterialCountOnCart, bundleDto: $bundleDto, bonusItem: $bonusItem, stockInfoDto: $stockInfoDto, tenderContractDto: $tenderContractDto, comboDealDto: $comboDealDto, isSpecialOrderType: $isSpecialOrderType, stockInfoDtoList: $stockInfoDtoList, bannerDto: $bannerDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceAggregateDto &&
            (identical(other.materialDto, materialDto) ||
                other.materialDto == materialDto) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.priceDto, priceDto) ||
                other.priceDto == priceDto) &&
            (identical(other.salesOrganisationConfigsDto,
                    salesOrganisationConfigsDto) ||
                other.salesOrganisationConfigsDto ==
                    salesOrganisationConfigsDto) &&
            (identical(other.zmgMaterialCountOnCart, zmgMaterialCountOnCart) ||
                other.zmgMaterialCountOnCart == zmgMaterialCountOnCart) &&
            (identical(other.bundleDto, bundleDto) ||
                other.bundleDto == bundleDto) &&
            const DeepCollectionEquality()
                .equals(other._bonusItem, _bonusItem) &&
            (identical(other.stockInfoDto, stockInfoDto) ||
                other.stockInfoDto == stockInfoDto) &&
            (identical(other.tenderContractDto, tenderContractDto) ||
                other.tenderContractDto == tenderContractDto) &&
            (identical(other.comboDealDto, comboDealDto) ||
                other.comboDealDto == comboDealDto) &&
            (identical(other.isSpecialOrderType, isSpecialOrderType) ||
                other.isSpecialOrderType == isSpecialOrderType) &&
            const DeepCollectionEquality()
                .equals(other._stockInfoDtoList, _stockInfoDtoList) &&
            (identical(other.bannerDto, bannerDto) ||
                other.bannerDto == bannerDto));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialDto,
      quantity,
      priceDto,
      salesOrganisationConfigsDto,
      zmgMaterialCountOnCart,
      bundleDto,
      const DeepCollectionEquality().hash(_bonusItem),
      stockInfoDto,
      tenderContractDto,
      comboDealDto,
      isSpecialOrderType,
      const DeepCollectionEquality().hash(_stockInfoDtoList),
      bannerDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceAggregateDtoCopyWith<_$_PriceAggregateDto> get copyWith =>
      __$$_PriceAggregateDtoCopyWithImpl<_$_PriceAggregateDto>(
          this, _$identity);
}

abstract class _PriceAggregateDto extends PriceAggregateDto {
  const factory _PriceAggregateDto(
      {@HiveField(0, defaultValue: _emptyConstMaterialDto)
          required final MaterialDto materialDto,
      @HiveField(1, defaultValue: 1)
          required final int quantity,
      @HiveField(2, defaultValue: _emptyPriceDto)
          required final PriceDto priceDto,
      @HiveField(3, defaultValue: _emptySalesOrganisationConfigsDto)
          required final SalesOrganisationConfigsDto
              salesOrganisationConfigsDto,
      @HiveField(4, defaultValue: 0)
          required final int zmgMaterialCountOnCart,
      @HiveField(5, defaultValue: _emptyBundleDto)
          required final BundleDto bundleDto,
      @HiveField(6, defaultValue: [])
          required final List<MaterialItemBonusDto> bonusItem,
      @HiveField(7, defaultValue: _emptyStockInfoDto)
          required final StockInfoDto stockInfoDto,
      @HiveField(8, defaultValue: _emptyTenderContractDto)
          required final TenderContractDto tenderContractDto,
      @HiveField(9, defaultValue: ComboDealDto.empty)
          required final ComboDealDto comboDealDto,
      @HiveField(10, defaultValue: false)
          required final bool isSpecialOrderType,
      @HiveField(11, defaultValue: [])
          required final List<StockInfoDto> stockInfoDtoList,
      @HiveField(12, defaultValue: BannerDto.empty)
          required final BannerDto bannerDto}) = _$_PriceAggregateDto;
  const _PriceAggregateDto._() : super._();

  @override
  @HiveField(0, defaultValue: _emptyConstMaterialDto)
  MaterialDto get materialDto;
  @override
  @HiveField(1, defaultValue: 1)
  int get quantity;
  @override
  @HiveField(2, defaultValue: _emptyPriceDto)
  PriceDto get priceDto;
  @override
  @HiveField(3, defaultValue: _emptySalesOrganisationConfigsDto)
  SalesOrganisationConfigsDto get salesOrganisationConfigsDto;
  @override
  @HiveField(4, defaultValue: 0)
  int get zmgMaterialCountOnCart;
  @override
  @HiveField(5, defaultValue: _emptyBundleDto)
  BundleDto get bundleDto;
  @override
  @HiveField(6, defaultValue: [])
  List<MaterialItemBonusDto> get bonusItem;
  @override
  @HiveField(7, defaultValue: _emptyStockInfoDto)
  StockInfoDto get stockInfoDto;
  @override
  @HiveField(8, defaultValue: _emptyTenderContractDto)
  TenderContractDto get tenderContractDto;
  @override
  @HiveField(9, defaultValue: ComboDealDto.empty)
  ComboDealDto get comboDealDto;
  @override
  @HiveField(10, defaultValue: false)
  bool get isSpecialOrderType;
  @override
  @HiveField(11, defaultValue: [])
  List<StockInfoDto> get stockInfoDtoList;
  @override
  @HiveField(12, defaultValue: BannerDto.empty)
  BannerDto get bannerDto;
  @override
  @JsonKey(ignore: true)
  _$$_PriceAggregateDtoCopyWith<_$_PriceAggregateDto> get copyWith =>
      throw _privateConstructorUsedError;
}
