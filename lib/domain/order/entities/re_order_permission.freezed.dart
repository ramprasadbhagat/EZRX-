// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 're_order_permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReOrderPermission {
  List<ValidMaterial> get validMaterials => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReOrderPermissionCopyWith<ReOrderPermission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReOrderPermissionCopyWith<$Res> {
  factory $ReOrderPermissionCopyWith(
          ReOrderPermission value, $Res Function(ReOrderPermission) then) =
      _$ReOrderPermissionCopyWithImpl<$Res, ReOrderPermission>;
  @useResult
  $Res call({List<ValidMaterial> validMaterials});
}

/// @nodoc
class _$ReOrderPermissionCopyWithImpl<$Res, $Val extends ReOrderPermission>
    implements $ReOrderPermissionCopyWith<$Res> {
  _$ReOrderPermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validMaterials = null,
  }) {
    return _then(_value.copyWith(
      validMaterials: null == validMaterials
          ? _value.validMaterials
          : validMaterials // ignore: cast_nullable_to_non_nullable
              as List<ValidMaterial>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReOrderPermissionCopyWith<$Res>
    implements $ReOrderPermissionCopyWith<$Res> {
  factory _$$_ReOrderPermissionCopyWith(_$_ReOrderPermission value,
          $Res Function(_$_ReOrderPermission) then) =
      __$$_ReOrderPermissionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ValidMaterial> validMaterials});
}

/// @nodoc
class __$$_ReOrderPermissionCopyWithImpl<$Res>
    extends _$ReOrderPermissionCopyWithImpl<$Res, _$_ReOrderPermission>
    implements _$$_ReOrderPermissionCopyWith<$Res> {
  __$$_ReOrderPermissionCopyWithImpl(
      _$_ReOrderPermission _value, $Res Function(_$_ReOrderPermission) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validMaterials = null,
  }) {
    return _then(_$_ReOrderPermission(
      validMaterials: null == validMaterials
          ? _value._validMaterials
          : validMaterials // ignore: cast_nullable_to_non_nullable
              as List<ValidMaterial>,
    ));
  }
}

/// @nodoc

class _$_ReOrderPermission implements _ReOrderPermission {
  _$_ReOrderPermission({required final List<ValidMaterial> validMaterials})
      : _validMaterials = validMaterials;

  final List<ValidMaterial> _validMaterials;
  @override
  List<ValidMaterial> get validMaterials {
    if (_validMaterials is EqualUnmodifiableListView) return _validMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validMaterials);
  }

  @override
  String toString() {
    return 'ReOrderPermission(validMaterials: $validMaterials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReOrderPermission &&
            const DeepCollectionEquality()
                .equals(other._validMaterials, _validMaterials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_validMaterials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReOrderPermissionCopyWith<_$_ReOrderPermission> get copyWith =>
      __$$_ReOrderPermissionCopyWithImpl<_$_ReOrderPermission>(
          this, _$identity);
}

abstract class _ReOrderPermission implements ReOrderPermission {
  factory _ReOrderPermission(
          {required final List<ValidMaterial> validMaterials}) =
      _$_ReOrderPermission;

  @override
  List<ValidMaterial> get validMaterials;
  @override
  @JsonKey(ignore: true)
  _$$_ReOrderPermissionCopyWith<_$_ReOrderPermission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ValidMaterial {
  bool get hidePrice => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValidMaterialCopyWith<ValidMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidMaterialCopyWith<$Res> {
  factory $ValidMaterialCopyWith(
          ValidMaterial value, $Res Function(ValidMaterial) then) =
      _$ValidMaterialCopyWithImpl<$Res, ValidMaterial>;
  @useResult
  $Res call({bool hidePrice, MaterialNumber materialNumber});
}

/// @nodoc
class _$ValidMaterialCopyWithImpl<$Res, $Val extends ValidMaterial>
    implements $ValidMaterialCopyWith<$Res> {
  _$ValidMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hidePrice = null,
    Object? materialNumber = null,
  }) {
    return _then(_value.copyWith(
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValidMaterialCopyWith<$Res>
    implements $ValidMaterialCopyWith<$Res> {
  factory _$$_ValidMaterialCopyWith(
          _$_ValidMaterial value, $Res Function(_$_ValidMaterial) then) =
      __$$_ValidMaterialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hidePrice, MaterialNumber materialNumber});
}

/// @nodoc
class __$$_ValidMaterialCopyWithImpl<$Res>
    extends _$ValidMaterialCopyWithImpl<$Res, _$_ValidMaterial>
    implements _$$_ValidMaterialCopyWith<$Res> {
  __$$_ValidMaterialCopyWithImpl(
      _$_ValidMaterial _value, $Res Function(_$_ValidMaterial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hidePrice = null,
    Object? materialNumber = null,
  }) {
    return _then(_$_ValidMaterial(
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$_ValidMaterial implements _ValidMaterial {
  _$_ValidMaterial({required this.hidePrice, required this.materialNumber});

  @override
  final bool hidePrice;
  @override
  final MaterialNumber materialNumber;

  @override
  String toString() {
    return 'ValidMaterial(hidePrice: $hidePrice, materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidMaterial &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hidePrice, materialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidMaterialCopyWith<_$_ValidMaterial> get copyWith =>
      __$$_ValidMaterialCopyWithImpl<_$_ValidMaterial>(this, _$identity);
}

abstract class _ValidMaterial implements ValidMaterial {
  factory _ValidMaterial(
      {required final bool hidePrice,
      required final MaterialNumber materialNumber}) = _$_ValidMaterial;

  @override
  bool get hidePrice;
  @override
  MaterialNumber get materialNumber;
  @override
  @JsonKey(ignore: true)
  _$$_ValidMaterialCopyWith<_$_ValidMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}
