// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_bonus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceBonus {
  List<PriceBonusItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceBonusCopyWith<PriceBonus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBonusCopyWith<$Res> {
  factory $PriceBonusCopyWith(
          PriceBonus value, $Res Function(PriceBonus) then) =
      _$PriceBonusCopyWithImpl<$Res>;
  $Res call({List<PriceBonusItem> items});
}

/// @nodoc
class _$PriceBonusCopyWithImpl<$Res> implements $PriceBonusCopyWith<$Res> {
  _$PriceBonusCopyWithImpl(this._value, this._then);

  final PriceBonus _value;
  // ignore: unused_field
  final $Res Function(PriceBonus) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceBonusCopyWith<$Res>
    implements $PriceBonusCopyWith<$Res> {
  factory _$$_PriceBonusCopyWith(
          _$_PriceBonus value, $Res Function(_$_PriceBonus) then) =
      __$$_PriceBonusCopyWithImpl<$Res>;
  @override
  $Res call({List<PriceBonusItem> items});
}

/// @nodoc
class __$$_PriceBonusCopyWithImpl<$Res> extends _$PriceBonusCopyWithImpl<$Res>
    implements _$$_PriceBonusCopyWith<$Res> {
  __$$_PriceBonusCopyWithImpl(
      _$_PriceBonus _value, $Res Function(_$_PriceBonus) _then)
      : super(_value, (v) => _then(v as _$_PriceBonus));

  @override
  _$_PriceBonus get _value => super._value as _$_PriceBonus;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$_PriceBonus(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusItem>,
    ));
  }
}

/// @nodoc

class _$_PriceBonus extends _PriceBonus {
  const _$_PriceBonus({required final List<PriceBonusItem> items})
      : _items = items,
        super._();

  final List<PriceBonusItem> _items;
  @override
  List<PriceBonusItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PriceBonus(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceBonus &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_PriceBonusCopyWith<_$_PriceBonus> get copyWith =>
      __$$_PriceBonusCopyWithImpl<_$_PriceBonus>(this, _$identity);
}

abstract class _PriceBonus extends PriceBonus {
  const factory _PriceBonus({required final List<PriceBonusItem> items}) =
      _$_PriceBonus;
  const _PriceBonus._() : super._();

