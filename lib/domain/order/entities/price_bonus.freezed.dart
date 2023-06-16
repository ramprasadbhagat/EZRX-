// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$PriceBonusCopyWithImpl<$Res, PriceBonus>;
  @useResult
  $Res call({List<PriceBonusItem> items});
}

/// @nodoc
class _$PriceBonusCopyWithImpl<$Res, $Val extends PriceBonus>
    implements $PriceBonusCopyWith<$Res> {
  _$PriceBonusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceBonusCopyWith<$Res>
    implements $PriceBonusCopyWith<$Res> {
  factory _$$_PriceBonusCopyWith(
          _$_PriceBonus value, $Res Function(_$_PriceBonus) then) =
      __$$_PriceBonusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PriceBonusItem> items});
}

/// @nodoc
class __$$_PriceBonusCopyWithImpl<$Res>
    extends _$PriceBonusCopyWithImpl<$Res, _$_PriceBonus>
    implements _$$_PriceBonusCopyWith<$Res> {
  __$$_PriceBonusCopyWithImpl(
      _$_PriceBonus _value, $Res Function(_$_PriceBonus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_PriceBonus(
      items: null == items
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
    if (_items is EqualUnmodifiableListView) return _items;
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
  @pragma('vm:prefer-inline')
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
  BonusMaterialCalculation get calculation =>
      throw _privateConstructorUsedError;
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
      _$PriceBonusItemCopyWithImpl<$Res, PriceBonusItem>;
  @useResult
  $Res call(
      {BonusMaterialCalculation calculation,
      int qualifyingQuantity,
      List<BonusMaterial> bonusMaterials});
}

/// @nodoc
class _$PriceBonusItemCopyWithImpl<$Res, $Val extends PriceBonusItem>
    implements $PriceBonusItemCopyWith<$Res> {
  _$PriceBonusItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculation = null,
    Object? qualifyingQuantity = null,
    Object? bonusMaterials = null,
  }) {
    return _then(_value.copyWith(
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as BonusMaterialCalculation,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusMaterials: null == bonusMaterials
          ? _value.bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusMaterial>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceBonusItemCopyWith<$Res>
    implements $PriceBonusItemCopyWith<$Res> {
  factory _$$_PriceBonusItemCopyWith(
          _$_PriceBonusItem value, $Res Function(_$_PriceBonusItem) then) =
      __$$_PriceBonusItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BonusMaterialCalculation calculation,
      int qualifyingQuantity,
      List<BonusMaterial> bonusMaterials});
}

/// @nodoc
class __$$_PriceBonusItemCopyWithImpl<$Res>
    extends _$PriceBonusItemCopyWithImpl<$Res, _$_PriceBonusItem>
    implements _$$_PriceBonusItemCopyWith<$Res> {
  __$$_PriceBonusItemCopyWithImpl(
      _$_PriceBonusItem _value, $Res Function(_$_PriceBonusItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculation = null,
    Object? qualifyingQuantity = null,
    Object? bonusMaterials = null,
  }) {
    return _then(_$_PriceBonusItem(
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as BonusMaterialCalculation,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusMaterials: null == bonusMaterials
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
  final BonusMaterialCalculation calculation;
  @override
  final int qualifyingQuantity;
  final List<BonusMaterial> _bonusMaterials;
  @override
  List<BonusMaterial> get bonusMaterials {
    if (_bonusMaterials is EqualUnmodifiableListView) return _bonusMaterials;
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
            (identical(other.calculation, calculation) ||
                other.calculation == calculation) &&
            (identical(other.qualifyingQuantity, qualifyingQuantity) ||
                other.qualifyingQuantity == qualifyingQuantity) &&
            const DeepCollectionEquality()
                .equals(other._bonusMaterials, _bonusMaterials));
  }

  @override
  int get hashCode => Object.hash(runtimeType, calculation, qualifyingQuantity,
      const DeepCollectionEquality().hash(_bonusMaterials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceBonusItemCopyWith<_$_PriceBonusItem> get copyWith =>
      __$$_PriceBonusItemCopyWithImpl<_$_PriceBonusItem>(this, _$identity);
}

abstract class _PriceBonusItem extends PriceBonusItem {
  const factory _PriceBonusItem(
      {required final BonusMaterialCalculation calculation,
      required final int qualifyingQuantity,
      required final List<BonusMaterial> bonusMaterials}) = _$_PriceBonusItem;
  const _PriceBonusItem._() : super._();

  @override
  BonusMaterialCalculation get calculation;
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
  int get id => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  BonusMaterialCalculation get calculation =>
      throw _privateConstructorUsedError;
  int get bonusRatio => throw _privateConstructorUsedError;
  int get qualifyingQuantity => throw _privateConstructorUsedError;
  int get bonusQuantity => throw _privateConstructorUsedError;
  int get limitPerTransaction => throw _privateConstructorUsedError;
  String get conditionId => throw _privateConstructorUsedError;
  MaterialCode get oldMaterialCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BonusMaterialCopyWith<BonusMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusMaterialCopyWith<$Res> {
  factory $BonusMaterialCopyWith(
          BonusMaterial value, $Res Function(BonusMaterial) then) =
      _$BonusMaterialCopyWithImpl<$Res, BonusMaterial>;
  @useResult
  $Res call(
      {int id,
      MaterialNumber materialNumber,
      String materialDescription,
      BonusMaterialCalculation calculation,
      int bonusRatio,
      int qualifyingQuantity,
      int bonusQuantity,
      int limitPerTransaction,
      String conditionId,
      MaterialCode oldMaterialCode});
}

/// @nodoc
class _$BonusMaterialCopyWithImpl<$Res, $Val extends BonusMaterial>
    implements $BonusMaterialCopyWith<$Res> {
  _$BonusMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? calculation = null,
    Object? bonusRatio = null,
    Object? qualifyingQuantity = null,
    Object? bonusQuantity = null,
    Object? limitPerTransaction = null,
    Object? conditionId = null,
    Object? oldMaterialCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as BonusMaterialCalculation,
      bonusRatio: null == bonusRatio
          ? _value.bonusRatio
          : bonusRatio // ignore: cast_nullable_to_non_nullable
              as int,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuantity: null == bonusQuantity
          ? _value.bonusQuantity
          : bonusQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      limitPerTransaction: null == limitPerTransaction
          ? _value.limitPerTransaction
          : limitPerTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      conditionId: null == conditionId
          ? _value.conditionId
          : conditionId // ignore: cast_nullable_to_non_nullable
              as String,
      oldMaterialCode: null == oldMaterialCode
          ? _value.oldMaterialCode
          : oldMaterialCode // ignore: cast_nullable_to_non_nullable
              as MaterialCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BonusMaterialCopyWith<$Res>
    implements $BonusMaterialCopyWith<$Res> {
  factory _$$_BonusMaterialCopyWith(
          _$_BonusMaterial value, $Res Function(_$_BonusMaterial) then) =
      __$$_BonusMaterialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      MaterialNumber materialNumber,
      String materialDescription,
      BonusMaterialCalculation calculation,
      int bonusRatio,
      int qualifyingQuantity,
      int bonusQuantity,
      int limitPerTransaction,
      String conditionId,
      MaterialCode oldMaterialCode});
}

/// @nodoc
class __$$_BonusMaterialCopyWithImpl<$Res>
    extends _$BonusMaterialCopyWithImpl<$Res, _$_BonusMaterial>
    implements _$$_BonusMaterialCopyWith<$Res> {
  __$$_BonusMaterialCopyWithImpl(
      _$_BonusMaterial _value, $Res Function(_$_BonusMaterial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? calculation = null,
    Object? bonusRatio = null,
    Object? qualifyingQuantity = null,
    Object? bonusQuantity = null,
    Object? limitPerTransaction = null,
    Object? conditionId = null,
    Object? oldMaterialCode = null,
  }) {
    return _then(_$_BonusMaterial(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as BonusMaterialCalculation,
      bonusRatio: null == bonusRatio
          ? _value.bonusRatio
          : bonusRatio // ignore: cast_nullable_to_non_nullable
              as int,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuantity: null == bonusQuantity
          ? _value.bonusQuantity
          : bonusQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      limitPerTransaction: null == limitPerTransaction
          ? _value.limitPerTransaction
          : limitPerTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      conditionId: null == conditionId
          ? _value.conditionId
          : conditionId // ignore: cast_nullable_to_non_nullable
              as String,
      oldMaterialCode: null == oldMaterialCode
          ? _value.oldMaterialCode
          : oldMaterialCode // ignore: cast_nullable_to_non_nullable
              as MaterialCode,
    ));
  }
}

/// @nodoc

class _$_BonusMaterial extends _BonusMaterial {
  const _$_BonusMaterial(
      {required this.id,
      required this.materialNumber,
      required this.materialDescription,
      required this.calculation,
      required this.bonusRatio,
      required this.qualifyingQuantity,
      required this.bonusQuantity,
      required this.limitPerTransaction,
      required this.conditionId,
      required this.oldMaterialCode})
      : super._();

  @override
  final int id;
  @override
  final MaterialNumber materialNumber;
  @override
  final String materialDescription;
  @override
  final BonusMaterialCalculation calculation;
  @override
  final int bonusRatio;
  @override
  final int qualifyingQuantity;
  @override
  final int bonusQuantity;
  @override
  final int limitPerTransaction;
  @override
  final String conditionId;
  @override
  final MaterialCode oldMaterialCode;

  @override
  String toString() {
    return 'BonusMaterial(id: $id, materialNumber: $materialNumber, materialDescription: $materialDescription, calculation: $calculation, bonusRatio: $bonusRatio, qualifyingQuantity: $qualifyingQuantity, bonusQuantity: $bonusQuantity, limitPerTransaction: $limitPerTransaction, conditionId: $conditionId, oldMaterialCode: $oldMaterialCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BonusMaterial &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.calculation, calculation) ||
                other.calculation == calculation) &&
            (identical(other.bonusRatio, bonusRatio) ||
                other.bonusRatio == bonusRatio) &&
            (identical(other.qualifyingQuantity, qualifyingQuantity) ||
                other.qualifyingQuantity == qualifyingQuantity) &&
            (identical(other.bonusQuantity, bonusQuantity) ||
                other.bonusQuantity == bonusQuantity) &&
            (identical(other.limitPerTransaction, limitPerTransaction) ||
                other.limitPerTransaction == limitPerTransaction) &&
            (identical(other.conditionId, conditionId) ||
                other.conditionId == conditionId) &&
            (identical(other.oldMaterialCode, oldMaterialCode) ||
                other.oldMaterialCode == oldMaterialCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      materialNumber,
      materialDescription,
      calculation,
      bonusRatio,
      qualifyingQuantity,
      bonusQuantity,
      limitPerTransaction,
      conditionId,
      oldMaterialCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BonusMaterialCopyWith<_$_BonusMaterial> get copyWith =>
      __$$_BonusMaterialCopyWithImpl<_$_BonusMaterial>(this, _$identity);
}

abstract class _BonusMaterial extends BonusMaterial {
  const factory _BonusMaterial(
      {required final int id,
      required final MaterialNumber materialNumber,
      required final String materialDescription,
      required final BonusMaterialCalculation calculation,
      required final int bonusRatio,
      required final int qualifyingQuantity,
      required final int bonusQuantity,
      required final int limitPerTransaction,
      required final String conditionId,
      required final MaterialCode oldMaterialCode}) = _$_BonusMaterial;
  const _BonusMaterial._() : super._();

  @override
  int get id;
  @override
  MaterialNumber get materialNumber;
  @override
  String get materialDescription;
  @override
  BonusMaterialCalculation get calculation;
  @override
  int get bonusRatio;
  @override
  int get qualifyingQuantity;
  @override
  int get bonusQuantity;
  @override
  int get limitPerTransaction;
  @override
  String get conditionId;
  @override
  MaterialCode get oldMaterialCode;
  @override
  @JsonKey(ignore: true)
  _$$_BonusMaterialCopyWith<_$_BonusMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}
