// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Price {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  List<PriceRule> get rules => throw _privateConstructorUsedError;
  List<PriceTier> get tiers => throw _privateConstructorUsedError;
  List<PriceBonus> get bonuses => throw _privateConstructorUsedError;
  List<PriceBundle> get bundles => throw _privateConstructorUsedError;
  bool get overrideRulePresent => throw _privateConstructorUsedError;
  String get zdp5MaxQuota => throw _privateConstructorUsedError;
  String get zdp5RemainingQuota => throw _privateConstructorUsedError;
  bool get zmgDiscount => throw _privateConstructorUsedError;
  MaterialPrice get lastPrice => throw _privateConstructorUsedError;
  MaterialPrice get finalPrice => throw _privateConstructorUsedError;
  MaterialPrice get finalTotalPrice => throw _privateConstructorUsedError;
  bool get additionalBonusEligible => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  bool get isValidMaterial => throw _privateConstructorUsedError;
  bool get isFOC => throw _privateConstructorUsedError;
  bool get isPriceOverride => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceCopyWith<Price> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceCopyWith<$Res> {
  factory $PriceCopyWith(Price value, $Res Function(Price) then) =
      _$PriceCopyWithImpl<$Res, Price>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      List<PriceRule> rules,
      List<PriceTier> tiers,
      List<PriceBonus> bonuses,
      List<PriceBundle> bundles,
      bool overrideRulePresent,
      String zdp5MaxQuota,
      String zdp5RemainingQuota,
      bool zmgDiscount,
      MaterialPrice lastPrice,
      MaterialPrice finalPrice,
      MaterialPrice finalTotalPrice,
      bool additionalBonusEligible,
      bool isValid,
      bool isValidMaterial,
      bool isFOC,
      bool isPriceOverride});
}

/// @nodoc
class _$PriceCopyWithImpl<$Res, $Val extends Price>
    implements $PriceCopyWith<$Res> {
  _$PriceCopyWithImpl(this._value, this._then);

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
    Object? lastPrice = null,
    Object? finalPrice = null,
    Object? finalTotalPrice = null,
    Object? additionalBonusEligible = null,
    Object? isValid = null,
    Object? isValidMaterial = null,
    Object? isFOC = null,
    Object? isPriceOverride = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      rules: null == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRule>,
      tiers: null == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTier>,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonus>,
      bundles: null == bundles
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundle>,
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
      lastPrice: null == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalTotalPrice: null == finalTotalPrice
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      additionalBonusEligible: null == additionalBonusEligible
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidMaterial: null == isValidMaterial
          ? _value.isValidMaterial
          : isValidMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      isFOC: null == isFOC
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
      isPriceOverride: null == isPriceOverride
          ? _value.isPriceOverride
          : isPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceCopyWith<$Res> implements $PriceCopyWith<$Res> {
  factory _$$_PriceCopyWith(_$_Price value, $Res Function(_$_Price) then) =
      __$$_PriceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      List<PriceRule> rules,
      List<PriceTier> tiers,
      List<PriceBonus> bonuses,
      List<PriceBundle> bundles,
      bool overrideRulePresent,
      String zdp5MaxQuota,
      String zdp5RemainingQuota,
      bool zmgDiscount,
      MaterialPrice lastPrice,
      MaterialPrice finalPrice,
      MaterialPrice finalTotalPrice,
      bool additionalBonusEligible,
      bool isValid,
      bool isValidMaterial,
      bool isFOC,
      bool isPriceOverride});
}