  @override
  List<PriceBonusItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_PriceBonusCopyWith<_$_PriceBonus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PriceBonusItem {
  String get calculation => throw _privateConstructorUsedError;
  int get qualifyingQuantity => throw _privateConstructorUsedError;
  List<BonusMaterial> get bonusMaterials => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceBonusItemCopyWith<PriceBonusItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBonusItemCopyWith<$Res> {
  factory $PriceBonusItemCopyWith(
          PriceBonusItem value, $Res Function(PriceBonusItem) then) =
      _$PriceBonusItemCopyWithImpl<$Res>;
  $Res call(
      {String calculation,
      int qualifyingQuantity,
      List<BonusMaterial> bonusMaterials});
}

/// @nodoc
class _$PriceBonusItemCopyWithImpl<$Res>
    implements $PriceBonusItemCopyWith<$Res> {
  _$PriceBonusItemCopyWithImpl(this._value, this._then);

  final PriceBonusItem _value;
  // ignore: unused_field
  final $Res Function(PriceBonusItem) _then;

  @override
  $Res call({
    Object? calculation = freezed,
    Object? qualifyingQuantity = freezed,
    Object? bonusMaterials = freezed,
  }) {
    return _then(_value.copyWith(
      calculation: calculation == freezed
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      qualifyingQuantity: qualifyingQuantity == freezed
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusMaterials: bonusMaterials == freezed
          ? _value.bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusMaterial>,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceBonusItemCopyWith<$Res>
    implements $PriceBonusItemCopyWith<$Res> {
  factory _$$_PriceBonusItemCopyWith(
          _$_PriceBonusItem value, $Res Function(_$_PriceBonusItem) then) =
      __$$_PriceBonusItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String calculation,
      int qualifyingQuantity,
      List<BonusMaterial> bonusMaterials});
}

/// @nodoc
class __$$_PriceBonusItemCopyWithImpl<$Res>
    extends _$PriceBonusItemCopyWithImpl<$Res>
    implements _$$_PriceBonusItemCopyWith<$Res> {
  __$$_PriceBonusItemCopyWithImpl(
      _$_PriceBonusItem _value, $Res Function(_$_PriceBonusItem) _then)
      : super(_value, (v) => _then(v as _$_PriceBonusItem));

  @override
  _$_PriceBonusItem get _value => super._value as _$_PriceBonusItem;

  @override
  $Res call({
    Object? calculation = freezed,
    Object? qualifyingQuantity = freezed,
    Object? bonusMaterials = freezed,
  }) {
    return _then(_$_PriceBonusItem(
      calculation: calculation == freezed
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      qualifyingQuantity: qualifyingQuantity == freezed
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusMaterials: bonusMaterials == freezed
          ? _value._bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusMaterial>,
    ));
  }
}

/// @nodoc

class _$_PriceBonusItem extends _PriceBonusItem {
  const _$_PriceBonusItem(
      {required this.calculation,
      required this.qualifyingQuantity,
      required final List<BonusMaterial> bonusMaterials})
      : _bonusMaterials = bonusMaterials,
        super._();

  @override
  final String calculation;
  @override
  final int qualifyingQuantity;
  final List<BonusMaterial> _bonusMaterials;
  @override
  List<BonusMaterial> get bonusMaterials {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusMaterials);
  }

  @override
  String toString() {
    return 'PriceBonusItem(calculation: $calculation, qualifyingQuantity: $qualifyingQuantity, bonusMaterials: $bonusMaterials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceBonusItem &&
            const DeepCollectionEquality()
                .equals(other.calculation, calculation) &&
            const DeepCollectionEquality()
                .equals(other.qualifyingQuantity, qualifyingQuantity) &&
            const DeepCollectionEquality()
                .equals(other._bonusMaterials, _bonusMaterials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(calculation),
      const DeepCollectionEquality().hash(qualifyingQuantity),
      const DeepCollectionEquality().hash(_bonusMaterials));

  @JsonKey(ignore: true)
  @override
  _$$_PriceBonusItemCopyWith<_$_PriceBonusItem> get copyWith =>
      __$$_PriceBonusItemCopyWithImpl<_$_PriceBonusItem>(this, _$identity);
}

abstract class _PriceBonusItem extends PriceBonusItem {
  const factory _PriceBonusItem(
      {required final String calculation,
      required final int qualifyingQuantity,
      required final List<BonusMaterial> bonusMaterials}) = _$_PriceBonusItem;
  const _PriceBonusItem._() : super._();

  @override
  String get calculation;
  @override
  int get qualifyingQuantity;
  @override
  List<BonusMaterial> get bonusMaterials;
  @override
  @JsonKey(ignore: true)
  _$$_PriceBonusItemCopyWith<_$_PriceBonusItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BonusMaterial {
  String get materialNumber => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  String get calculation => throw _privateConstructorUsedError;
  int get bonusRatio => throw _privateConstructorUsedError;
  int get qualifyingQuantity => throw _privateConstructorUsedError;
  int get bonusQuantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BonusMaterialCopyWith<BonusMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusMaterialCopyWith<$Res> {
  factory $BonusMaterialCopyWith(
          BonusMaterial value, $Res Function(BonusMaterial) then) =
      _$BonusMaterialCopyWithImpl<$Res>;
  $Res call(
      {String materialNumber,
      String materialDescription,
      String calculation,
      int bonusRatio,
      int qualifyingQuantity,
      int bonusQuantity});
}

/// @nodoc
class _$BonusMaterialCopyWithImpl<$Res>
    implements $BonusMaterialCopyWith<$Res> {
  _$BonusMaterialCopyWithImpl(this._value, this._then);

  final BonusMaterial _value;
  // ignore: unused_field
  final $Res Function(BonusMaterial) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? materialDescription = freezed,
    Object? calculation = freezed,
    Object? bonusRatio = freezed,
    Object? qualifyingQuantity = freezed,
    Object? bonusQuantity = freezed,
  }) {
    return _then(_value.copyWith(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      calculation: calculation == freezed
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      bonusRatio: bonusRatio == freezed
          ? _value.bonusRatio
          : bonusRatio // ignore: cast_nullable_to_non_nullable
              as int,
      qualifyingQuantity: qualifyingQuantity == freezed
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuantity: bonusQuantity == freezed
          ? _value.bonusQuantity
          : bonusQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_BonusMaterialCopyWith<$Res>
    implements $BonusMaterialCopyWith<$Res> {
  factory _$$_BonusMaterialCopyWith(
          _$_BonusMaterial value, $Res Function(_$_BonusMaterial) then) =
      __$$_BonusMaterialCopyWithImpl<$Res>;
  @override
  $Res call(
      {String materialNumber,
      String materialDescription,
      String calculation,
      int bonusRatio,
      int qualifyingQuantity,
      int bonusQuantity});
}

/// @nodoc
class __$$_BonusMaterialCopyWithImpl<$Res>
    extends _$BonusMaterialCopyWithImpl<$Res>
    implements _$$_BonusMaterialCopyWith<$Res> {
  __$$_BonusMaterialCopyWithImpl(
      _$_BonusMaterial _value, $Res Function(_$_BonusMaterial) _then)
      : super(_value, (v) => _then(v as _$_BonusMaterial));

  @override
  _$_BonusMaterial get _value => super._value as _$_BonusMaterial;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? materialDescription = freezed,
    Object? calculation = freezed,
    Object? bonusRatio = freezed,
    Object? qualifyingQuantity = freezed,
    Object? bonusQuantity = freezed,
  }) {
    return _then(_$_BonusMaterial(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      calculation: calculation == freezed
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      bonusRatio: bonusRatio == freezed
          ? _value.bonusRatio
          : bonusRatio // ignore: cast_nullable_to_non_nullable
              as int,
      qualifyingQuantity: qualifyingQuantity == freezed
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuantity: bonusQuantity == freezed
          ? _value.bonusQuantity
          : bonusQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BonusMaterial extends _BonusMaterial {
  const _$_BonusMaterial(
      {required this.materialNumber,
      required this.materialDescription,
      required this.calculation,
      required this.bonusRatio,
      required this.qualifyingQuantity,
      required this.bonusQuantity})
      : super._();

  @override
  final String materialNumber;
  @override
  final String materialDescription;
  @override
  final String calculation;
  @override
  final int bonusRatio;
  @override
  final int qualifyingQuantity;
  @override
  final int bonusQuantity;

  @override
  String toString() {
    return 'BonusMaterial(materialNumber: $materialNumber, materialDescription: $materialDescription, calculation: $calculation, bonusRatio: $bonusRatio, qualifyingQuantity: $qualifyingQuantity, bonusQuantity: $bonusQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BonusMaterial &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription) &&
            const DeepCollectionEquality()
                .equals(other.calculation, calculation) &&
            const DeepCollectionEquality()
                .equals(other.bonusRatio, bonusRatio) &&
            const DeepCollectionEquality()
                .equals(other.qualifyingQuantity, qualifyingQuantity) &&
            const DeepCollectionEquality()
                .equals(other.bonusQuantity, bonusQuantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(materialDescription),
      const DeepCollectionEquality().hash(calculation),
      const DeepCollectionEquality().hash(bonusRatio),
      const DeepCollectionEquality().hash(qualifyingQuantity),
      const DeepCollectionEquality().hash(bonusQuantity));

  @JsonKey(ignore: true)
  @override
  _$$_BonusMaterialCopyWith<_$_BonusMaterial> get copyWith =>
      __$$_BonusMaterialCopyWithImpl<_$_BonusMaterial>(this, _$identity);
}

abstract class _BonusMaterial extends BonusMaterial {
  const factory _BonusMaterial(
      {required final String materialNumber,
      required final String materialDescription,
      required final String calculation,
      required final int bonusRatio,
      required final int qualifyingQuantity,
      required final int bonusQuantity}) = _$_BonusMaterial;
  const _BonusMaterial._() : super._();

  @override
  String get materialNumber;
  @override
  String get materialDescription;
  @override
  String get calculation;
  @override
  int get bonusRatio;
  @override
  int get qualifyingQuantity;
  @override
  int get bonusQuantity;
  @override
  @JsonKey(ignore: true)
  _$$_BonusMaterialCopyWith<_$_BonusMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}
