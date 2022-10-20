// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'valid_customer_material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValidCustomerMaterial {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValidCustomerMaterialCopyWith<ValidCustomerMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidCustomerMaterialCopyWith<$Res> {
  factory $ValidCustomerMaterialCopyWith(ValidCustomerMaterial value,
          $Res Function(ValidCustomerMaterial) then) =
      _$ValidCustomerMaterialCopyWithImpl<$Res>;
  $Res call({MaterialNumber materialNumber});
}

/// @nodoc
class _$ValidCustomerMaterialCopyWithImpl<$Res>
    implements $ValidCustomerMaterialCopyWith<$Res> {
  _$ValidCustomerMaterialCopyWithImpl(this._value, this._then);

  final ValidCustomerMaterial _value;
  // ignore: unused_field
  final $Res Function(ValidCustomerMaterial) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
  }) {
    return _then(_value.copyWith(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc
abstract class _$$_ValidCustomerMaterialCopyWith<$Res>
    implements $ValidCustomerMaterialCopyWith<$Res> {
  factory _$$_ValidCustomerMaterialCopyWith(_$_ValidCustomerMaterial value,
          $Res Function(_$_ValidCustomerMaterial) then) =
      __$$_ValidCustomerMaterialCopyWithImpl<$Res>;
  @override
  $Res call({MaterialNumber materialNumber});
}

/// @nodoc
class __$$_ValidCustomerMaterialCopyWithImpl<$Res>
    extends _$ValidCustomerMaterialCopyWithImpl<$Res>
    implements _$$_ValidCustomerMaterialCopyWith<$Res> {
  __$$_ValidCustomerMaterialCopyWithImpl(_$_ValidCustomerMaterial _value,
      $Res Function(_$_ValidCustomerMaterial) _then)
      : super(_value, (v) => _then(v as _$_ValidCustomerMaterial));

  @override
  _$_ValidCustomerMaterial get _value =>
      super._value as _$_ValidCustomerMaterial;

  @override
  $Res call({
    Object? materialNumber = freezed,
  }) {
    return _then(_$_ValidCustomerMaterial(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$_ValidCustomerMaterial extends _ValidCustomerMaterial {
  const _$_ValidCustomerMaterial({required this.materialNumber}) : super._();

  @override
  final MaterialNumber materialNumber;

  @override
  String toString() {
    return 'ValidCustomerMaterial(materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidCustomerMaterial &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(materialNumber));

  @JsonKey(ignore: true)
  @override
  _$$_ValidCustomerMaterialCopyWith<_$_ValidCustomerMaterial> get copyWith =>
      __$$_ValidCustomerMaterialCopyWithImpl<_$_ValidCustomerMaterial>(
          this, _$identity);
}

abstract class _ValidCustomerMaterial extends ValidCustomerMaterial {
  const factory _ValidCustomerMaterial(
          {required final MaterialNumber materialNumber}) =
      _$_ValidCustomerMaterial;
  const _ValidCustomerMaterial._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  @JsonKey(ignore: true)
  _$$_ValidCustomerMaterialCopyWith<_$_ValidCustomerMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}
