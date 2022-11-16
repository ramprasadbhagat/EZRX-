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
  bool get isOverride => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceCopyWith<Price> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceCopyWith<$Res> {
  factory $PriceCopyWith(Price value, $Res Function(Price) then) =
      _$PriceCopyWithImpl<$Res>;
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
      bool isOverride});
}

/// @nodoc
class _$PriceCopyWithImpl<$Res> implements $PriceCopyWith<$Res> {
  _$PriceCopyWithImpl(this._value, this._then);

  final Price _value;
  // ignore: unused_field
  final $Res Function(Price) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? rules = freezed,
    Object? tiers = freezed,
    Object? bonuses = freezed,
    Object? bundles = freezed,
    Object? overrideRulePresent = freezed,
    Object? zdp5MaxQuota = freezed,
    Object? zdp5RemainingQuota = freezed,
    Object? zmgDiscount = freezed,
    Object? lastPrice = freezed,
    Object? finalPrice = freezed,
    Object? finalTotalPrice = freezed,
    Object? additionalBonusEligible = freezed,
    Object? isValid = freezed,
    Object? isValidMaterial = freezed,
    Object? isFOC = freezed,
    Object? isOverride = freezed,
  }) {
    return _then(_value.copyWith(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      rules: rules == freezed
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRule>,
      tiers: tiers == freezed
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTier>,
      bonuses: bonuses == freezed
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonus>,
      bundles: bundles == freezed
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundle>,
      overrideRulePresent: overrideRulePresent == freezed
          ? _value.overrideRulePresent
          : overrideRulePresent // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp5MaxQuota: zdp5MaxQuota == freezed
          ? _value.zdp5MaxQuota
          : zdp5MaxQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zdp5RemainingQuota: zdp5RemainingQuota == freezed
          ? _value.zdp5RemainingQuota
          : zdp5RemainingQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zmgDiscount: zmgDiscount == freezed
          ? _value.zmgDiscount
          : zmgDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPrice: lastPrice == freezed
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalPrice: finalPrice == freezed
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalTotalPrice: finalTotalPrice == freezed
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      additionalBonusEligible: additionalBonusEligible == freezed
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidMaterial: isValidMaterial == freezed
          ? _value.isValidMaterial
          : isValidMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      isFOC: isFOC == freezed
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
      isOverride: isOverride == freezed
          ? _value.isOverride
          : isOverride // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceCopyWith<$Res> implements $PriceCopyWith<$Res> {
  factory _$$_PriceCopyWith(_$_Price value, $Res Function(_$_Price) then) =
      __$$_PriceCopyWithImpl<$Res>;
  @override
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
      bool isOverride});
}

