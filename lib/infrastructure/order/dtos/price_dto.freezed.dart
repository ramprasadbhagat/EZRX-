// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules => throw _privateConstructorUsedError;
  @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles => throw _privateConstructorUsedError;
  @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
  bool get overrideRulePresent => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
  String get zdp5MaxQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
  String get zdp5RemainingQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZMGDiscount', defaultValue: false)
  bool get zmgDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ListPrice', defaultValue: 0)
  double get listPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
  double get finalIndividualPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
  double get finalTotalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
  bool get additionalBonusEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'Valid', defaultValue: false)
  bool get isValid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceDtoCopyWith<PriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceDtoCopyWith<$Res> {
  factory $PriceDtoCopyWith(PriceDto value, $Res Function(PriceDto) then) =
      _$PriceDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'MaterialNumber')
          String materialNumber,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
          List<PriceRuleDto> rules,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
          List<PriceTierDto> tiers,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
          List<PriceBonusDto> bonuses,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
          List<PriceBundleDto> bundles,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
          bool overrideRulePresent,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
          String zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
          String zdp5RemainingQuota,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
          bool zmgDiscount,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
          double listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
          double finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
          double finalTotalPrice,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
          bool additionalBonusEligible,
      @JsonKey(name: 'Valid', defaultValue: false)
          bool isValid});
}

/// @nodoc
class _$PriceDtoCopyWithImpl<$Res> implements $PriceDtoCopyWith<$Res> {
  _$PriceDtoCopyWithImpl(this._value, this._then);

  final PriceDto _value;
  // ignore: unused_field
  final $Res Function(PriceDto) _then;

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
    Object? listPrice = freezed,
    Object? finalIndividualPrice = freezed,
    Object? finalTotalPrice = freezed,
    Object? additionalBonusEligible = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_value.copyWith(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      rules: rules == freezed
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      tiers: tiers == freezed
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierDto>,
      bonuses: bonuses == freezed
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusDto>,
      bundles: bundles == freezed
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleDto>,
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
      listPrice: listPrice == freezed
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalIndividualPrice: finalIndividualPrice == freezed
          ? _value.finalIndividualPrice
          : finalIndividualPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalTotalPrice: finalTotalPrice == freezed
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      additionalBonusEligible: additionalBonusEligible == freezed
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceDtoCopyWith<$Res> implements $PriceDtoCopyWith<$Res> {
  factory _$$_PriceDtoCopyWith(
          _$_PriceDto value, $Res Function(_$_PriceDto) then) =
      __$$_PriceDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'MaterialNumber')
          String materialNumber,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
          List<PriceRuleDto> rules,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
          List<PriceTierDto> tiers,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
          List<PriceBonusDto> bonuses,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
          List<PriceBundleDto> bundles,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
          bool overrideRulePresent,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
          String zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
          String zdp5RemainingQuota,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
          bool zmgDiscount,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
          double listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
          double finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
          double finalTotalPrice,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
          bool additionalBonusEligible,
      @JsonKey(name: 'Valid', defaultValue: false)
          bool isValid});
}

