// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceRule {
  String get type => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  String get conditionNumber => throw _privateConstructorUsedError;
  bool get bonusEligible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceRuleCopyWith<PriceRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceRuleCopyWith<$Res> {
  factory $PriceRuleCopyWith(PriceRule value, $Res Function(PriceRule) then) =
      _$PriceRuleCopyWithImpl<$Res>;
  $Res call(
      {String type,
      double rate,
      String condition,
      String conditionNumber,
      bool bonusEligible});
}

/// @nodoc
class _$PriceRuleCopyWithImpl<$Res> implements $PriceRuleCopyWith<$Res> {
  _$PriceRuleCopyWithImpl(this._value, this._then);

  final PriceRule _value;
  // ignore: unused_field
  final $Res Function(PriceRule) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? rate = freezed,
    Object? condition = freezed,
    Object? conditionNumber = freezed,
    Object? bonusEligible = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      conditionNumber: conditionNumber == freezed
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bonusEligible: bonusEligible == freezed
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceRuleCopyWith<$Res> implements $PriceRuleCopyWith<$Res> {
  factory _$$_PriceRuleCopyWith(
          _$_PriceRule value, $Res Function(_$_PriceRule) then) =
      __$$_PriceRuleCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      double rate,
      String condition,
      String conditionNumber,
      bool bonusEligible});
}

/// @nodoc
class __$$_PriceRuleCopyWithImpl<$Res> extends _$PriceRuleCopyWithImpl<$Res>
    implements _$$_PriceRuleCopyWith<$Res> {
  __$$_PriceRuleCopyWithImpl(
      _$_PriceRule _value, $Res Function(_$_PriceRule) _then)
      : super(_value, (v) => _then(v as _$_PriceRule));

  @override
  _$_PriceRule get _value => super._value as _$_PriceRule;

  @override
  $Res call({
    Object? type = freezed,
    Object? rate = freezed,
    Object? condition = freezed,
    Object? conditionNumber = freezed,
    Object? bonusEligible = freezed,
  }) {
    return _then(_$_PriceRule(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      conditionNumber: conditionNumber == freezed
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bonusEligible: bonusEligible == freezed
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PriceRule extends _PriceRule {
  const _$_PriceRule(
      {required this.type,
      required this.rate,
      required this.condition,
      required this.conditionNumber,
      required this.bonusEligible})
      : super._();

  @override
  final String type;
  @override
  final double rate;
  @override
  final String condition;
  @override
  final String conditionNumber;
  @override
  final bool bonusEligible;

  @override
  String toString() {
    return 'PriceRule(type: $type, rate: $rate, condition: $condition, conditionNumber: $conditionNumber, bonusEligible: $bonusEligible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceRule &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality().equals(other.condition, condition) &&
            const DeepCollectionEquality()
                .equals(other.conditionNumber, conditionNumber) &&
            const DeepCollectionEquality()
                .equals(other.bonusEligible, bonusEligible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(condition),
      const DeepCollectionEquality().hash(conditionNumber),
      const DeepCollectionEquality().hash(bonusEligible));

  @JsonKey(ignore: true)
  @override
  _$$_PriceRuleCopyWith<_$_PriceRule> get copyWith =>
      __$$_PriceRuleCopyWithImpl<_$_PriceRule>(this, _$identity);
}

abstract class _PriceRule extends PriceRule {
  const factory _PriceRule(
      {required final String type,
      required final double rate,
      required final String condition,
      required final String conditionNumber,
      required final bool bonusEligible}) = _$_PriceRule;
  const _PriceRule._() : super._();

  @override
  String get type;
  @override
  double get rate;
  @override
  String get condition;
  @override
  String get conditionNumber;
  @override
  bool get bonusEligible;
  @override
  @JsonKey(ignore: true)
  _$$_PriceRuleCopyWith<_$_PriceRule> get copyWith =>
      throw _privateConstructorUsedError;
}
