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
  @JsonKey(name: 'MaterialNumber')
  @HiveField(0, defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
  @HiveField(1, defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules => throw _privateConstructorUsedError;
  @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
  @HiveField(2, defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
  @HiveField(3, defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
  @HiveField(4, defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles => throw _privateConstructorUsedError;
  @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
  @HiveField(5, defaultValue: false)
  bool get overrideRulePresent => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
  @HiveField(6, defaultValue: '')
  String get zdp5MaxQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
  @HiveField(7, defaultValue: '')
  String get zdp5RemainingQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZMGDiscount', defaultValue: false)
  @HiveField(8, defaultValue: false)
  bool get zmgDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ListPrice', defaultValue: 0)
  @HiveField(9, defaultValue: 0)
  double get listPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
  @HiveField(10, defaultValue: 0)
  double get finalIndividualPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
  @HiveField(11, defaultValue: 0)
  double get finalTotalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
  @HiveField(12, defaultValue: false)
  bool get additionalBonusEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'Valid', defaultValue: false)
  @HiveField(13, defaultValue: false)
  bool get isValid => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPriceOverride', defaultValue: false)
  @HiveField(14, defaultValue: false)
  bool get isPriceOverride => throw _privateConstructorUsedError;
  @HiveField(15, defaultValue: 0)
  @JsonKey(name: 'zdp8Override', defaultValue: 0)
  double get zdp8Override => throw _privateConstructorUsedError;
  @HiveField(16, defaultValue: 0)
  @JsonKey(name: 'priceOverride', defaultValue: 0)
  double get priceOverride => throw _privateConstructorUsedError;
  @HiveField(17, defaultValue: PriceComboDealDto.empty)
  @JsonKey(name: 'ComboDeals')
  PriceComboDealDto get comboDeal => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'MaterialNumber')
      @HiveField(0, defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
      @HiveField(1, defaultValue: <PriceRuleDto>[])
          List<PriceRuleDto> rules,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
      @HiveField(2, defaultValue: <PriceTierDto>[])
          List<PriceTierDto> tiers,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
      @HiveField(3, defaultValue: <PriceBonusDto>[])
          List<PriceBonusDto> bonuses,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
      @HiveField(4, defaultValue: <PriceBundleDto>[])
          List<PriceBundleDto> bundles,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
      @HiveField(5, defaultValue: false)
          bool overrideRulePresent,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
      @HiveField(6, defaultValue: '')
          String zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
      @HiveField(7, defaultValue: '')
          String zdp5RemainingQuota,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
      @HiveField(8, defaultValue: false)
          bool zmgDiscount,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
      @HiveField(9, defaultValue: 0)
          double listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
      @HiveField(10, defaultValue: 0)
          double finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
      @HiveField(11, defaultValue: 0)
          double finalTotalPrice,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
      @HiveField(12, defaultValue: false)
          bool additionalBonusEligible,
      @JsonKey(name: 'Valid', defaultValue: false)
      @HiveField(13, defaultValue: false)
          bool isValid,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      @HiveField(14, defaultValue: false)
          bool isPriceOverride,
      @HiveField(15, defaultValue: 0)
      @JsonKey(name: 'zdp8Override', defaultValue: 0)
          double zdp8Override,
      @HiveField(16, defaultValue: 0)
      @JsonKey(name: 'priceOverride', defaultValue: 0)
          double priceOverride,
      @HiveField(17, defaultValue: PriceComboDealDto.empty)
      @JsonKey(name: 'ComboDeals')
          PriceComboDealDto comboDeal});

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
    Object? rules = null,
    Object? tiers = null,
    Object? bonuses = null,
    Object? bundles = null,
    Object? overrideRulePresent = null,
    Object? zdp5MaxQuota = null,
    Object? zdp5RemainingQuota = null,
    Object? zmgDiscount = null,
    Object? listPrice = null,
    Object? finalIndividualPrice = null,
    Object? finalTotalPrice = null,
    Object? additionalBonusEligible = null,
    Object? isValid = null,
    Object? isPriceOverride = null,
    Object? zdp8Override = null,
    Object? priceOverride = null,
    Object? comboDeal = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      rules: null == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      tiers: null == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierDto>,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusDto>,
      bundles: null == bundles
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleDto>,
      overrideRulePresent: null == overrideRulePresent
          ? _value.overrideRulePresent
          : overrideRulePresent // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp5MaxQuota: null == zdp5MaxQuota
          ? _value.zdp5MaxQuota
          : zdp5MaxQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zdp5RemainingQuota: null == zdp5RemainingQuota
          ? _value.zdp5RemainingQuota
          : zdp5RemainingQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zmgDiscount: null == zmgDiscount
          ? _value.zmgDiscount
          : zmgDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
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
      additionalBonusEligible: null == additionalBonusEligible
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {@JsonKey(name: 'MaterialNumber')
      @HiveField(0, defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
      @HiveField(1, defaultValue: <PriceRuleDto>[])
          List<PriceRuleDto> rules,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
      @HiveField(2, defaultValue: <PriceTierDto>[])
          List<PriceTierDto> tiers,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
      @HiveField(3, defaultValue: <PriceBonusDto>[])
          List<PriceBonusDto> bonuses,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
      @HiveField(4, defaultValue: <PriceBundleDto>[])
          List<PriceBundleDto> bundles,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
      @HiveField(5, defaultValue: false)
          bool overrideRulePresent,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
      @HiveField(6, defaultValue: '')
          String zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
      @HiveField(7, defaultValue: '')
          String zdp5RemainingQuota,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
      @HiveField(8, defaultValue: false)
          bool zmgDiscount,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
      @HiveField(9, defaultValue: 0)
          double listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
      @HiveField(10, defaultValue: 0)
          double finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
      @HiveField(11, defaultValue: 0)
          double finalTotalPrice,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
      @HiveField(12, defaultValue: false)
          bool additionalBonusEligible,
      @JsonKey(name: 'Valid', defaultValue: false)
      @HiveField(13, defaultValue: false)
          bool isValid,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      @HiveField(14, defaultValue: false)
          bool isPriceOverride,
      @HiveField(15, defaultValue: 0)
      @JsonKey(name: 'zdp8Override', defaultValue: 0)
          double zdp8Override,
      @HiveField(16, defaultValue: 0)
      @JsonKey(name: 'priceOverride', defaultValue: 0)
          double priceOverride,
      @HiveField(17, defaultValue: PriceComboDealDto.empty)
      @JsonKey(name: 'ComboDeals')
          PriceComboDealDto comboDeal});

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
    Object? rules = null,
    Object? tiers = null,
    Object? bonuses = null,
    Object? bundles = null,
    Object? overrideRulePresent = null,
    Object? zdp5MaxQuota = null,
    Object? zdp5RemainingQuota = null,
    Object? zmgDiscount = null,
    Object? listPrice = null,
    Object? finalIndividualPrice = null,
    Object? finalTotalPrice = null,
    Object? additionalBonusEligible = null,
    Object? isValid = null,
    Object? isPriceOverride = null,
    Object? zdp8Override = null,
    Object? priceOverride = null,
    Object? comboDeal = null,
  }) {
    return _then(_$_PriceDto(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      rules: null == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      tiers: null == tiers
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierDto>,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusDto>,
      bundles: null == bundles
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleDto>,
      overrideRulePresent: null == overrideRulePresent
          ? _value.overrideRulePresent
          : overrideRulePresent // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp5MaxQuota: null == zdp5MaxQuota
          ? _value.zdp5MaxQuota
          : zdp5MaxQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zdp5RemainingQuota: null == zdp5RemainingQuota
          ? _value.zdp5RemainingQuota
          : zdp5RemainingQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zmgDiscount: null == zmgDiscount
          ? _value.zmgDiscount
          : zmgDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
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
      additionalBonusEligible: null == additionalBonusEligible
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 6, adapterName: 'PriceDtoAdapter')
class _$_PriceDto extends _PriceDto {
  const _$_PriceDto(
      {@JsonKey(name: 'MaterialNumber')
      @HiveField(0, defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
      @HiveField(1, defaultValue: <PriceRuleDto>[])
          required final List<PriceRuleDto> rules,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
      @HiveField(2, defaultValue: <PriceTierDto>[])
          required final List<PriceTierDto> tiers,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
      @HiveField(3, defaultValue: <PriceBonusDto>[])
          required final List<PriceBonusDto> bonuses,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
      @HiveField(4, defaultValue: <PriceBundleDto>[])
          required final List<PriceBundleDto> bundles,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
      @HiveField(5, defaultValue: false)
          required this.overrideRulePresent,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
      @HiveField(6, defaultValue: '')
          required this.zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
      @HiveField(7, defaultValue: '')
          required this.zdp5RemainingQuota,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
      @HiveField(8, defaultValue: false)
          required this.zmgDiscount,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
      @HiveField(9, defaultValue: 0)
          required this.listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
      @HiveField(10, defaultValue: 0)
          required this.finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
      @HiveField(11, defaultValue: 0)
          required this.finalTotalPrice,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
      @HiveField(12, defaultValue: false)
          required this.additionalBonusEligible,
      @JsonKey(name: 'Valid', defaultValue: false)
      @HiveField(13, defaultValue: false)
          required this.isValid,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      @HiveField(14, defaultValue: false)
          required this.isPriceOverride,
      @HiveField(15, defaultValue: 0)
      @JsonKey(name: 'zdp8Override', defaultValue: 0)
          required this.zdp8Override,
      @HiveField(16, defaultValue: 0)
      @JsonKey(name: 'priceOverride', defaultValue: 0)
          required this.priceOverride,
      @HiveField(17, defaultValue: PriceComboDealDto.empty)
      @JsonKey(name: 'ComboDeals')
          this.comboDeal = PriceComboDealDto.empty})
      : _rules = rules,
        _tiers = tiers,
        _bonuses = bonuses,
        _bundles = bundles,
        super._();

  factory _$_PriceDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialNumber')
  @HiveField(0, defaultValue: '')
  final String materialNumber;
  final List<PriceRuleDto> _rules;
  @override
  @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
  @HiveField(1, defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  final List<PriceTierDto> _tiers;
  @override
  @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
  @HiveField(2, defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers {
    if (_tiers is EqualUnmodifiableListView) return _tiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiers);
  }

  final List<PriceBonusDto> _bonuses;
  @override
  @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
  @HiveField(3, defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses {
    if (_bonuses is EqualUnmodifiableListView) return _bonuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  final List<PriceBundleDto> _bundles;
  @override
  @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
  @HiveField(4, defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles {
    if (_bundles is EqualUnmodifiableListView) return _bundles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundles);
  }

  @override
  @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
  @HiveField(5, defaultValue: false)
  final bool overrideRulePresent;
  @override
  @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
  @HiveField(6, defaultValue: '')
  final String zdp5MaxQuota;
  @override
  @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
  @HiveField(7, defaultValue: '')
  final String zdp5RemainingQuota;
  @override
  @JsonKey(name: 'ZMGDiscount', defaultValue: false)
  @HiveField(8, defaultValue: false)
  final bool zmgDiscount;
  @override
  @JsonKey(name: 'ListPrice', defaultValue: 0)
  @HiveField(9, defaultValue: 0)
  final double listPrice;
  @override
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
  @HiveField(10, defaultValue: 0)
  final double finalIndividualPrice;
  @override
  @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
  @HiveField(11, defaultValue: 0)
  final double finalTotalPrice;
  @override
  @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
  @HiveField(12, defaultValue: false)
  final bool additionalBonusEligible;
  @override
  @JsonKey(name: 'Valid', defaultValue: false)
  @HiveField(13, defaultValue: false)
  final bool isValid;
  @override
  @JsonKey(name: 'isPriceOverride', defaultValue: false)
  @HiveField(14, defaultValue: false)
  final bool isPriceOverride;
  @override
  @HiveField(15, defaultValue: 0)
  @JsonKey(name: 'zdp8Override', defaultValue: 0)
  final double zdp8Override;
  @override
  @HiveField(16, defaultValue: 0)
  @JsonKey(name: 'priceOverride', defaultValue: 0)
  final double priceOverride;
  @override
  @HiveField(17, defaultValue: PriceComboDealDto.empty)
  @JsonKey(name: 'ComboDeals')
  final PriceComboDealDto comboDeal;

  @override
  String toString() {
    return 'PriceDto(materialNumber: $materialNumber, rules: $rules, tiers: $tiers, bonuses: $bonuses, bundles: $bundles, overrideRulePresent: $overrideRulePresent, zdp5MaxQuota: $zdp5MaxQuota, zdp5RemainingQuota: $zdp5RemainingQuota, zmgDiscount: $zmgDiscount, listPrice: $listPrice, finalIndividualPrice: $finalIndividualPrice, finalTotalPrice: $finalTotalPrice, additionalBonusEligible: $additionalBonusEligible, isValid: $isValid, isPriceOverride: $isPriceOverride, zdp8Override: $zdp8Override, priceOverride: $priceOverride, comboDeal: $comboDeal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            const DeepCollectionEquality().equals(other._tiers, _tiers) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            const DeepCollectionEquality().equals(other._bundles, _bundles) &&
            (identical(other.overrideRulePresent, overrideRulePresent) ||
                other.overrideRulePresent == overrideRulePresent) &&
            (identical(other.zdp5MaxQuota, zdp5MaxQuota) ||
                other.zdp5MaxQuota == zdp5MaxQuota) &&
            (identical(other.zdp5RemainingQuota, zdp5RemainingQuota) ||
                other.zdp5RemainingQuota == zdp5RemainingQuota) &&
            (identical(other.zmgDiscount, zmgDiscount) ||
                other.zmgDiscount == zmgDiscount) &&
            (identical(other.listPrice, listPrice) ||
                other.listPrice == listPrice) &&
            (identical(other.finalIndividualPrice, finalIndividualPrice) ||
                other.finalIndividualPrice == finalIndividualPrice) &&
            (identical(other.finalTotalPrice, finalTotalPrice) ||
                other.finalTotalPrice == finalTotalPrice) &&
            (identical(
                    other.additionalBonusEligible, additionalBonusEligible) ||
                other.additionalBonusEligible == additionalBonusEligible) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.isPriceOverride, isPriceOverride) ||
                other.isPriceOverride == isPriceOverride) &&
            (identical(other.zdp8Override, zdp8Override) ||
                other.zdp8Override == zdp8Override) &&
            (identical(other.priceOverride, priceOverride) ||
                other.priceOverride == priceOverride) &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialNumber,
      const DeepCollectionEquality().hash(_rules),
      const DeepCollectionEquality().hash(_tiers),
      const DeepCollectionEquality().hash(_bonuses),
      const DeepCollectionEquality().hash(_bundles),
      overrideRulePresent,
      zdp5MaxQuota,
      zdp5RemainingQuota,
      zmgDiscount,
      listPrice,
      finalIndividualPrice,
      finalTotalPrice,
      additionalBonusEligible,
      isValid,
      isPriceOverride,
      zdp8Override,
      priceOverride,
      comboDeal);

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
      {@JsonKey(name: 'MaterialNumber')
      @HiveField(0, defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
      @HiveField(1, defaultValue: <PriceRuleDto>[])
          required final List<PriceRuleDto> rules,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
      @HiveField(2, defaultValue: <PriceTierDto>[])
          required final List<PriceTierDto> tiers,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
      @HiveField(3, defaultValue: <PriceBonusDto>[])
          required final List<PriceBonusDto> bonuses,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
      @HiveField(4, defaultValue: <PriceBundleDto>[])
          required final List<PriceBundleDto> bundles,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
      @HiveField(5, defaultValue: false)
          required final bool overrideRulePresent,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
      @HiveField(6, defaultValue: '')
          required final String zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
      @HiveField(7, defaultValue: '')
          required final String zdp5RemainingQuota,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
      @HiveField(8, defaultValue: false)
          required final bool zmgDiscount,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
      @HiveField(9, defaultValue: 0)
          required final double listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
      @HiveField(10, defaultValue: 0)
          required final double finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
      @HiveField(11, defaultValue: 0)
          required final double finalTotalPrice,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
      @HiveField(12, defaultValue: false)
          required final bool additionalBonusEligible,
      @JsonKey(name: 'Valid', defaultValue: false)
      @HiveField(13, defaultValue: false)
          required final bool isValid,
      @JsonKey(name: 'isPriceOverride', defaultValue: false)
      @HiveField(14, defaultValue: false)
          required final bool isPriceOverride,
      @HiveField(15, defaultValue: 0)
      @JsonKey(name: 'zdp8Override', defaultValue: 0)
          required final double zdp8Override,
      @HiveField(16, defaultValue: 0)
      @JsonKey(name: 'priceOverride', defaultValue: 0)
          required final double priceOverride,
      @HiveField(17, defaultValue: PriceComboDealDto.empty)
      @JsonKey(name: 'ComboDeals')
          final PriceComboDealDto comboDeal}) = _$_PriceDto;
  const _PriceDto._() : super._();

  factory _PriceDto.fromJson(Map<String, dynamic> json) = _$_PriceDto.fromJson;

  @override
  @JsonKey(name: 'MaterialNumber')
  @HiveField(0, defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
  @HiveField(1, defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules;
  @override
  @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
  @HiveField(2, defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers;
  @override
  @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
  @HiveField(3, defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses;
  @override
  @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
  @HiveField(4, defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles;
  @override
  @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
  @HiveField(5, defaultValue: false)
  bool get overrideRulePresent;
  @override
  @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
  @HiveField(6, defaultValue: '')
  String get zdp5MaxQuota;
  @override
  @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
  @HiveField(7, defaultValue: '')
  String get zdp5RemainingQuota;
  @override
  @JsonKey(name: 'ZMGDiscount', defaultValue: false)
  @HiveField(8, defaultValue: false)
  bool get zmgDiscount;
  @override
  @JsonKey(name: 'ListPrice', defaultValue: 0)
  @HiveField(9, defaultValue: 0)
  double get listPrice;
  @override
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
  @HiveField(10, defaultValue: 0)
  double get finalIndividualPrice;
  @override
  @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
  @HiveField(11, defaultValue: 0)
  double get finalTotalPrice;
  @override
  @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
  @HiveField(12, defaultValue: false)
  bool get additionalBonusEligible;
  @override
  @JsonKey(name: 'Valid', defaultValue: false)
  @HiveField(13, defaultValue: false)
  bool get isValid;
  @override
  @JsonKey(name: 'isPriceOverride', defaultValue: false)
  @HiveField(14, defaultValue: false)
  bool get isPriceOverride;
  @override
  @HiveField(15, defaultValue: 0)
  @JsonKey(name: 'zdp8Override', defaultValue: 0)
  double get zdp8Override;
  @override
  @HiveField(16, defaultValue: 0)
  @JsonKey(name: 'priceOverride', defaultValue: 0)
  double get priceOverride;
  @override
  @HiveField(17, defaultValue: PriceComboDealDto.empty)
  @JsonKey(name: 'ComboDeals')
  PriceComboDealDto get comboDeal;
  @override
  @JsonKey(ignore: true)
  _$$_PriceDtoCopyWith<_$_PriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