/// @nodoc
class __$$_PriceDtoCopyWithImpl<$Res> extends _$PriceDtoCopyWithImpl<$Res>
    implements _$$_PriceDtoCopyWith<$Res> {
  __$$_PriceDtoCopyWithImpl(
      _$_PriceDto _value, $Res Function(_$_PriceDto) _then)
      : super(_value, (v) => _then(v as _$_PriceDto));

  @override
  _$_PriceDto get _value => super._value as _$_PriceDto;

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
    Object? listPrice = freezed,
    Object? finalIndividualPrice = freezed,
    Object? finalTotalPrice = freezed,
    Object? additionalBonusEligible = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_$_PriceDto(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      rules: rules == freezed
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<PriceRuleDto>,
      tiers: tiers == freezed
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<PriceTierDto>,
      bonuses: bonuses == freezed
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusDto>,
      bundles: bundles == freezed
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleDto>,
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
      listPrice: listPrice == freezed
          ? _value.listPrice
          : listPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalIndividualPrice: finalIndividualPrice == freezed
          ? _value.finalIndividualPrice
          : finalIndividualPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalTotalPrice: finalTotalPrice == freezed
          ? _value.finalTotalPrice
          : finalTotalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      additionalBonusEligible: additionalBonusEligible == freezed
          ? _value.additionalBonusEligible
          : additionalBonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PriceDto extends _PriceDto {
  const _$_PriceDto(
      {@JsonKey(name: 'MaterialNumber')
          required this.materialNumber,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
          required final List<PriceRuleDto> rules,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
          required final List<PriceTierDto> tiers,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
          required final List<PriceBonusDto> bonuses,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
          required final List<PriceBundleDto> bundles,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
          required this.overrideRulePresent,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
          required this.zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
          required this.zdp5RemainingQuota,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
          required this.zmgDiscount,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
          required this.listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
          required this.finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
          required this.finalTotalPrice,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
          required this.additionalBonusEligible,
      @JsonKey(name: 'Valid', defaultValue: false)
          required this.isValid})
      : _rules = rules,
        _tiers = tiers,
        _bonuses = bonuses,
        _bundles = bundles,
        super._();

  factory _$_PriceDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialNumber')
  final String materialNumber;
  final List<PriceRuleDto> _rules;
  @override
  @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  final List<PriceTierDto> _tiers;
  @override
  @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiers);
  }

  final List<PriceBonusDto> _bonuses;
  @override
  @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  final List<PriceBundleDto> _bundles;
  @override
  @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundles);
  }

  @override
  @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
  final bool overrideRulePresent;
  @override
  @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
  final String zdp5MaxQuota;
  @override
  @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
  final String zdp5RemainingQuota;
  @override
  @JsonKey(name: 'ZMGDiscount', defaultValue: false)
  final bool zmgDiscount;
  @override
  @JsonKey(name: 'ListPrice', defaultValue: 0)
  final double listPrice;
  @override
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
  final double finalIndividualPrice;
  @override
  @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
  final double finalTotalPrice;
  @override
  @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
  final bool additionalBonusEligible;
  @override
  @JsonKey(name: 'Valid', defaultValue: false)
  final bool isValid;

  @override
  String toString() {
    return 'PriceDto(materialNumber: $materialNumber, rules: $rules, tiers: $tiers, bonuses: $bonuses, bundles: $bundles, overrideRulePresent: $overrideRulePresent, zdp5MaxQuota: $zdp5MaxQuota, zdp5RemainingQuota: $zdp5RemainingQuota, zmgDiscount: $zmgDiscount, listPrice: $listPrice, finalIndividualPrice: $finalIndividualPrice, finalTotalPrice: $finalTotalPrice, additionalBonusEligible: $additionalBonusEligible, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceDto &&
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
            const DeepCollectionEquality().equals(other.listPrice, listPrice) &&
            const DeepCollectionEquality()
                .equals(other.finalIndividualPrice, finalIndividualPrice) &&
            const DeepCollectionEquality()
                .equals(other.finalTotalPrice, finalTotalPrice) &&
            const DeepCollectionEquality().equals(
                other.additionalBonusEligible, additionalBonusEligible) &&
            const DeepCollectionEquality().equals(other.isValid, isValid));
  }

  @JsonKey(ignore: true)
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
      const DeepCollectionEquality().hash(listPrice),
      const DeepCollectionEquality().hash(finalIndividualPrice),
      const DeepCollectionEquality().hash(finalTotalPrice),
      const DeepCollectionEquality().hash(additionalBonusEligible),
      const DeepCollectionEquality().hash(isValid));

  @JsonKey(ignore: true)
  @override
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
          required final String materialNumber,
      @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
          required final List<PriceRuleDto> rules,
      @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
          required final List<PriceTierDto> tiers,
      @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
          required final List<PriceBonusDto> bonuses,
      @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
          required final List<PriceBundleDto> bundles,
      @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
          required final bool overrideRulePresent,
      @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
          required final String zdp5MaxQuota,
      @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
          required final String zdp5RemainingQuota,
      @JsonKey(name: 'ZMGDiscount', defaultValue: false)
          required final bool zmgDiscount,
      @JsonKey(name: 'ListPrice', defaultValue: 0)
          required final double listPrice,
      @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
          required final double finalIndividualPrice,
      @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
          required final double finalTotalPrice,
      @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
          required final bool additionalBonusEligible,
      @JsonKey(name: 'Valid', defaultValue: false)
          required final bool isValid}) = _$_PriceDto;
  const _PriceDto._() : super._();

  factory _PriceDto.fromJson(Map<String, dynamic> json) = _$_PriceDto.fromJson;

  @override
  @JsonKey(name: 'MaterialNumber')
  String get materialNumber;
  @override
  @JsonKey(name: 'PriceRules', defaultValue: <PriceRuleDto>[])
  List<PriceRuleDto> get rules;
  @override
  @JsonKey(name: 'TieredPricing', defaultValue: <PriceTierDto>[])
  List<PriceTierDto> get tiers;
  @override
  @JsonKey(name: 'Bonuses', defaultValue: <PriceBonusDto>[])
  List<PriceBonusDto> get bonuses;
  @override
  @JsonKey(name: 'Bundles', defaultValue: <PriceBundleDto>[])
  List<PriceBundleDto> get bundles;
  @override
  @JsonKey(name: 'OverridenRulePresent', defaultValue: false)
  bool get overrideRulePresent;
  @override
  @JsonKey(name: 'ZDP5MaxQuota', defaultValue: '')
  String get zdp5MaxQuota;
  @override
  @JsonKey(name: 'ZDP5RemainingQuota', defaultValue: '')
  String get zdp5RemainingQuota;
  @override
  @JsonKey(name: 'ZMGDiscount', defaultValue: false)
  bool get zmgDiscount;
  @override
  @JsonKey(name: 'ListPrice', defaultValue: 0)
  double get listPrice;
  @override
  @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0)
  double get finalIndividualPrice;
  @override
  @JsonKey(name: 'FinalTotalPrice', defaultValue: 0)
  double get finalTotalPrice;
  @override
  @JsonKey(name: 'AdditionalBonusEligible', defaultValue: false)
  bool get additionalBonusEligible;
  @override
  @JsonKey(name: 'Valid', defaultValue: false)
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$_PriceDtoCopyWith<_$_PriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
