// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bonus_sample_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BonusSampleItem {
  MaterialQty get qty => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  StringValue get itemId => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  PrincipalData get principalData => throw _privateConstructorUsedError;
  MaterialInfoType get type => throw _privateConstructorUsedError;
  MaterialInStock get inStock => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BonusSampleItemCopyWith<BonusSampleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusSampleItemCopyWith<$Res> {
  factory $BonusSampleItemCopyWith(
          BonusSampleItem value, $Res Function(BonusSampleItem) then) =
      _$BonusSampleItemCopyWithImpl<$Res, BonusSampleItem>;
  @useResult
  $Res call(
      {MaterialQty qty,
      MaterialNumber materialNumber,
      StringValue itemId,
      String materialDescription,
      PrincipalData principalData,
      MaterialInfoType type,
      MaterialInStock inStock});

  $PrincipalDataCopyWith<$Res> get principalData;
}

/// @nodoc
class _$BonusSampleItemCopyWithImpl<$Res, $Val extends BonusSampleItem>
    implements $BonusSampleItemCopyWith<$Res> {
  _$BonusSampleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
    Object? materialNumber = null,
    Object? itemId = null,
    Object? materialDescription = null,
    Object? principalData = null,
    Object? type = null,
    Object? inStock = null,
  }) {
    return _then(_value.copyWith(
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as MaterialQty,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as StringValue,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialInfoType,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as MaterialInStock,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PrincipalDataCopyWith<$Res> get principalData {
    return $PrincipalDataCopyWith<$Res>(_value.principalData, (value) {
      return _then(_value.copyWith(principalData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BonusSampleItemCopyWith<$Res>
    implements $BonusSampleItemCopyWith<$Res> {
  factory _$$_BonusSampleItemCopyWith(
          _$_BonusSampleItem value, $Res Function(_$_BonusSampleItem) then) =
      __$$_BonusSampleItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialQty qty,
      MaterialNumber materialNumber,
      StringValue itemId,
      String materialDescription,
      PrincipalData principalData,
      MaterialInfoType type,
      MaterialInStock inStock});

  @override
  $PrincipalDataCopyWith<$Res> get principalData;
}

/// @nodoc
class __$$_BonusSampleItemCopyWithImpl<$Res>
    extends _$BonusSampleItemCopyWithImpl<$Res, _$_BonusSampleItem>
    implements _$$_BonusSampleItemCopyWith<$Res> {
  __$$_BonusSampleItemCopyWithImpl(
      _$_BonusSampleItem _value, $Res Function(_$_BonusSampleItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
    Object? materialNumber = null,
    Object? itemId = null,
    Object? materialDescription = null,
    Object? principalData = null,
    Object? type = null,
    Object? inStock = null,
  }) {
    return _then(_$_BonusSampleItem(
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as MaterialQty,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as StringValue,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialInfoType,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as MaterialInStock,
    ));
  }
}

/// @nodoc

class _$_BonusSampleItem extends _BonusSampleItem {
  const _$_BonusSampleItem(
      {required this.qty,
      required this.materialNumber,
      required this.itemId,
      required this.materialDescription,
      required this.principalData,
      required this.type,
      required this.inStock})
      : super._();

  @override
  final MaterialQty qty;
  @override
  final MaterialNumber materialNumber;
  @override
  final StringValue itemId;
  @override
  final String materialDescription;
  @override
  final PrincipalData principalData;
  @override
  final MaterialInfoType type;
  @override
  final MaterialInStock inStock;

  @override
  String toString() {
    return 'BonusSampleItem(qty: $qty, materialNumber: $materialNumber, itemId: $itemId, materialDescription: $materialDescription, principalData: $principalData, type: $type, inStock: $inStock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BonusSampleItem &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.principalData, principalData) ||
                other.principalData == principalData) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.inStock, inStock) || other.inStock == inStock));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qty, materialNumber, itemId,
      materialDescription, principalData, type, inStock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BonusSampleItemCopyWith<_$_BonusSampleItem> get copyWith =>
      __$$_BonusSampleItemCopyWithImpl<_$_BonusSampleItem>(this, _$identity);
}

abstract class _BonusSampleItem extends BonusSampleItem {
  const factory _BonusSampleItem(
      {required final MaterialQty qty,
      required final MaterialNumber materialNumber,
      required final StringValue itemId,
      required final String materialDescription,
      required final PrincipalData principalData,
      required final MaterialInfoType type,
      required final MaterialInStock inStock}) = _$_BonusSampleItem;
  const _BonusSampleItem._() : super._();

  @override
  MaterialQty get qty;
  @override
  MaterialNumber get materialNumber;
  @override
  StringValue get itemId;
  @override
  String get materialDescription;
  @override
  PrincipalData get principalData;
  @override
  MaterialInfoType get type;
  @override
  MaterialInStock get inStock;
  @override
  @JsonKey(ignore: true)
  _$$_BonusSampleItemCopyWith<_$_BonusSampleItem> get copyWith =>
      throw _privateConstructorUsedError;
}
