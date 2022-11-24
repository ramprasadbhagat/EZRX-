// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialItem {
  int get qty => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  bool get hidePrice => throw _privateConstructorUsedError;
  String get batchNumber => throw _privateConstructorUsedError;
  bool get zdp8Override => throw _privateConstructorUsedError;
  List<MaterialItemBonus> get bonuses => throw _privateConstructorUsedError;
  MaterialGroup get materialGroup2 => throw _privateConstructorUsedError;
  MaterialGroup get materialGroup4 => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  double get overridenPrice => throw _privateConstructorUsedError;
  String get unitOfMeasurement => throw _privateConstructorUsedError;
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  MaterialItemOverride get overrideInfo => throw _privateConstructorUsedError;
  String get remarks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialItemCopyWith<MaterialItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialItemCopyWith<$Res> {
  factory $MaterialItemCopyWith(
          MaterialItem value, $Res Function(MaterialItem) then) =
      _$MaterialItemCopyWithImpl<$Res, MaterialItem>;
  @useResult
  $Res call(
      {int qty,
      String type,
      String comment,
      bool hidePrice,
      String batchNumber,
      bool zdp8Override,
      List<MaterialItemBonus> bonuses,
      MaterialGroup materialGroup2,
      MaterialGroup materialGroup4,
      MaterialNumber materialNumber,
      String defaultMaterialDescription,
      double overridenPrice,
      String unitOfMeasurement,
      String itemRegistrationNumber,
      String materialDescription,
      MaterialItemOverride overrideInfo,
      String remarks});

  $MaterialItemOverrideCopyWith<$Res> get overrideInfo;
}