/// @nodoc
class __$$_PriceCopyWithImpl<$Res> extends _$PriceCopyWithImpl<$Res, _$_Price>
    implements _$$_PriceCopyWith<$Res> {
  __$$_PriceCopyWithImpl(_$_Price _value, $Res Function(_$_Price) _then)
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
    Object? lastPrice = null,
    Object? finalPrice = null,
    Object? finalTotalPrice = null,
    Object? additionalBonusEligible = null,
    Object? isValid = null,
    Object? isValidMaterial = null,
    Object? isFOC = null,
    Object? isPriceOverride = null,
  }) {
    return _then(_$_Price(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      rules: null == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRule>,
      tiers: null == tiers
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTier>,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonus>,
      bundles: null == bundles
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundle>,
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
      lastPrice: null == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalTotalPrice: null == finalTotalPrice
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      additionalBonusEligible: null == additionalBonusEligible
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidMaterial: null == isValidMaterial
          ? _value.isValidMaterial
          : isValidMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      isFOC: null == isFOC
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
      isPriceOverride: null == isPriceOverride
          ? _value.isPriceOverride
          : isPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Price extends _Price {
  const _$_Price(
      {required this.materialNumber,
      required final List<PriceRule> rules,
      required final List<PriceTier> tiers,
      required final List<PriceBonus> bonuses,
      required final List<PriceBundle> bundles,
      required this.overrideRulePresent,
      required this.zdp5MaxQuota,
      required this.zdp5RemainingQuota,
      required this.zmgDiscount,
      required this.lastPrice,
      required this.finalPrice,
      required this.finalTotalPrice,
      required this.additionalBonusEligible,
      required this.isValid,
      this.isValidMaterial = true,
      this.isFOC = false,
      this.isPriceOverride = false})
      : _rules = rules,
        _tiers = tiers,
        _bonuses = bonuses,
        _bundles = bundles,
        super._();

  @override
  final MaterialNumber materialNumber;
  final List<PriceRule> _rules;
  @override
  List<PriceRule> get rules {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  final List<PriceTier> _tiers;
  @override
  List<PriceTier> get tiers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiers);
  }

  final List<PriceBonus> _bonuses;
  @override
  List<PriceBonus> get bonuses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  final List<PriceBundle> _bundles;
  @override
  List<PriceBundle> get bundles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundles);
  }

  @override
  final bool overrideRulePresent;
  @override
  final String zdp5MaxQuota;
  @override
  final String zdp5RemainingQuota;
  @override
  final bool zmgDiscount;
  @override
  final MaterialPrice lastPrice;
  @override
  final MaterialPrice finalPrice;
  @override
  final MaterialPrice finalTotalPrice;
  @override
  final bool additionalBonusEligible;
  @override
  final bool isValid;
  @override
  @JsonKey()
  final bool isValidMaterial;
  @override
  @JsonKey()
  final bool isFOC;
  @override
  @JsonKey()
  final bool isPriceOverride;

  @override
  String toString() {
    return 'Price(materialNumber: $materialNumber, rules: $rules, tiers: $tiers, bonuses: $bonuses, bundles: $bundles, overrideRulePresent: $overrideRulePresent, zdp5MaxQuota: $zdp5MaxQuota, zdp5RemainingQuota: $zdp5RemainingQuota, zmgDiscount: $zmgDiscount, lastPrice: $lastPrice, finalPrice: $finalPrice, finalTotalPrice: $finalTotalPrice, additionalBonusEligible: $additionalBonusEligible, isValid: $isValid, isValidMaterial: $isValidMaterial, isFOC: $isFOC, isPriceOverride: $isPriceOverride)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Price &&
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
            (identical(other.lastPrice, lastPrice) ||
                other.lastPrice == lastPrice) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.finalTotalPrice, finalTotalPrice) ||
                other.finalTotalPrice == finalTotalPrice) &&
            (identical(
                    other.additionalBonusEligible, additionalBonusEligible) ||
                other.additionalBonusEligible == additionalBonusEligible) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.isValidMaterial, isValidMaterial) ||
                other.isValidMaterial == isValidMaterial) &&
            (identical(other.isFOC, isFOC) || other.isFOC == isFOC) &&
            (identical(other.isPriceOverride, isPriceOverride) ||
                other.isPriceOverride == isPriceOverride));
  }

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
      lastPrice,
      finalPrice,
      finalTotalPrice,
      additionalBonusEligible,
      isValid,
      isValidMaterial,
      isFOC,
      isPriceOverride);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceCopyWith<_$_Price> get copyWith =>
      __$$_PriceCopyWithImpl<_$_Price>(this, _$identity);
}

abstract class _Price extends Price {
  const factory _Price(
      {required final MaterialNumber materialNumber,
      required final List<PriceRule> rules,
      required final List<PriceTier> tiers,
      required final List<PriceBonus> bonuses,
      required final List<PriceBundle> bundles,
      required final bool overrideRulePresent,
      required final String zdp5MaxQuota,
      required final String zdp5RemainingQuota,
      required final bool zmgDiscount,
      required final MaterialPrice lastPrice,
      required final MaterialPrice finalPrice,
      required final MaterialPrice finalTotalPrice,
      required final bool additionalBonusEligible,
      required final bool isValid,
      final bool isValidMaterial,
      final bool isFOC,
      final bool isPriceOverride}) = _$_Price;
  const _Price._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  List<PriceRule> get rules;
  @override
  List<PriceTier> get tiers;
  @override
  List<PriceBonus> get bonuses;
  @override
  List<PriceBundle> get bundles;
  @override
  bool get overrideRulePresent;
  @override
  String get zdp5MaxQuota;
  @override
  String get zdp5RemainingQuota;
  @override
  bool get zmgDiscount;
  @override
  MaterialPrice get lastPrice;
  @override
  MaterialPrice get finalPrice;
  @override
  MaterialPrice get finalTotalPrice;
  @override
  bool get additionalBonusEligible;
  @override
  bool get isValid;
  @override
  bool get isValidMaterial;
  @override
  bool get isFOC;
  @override
  bool get isPriceOverride;
  @override
  @JsonKey(ignore: true)
  _$$_PriceCopyWith<_$_Price> get copyWith =>
      throw _privateConstructorUsedError;
}
