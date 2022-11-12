// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_rule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceRuleDto _$PriceRuleDtoFromJson(Map<String, dynamic> json) {
  return _PriceRuleDto.fromJson(json);
}

/// @nodoc
mixin _$PriceRuleDto {
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(14, defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(15, defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Conditions', defaultValue: '')
  @HiveField(16, defaultValue: '')
  String get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConditionNumber', defaultValue: '')
  @HiveField(17, defaultValue: '')
  String get conditionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'BonusEligible', defaultValue: false)
  @HiveField(18, defaultValue: false)
  bool get bonusEligible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceRuleDtoCopyWith<PriceRuleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceRuleDtoCopyWith<$Res> {
  factory $PriceRuleDtoCopyWith(
          PriceRuleDto value, $Res Function(PriceRuleDto) then) =
      _$PriceRuleDtoCopyWithImpl<$Res, PriceRuleDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(14, defaultValue: '')
          String type,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(15, defaultValue: 0)
          double rate,
      @JsonKey(name: 'Conditions', defaultValue: '')
      @HiveField(16, defaultValue: '')
          String condition,
      @JsonKey(name: 'ConditionNumber', defaultValue: '')
      @HiveField(17, defaultValue: '')
          String conditionNumber,
      @JsonKey(name: 'BonusEligible', defaultValue: false)
      @HiveField(18, defaultValue: false)
          bool bonusEligible});
}

/// @nodoc
class _$PriceRuleDtoCopyWithImpl<$Res, $Val extends PriceRuleDto>
    implements $PriceRuleDtoCopyWith<$Res> {
  _$PriceRuleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? rate = null,
    Object? condition = null,
    Object? conditionNumber = null,
    Object? bonusEligible = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bonusEligible: null == bonusEligible
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceRuleDtoCopyWith<$Res>
    implements $PriceRuleDtoCopyWith<$Res> {
  factory _$$_PriceRuleDtoCopyWith(
          _$_PriceRuleDto value, $Res Function(_$_PriceRuleDto) then) =
      __$$_PriceRuleDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(14, defaultValue: '')
          String type,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(15, defaultValue: 0)
          double rate,
      @JsonKey(name: 'Conditions', defaultValue: '')
      @HiveField(16, defaultValue: '')
          String condition,
      @JsonKey(name: 'ConditionNumber', defaultValue: '')
      @HiveField(17, defaultValue: '')
          String conditionNumber,
      @JsonKey(name: 'BonusEligible', defaultValue: false)
      @HiveField(18, defaultValue: false)
          bool bonusEligible});
}

/// @nodoc
class __$$_PriceRuleDtoCopyWithImpl<$Res>
    extends _$PriceRuleDtoCopyWithImpl<$Res, _$_PriceRuleDto>
    implements _$$_PriceRuleDtoCopyWith<$Res> {
  __$$_PriceRuleDtoCopyWithImpl(
      _$_PriceRuleDto _value, $Res Function(_$_PriceRuleDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? rate = null,
    Object? condition = null,
    Object? conditionNumber = null,
    Object? bonusEligible = null,
  }) {
    return _then(_$_PriceRuleDto(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bonusEligible: null == bonusEligible
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 7, adapterName: 'PriceRuleDtoAdapter')
class _$_PriceRuleDto extends _PriceRuleDto {
  const _$_PriceRuleDto(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(14, defaultValue: '')
          required this.type,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(15, defaultValue: 0)
          required this.rate,
      @JsonKey(name: 'Conditions', defaultValue: '')
      @HiveField(16, defaultValue: '')
          required this.condition,
      @JsonKey(name: 'ConditionNumber', defaultValue: '')
      @HiveField(17, defaultValue: '')
          required this.conditionNumber,
      @JsonKey(name: 'BonusEligible', defaultValue: false)
      @HiveField(18, defaultValue: false)
          required this.bonusEligible})
      : super._();

  factory _$_PriceRuleDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceRuleDtoFromJson(json);

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(14, defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(15, defaultValue: 0)
  final double rate;
  @override
  @JsonKey(name: 'Conditions', defaultValue: '')
  @HiveField(16, defaultValue: '')
  final String condition;
  @override
  @JsonKey(name: 'ConditionNumber', defaultValue: '')
  @HiveField(17, defaultValue: '')
  final String conditionNumber;
  @override
  @JsonKey(name: 'BonusEligible', defaultValue: false)
  @HiveField(18, defaultValue: false)
  final bool bonusEligible;

  @override
  String toString() {
    return 'PriceRuleDto(type: $type, rate: $rate, condition: $condition, conditionNumber: $conditionNumber, bonusEligible: $bonusEligible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceRuleDto &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.bonusEligible, bonusEligible) ||
                other.bonusEligible == bonusEligible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, rate, condition, conditionNumber, bonusEligible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceRuleDtoCopyWith<_$_PriceRuleDto> get copyWith =>
      __$$_PriceRuleDtoCopyWithImpl<_$_PriceRuleDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceRuleDtoToJson(
      this,
    );
  }
}

abstract class _PriceRuleDto extends PriceRuleDto {
  const factory _PriceRuleDto(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(14, defaultValue: '')
          required final String type,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(15, defaultValue: 0)
          required final double rate,
      @JsonKey(name: 'Conditions', defaultValue: '')
      @HiveField(16, defaultValue: '')
          required final String condition,
      @JsonKey(name: 'ConditionNumber', defaultValue: '')
      @HiveField(17, defaultValue: '')
          required final String conditionNumber,
      @JsonKey(name: 'BonusEligible', defaultValue: false)
      @HiveField(18, defaultValue: false)
          required final bool bonusEligible}) = _$_PriceRuleDto;
  const _PriceRuleDto._() : super._();

  factory _PriceRuleDto.fromJson(Map<String, dynamic> json) =
      _$_PriceRuleDto.fromJson;

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(14, defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(15, defaultValue: 0)
  double get rate;
  @override
  @JsonKey(name: 'Conditions', defaultValue: '')
  @HiveField(16, defaultValue: '')
  String get condition;
  @override
  @JsonKey(name: 'ConditionNumber', defaultValue: '')
  @HiveField(17, defaultValue: '')
  String get conditionNumber;
  @override
  @JsonKey(name: 'BonusEligible', defaultValue: false)
  @HiveField(18, defaultValue: false)
  bool get bonusEligible;
  @override
  @JsonKey(ignore: true)
  _$$_PriceRuleDtoCopyWith<_$_PriceRuleDto> get copyWith =>
      throw _privateConstructorUsedError;
}
