// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_org_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesOrgId {
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrgIdCopyWith<SalesOrgId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrgIdCopyWith<$Res> {
  factory $SalesOrgIdCopyWith(
          SalesOrgId value, $Res Function(SalesOrgId) then) =
      _$SalesOrgIdCopyWithImpl<$Res, SalesOrgId>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$SalesOrgIdCopyWithImpl<$Res, $Val extends SalesOrgId>
    implements $SalesOrgIdCopyWith<$Res> {
  _$SalesOrgIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesOrgIdCopyWith<$Res>
    implements $SalesOrgIdCopyWith<$Res> {
  factory _$$_SalesOrgIdCopyWith(
          _$_SalesOrgId value, $Res Function(_$_SalesOrgId) then) =
      __$$_SalesOrgIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_SalesOrgIdCopyWithImpl<$Res>
    extends _$SalesOrgIdCopyWithImpl<$Res, _$_SalesOrgId>
    implements _$$_SalesOrgIdCopyWith<$Res> {
  __$$_SalesOrgIdCopyWithImpl(
      _$_SalesOrgId _value, $Res Function(_$_SalesOrgId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_SalesOrgId(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SalesOrgId extends _SalesOrgId {
  const _$_SalesOrgId({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'SalesOrgId(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrgId &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesOrgIdCopyWith<_$_SalesOrgId> get copyWith =>
      __$$_SalesOrgIdCopyWithImpl<_$_SalesOrgId>(this, _$identity);
}

abstract class _SalesOrgId extends SalesOrgId {
  const factory _SalesOrgId({required final int id}) = _$_SalesOrgId;
  const _SalesOrgId._() : super._();

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrgIdCopyWith<_$_SalesOrgId> get copyWith =>
      throw _privateConstructorUsedError;
}
