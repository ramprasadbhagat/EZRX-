// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'combo_deal_qty_tier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ComboDealQtyTier {
  double get rate => throw _privateConstructorUsedError;
  String get conditionNumber => throw _privateConstructorUsedError;
  int get minQty => throw _privateConstructorUsedError;
  DiscountType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComboDealQtyTierCopyWith<ComboDealQtyTier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealQtyTierCopyWith<$Res> {
  factory $ComboDealQtyTierCopyWith(
          ComboDealQtyTier value, $Res Function(ComboDealQtyTier) then) =
      _$ComboDealQtyTierCopyWithImpl<$Res, ComboDealQtyTier>;
  @useResult
  $Res call(
      {double rate, String conditionNumber, int minQty, DiscountType type});
}

/// @nodoc
class _$ComboDealQtyTierCopyWithImpl<$Res, $Val extends ComboDealQtyTier>
    implements $ComboDealQtyTierCopyWith<$Res> {
  _$ComboDealQtyTierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? conditionNumber = null,
    Object? minQty = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComboDealQtyTierCopyWith<$Res>
    implements $ComboDealQtyTierCopyWith<$Res> {
  factory _$$_ComboDealQtyTierCopyWith(
          _$_ComboDealQtyTier value, $Res Function(_$_ComboDealQtyTier) then) =
      __$$_ComboDealQtyTierCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double rate, String conditionNumber, int minQty, DiscountType type});
}

/// @nodoc
class __$$_ComboDealQtyTierCopyWithImpl<$Res>
    extends _$ComboDealQtyTierCopyWithImpl<$Res, _$_ComboDealQtyTier>
    implements _$$_ComboDealQtyTierCopyWith<$Res> {
  __$$_ComboDealQtyTierCopyWithImpl(
      _$_ComboDealQtyTier _value, $Res Function(_$_ComboDealQtyTier) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? conditionNumber = null,
    Object? minQty = null,
    Object? type = null,
  }) {
    return _then(_$_ComboDealQtyTier(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
    ));
  }
}

/// @nodoc

class _$_ComboDealQtyTier extends _ComboDealQtyTier {
  const _$_ComboDealQtyTier(
      {required this.rate,
      required this.conditionNumber,
      required this.minQty,
      required this.type})
      : super._();

  @override
  final double rate;
  @override
  final String conditionNumber;
  @override
  final int minQty;
  @override
  final DiscountType type;

  @override
  String toString() {
    return 'ComboDealQtyTier(rate: $rate, conditionNumber: $conditionNumber, minQty: $minQty, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComboDealQtyTier &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, rate, conditionNumber, minQty, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComboDealQtyTierCopyWith<_$_ComboDealQtyTier> get copyWith =>
      __$$_ComboDealQtyTierCopyWithImpl<_$_ComboDealQtyTier>(this, _$identity);
}

abstract class _ComboDealQtyTier extends ComboDealQtyTier {
  const factory _ComboDealQtyTier(
      {required final double rate,
      required final String conditionNumber,
      required final int minQty,
      required final DiscountType type}) = _$_ComboDealQtyTier;
  const _ComboDealQtyTier._() : super._();

  @override
  double get rate;
  @override
  String get conditionNumber;
  @override
  int get minQty;
  @override
  DiscountType get type;
  @override
  @JsonKey(ignore: true)
  _$$_ComboDealQtyTierCopyWith<_$_ComboDealQtyTier> get copyWith =>
      throw _privateConstructorUsedError;
}
