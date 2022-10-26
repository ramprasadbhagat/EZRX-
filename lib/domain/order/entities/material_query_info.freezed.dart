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
  MaterialQty get qty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialQueryInfoCopyWith<MaterialQueryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialQueryInfoCopyWith<$Res> {
  factory $MaterialQueryInfoCopyWith(
          MaterialQueryInfo value, $Res Function(MaterialQueryInfo) then) =
      _$MaterialQueryInfoCopyWithImpl<$Res>;
  $Res call(
      {MaterialNumber value,
      MaterialGroup materialGroup2,
      MaterialGroup materialGroup4,
      MaterialQty qty});
}

/// @nodoc
class _$MaterialQueryInfoCopyWithImpl<$Res>
    implements $MaterialQueryInfoCopyWith<$Res> {
  _$MaterialQueryInfoCopyWithImpl(this._value, this._then);

  final MaterialQueryInfo _value;
  // ignore: unused_field
  final $Res Function(MaterialQueryInfo) _then;

  @override
  $Res call({
    Object? value = freezed,
    Object? materialGroup2 = freezed,
    Object? materialGroup4 = freezed,
    Object? qty = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialGroup2: materialGroup2 == freezed
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialGroup4: materialGroup4 == freezed
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as MaterialQty,
    ));
  }
}

/// @nodoc
abstract class _$$_MaterialQueryInfoCopyWith<$Res>
    implements $MaterialQueryInfoCopyWith<$Res> {
  factory _$$_MaterialQueryInfoCopyWith(_$_MaterialQueryInfo value,
          $Res Function(_$_MaterialQueryInfo) then) =
      __$$_MaterialQueryInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {MaterialNumber value,
      MaterialGroup materialGroup2,
      MaterialGroup materialGroup4,
      MaterialQty qty});
}

/// @nodoc
class __$$_MaterialQueryInfoCopyWithImpl<$Res>
    extends _$MaterialQueryInfoCopyWithImpl<$Res>
    implements _$$_MaterialQueryInfoCopyWith<$Res> {
  __$$_MaterialQueryInfoCopyWithImpl(
      _$_MaterialQueryInfo _value, $Res Function(_$_MaterialQueryInfo) _then)
      : super(_value, (v) => _then(v as _$_MaterialQueryInfo));

  @override
  _$_MaterialQueryInfo get _value => super._value as _$_MaterialQueryInfo;

  @override
  $Res call({
    Object? value = freezed,
    Object? materialGroup2 = freezed,
    Object? materialGroup4 = freezed,
    Object? qty = freezed,
  }) {
    return _then(_$_MaterialQueryInfo(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      materialGroup2: materialGroup2 == freezed
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialGroup4: materialGroup4 == freezed
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      qty: qty == freezed
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
      required this.qty})
      : super._();

  @override
  final MaterialNumber value;
  @override
  final MaterialGroup materialGroup2;
  @override
  final MaterialGroup materialGroup4;
  @override
  final MaterialQty qty;

  @override
  String toString() {
    return 'MaterialQueryInfo(value: $value, materialGroup2: $materialGroup2, materialGroup4: $materialGroup4, qty: $qty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialQueryInfo &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.materialGroup2, materialGroup2) &&
            const DeepCollectionEquality()
                .equals(other.materialGroup4, materialGroup4) &&
            const DeepCollectionEquality().equals(other.qty, qty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(materialGroup2),
      const DeepCollectionEquality().hash(materialGroup4),
      const DeepCollectionEquality().hash(qty));

  @JsonKey(ignore: true)
  @override
  _$$_MaterialQueryInfoCopyWith<_$_MaterialQueryInfo> get copyWith =>
      __$$_MaterialQueryInfoCopyWithImpl<_$_MaterialQueryInfo>(
          this, _$identity);
}

abstract class _MaterialQueryInfo extends MaterialQueryInfo {
  const factory _MaterialQueryInfo(
      {required final MaterialNumber value,
      required final MaterialGroup materialGroup2,
      required final MaterialGroup materialGroup4,
      required final MaterialQty qty}) = _$_MaterialQueryInfo;
  const _MaterialQueryInfo._() : super._();

  @override
  MaterialNumber get value;
  @override
  MaterialGroup get materialGroup2;
  @override
  MaterialGroup get materialGroup4;
  @override
  MaterialQty get qty;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialQueryInfoCopyWith<_$_MaterialQueryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
