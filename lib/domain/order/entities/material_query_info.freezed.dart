// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_query_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialQueryInfo {
  MaterialNumber get value => throw _privateConstructorUsedError;
  MaterialGroup get materialGroup2 => throw _privateConstructorUsedError;
  MaterialGroup get materialGroup4 => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get principalName => throw _privateConstructorUsedError;
  MaterialQty get qty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialQueryInfoCopyWith<MaterialQueryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialQueryInfoCopyWith<$Res> {
  factory $MaterialQueryInfoCopyWith(
          MaterialQueryInfo value, $Res Function(MaterialQueryInfo) then) =
      _$MaterialQueryInfoCopyWithImpl<$Res, MaterialQueryInfo>;
  @useResult
  $Res call(
      {MaterialNumber value,
      MaterialGroup materialGroup2,
      MaterialGroup materialGroup4,
      String description,
      String principalName,
      MaterialQty qty});
}

/// @nodoc
class _$MaterialQueryInfoCopyWithImpl<$Res, $Val extends MaterialQueryInfo>
    implements $MaterialQueryInfoCopyWith<$Res> {
  _$MaterialQueryInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? materialGroup2 = null,
    Object? materialGroup4 = null,
    Object? description = null,
    Object? principalName = null,
    Object? qty = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialGroup2: null == materialGroup2
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialGroup4: null == materialGroup4
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as MaterialQty,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialQueryInfoCopyWith<$Res>
    implements $MaterialQueryInfoCopyWith<$Res> {
  factory _$$_MaterialQueryInfoCopyWith(_$_MaterialQueryInfo value,
          $Res Function(_$_MaterialQueryInfo) then) =
      __$$_MaterialQueryInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber value,
      MaterialGroup materialGroup2,
      MaterialGroup materialGroup4,
      String description,
      String principalName,
      MaterialQty qty});
}

/// @nodoc
class __$$_MaterialQueryInfoCopyWithImpl<$Res>
    extends _$MaterialQueryInfoCopyWithImpl<$Res, _$_MaterialQueryInfo>
    implements _$$_MaterialQueryInfoCopyWith<$Res> {
  __$$_MaterialQueryInfoCopyWithImpl(
      _$_MaterialQueryInfo _value, $Res Function(_$_MaterialQueryInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? materialGroup2 = null,
    Object? materialGroup4 = null,
    Object? description = null,
    Object? principalName = null,
    Object? qty = null,
  }) {
    return _then(_$_MaterialQueryInfo(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialGroup2: null == materialGroup2
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialGroup4: null == materialGroup4
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as MaterialQty,
    ));
  }
}

/// @nodoc

class _$_MaterialQueryInfo extends _MaterialQueryInfo {
  const _$_MaterialQueryInfo(
      {required this.value,
      required this.materialGroup2,
      required this.materialGroup4,
      required this.description,
      required this.principalName,
      required this.qty})
      : super._();

  @override
  final MaterialNumber value;
  @override
  final MaterialGroup materialGroup2;
  @override
  final MaterialGroup materialGroup4;
  @override
  final String description;
  @override
  final String principalName;
  @override
  final MaterialQty qty;

  @override
  String toString() {
    return 'MaterialQueryInfo(value: $value, materialGroup2: $materialGroup2, materialGroup4: $materialGroup4, description: $description, principalName: $principalName, qty: $qty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialQueryInfo &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.materialGroup2, materialGroup2) ||
                other.materialGroup2 == materialGroup2) &&
            (identical(other.materialGroup4, materialGroup4) ||
                other.materialGroup4 == materialGroup4) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, materialGroup2,
      materialGroup4, description, principalName, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialQueryInfoCopyWith<_$_MaterialQueryInfo> get copyWith =>
      __$$_MaterialQueryInfoCopyWithImpl<_$_MaterialQueryInfo>(
          this, _$identity);
}

abstract class _MaterialQueryInfo extends MaterialQueryInfo {
  const factory _MaterialQueryInfo(
      {required final MaterialNumber value,
      required final MaterialGroup materialGroup2,
      required final MaterialGroup materialGroup4,
      required final String description,
      required final String principalName,
      required final MaterialQty qty}) = _$_MaterialQueryInfo;
  const _MaterialQueryInfo._() : super._();

  @override
  MaterialNumber get value;
  @override
  MaterialGroup get materialGroup2;
  @override
  MaterialGroup get materialGroup4;
  @override
  String get description;
  @override
  String get principalName;
  @override
  MaterialQty get qty;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialQueryInfoCopyWith<_$_MaterialQueryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
