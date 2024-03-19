// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apl_promotions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AplPromotions {
  double get discountValue => throw _privateConstructorUsedError;
  DiscountType get discountTypeValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AplPromotionsCopyWith<AplPromotions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AplPromotionsCopyWith<$Res> {
  factory $AplPromotionsCopyWith(
          AplPromotions value, $Res Function(AplPromotions) then) =
      _$AplPromotionsCopyWithImpl<$Res, AplPromotions>;
  @useResult
  $Res call({double discountValue, DiscountType discountTypeValue});
}

/// @nodoc
class _$AplPromotionsCopyWithImpl<$Res, $Val extends AplPromotions>
    implements $AplPromotionsCopyWith<$Res> {
  _$AplPromotionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountValue = null,
    Object? discountTypeValue = null,
  }) {
    return _then(_value.copyWith(
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountTypeValue: null == discountTypeValue
          ? _value.discountTypeValue
          : discountTypeValue // ignore: cast_nullable_to_non_nullable
              as DiscountType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AplPromotionsCopyWith<$Res>
    implements $AplPromotionsCopyWith<$Res> {
  factory _$$_AplPromotionsCopyWith(
          _$_AplPromotions value, $Res Function(_$_AplPromotions) then) =
      __$$_AplPromotionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double discountValue, DiscountType discountTypeValue});
}

/// @nodoc
class __$$_AplPromotionsCopyWithImpl<$Res>
    extends _$AplPromotionsCopyWithImpl<$Res, _$_AplPromotions>
    implements _$$_AplPromotionsCopyWith<$Res> {
  __$$_AplPromotionsCopyWithImpl(
      _$_AplPromotions _value, $Res Function(_$_AplPromotions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountValue = null,
    Object? discountTypeValue = null,
  }) {
    return _then(_$_AplPromotions(
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountTypeValue: null == discountTypeValue
          ? _value.discountTypeValue
          : discountTypeValue // ignore: cast_nullable_to_non_nullable
              as DiscountType,
    ));
  }
}

/// @nodoc

class _$_AplPromotions extends _AplPromotions {
  const _$_AplPromotions(
      {required this.discountValue, required this.discountTypeValue})
      : super._();

  @override
  final double discountValue;
  @override
  final DiscountType discountTypeValue;

  @override
  String toString() {
    return 'AplPromotions(discountValue: $discountValue, discountTypeValue: $discountTypeValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AplPromotions &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountTypeValue, discountTypeValue) ||
                other.discountTypeValue == discountTypeValue));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, discountValue, discountTypeValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AplPromotionsCopyWith<_$_AplPromotions> get copyWith =>
      __$$_AplPromotionsCopyWithImpl<_$_AplPromotions>(this, _$identity);
}

abstract class _AplPromotions extends AplPromotions {
  const factory _AplPromotions(
      {required final double discountValue,
      required final DiscountType discountTypeValue}) = _$_AplPromotions;
  const _AplPromotions._() : super._();

  @override
  double get discountValue;
  @override
  DiscountType get discountTypeValue;
  @override
  @JsonKey(ignore: true)
  _$$_AplPromotionsCopyWith<_$_AplPromotions> get copyWith =>
      throw _privateConstructorUsedError;
}
