// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_item_bonus_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialItemBonusDto _$MaterialItemBonusDtoFromJson(Map<String, dynamic> json) {
  return _MaterialItemBonusDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialItemBonusDto {
  @HiveField(51, defaultValue: '')
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @HiveField(52, defaultValue: 0)
  @JsonKey(name: 'freeQuantity', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;
  @HiveField(53, defaultValue: '')
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment => throw _privateConstructorUsedError;
  @HiveField(54, defaultValue: '')
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @HiveField(55, defaultValue: '')
  @JsonKey(name: 'expiryDate', defaultValue: '')
  String get expiryDate => throw _privateConstructorUsedError;
  @HiveField(56, defaultValue: '')
  @JsonKey(name: 'inStock', defaultValue: '')
  String get inStock => throw _privateConstructorUsedError;
  @HiveField(57, defaultValue: 0)
  @JsonKey(name: 'remainingQty', defaultValue: 0)
  int get remainingQty => throw _privateConstructorUsedError;
  @HiveField(58, defaultValue: false)
  @JsonKey(name: 'bonusOverrideFlag', defaultValue: false)
  bool get bonusOverrideFlag => throw _privateConstructorUsedError;
  @HiveField(59, defaultValue: false)
  @JsonKey(name: 'additionalBonusFlag', defaultValue: false)
  bool get additionalBonusFlag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialItemBonusDtoCopyWith<MaterialItemBonusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialItemBonusDtoCopyWith<$Res> {
  factory $MaterialItemBonusDtoCopyWith(MaterialItemBonusDto value,
          $Res Function(MaterialItemBonusDto) then) =
      _$MaterialItemBonusDtoCopyWithImpl<$Res, MaterialItemBonusDto>;
  @useResult
  $Res call(
      {@HiveField(51, defaultValue: '')
      @JsonKey(name: 'MaterialNumber', defaultValue: '')
          String materialNumber,
      @HiveField(52, defaultValue: 0)
      @JsonKey(name: 'freeQuantity', defaultValue: 0)
          int qty,
      @HiveField(53, defaultValue: '')
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @HiveField(54, defaultValue: '')
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          String materialDescription,
      @HiveField(55, defaultValue: '')
      @JsonKey(name: 'expiryDate', defaultValue: '')
          String expiryDate,
      @HiveField(56, defaultValue: '')
      @JsonKey(name: 'inStock', defaultValue: '')
          String inStock,
      @HiveField(57, defaultValue: 0)
      @JsonKey(name: 'remainingQty', defaultValue: 0)
          int remainingQty,
      @HiveField(58, defaultValue: false)
      @JsonKey(name: 'bonusOverrideFlag', defaultValue: false)
          bool bonusOverrideFlag,
      @HiveField(59, defaultValue: false)
      @JsonKey(name: 'additionalBonusFlag', defaultValue: false)
          bool additionalBonusFlag});
}

/// @nodoc
class _$MaterialItemBonusDtoCopyWithImpl<$Res,
        $Val extends MaterialItemBonusDto>
    implements $MaterialItemBonusDtoCopyWith<$Res> {
  _$MaterialItemBonusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
    Object? comment = null,
    Object? materialDescription = null,
    Object? expiryDate = null,
    Object? inStock = null,
    Object? remainingQty = null,
    Object? bonusOverrideFlag = null,
    Object? additionalBonusFlag = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as String,
      remainingQty: null == remainingQty
          ? _value.remainingQty
          : remainingQty // ignore: cast_nullable_to_non_nullable
              as int,
      bonusOverrideFlag: null == bonusOverrideFlag
          ? _value.bonusOverrideFlag
          : bonusOverrideFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      additionalBonusFlag: null == additionalBonusFlag
          ? _value.additionalBonusFlag
          : additionalBonusFlag // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialItemBonusDtoCopyWith<$Res>
    implements $MaterialItemBonusDtoCopyWith<$Res> {
  factory _$$_MaterialItemBonusDtoCopyWith(_$_MaterialItemBonusDto value,
          $Res Function(_$_MaterialItemBonusDto) then) =
      __$$_MaterialItemBonusDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(51, defaultValue: '')
      @JsonKey(name: 'MaterialNumber', defaultValue: '')
          String materialNumber,
      @HiveField(52, defaultValue: 0)
      @JsonKey(name: 'freeQuantity', defaultValue: 0)
          int qty,
      @HiveField(53, defaultValue: '')
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @HiveField(54, defaultValue: '')
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          String materialDescription,
      @HiveField(55, defaultValue: '')
      @JsonKey(name: 'expiryDate', defaultValue: '')
          String expiryDate,
      @HiveField(56, defaultValue: '')
      @JsonKey(name: 'inStock', defaultValue: '')
          String inStock,
      @HiveField(57, defaultValue: 0)
      @JsonKey(name: 'remainingQty', defaultValue: 0)
          int remainingQty,
      @HiveField(58, defaultValue: false)
      @JsonKey(name: 'bonusOverrideFlag', defaultValue: false)
          bool bonusOverrideFlag,
      @HiveField(59, defaultValue: false)
      @JsonKey(name: 'additionalBonusFlag', defaultValue: false)
          bool additionalBonusFlag});
}

/// @nodoc
class __$$_MaterialItemBonusDtoCopyWithImpl<$Res>
    extends _$MaterialItemBonusDtoCopyWithImpl<$Res, _$_MaterialItemBonusDto>
    implements _$$_MaterialItemBonusDtoCopyWith<$Res> {
  __$$_MaterialItemBonusDtoCopyWithImpl(_$_MaterialItemBonusDto _value,
      $Res Function(_$_MaterialItemBonusDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
    Object? comment = null,
    Object? materialDescription = null,
    Object? expiryDate = null,
    Object? inStock = null,
    Object? remainingQty = null,
    Object? bonusOverrideFlag = null,
    Object? additionalBonusFlag = null,
  }) {
    return _then(_$_MaterialItemBonusDto(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as String,
      remainingQty: null == remainingQty
          ? _value.remainingQty
          : remainingQty // ignore: cast_nullable_to_non_nullable
              as int,
      bonusOverrideFlag: null == bonusOverrideFlag
          ? _value.bonusOverrideFlag
          : bonusOverrideFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      additionalBonusFlag: null == additionalBonusFlag
          ? _value.additionalBonusFlag
          : additionalBonusFlag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 19, adapterName: 'MaterialItemBonusDtoAdapter')
class _$_MaterialItemBonusDto extends _MaterialItemBonusDto {
  const _$_MaterialItemBonusDto(
      {@HiveField(51, defaultValue: '')
      @JsonKey(name: 'MaterialNumber', defaultValue: '')
          required this.materialNumber,
      @HiveField(52, defaultValue: 0)
      @JsonKey(name: 'freeQuantity', defaultValue: 0)
          required this.qty,
      @HiveField(53, defaultValue: '')
      @JsonKey(name: 'comment', defaultValue: '')
          required this.comment,
      @HiveField(54, defaultValue: '')
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          required this.materialDescription,
      @HiveField(55, defaultValue: '')
      @JsonKey(name: 'expiryDate', defaultValue: '')
          required this.expiryDate,
      @HiveField(56, defaultValue: '')
      @JsonKey(name: 'inStock', defaultValue: '')
          required this.inStock,
      @HiveField(57, defaultValue: 0)
      @JsonKey(name: 'remainingQty', defaultValue: 0)
          required this.remainingQty,
      @HiveField(58, defaultValue: false)
      @JsonKey(name: 'bonusOverrideFlag', defaultValue: false)
          required this.bonusOverrideFlag,
      @HiveField(59, defaultValue: false)
      @JsonKey(name: 'additionalBonusFlag', defaultValue: false)
          required this.additionalBonusFlag})
      : super._();

  factory _$_MaterialItemBonusDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialItemBonusDtoFromJson(json);

  @override
  @HiveField(51, defaultValue: '')
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @HiveField(52, defaultValue: 0)
  @JsonKey(name: 'freeQuantity', defaultValue: 0)
  final int qty;
  @override
  @HiveField(53, defaultValue: '')
  @JsonKey(name: 'comment', defaultValue: '')
  final String comment;
  @override
  @HiveField(54, defaultValue: '')
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @HiveField(55, defaultValue: '')
  @JsonKey(name: 'expiryDate', defaultValue: '')
  final String expiryDate;
  @override
  @HiveField(56, defaultValue: '')
  @JsonKey(name: 'inStock', defaultValue: '')
  final String inStock;
  @override
  @HiveField(57, defaultValue: 0)
  @JsonKey(name: 'remainingQty', defaultValue: 0)
  final int remainingQty;
  @override
  @HiveField(58, defaultValue: false)
  @JsonKey(name: 'bonusOverrideFlag', defaultValue: false)
  final bool bonusOverrideFlag;
  @override
  @HiveField(59, defaultValue: false)
  @JsonKey(name: 'additionalBonusFlag', defaultValue: false)
  final bool additionalBonusFlag;

  @override
  String toString() {
    return 'MaterialItemBonusDto(materialNumber: $materialNumber, qty: $qty, comment: $comment, materialDescription: $materialDescription, expiryDate: $expiryDate, inStock: $inStock, remainingQty: $remainingQty, bonusOverrideFlag: $bonusOverrideFlag, additionalBonusFlag: $additionalBonusFlag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialItemBonusDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.remainingQty, remainingQty) ||
                other.remainingQty == remainingQty) &&
            (identical(other.bonusOverrideFlag, bonusOverrideFlag) ||
                other.bonusOverrideFlag == bonusOverrideFlag) &&
            (identical(other.additionalBonusFlag, additionalBonusFlag) ||
                other.additionalBonusFlag == additionalBonusFlag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialNumber,
      qty,
      comment,
      materialDescription,
      expiryDate,
      inStock,
      remainingQty,
      bonusOverrideFlag,
      additionalBonusFlag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialItemBonusDtoCopyWith<_$_MaterialItemBonusDto> get copyWith =>
      __$$_MaterialItemBonusDtoCopyWithImpl<_$_MaterialItemBonusDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialItemBonusDtoToJson(
      this,
    );
  }
}

abstract class _MaterialItemBonusDto extends MaterialItemBonusDto {
  const factory _MaterialItemBonusDto(
      {@HiveField(51, defaultValue: '')
      @JsonKey(name: 'MaterialNumber', defaultValue: '')
          required final String materialNumber,
      @HiveField(52, defaultValue: 0)
      @JsonKey(name: 'freeQuantity', defaultValue: 0)
          required final int qty,
      @HiveField(53, defaultValue: '')
      @JsonKey(name: 'comment', defaultValue: '')
          required final String comment,
      @HiveField(54, defaultValue: '')
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          required final String materialDescription,
      @HiveField(55, defaultValue: '')
      @JsonKey(name: 'expiryDate', defaultValue: '')
          required final String expiryDate,
      @HiveField(56, defaultValue: '')
      @JsonKey(name: 'inStock', defaultValue: '')
          required final String inStock,
      @HiveField(57, defaultValue: 0)
      @JsonKey(name: 'remainingQty', defaultValue: 0)
          required final int remainingQty,
      @HiveField(58, defaultValue: false)
      @JsonKey(name: 'bonusOverrideFlag', defaultValue: false)
          required final bool bonusOverrideFlag,
      @HiveField(59, defaultValue: false)
      @JsonKey(name: 'additionalBonusFlag', defaultValue: false)
          required final bool additionalBonusFlag}) = _$_MaterialItemBonusDto;
  const _MaterialItemBonusDto._() : super._();

  factory _MaterialItemBonusDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialItemBonusDto.fromJson;

  @override
  @HiveField(51, defaultValue: '')
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @HiveField(52, defaultValue: 0)
  @JsonKey(name: 'freeQuantity', defaultValue: 0)
  int get qty;
  @override
  @HiveField(53, defaultValue: '')
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment;
  @override
  @HiveField(54, defaultValue: '')
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @HiveField(55, defaultValue: '')
  @JsonKey(name: 'expiryDate', defaultValue: '')
  String get expiryDate;
  @override
  @HiveField(56, defaultValue: '')
  @JsonKey(name: 'inStock', defaultValue: '')
  String get inStock;
  @override
  @HiveField(57, defaultValue: 0)
  @JsonKey(name: 'remainingQty', defaultValue: 0)
  int get remainingQty;
  @override
  @HiveField(58, defaultValue: false)
  @JsonKey(name: 'bonusOverrideFlag', defaultValue: false)
  bool get bonusOverrideFlag;
  @override
  @HiveField(59, defaultValue: false)
  @JsonKey(name: 'additionalBonusFlag', defaultValue: false)
  bool get additionalBonusFlag;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialItemBonusDtoCopyWith<_$_MaterialItemBonusDto> get copyWith =>
      throw _privateConstructorUsedError;
}
