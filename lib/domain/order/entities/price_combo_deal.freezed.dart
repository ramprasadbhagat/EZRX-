// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_combo_deal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceComboDeal {
  bool get isEligible => throw _privateConstructorUsedError;
  FlexibleGroup get flexibleGroup => throw _privateConstructorUsedError;
  SalesDealNumber get salesDeal => throw _privateConstructorUsedError;
  PriceComboDealCategory get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceComboDealCopyWith<PriceComboDeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComboDealCopyWith<$Res> {
  factory $PriceComboDealCopyWith(
          PriceComboDeal value, $Res Function(PriceComboDeal) then) =
      _$PriceComboDealCopyWithImpl<$Res, PriceComboDeal>;
  @useResult
  $Res call(
      {bool isEligible,
      FlexibleGroup flexibleGroup,
      SalesDealNumber salesDeal,
      PriceComboDealCategory category});

  $PriceComboDealCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$PriceComboDealCopyWithImpl<$Res, $Val extends PriceComboDeal>
    implements $PriceComboDealCopyWith<$Res> {
  _$PriceComboDealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = null,
    Object? flexibleGroup = null,
    Object? salesDeal = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      isEligible: null == isEligible
          ? _value.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      flexibleGroup: null == flexibleGroup
          ? _value.flexibleGroup
          : flexibleGroup // ignore: cast_nullable_to_non_nullable
              as FlexibleGroup,
      salesDeal: null == salesDeal
          ? _value.salesDeal
          : salesDeal // ignore: cast_nullable_to_non_nullable
              as SalesDealNumber,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PriceComboDealCategory,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealCategoryCopyWith<$Res> get category {
    return $PriceComboDealCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PriceComboDealCopyWith<$Res>
    implements $PriceComboDealCopyWith<$Res> {
  factory _$$_PriceComboDealCopyWith(
          _$_PriceComboDeal value, $Res Function(_$_PriceComboDeal) then) =
      __$$_PriceComboDealCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEligible,
      FlexibleGroup flexibleGroup,
      SalesDealNumber salesDeal,
      PriceComboDealCategory category});

  @override
  $PriceComboDealCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$_PriceComboDealCopyWithImpl<$Res>
    extends _$PriceComboDealCopyWithImpl<$Res, _$_PriceComboDeal>
    implements _$$_PriceComboDealCopyWith<$Res> {
  __$$_PriceComboDealCopyWithImpl(
      _$_PriceComboDeal _value, $Res Function(_$_PriceComboDeal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEligible = null,
    Object? flexibleGroup = null,
    Object? salesDeal = null,
    Object? category = null,
  }) {
    return _then(_$_PriceComboDeal(
      isEligible: null == isEligible
          ? _value.isEligible
          : isEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      flexibleGroup: null == flexibleGroup
          ? _value.flexibleGroup
          : flexibleGroup // ignore: cast_nullable_to_non_nullable
              as FlexibleGroup,
      salesDeal: null == salesDeal
          ? _value.salesDeal
          : salesDeal // ignore: cast_nullable_to_non_nullable
              as SalesDealNumber,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PriceComboDealCategory,
    ));
  }
}

/// @nodoc

class _$_PriceComboDeal extends _PriceComboDeal {
  const _$_PriceComboDeal(
      {required this.isEligible,
      required this.flexibleGroup,
      required this.salesDeal,
      required this.category})
      : super._();

  @override
  final bool isEligible;
  @override
  final FlexibleGroup flexibleGroup;
  @override
  final SalesDealNumber salesDeal;
  @override
  final PriceComboDealCategory category;

  @override
  String toString() {
    return 'PriceComboDeal(isEligible: $isEligible, flexibleGroup: $flexibleGroup, salesDeal: $salesDeal, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceComboDeal &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.flexibleGroup, flexibleGroup) ||
                other.flexibleGroup == flexibleGroup) &&
            (identical(other.salesDeal, salesDeal) ||
                other.salesDeal == salesDeal) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isEligible, flexibleGroup, salesDeal, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceComboDealCopyWith<_$_PriceComboDeal> get copyWith =>
      __$$_PriceComboDealCopyWithImpl<_$_PriceComboDeal>(this, _$identity);
}

abstract class _PriceComboDeal extends PriceComboDeal {
  const factory _PriceComboDeal(
      {required final bool isEligible,
      required final FlexibleGroup flexibleGroup,
      required final SalesDealNumber salesDeal,
      required final PriceComboDealCategory category}) = _$_PriceComboDeal;
  const _PriceComboDeal._() : super._();

  @override
  bool get isEligible;
  @override
  FlexibleGroup get flexibleGroup;
  @override
  SalesDealNumber get salesDeal;
  @override
  PriceComboDealCategory get category;
  @override
  @JsonKey(ignore: true)
  _$$_PriceComboDealCopyWith<_$_PriceComboDeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PriceComboDealCategory {
  ComboDealType get type => throw _privateConstructorUsedError;
  List<MaterialNumber> get comboMaterialNumbers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceComboDealCategoryCopyWith<PriceComboDealCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComboDealCategoryCopyWith<$Res> {
  factory $PriceComboDealCategoryCopyWith(PriceComboDealCategory value,
          $Res Function(PriceComboDealCategory) then) =
      _$PriceComboDealCategoryCopyWithImpl<$Res, PriceComboDealCategory>;
  @useResult
  $Res call({ComboDealType type, List<MaterialNumber> comboMaterialNumbers});
}

/// @nodoc
class _$PriceComboDealCategoryCopyWithImpl<$Res,
        $Val extends PriceComboDealCategory>
    implements $PriceComboDealCategoryCopyWith<$Res> {
  _$PriceComboDealCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? comboMaterialNumbers = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ComboDealType,
      comboMaterialNumbers: null == comboMaterialNumbers
          ? _value.comboMaterialNumbers
          : comboMaterialNumbers // ignore: cast_nullable_to_non_nullable
              as List<MaterialNumber>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceComboDealCategoryCopyWith<$Res>
    implements $PriceComboDealCategoryCopyWith<$Res> {
  factory _$$_PriceComboDealCategoryCopyWith(_$_PriceComboDealCategory value,
          $Res Function(_$_PriceComboDealCategory) then) =
      __$$_PriceComboDealCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ComboDealType type, List<MaterialNumber> comboMaterialNumbers});
}

/// @nodoc
class __$$_PriceComboDealCategoryCopyWithImpl<$Res>
    extends _$PriceComboDealCategoryCopyWithImpl<$Res,
        _$_PriceComboDealCategory>
    implements _$$_PriceComboDealCategoryCopyWith<$Res> {
  __$$_PriceComboDealCategoryCopyWithImpl(_$_PriceComboDealCategory _value,
      $Res Function(_$_PriceComboDealCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? comboMaterialNumbers = null,
  }) {
    return _then(_$_PriceComboDealCategory(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ComboDealType,
      comboMaterialNumbers: null == comboMaterialNumbers
          ? _value._comboMaterialNumbers
          : comboMaterialNumbers // ignore: cast_nullable_to_non_nullable
              as List<MaterialNumber>,
    ));
  }
}

/// @nodoc

class _$_PriceComboDealCategory extends _PriceComboDealCategory {
  const _$_PriceComboDealCategory(
      {required this.type,
      required final List<MaterialNumber> comboMaterialNumbers})
      : _comboMaterialNumbers = comboMaterialNumbers,
        super._();

  @override
  final ComboDealType type;
  final List<MaterialNumber> _comboMaterialNumbers;
  @override
  List<MaterialNumber> get comboMaterialNumbers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comboMaterialNumbers);
  }

  @override
  String toString() {
    return 'PriceComboDealCategory(type: $type, comboMaterialNumbers: $comboMaterialNumbers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceComboDealCategory &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._comboMaterialNumbers, _comboMaterialNumbers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type,
      const DeepCollectionEquality().hash(_comboMaterialNumbers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceComboDealCategoryCopyWith<_$_PriceComboDealCategory> get copyWith =>
      __$$_PriceComboDealCategoryCopyWithImpl<_$_PriceComboDealCategory>(
          this, _$identity);
}

abstract class _PriceComboDealCategory extends PriceComboDealCategory {
  const factory _PriceComboDealCategory(
          {required final ComboDealType type,
          required final List<MaterialNumber> comboMaterialNumbers}) =
      _$_PriceComboDealCategory;
  const _PriceComboDealCategory._() : super._();

  @override
  ComboDealType get type;
  @override
  List<MaterialNumber> get comboMaterialNumbers;
  @override
  @JsonKey(ignore: true)
  _$$_PriceComboDealCategoryCopyWith<_$_PriceComboDealCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