/// @nodoc
class _$MaterialItemCopyWithImpl<$Res, $Val extends MaterialItem>
    implements $MaterialItemCopyWith<$Res> {
  _$MaterialItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
    Object? type = null,
    Object? comment = null,
    Object? hidePrice = null,
    Object? batchNumber = null,
    Object? zdp8Override = null,
    Object? bonuses = null,
    Object? materialGroup2 = null,
    Object? materialGroup4 = null,
    Object? materialNumber = null,
    Object? defaultMaterialDescription = null,
    Object? overridenPrice = null,
    Object? unitOfMeasurement = null,
    Object? itemRegistrationNumber = null,
    Object? materialDescription = null,
    Object? overrideInfo = null,
    Object? remarks = null,
  }) {
    return _then(_value.copyWith(
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      batchNumber: null == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      zdp8Override: null == zdp8Override
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as bool,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonus>,
      materialGroup2: null == materialGroup2
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialGroup4: null == materialGroup4
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      overridenPrice: null == overridenPrice
          ? _value.overridenPrice
          : overridenPrice // ignore: cast_nullable_to_non_nullable
              as double,
      unitOfMeasurement: null == unitOfMeasurement
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      overrideInfo: null == overrideInfo
          ? _value.overrideInfo
          : overrideInfo // ignore: cast_nullable_to_non_nullable
              as MaterialItemOverride,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialItemOverrideCopyWith<$Res> get overrideInfo {
    return $MaterialItemOverrideCopyWith<$Res>(_value.overrideInfo, (value) {
      return _then(_value.copyWith(overrideInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MaterialItemCopyWith<$Res>
    implements $MaterialItemCopyWith<$Res> {
  factory _$$_MaterialItemCopyWith(
          _$_MaterialItem value, $Res Function(_$_MaterialItem) then) =
      __$$_MaterialItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int qty,
      String type,
      String comment,
      bool hidePrice,
      String batchNumber,
      bool zdp8Override,
      List<MaterialItemBonus> bonuses,
      MaterialGroup materialGroup2,
      MaterialGroup materialGroup4,
      MaterialNumber materialNumber,
      String defaultMaterialDescription,
      double overridenPrice,
      String unitOfMeasurement,
      String itemRegistrationNumber,
      String materialDescription,
      MaterialItemOverride overrideInfo,
      String remarks});

  @override
  $MaterialItemOverrideCopyWith<$Res> get overrideInfo;
}

/// @nodoc
class __$$_MaterialItemCopyWithImpl<$Res>
    extends _$MaterialItemCopyWithImpl<$Res, _$_MaterialItem>
    implements _$$_MaterialItemCopyWith<$Res> {
  __$$_MaterialItemCopyWithImpl(
      _$_MaterialItem _value, $Res Function(_$_MaterialItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
    Object? type = null,
    Object? comment = null,
    Object? hidePrice = null,
    Object? batchNumber = null,
    Object? zdp8Override = null,
    Object? bonuses = null,
    Object? materialGroup2 = null,
    Object? materialGroup4 = null,
    Object? materialNumber = null,
    Object? defaultMaterialDescription = null,
    Object? overridenPrice = null,
    Object? unitOfMeasurement = null,
    Object? itemRegistrationNumber = null,
    Object? materialDescription = null,
    Object? overrideInfo = null,
    Object? remarks = null,
  }) {
    return _then(_$_MaterialItem(
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      batchNumber: null == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      zdp8Override: null == zdp8Override
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as bool,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonus>,
      materialGroup2: null == materialGroup2
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialGroup4: null == materialGroup4
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      overridenPrice: null == overridenPrice
          ? _value.overridenPrice
          : overridenPrice // ignore: cast_nullable_to_non_nullable
              as double,
      unitOfMeasurement: null == unitOfMeasurement
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      overrideInfo: null == overrideInfo
          ? _value.overrideInfo
          : overrideInfo // ignore: cast_nullable_to_non_nullable
              as MaterialItemOverride,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MaterialItem extends _MaterialItem {
  const _$_MaterialItem(
      {required this.qty,
      required this.type,
      required this.comment,
      required this.hidePrice,
      required this.batchNumber,
      required this.zdp8Override,
      required final List<MaterialItemBonus> bonuses,
      required this.materialGroup2,
      required this.materialGroup4,
      required this.materialNumber,
      required this.defaultMaterialDescription,
      required this.overridenPrice,
      required this.unitOfMeasurement,
      required this.itemRegistrationNumber,
      required this.materialDescription,
      required this.overrideInfo,
      required this.remarks})
      : _bonuses = bonuses,
        super._();

  @override
  final int qty;
  @override
  final String type;
  @override
  final String comment;
  @override
  final bool hidePrice;
  @override
  final String batchNumber;
  @override
  final bool zdp8Override;
  final List<MaterialItemBonus> _bonuses;
  @override
  List<MaterialItemBonus> get bonuses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  @override
  final MaterialGroup materialGroup2;
  @override
  final MaterialGroup materialGroup4;
  @override
  final MaterialNumber materialNumber;
  @override
  final String defaultMaterialDescription;
  @override
  final double overridenPrice;
  @override
  final String unitOfMeasurement;
  @override
  final String itemRegistrationNumber;
  @override
  final String materialDescription;
  @override
  final MaterialItemOverride overrideInfo;
  @override
  final String remarks;

  @override
  String toString() {
    return 'MaterialItem(qty: $qty, type: $type, comment: $comment, hidePrice: $hidePrice, batchNumber: $batchNumber, zdp8Override: $zdp8Override, bonuses: $bonuses, materialGroup2: $materialGroup2, materialGroup4: $materialGroup4, materialNumber: $materialNumber, defaultMaterialDescription: $defaultMaterialDescription, overridenPrice: $overridenPrice, unitOfMeasurement: $unitOfMeasurement, itemRegistrationNumber: $itemRegistrationNumber, materialDescription: $materialDescription, overrideInfo: $overrideInfo, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialItem &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.zdp8Override, zdp8Override) ||
                other.zdp8Override == zdp8Override) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            (identical(other.materialGroup2, materialGroup2) ||
                other.materialGroup2 == materialGroup2) &&
            (identical(other.materialGroup4, materialGroup4) ||
                other.materialGroup4 == materialGroup4) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.overridenPrice, overridenPrice) ||
                other.overridenPrice == overridenPrice) &&
            (identical(other.unitOfMeasurement, unitOfMeasurement) ||
                other.unitOfMeasurement == unitOfMeasurement) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.overrideInfo, overrideInfo) ||
                other.overrideInfo == overrideInfo) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      qty,
      type,
      comment,
      hidePrice,
      batchNumber,
      zdp8Override,
      const DeepCollectionEquality().hash(_bonuses),
      materialGroup2,
      materialGroup4,
      materialNumber,
      defaultMaterialDescription,
      overridenPrice,
      unitOfMeasurement,
      itemRegistrationNumber,
      materialDescription,
      overrideInfo,
      remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialItemCopyWith<_$_MaterialItem> get copyWith =>
      __$$_MaterialItemCopyWithImpl<_$_MaterialItem>(this, _$identity);
}

abstract class _MaterialItem extends MaterialItem {
  const factory _MaterialItem(
      {required final int qty,
      required final String type,
      required final String comment,
      required final bool hidePrice,
      required final String batchNumber,
      required final bool zdp8Override,
      required final List<MaterialItemBonus> bonuses,
      required final MaterialGroup materialGroup2,
      required final MaterialGroup materialGroup4,
      required final MaterialNumber materialNumber,
      required final String defaultMaterialDescription,
      required final double overridenPrice,
      required final String unitOfMeasurement,
      required final String itemRegistrationNumber,
      required final String materialDescription,
      required final MaterialItemOverride overrideInfo,
      required final String remarks}) = _$_MaterialItem;
  const _MaterialItem._() : super._();

  @override
  int get qty;
  @override
  String get type;
  @override
  String get comment;
  @override
  bool get hidePrice;
  @override
  String get batchNumber;
  @override
  bool get zdp8Override;
  @override
  List<MaterialItemBonus> get bonuses;
  @override
  MaterialGroup get materialGroup2;
  @override
  MaterialGroup get materialGroup4;
  @override
  MaterialNumber get materialNumber;
  @override
  String get defaultMaterialDescription;
  @override
  double get overridenPrice;
  @override
  String get unitOfMeasurement;
  @override
  String get itemRegistrationNumber;
  @override
  String get materialDescription;
  @override
  MaterialItemOverride get overrideInfo;
  @override
  String get remarks;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialItemCopyWith<_$_MaterialItem> get copyWith =>
      throw _privateConstructorUsedError;
}
