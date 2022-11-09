// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_template_material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderTemplateMaterial {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get principalName => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  bool get hidePrice => throw _privateConstructorUsedError;
  MaterialTaxClassification get taxClassification =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderTemplateMaterialCopyWith<OrderTemplateMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTemplateMaterialCopyWith<$Res> {
  factory $OrderTemplateMaterialCopyWith(OrderTemplateMaterial value,
          $Res Function(OrderTemplateMaterial) then) =
      _$OrderTemplateMaterialCopyWithImpl<$Res>;
  $Res call(
      {MaterialNumber materialNumber,
      int qty,
      String type,
      String principalName,
      String materialDescription,
      bool hidePrice,
      MaterialTaxClassification taxClassification});
}

/// @nodoc
class _$OrderTemplateMaterialCopyWithImpl<$Res>
    implements $OrderTemplateMaterialCopyWith<$Res> {
  _$OrderTemplateMaterialCopyWithImpl(this._value, this._then);

  final OrderTemplateMaterial _value;
  // ignore: unused_field
  final $Res Function(OrderTemplateMaterial) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? qty = freezed,
    Object? type = freezed,
    Object? principalName = freezed,
    Object? materialDescription = freezed,
    Object? hidePrice = freezed,
    Object? taxClassification = freezed,
  }) {
    return _then(_value.copyWith(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: principalName == freezed
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: hidePrice == freezed
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      taxClassification: taxClassification == freezed
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as MaterialTaxClassification,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderTemplateMaterialCopyWith<$Res>
    implements $OrderTemplateMaterialCopyWith<$Res> {
  factory _$$_OrderTemplateMaterialCopyWith(_$_OrderTemplateMaterial value,
          $Res Function(_$_OrderTemplateMaterial) then) =
      __$$_OrderTemplateMaterialCopyWithImpl<$Res>;
  @override
  $Res call(
      {MaterialNumber materialNumber,
      int qty,
      String type,
      String principalName,
      String materialDescription,
      bool hidePrice,
      MaterialTaxClassification taxClassification});
}

/// @nodoc
class __$$_OrderTemplateMaterialCopyWithImpl<$Res>
    extends _$OrderTemplateMaterialCopyWithImpl<$Res>
    implements _$$_OrderTemplateMaterialCopyWith<$Res> {
  __$$_OrderTemplateMaterialCopyWithImpl(_$_OrderTemplateMaterial _value,
      $Res Function(_$_OrderTemplateMaterial) _then)
      : super(_value, (v) => _then(v as _$_OrderTemplateMaterial));

  @override
  _$_OrderTemplateMaterial get _value =>
      super._value as _$_OrderTemplateMaterial;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? qty = freezed,
    Object? type = freezed,
    Object? principalName = freezed,
    Object? materialDescription = freezed,
    Object? hidePrice = freezed,
    Object? taxClassification = freezed,
  }) {
    return _then(_$_OrderTemplateMaterial(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: principalName == freezed
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: hidePrice == freezed
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      taxClassification: taxClassification == freezed
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as MaterialTaxClassification,
    ));
  }
}

/// @nodoc

class _$_OrderTemplateMaterial extends _OrderTemplateMaterial {
  const _$_OrderTemplateMaterial(
      {required this.materialNumber,
      required this.qty,
      required this.type,
      required this.principalName,
      required this.materialDescription,
      required this.hidePrice,
      required this.taxClassification})
      : super._();

  @override
  final MaterialNumber materialNumber;
  @override
  final int qty;
  @override
  final String type;
  @override
  final String principalName;
  @override
  final String materialDescription;
  @override
  final bool hidePrice;
  @override
  final MaterialTaxClassification taxClassification;

  @override
  String toString() {
    return 'OrderTemplateMaterial(materialNumber: $materialNumber, qty: $qty, type: $type, principalName: $principalName, materialDescription: $materialDescription, hidePrice: $hidePrice, taxClassification: $taxClassification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTemplateMaterial &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.principalName, principalName) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription) &&
            const DeepCollectionEquality().equals(other.hidePrice, hidePrice) &&
            const DeepCollectionEquality()
                .equals(other.taxClassification, taxClassification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(principalName),
      const DeepCollectionEquality().hash(materialDescription),
      const DeepCollectionEquality().hash(hidePrice),
      const DeepCollectionEquality().hash(taxClassification));

  @JsonKey(ignore: true)
  @override
  _$$_OrderTemplateMaterialCopyWith<_$_OrderTemplateMaterial> get copyWith =>
      __$$_OrderTemplateMaterialCopyWithImpl<_$_OrderTemplateMaterial>(
          this, _$identity);
}

abstract class _OrderTemplateMaterial extends OrderTemplateMaterial {
  const factory _OrderTemplateMaterial(
          {required final MaterialNumber materialNumber,
          required final int qty,
          required final String type,
          required final String principalName,
          required final String materialDescription,
          required final bool hidePrice,
          required final MaterialTaxClassification taxClassification}) =
      _$_OrderTemplateMaterial;
  const _OrderTemplateMaterial._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  int get qty;
  @override
  String get type;
  @override
  String get principalName;
  @override
  String get materialDescription;
  @override
  bool get hidePrice;
  @override
  MaterialTaxClassification get taxClassification;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTemplateMaterialCopyWith<_$_OrderTemplateMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}