/// @nodoc
class __$$_PriceCopyWithImpl<$Res> extends _$PriceCopyWithImpl<$Res>
    implements _$$_PriceCopyWith<$Res> {
  __$$_PriceCopyWithImpl(_$_Price _value, $Res Function(_$_Price) _then)
      : super(_value, (v) => _then(v as _$_Price));

  @override
  _$_Price get _value => super._value as _$_Price;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? rules = freezed,
    Object? tiers = freezed,
    Object? bonuses = freezed,
    Object? bundles = freezed,
    Object? overrideRulePresent = freezed,
    Object? zdp5MaxQuota = freezed,
    Object? zdp5RemainingQuota = freezed,
    Object? zmgDiscount = freezed,
    Object? lastPrice = freezed,
    Object? finalPrice = freezed,
    Object? finalTotalPrice = freezed,
    Object? additionalBonusEligible = freezed,
    Object? isValid = freezed,
    Object? isValidMaterial = freezed,
    Object? isFOC = freezed,
    Object? isOverride = freezed,
  }) {
    return _then(_$_Price(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      rules: rules == freezed
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRule>,
      tiers: tiers == freezed
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTier>,
      bonuses: bonuses == freezed
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonus>,
      bundles: bundles == freezed
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundle>,
      overrideRulePresent: overrideRulePresent == freezed
          ? _value.overrideRulePresent
          : overrideRulePresent // ignore: cast_nullable_to_non_nullable
              as bool,
      zdp5MaxQuota: zdp5MaxQuota == freezed
          ? _value.zdp5MaxQuota
          : zdp5MaxQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zdp5RemainingQuota: zdp5RemainingQuota == freezed
          ? _value.zdp5RemainingQuota
          : zdp5RemainingQuota // ignore: cast_nullable_to_non_nullable
              as String,
      zmgDiscount: zmgDiscount == freezed
          ? _value.zmgDiscount
          : zmgDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPrice: lastPrice == freezed
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalPrice: finalPrice == freezed
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      finalTotalPrice: finalTotalPrice == freezed
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as MaterialPrice,
      additionalBonusEligible: additionalBonusEligible == freezed
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidMaterial: isValidMaterial == freezed
          ? _value.isValidMaterial
          : isValidMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      isFOC: isFOC == freezed
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
      isOverride: isOverride == freezed
          ? _value.isOverride
          : isOverride // ignore: cast_nullable_to_non_nullable
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
      this.isOverride = false})
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
  final bool isOverride;

  @override
  String toString() {
    return 'Price(materialNumber: $materialNumber, rules: $rules, tiers: $tiers, bonuses: $bonuses, bundles: $bundles, overrideRulePresent: $overrideRulePresent, zdp5MaxQuota: $zdp5MaxQuota, zdp5RemainingQuota: $zdp5RemainingQuota, zmgDiscount: $zmgDiscount, lastPrice: $lastPrice, finalPrice: $finalPrice, finalTotalPrice: $finalTotalPrice, additionalBonusEligible: $additionalBonusEligible, isValid: $isValid, isValidMaterial: $isValidMaterial, isFOC: $isFOC, isOverride: $isOverride)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Price &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            const DeepCollectionEquality().equals(other._tiers, _tiers) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            const DeepCollectionEquality().equals(other._bundles, _bundles) &&
            const DeepCollectionEquality()
                .equals(other.overrideRulePresent, overrideRulePresent) &&
            const DeepCollectionEquality()
                .equals(other.zdp5MaxQuota, zdp5MaxQuota) &&
            const DeepCollectionEquality()
                .equals(other.zdp5RemainingQuota, zdp5RemainingQuota) &&
            const DeepCollectionEquality()
                .equals(other.zmgDiscount, zmgDiscount) &&
            const DeepCollectionEquality().equals(other.lastPrice, lastPrice) &&
            const DeepCollectionEquality()
                .equals(other.finalPrice, finalPrice) &&
            const DeepCollectionEquality()
                .equals(other.finalTotalPrice, finalTotalPrice) &&
            const DeepCollectionEquality().equals(
                other.additionalBonusEligible, additionalBonusEligible) &&
            const DeepCollectionEquality().equals(other.isValid, isValid) &&
            const DeepCollectionEquality()
                .equals(other.isValidMaterial, isValidMaterial) &&
            const DeepCollectionEquality().equals(other.isFOC, isFOC) &&
            const DeepCollectionEquality()
                .equals(other.isOverride, isOverride));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(_rules),
      const DeepCollectionEquality().hash(_tiers),
      const DeepCollectionEquality().hash(_bonuses),
      const DeepCollectionEquality().hash(_bundles),
      const DeepCollectionEquality().hash(overrideRulePresent),
      const DeepCollectionEquality().hash(zdp5MaxQuota),
      const DeepCollectionEquality().hash(zdp5RemainingQuota),
      const DeepCollectionEquality().hash(zmgDiscount),
      const DeepCollectionEquality().hash(lastPrice),
      const DeepCollectionEquality().hash(finalPrice),
      const DeepCollectionEquality().hash(finalTotalPrice),
      const DeepCollectionEquality().hash(additionalBonusEligible),
      const DeepCollectionEquality().hash(isValid),
      const DeepCollectionEquality().hash(isValidMaterial),
      const DeepCollectionEquality().hash(isFOC),
      const DeepCollectionEquality().hash(isOverride));

  @JsonKey(ignore: true)
  @override
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
      final bool isOverride}) = _$_Price;
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
  bool get isOverride;
  @override
  @JsonKey(ignore: true)
  _$$_PriceCopyWith<_$_Price> get copyWith =>
      throw _privateConstructorUsedError;
}
