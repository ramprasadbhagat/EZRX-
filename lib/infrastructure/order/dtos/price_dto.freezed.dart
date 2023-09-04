// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceDto _$PriceDtoFromJson(Map<String, dynamic> json) {
  return _PriceDto.fromJson(json);
}

/// @nodoc
mixin _$PriceDto {
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  @HiveField(0, defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'OldMaterialCode', defaultValue: '')
  @HiveField(1, defaultValue: '')
  String get oldMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ListPrice', defaultValue: 0)
  @HiveField(2, defaultValue: 0)
  double get listPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
  @HiveField(3, defaultValue: 0)
  double get finalIndividualPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
  @HiveField(4, defaultValue: 0)
  double get finalTotalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
  @HiveField(5, defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
  @HiveField(6, defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses => throw _privateConstructorUsedError;
  @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
  @HiveField(7, defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
  @HiveField(8, defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles => throw _privateConstructorUsedError;
  @JsonKey(name: 'Valid', defaultValue: false)
  @HiveField(9, defaultValue: false)
  bool get isValid => throw _privateConstructorUsedError;
  @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
  @HiveField(10, defaultValue: false)
  bool get additionalBonusEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZMGDiscount', defaultValue: false)
  @HiveField(11, defaultValue: false)
  bool get zmgDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
  @HiveField(12, defaultValue: '')
  String get zdp5MaxQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
  @HiveField(13, defaultValue: '')
  String get zdp5RemainingQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExceedQty', defaultValue: false)
  @HiveField(14, defaultValue: false)
  bool get exceedQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
  @HiveField(15, defaultValue: false)
  bool get overrideRulePresent => throw _privateConstructorUsedError;
  @JsonKey(name: 'OverridenRules', defaultValue: [])
  @HiveField(16, defaultValue: [])
  List<PriceRuleDto> get overridenRules => throw _privateConstructorUsedError;
  @JsonKey(name: 'OverridenRuleTier', defaultValue: [])
  @HiveField(17, defaultValue: [])
  List<OverridenRuleTierDto> get overridenRuleTier =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'isPriceOverride', defaultValue: false)
  @HiveField(18, defaultValue: false)
  bool get isPriceOverride => throw _privateConstructorUsedError;
  @HiveField(19, defaultValue: 0)
  @JsonKey(name: 'zdp8Override', defaultValue: 0)
  double get zdp8Override => throw _privateConstructorUsedError;
  @HiveField(20, defaultValue: 0)
  @JsonKey(name: 'priceOverride', defaultValue: 0)
  double get priceOverride => throw _privateConstructorUsedError;
  @HiveField(21, defaultValue: PriceComboDealDto.empty)
  @JsonKey(name: 'ComboDeals')
  PriceComboDealDto get comboDeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDiscountOverride', defaultValue: false)
  @HiveField(22, defaultValue: false)
  bool get isDiscountOverride => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceDtoCopyWith<PriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceDtoCopyWith<$Res> {
  factory $PriceDtoCopyWith(PriceDto value, $Res Function(PriceDto) then) =
      _$PriceDtoCopyWithImpl<$Res, PriceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
      @HiveField(0, defaultValue: '')
      String materialNumber,
      @JsonKey(name: 'OldMaterialCode', defaultValue: '')
      @HiveField(1, defaultValue: '')
      String oldMaterialCode,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
      @HiveField(2, defaultValue: 0)
      double listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
      @HiveField(3, defaultValue: 0)
      double finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
      @HiveField(4, defaultValue: 0)
      double finalTotalPrice,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
      @HiveField(5, defaultValue: <PriceRuleDto>[])
      List<PriceRuleDto> rules,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
      @HiveField(6, defaultValue: <PriceBonusDto>[])
      List<PriceBonusDto> bonuses,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
      @HiveField(7, defaultValue: <PriceTierDto>[])
      List<PriceTierDto> tiers,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
      @HiveField(8, defaultValue: <PriceBundleDto>[])
      List<PriceBundleDto> bundles,
      @JsonKey(name: 'Valid', defaultValue: false)
      @HiveField(9, defaultValue: false)
      bool isValid,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
      @HiveField(10, defaultValue: false)
      bool additionalBonusEligible,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
      @HiveField(11, defaultValue: false)
      bool zmgDiscount,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
      @HiveField(12, defaultValue: '')
      String zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
      @HiveField(13, defaultValue: '')
      String zdp5RemainingQuota,
      @JsonKey(name: 'ExceedQty', defaultValue: false)
      @HiveField(14, defaultValue: false)
      bool exceedQty,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
      @HiveField(15, defaultValue: false)
      bool overrideRulePresent,
      @JsonKey(name: 'OverridenRules', defaultValue: [])
      @HiveField(16, defaultValue: [])
      List<PriceRuleDto> overridenRules,
      @JsonKey(name: 'OverridenRuleTier', defaultValue: [])
      @HiveField(17, defaultValue: [])
      List<OverridenRuleTierDto> overridenRuleTier,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      @HiveField(18, defaultValue: false)
      bool isPriceOverride,
      @HiveField(19, defaultValue: 0)
      @JsonKey(name: 'zdp8Override', defaultValue: 0)
      double zdp8Override,
      @HiveField(20, defaultValue: 0)
      @JsonKey(name: 'priceOverride', defaultValue: 0)
      double priceOverride,
      @HiveField(21, defaultValue: PriceComboDealDto.empty)
      @JsonKey(name: 'ComboDeals')
      PriceComboDealDto comboDeal,
      @JsonKey(name: 'isDiscountOverride', defaultValue: false)
      @HiveField(22, defaultValue: false)
      bool isDiscountOverride});

  $PriceComboDealDtoCopyWith<$Res> get comboDeal;
}

/// @nodoc
class _$PriceDtoCopyWithImpl<$Res, $Val extends PriceDto>
    implements $PriceDtoCopyWith<$Res> {
  _$PriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? oldMaterialCode = null,
    Object? listPrice = null,
    Object? finalIndividualPrice = null,
    Object? finalTotalPrice = null,
    Object? rules = null,
    Object? bonuses = null,
    Object? tiers = null,
    Object? bundles = null,
    Object? isValid = null,
    Object? additionalBonusEligible = null,
    Object? zmgDiscount = null,
    Object? zdp5MaxQuota = null,
    Object? zdp5RemainingQuota = null,
    Object? exceedQty = null,
    Object? overrideRulePresent = null,
    Object? overridenRules = null,
    Object? overridenRuleTier = null,
    Object? isPriceOverride = null,
    Object? zdp8Override = null,
    Object? priceOverride = null,
    Object? comboDeal = null,
    Object? isDiscountOverride = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      oldMaterialCode: null == oldMaterialCode
          ? _value.oldMaterialCode
          : oldMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: null == listPrice
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalIndividualPrice: null == finalIndividualPrice
          ? _value.finalIndividualPrice
          : finalIndividualPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalTotalPrice: null == finalTotalPrice
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      rules: null == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusDto>,
      tiers: null == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierDto>,
      bundles: null == bundles
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleDto>,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      additionalBonusEligible: null == additionalBonusEligible
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      zmgDiscount: null == zmgDiscount
          ? _value.zmgDiscount
          : zmgDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp5MaxQuota: null == zdp5MaxQuota
          ? _value.zdp5MaxQuota
          : zdp5MaxQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zdp5RemainingQuota: null == zdp5RemainingQuota
          ? _value.zdp5RemainingQuota
          : zdp5RemainingQuota // ignore: cast_nullable_to_non_nullable
              as String,
      exceedQty: null == exceedQty
          ? _value.exceedQty
          : exceedQty // ignore: cast_nullable_to_non_nullable
              as bool,
      overrideRulePresent: null == overrideRulePresent
          ? _value.overrideRulePresent
          : overrideRulePresent // ignore: cast_nullable_to_non_nullable
              as bool,
      overridenRules: null == overridenRules
          ? _value.overridenRules
          : overridenRules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      overridenRuleTier: null == overridenRuleTier
          ? _value.overridenRuleTier
          : overridenRuleTier // ignore: cast_nullable_to_non_nullable
              as List<OverridenRuleTierDto>,
      isPriceOverride: null == isPriceOverride
          ? _value.isPriceOverride
          : isPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp8Override: null == zdp8Override
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as double,
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as double,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDealDto,
      isDiscountOverride: null == isDiscountOverride
          ? _value.isDiscountOverride
          : isDiscountOverride // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealDtoCopyWith<$Res> get comboDeal {
    return $PriceComboDealDtoCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PriceDtoCopyWith<$Res> implements $PriceDtoCopyWith<$Res> {
  factory _$$_PriceDtoCopyWith(
          _$_PriceDto value, $Res Function(_$_PriceDto) then) =
      __$$_PriceDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
      @HiveField(0, defaultValue: '')
      String materialNumber,
      @JsonKey(name: 'OldMaterialCode', defaultValue: '')
      @HiveField(1, defaultValue: '')
      String oldMaterialCode,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
      @HiveField(2, defaultValue: 0)
      double listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
      @HiveField(3, defaultValue: 0)
      double finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
      @HiveField(4, defaultValue: 0)
      double finalTotalPrice,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
      @HiveField(5, defaultValue: <PriceRuleDto>[])
      List<PriceRuleDto> rules,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
      @HiveField(6, defaultValue: <PriceBonusDto>[])
      List<PriceBonusDto> bonuses,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
      @HiveField(7, defaultValue: <PriceTierDto>[])
      List<PriceTierDto> tiers,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
      @HiveField(8, defaultValue: <PriceBundleDto>[])
      List<PriceBundleDto> bundles,
      @JsonKey(name: 'Valid', defaultValue: false)
      @HiveField(9, defaultValue: false)
      bool isValid,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
      @HiveField(10, defaultValue: false)
      bool additionalBonusEligible,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
      @HiveField(11, defaultValue: false)
      bool zmgDiscount,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
      @HiveField(12, defaultValue: '')
      String zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
      @HiveField(13, defaultValue: '')
      String zdp5RemainingQuota,
      @JsonKey(name: 'ExceedQty', defaultValue: false)
      @HiveField(14, defaultValue: false)
      bool exceedQty,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
      @HiveField(15, defaultValue: false)
      bool overrideRulePresent,
      @JsonKey(name: 'OverridenRules', defaultValue: [])
      @HiveField(16, defaultValue: [])
      List<PriceRuleDto> overridenRules,
      @JsonKey(name: 'OverridenRuleTier', defaultValue: [])
      @HiveField(17, defaultValue: [])
      List<OverridenRuleTierDto> overridenRuleTier,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      @HiveField(18, defaultValue: false)
      bool isPriceOverride,
      @HiveField(19, defaultValue: 0)
      @JsonKey(name: 'zdp8Override', defaultValue: 0)
      double zdp8Override,
      @HiveField(20, defaultValue: 0)
      @JsonKey(name: 'priceOverride', defaultValue: 0)
      double priceOverride,
      @HiveField(21, defaultValue: PriceComboDealDto.empty)
      @JsonKey(name: 'ComboDeals')
      PriceComboDealDto comboDeal,
      @JsonKey(name: 'isDiscountOverride', defaultValue: false)
      @HiveField(22, defaultValue: false)
      bool isDiscountOverride});

  @override
  $PriceComboDealDtoCopyWith<$Res> get comboDeal;
}

/// @nodoc
class __$$_PriceDtoCopyWithImpl<$Res>
    extends _$PriceDtoCopyWithImpl<$Res, _$_PriceDto>
    implements _$$_PriceDtoCopyWith<$Res> {
  __$$_PriceDtoCopyWithImpl(
      _$_PriceDto _value, $Res Function(_$_PriceDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? oldMaterialCode = null,
    Object? listPrice = null,
    Object? finalIndividualPrice = null,
    Object? finalTotalPrice = null,
    Object? rules = null,
    Object? bonuses = null,
    Object? tiers = null,
    Object? bundles = null,
    Object? isValid = null,
    Object? additionalBonusEligible = null,
    Object? zmgDiscount = null,
    Object? zdp5MaxQuota = null,
    Object? zdp5RemainingQuota = null,
    Object? exceedQty = null,
    Object? overrideRulePresent = null,
    Object? overridenRules = null,
    Object? overridenRuleTier = null,
    Object? isPriceOverride = null,
    Object? zdp8Override = null,
    Object? priceOverride = null,
    Object? comboDeal = null,
    Object? isDiscountOverride = null,
  }) {
    return _then(_$_PriceDto(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      oldMaterialCode: null == oldMaterialCode
          ? _value.oldMaterialCode
          : oldMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      listPrice: null == listPrice
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalIndividualPrice: null == finalIndividualPrice
          ? _value.finalIndividualPrice
          : finalIndividualPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalTotalPrice: null == finalTotalPrice
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      rules: null == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusDto>,
      tiers: null == tiers
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierDto>,
      bundles: null == bundles
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleDto>,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      additionalBonusEligible: null == additionalBonusEligible
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      zmgDiscount: null == zmgDiscount
          ? _value.zmgDiscount
          : zmgDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp5MaxQuota: null == zdp5MaxQuota
          ? _value.zdp5MaxQuota
          : zdp5MaxQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zdp5RemainingQuota: null == zdp5RemainingQuota
          ? _value.zdp5RemainingQuota
          : zdp5RemainingQuota // ignore: cast_nullable_to_non_nullable
              as String,
      exceedQty: null == exceedQty
          ? _value.exceedQty
          : exceedQty // ignore: cast_nullable_to_non_nullable
              as bool,
      overrideRulePresent: null == overrideRulePresent
          ? _value.overrideRulePresent
          : overrideRulePresent // ignore: cast_nullable_to_non_nullable
              as bool,
      overridenRules: null == overridenRules
          ? _value._overridenRules
          : overridenRules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      overridenRuleTier: null == overridenRuleTier
          ? _value._overridenRuleTier
          : overridenRuleTier // ignore: cast_nullable_to_non_nullable
              as List<OverridenRuleTierDto>,
      isPriceOverride: null == isPriceOverride
          ? _value.isPriceOverride
          : isPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp8Override: null == zdp8Override
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as double,
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as double,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDealDto,
      isDiscountOverride: null == isDiscountOverride
          ? _value.isDiscountOverride
          : isDiscountOverride // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 6, adapterName: 'PriceDtoAdapter')
class _$_PriceDto extends _PriceDto {
  const _$_PriceDto(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
      @HiveField(0, defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'OldMaterialCode', defaultValue: '')
      @HiveField(1, defaultValue: '')
      required this.oldMaterialCode,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
      @HiveField(2, defaultValue: 0)
      required this.listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
      @HiveField(3, defaultValue: 0)
      required this.finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
      @HiveField(4, defaultValue: 0)
      required this.finalTotalPrice,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
      @HiveField(5, defaultValue: <PriceRuleDto>[])
      required final List<PriceRuleDto> rules,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
      @HiveField(6, defaultValue: <PriceBonusDto>[])
      required final List<PriceBonusDto> bonuses,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
      @HiveField(7, defaultValue: <PriceTierDto>[])
      required final List<PriceTierDto> tiers,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
      @HiveField(8, defaultValue: <PriceBundleDto>[])
      required final List<PriceBundleDto> bundles,
      @JsonKey(name: 'Valid', defaultValue: false)
      @HiveField(9, defaultValue: false)
      required this.isValid,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
      @HiveField(10, defaultValue: false)
      required this.additionalBonusEligible,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
      @HiveField(11, defaultValue: false)
      required this.zmgDiscount,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
      @HiveField(12, defaultValue: '')
      required this.zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
      @HiveField(13, defaultValue: '')
      required this.zdp5RemainingQuota,
      @JsonKey(name: 'ExceedQty', defaultValue: false)
      @HiveField(14, defaultValue: false)
      required this.exceedQty,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
      @HiveField(15, defaultValue: false)
      required this.overrideRulePresent,
      @JsonKey(name: 'OverridenRules', defaultValue: [])
      @HiveField(16, defaultValue: [])
      required final List<PriceRuleDto> overridenRules,
      @JsonKey(name: 'OverridenRuleTier', defaultValue: [])
      @HiveField(17, defaultValue: [])
      required final List<OverridenRuleTierDto> overridenRuleTier,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      @HiveField(18, defaultValue: false)
      required this.isPriceOverride,
      @HiveField(19, defaultValue: 0)
      @JsonKey(name: 'zdp8Override', defaultValue: 0)
      required this.zdp8Override,
      @HiveField(20, defaultValue: 0)
      @JsonKey(name: 'priceOverride', defaultValue: 0)
      required this.priceOverride,
      @HiveField(21, defaultValue: PriceComboDealDto.empty)
      @JsonKey(name: 'ComboDeals')
      this.comboDeal = PriceComboDealDto.empty,
      @JsonKey(name: 'isDiscountOverride', defaultValue: false)
      @HiveField(22, defaultValue: false)
      required this.isDiscountOverride})
      : _rules = rules,
        _bonuses = bonuses,
        _tiers = tiers,
        _bundles = bundles,
        _overridenRules = overridenRules,
        _overridenRuleTier = overridenRuleTier,
        super._();

  factory _$_PriceDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  @HiveField(0, defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'OldMaterialCode', defaultValue: '')
  @HiveField(1, defaultValue: '')
  final String oldMaterialCode;
  @override
  @JsonKey(name: 'ListPrice', defaultValue: 0)
  @HiveField(2, defaultValue: 0)
  final double listPrice;
  @override
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
  @HiveField(3, defaultValue: 0)
  final double finalIndividualPrice;
  @override
  @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
  @HiveField(4, defaultValue: 0)
  final double finalTotalPrice;
  final List<PriceRuleDto> _rules;
  @override
  @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
  @HiveField(5, defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  final List<PriceBonusDto> _bonuses;
  @override
  @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
  @HiveField(6, defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses {
    if (_bonuses is EqualUnmodifiableListView) return _bonuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  final List<PriceTierDto> _tiers;
  @override
  @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
  @HiveField(7, defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers {
    if (_tiers is EqualUnmodifiableListView) return _tiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiers);
  }

  final List<PriceBundleDto> _bundles;
  @override
  @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
  @HiveField(8, defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles {
    if (_bundles is EqualUnmodifiableListView) return _bundles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundles);
  }

  @override
  @JsonKey(name: 'Valid', defaultValue: false)
  @HiveField(9, defaultValue: false)
  final bool isValid;
  @override
  @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
  @HiveField(10, defaultValue: false)
  final bool additionalBonusEligible;
  @override
  @JsonKey(name: 'ZMGDiscount', defaultValue: false)
  @HiveField(11, defaultValue: false)
  final bool zmgDiscount;
  @override
  @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
  @HiveField(12, defaultValue: '')
  final String zdp5MaxQuota;
  @override
  @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
  @HiveField(13, defaultValue: '')
  final String zdp5RemainingQuota;
  @override
  @JsonKey(name: 'ExceedQty', defaultValue: false)
  @HiveField(14, defaultValue: false)
  final bool exceedQty;
  @override
  @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
  @HiveField(15, defaultValue: false)
  final bool overrideRulePresent;
  final List<PriceRuleDto> _overridenRules;
  @override
  @JsonKey(name: 'OverridenRules', defaultValue: [])
  @HiveField(16, defaultValue: [])
  List<PriceRuleDto> get overridenRules {
    if (_overridenRules is EqualUnmodifiableListView) return _overridenRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overridenRules);
  }

  final List<OverridenRuleTierDto> _overridenRuleTier;
  @override
  @JsonKey(name: 'OverridenRuleTier', defaultValue: [])
  @HiveField(17, defaultValue: [])
  List<OverridenRuleTierDto> get overridenRuleTier {
    if (_overridenRuleTier is EqualUnmodifiableListView)
      return _overridenRuleTier;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overridenRuleTier);
  }

  @override
  @JsonKey(name: 'isPriceOverride', defaultValue: false)
  @HiveField(18, defaultValue: false)
  final bool isPriceOverride;
  @override
  @HiveField(19, defaultValue: 0)
  @JsonKey(name: 'zdp8Override', defaultValue: 0)
  final double zdp8Override;
  @override
  @HiveField(20, defaultValue: 0)
  @JsonKey(name: 'priceOverride', defaultValue: 0)
  final double priceOverride;
  @override
  @HiveField(21, defaultValue: PriceComboDealDto.empty)
  @JsonKey(name: 'ComboDeals')
  final PriceComboDealDto comboDeal;
  @override
  @JsonKey(name: 'isDiscountOverride', defaultValue: false)
  @HiveField(22, defaultValue: false)
  final bool isDiscountOverride;

  @override
  String toString() {
    return 'PriceDto(materialNumber: $materialNumber, oldMaterialCode: $oldMaterialCode, listPrice: $listPrice, finalIndividualPrice: $finalIndividualPrice, finalTotalPrice: $finalTotalPrice, rules: $rules, bonuses: $bonuses, tiers: $tiers, bundles: $bundles, isValid: $isValid, additionalBonusEligible: $additionalBonusEligible, zmgDiscount: $zmgDiscount, zdp5MaxQuota: $zdp5MaxQuota, zdp5RemainingQuota: $zdp5RemainingQuota, exceedQty: $exceedQty, overrideRulePresent: $overrideRulePresent, overridenRules: $overridenRules, overridenRuleTier: $overridenRuleTier, isPriceOverride: $isPriceOverride, zdp8Override: $zdp8Override, priceOverride: $priceOverride, comboDeal: $comboDeal, isDiscountOverride: $isDiscountOverride)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.oldMaterialCode, oldMaterialCode) ||
                other.oldMaterialCode == oldMaterialCode) &&
            (identical(other.listPrice, listPrice) ||
                other.listPrice == listPrice) &&
            (identical(other.finalIndividualPrice, finalIndividualPrice) ||
                other.finalIndividualPrice == finalIndividualPrice) &&
            (identical(other.finalTotalPrice, finalTotalPrice) ||
                other.finalTotalPrice == finalTotalPrice) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            const DeepCollectionEquality().equals(other._tiers, _tiers) &&
            const DeepCollectionEquality().equals(other._bundles, _bundles) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(
                    other.additionalBonusEligible, additionalBonusEligible) ||
                other.additionalBonusEligible == additionalBonusEligible) &&
            (identical(other.zmgDiscount, zmgDiscount) ||
                other.zmgDiscount == zmgDiscount) &&
            (identical(other.zdp5MaxQuota, zdp5MaxQuota) ||
                other.zdp5MaxQuota == zdp5MaxQuota) &&
            (identical(other.zdp5RemainingQuota, zdp5RemainingQuota) ||
                other.zdp5RemainingQuota == zdp5RemainingQuota) &&
            (identical(other.exceedQty, exceedQty) ||
                other.exceedQty == exceedQty) &&
            (identical(other.overrideRulePresent, overrideRulePresent) ||
                other.overrideRulePresent == overrideRulePresent) &&
            const DeepCollectionEquality()
                .equals(other._overridenRules, _overridenRules) &&
            const DeepCollectionEquality()
                .equals(other._overridenRuleTier, _overridenRuleTier) &&
            (identical(other.isPriceOverride, isPriceOverride) ||
                other.isPriceOverride == isPriceOverride) &&
            (identical(other.zdp8Override, zdp8Override) ||
                other.zdp8Override == zdp8Override) &&
            (identical(other.priceOverride, priceOverride) ||
                other.priceOverride == priceOverride) &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            (identical(other.isDiscountOverride, isDiscountOverride) ||
                other.isDiscountOverride == isDiscountOverride));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        materialNumber,
        oldMaterialCode,
        listPrice,
        finalIndividualPrice,
        finalTotalPrice,
        const DeepCollectionEquality().hash(_rules),
        const DeepCollectionEquality().hash(_bonuses),
        const DeepCollectionEquality().hash(_tiers),
        const DeepCollectionEquality().hash(_bundles),
        isValid,
        additionalBonusEligible,
        zmgDiscount,
        zdp5MaxQuota,
        zdp5RemainingQuota,
        exceedQty,
        overrideRulePresent,
        const DeepCollectionEquality().hash(_overridenRules),
        const DeepCollectionEquality().hash(_overridenRuleTier),
        isPriceOverride,
        zdp8Override,
        priceOverride,
        comboDeal,
        isDiscountOverride
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceDtoCopyWith<_$_PriceDto> get copyWith =>
      __$$_PriceDtoCopyWithImpl<_$_PriceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceDtoToJson(
      this,
    );
  }
}

abstract class _PriceDto extends PriceDto {
  const factory _PriceDto(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
      @HiveField(0, defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'OldMaterialCode', defaultValue: '')
      @HiveField(1, defaultValue: '')
      required final String oldMaterialCode,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
      @HiveField(2, defaultValue: 0)
      required final double listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
      @HiveField(3, defaultValue: 0)
      required final double finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
      @HiveField(4, defaultValue: 0)
      required final double finalTotalPrice,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
      @HiveField(5, defaultValue: <PriceRuleDto>[])
      required final List<PriceRuleDto> rules,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
      @HiveField(6, defaultValue: <PriceBonusDto>[])
      required final List<PriceBonusDto> bonuses,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
      @HiveField(7, defaultValue: <PriceTierDto>[])
      required final List<PriceTierDto> tiers,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
      @HiveField(8, defaultValue: <PriceBundleDto>[])
      required final List<PriceBundleDto> bundles,
      @JsonKey(name: 'Valid', defaultValue: false)
      @HiveField(9, defaultValue: false)
      required final bool isValid,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
      @HiveField(10, defaultValue: false)
      required final bool additionalBonusEligible,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
      @HiveField(11, defaultValue: false)
      required final bool zmgDiscount,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
      @HiveField(12, defaultValue: '')
      required final String zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
      @HiveField(13, defaultValue: '')
      required final String zdp5RemainingQuota,
      @JsonKey(name: 'ExceedQty', defaultValue: false)
      @HiveField(14, defaultValue: false)
      required final bool exceedQty,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
      @HiveField(15, defaultValue: false)
      required final bool overrideRulePresent,
      @JsonKey(name: 'OverridenRules', defaultValue: [])
      @HiveField(16, defaultValue: [])
      required final List<PriceRuleDto> overridenRules,
      @JsonKey(name: 'OverridenRuleTier', defaultValue: [])
      @HiveField(17, defaultValue: [])
      required final List<OverridenRuleTierDto> overridenRuleTier,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      @HiveField(18, defaultValue: false)
      required final bool isPriceOverride,
      @HiveField(19, defaultValue: 0)
      @JsonKey(name: 'zdp8Override', defaultValue: 0)
      required final double zdp8Override,
      @HiveField(20, defaultValue: 0)
      @JsonKey(name: 'priceOverride', defaultValue: 0)
      required final double priceOverride,
      @HiveField(21, defaultValue: PriceComboDealDto.empty)
      @JsonKey(name: 'ComboDeals')
      final PriceComboDealDto comboDeal,
      @JsonKey(name: 'isDiscountOverride', defaultValue: false)
      @HiveField(22, defaultValue: false)
      required final bool isDiscountOverride}) = _$_PriceDto;
  const _PriceDto._() : super._();

  factory _PriceDto.fromJson(Map<String, dynamic> json) = _$_PriceDto.fromJson;

  @override
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  @HiveField(0, defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'OldMaterialCode', defaultValue: '')
  @HiveField(1, defaultValue: '')
  String get oldMaterialCode;
  @override
  @JsonKey(name: 'ListPrice', defaultValue: 0)
  @HiveField(2, defaultValue: 0)
  double get listPrice;
  @override
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
  @HiveField(3, defaultValue: 0)
  double get finalIndividualPrice;
  @override
  @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
  @HiveField(4, defaultValue: 0)
  double get finalTotalPrice;
  @override
  @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
  @HiveField(5, defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules;
  @override
  @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
  @HiveField(6, defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses;
  @override
  @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
  @HiveField(7, defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers;
  @override
  @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
  @HiveField(8, defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles;
  @override
  @JsonKey(name: 'Valid', defaultValue: false)
  @HiveField(9, defaultValue: false)
  bool get isValid;
  @override
  @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
  @HiveField(10, defaultValue: false)
  bool get additionalBonusEligible;
  @override
  @JsonKey(name: 'ZMGDiscount', defaultValue: false)
  @HiveField(11, defaultValue: false)
  bool get zmgDiscount;
  @override
  @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
  @HiveField(12, defaultValue: '')
  String get zdp5MaxQuota;
  @override
  @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
  @HiveField(13, defaultValue: '')
  String get zdp5RemainingQuota;
  @override
  @JsonKey(name: 'ExceedQty', defaultValue: false)
  @HiveField(14, defaultValue: false)
  bool get exceedQty;
  @override
  @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
  @HiveField(15, defaultValue: false)
  bool get overrideRulePresent;
  @override
  @JsonKey(name: 'OverridenRules', defaultValue: [])
  @HiveField(16, defaultValue: [])
  List<PriceRuleDto> get overridenRules;
  @override
  @JsonKey(name: 'OverridenRuleTier', defaultValue: [])
  @HiveField(17, defaultValue: [])
  List<OverridenRuleTierDto> get overridenRuleTier;
  @override
  @JsonKey(name: 'isPriceOverride', defaultValue: false)
  @HiveField(18, defaultValue: false)
  bool get isPriceOverride;
  @override
  @HiveField(19, defaultValue: 0)
  @JsonKey(name: 'zdp8Override', defaultValue: 0)
  double get zdp8Override;
  @override
  @HiveField(20, defaultValue: 0)
  @JsonKey(name: 'priceOverride', defaultValue: 0)
  double get priceOverride;
  @override
  @HiveField(21, defaultValue: PriceComboDealDto.empty)
  @JsonKey(name: 'ComboDeals')
  PriceComboDealDto get comboDeal;
  @override
  @JsonKey(name: 'isDiscountOverride', defaultValue: false)
  @HiveField(22, defaultValue: false)
  bool get isDiscountOverride;
  @override
  @JsonKey(ignore: true)
  _$$_PriceDtoCopyWith<_$_PriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
