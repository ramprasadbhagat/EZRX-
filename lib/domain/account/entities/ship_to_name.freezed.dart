// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ship_to_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShipToName {
  String get name1 => throw _privateConstructorUsedError;
  String get name2 => throw _privateConstructorUsedError;
  String get name3 => throw _privateConstructorUsedError;
  String get name4 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShipToNameCopyWith<ShipToName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipToNameCopyWith<$Res> {
  factory $ShipToNameCopyWith(
          ShipToName value, $Res Function(ShipToName) then) =
      _$ShipToNameCopyWithImpl<$Res>;
  $Res call({String name1, String name2, String name3, String name4});
}

/// @nodoc
class _$ShipToNameCopyWithImpl<$Res> implements $ShipToNameCopyWith<$Res> {
  _$ShipToNameCopyWithImpl(this._value, this._then);

  final ShipToName _value;
  // ignore: unused_field
  final $Res Function(ShipToName) _then;

  @override
  $Res call({
    Object? name1 = freezed,
    Object? name2 = freezed,
    Object? name3 = freezed,
    Object? name4 = freezed,
  }) {
    return _then(_value.copyWith(
      name1: name1 == freezed
          ? _value.name1
          : name1 // ignore: cast_nullable_to_non_nullable
              as String,
      name2: name2 == freezed
          ? _value.name2
          : name2 // ignore: cast_nullable_to_non_nullable
              as String,
      name3: name3 == freezed
          ? _value.name3
          : name3 // ignore: cast_nullable_to_non_nullable
              as String,
      name4: name4 == freezed
          ? _value.name4
          : name4 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ShipToNameCopyWith<$Res>
    implements $ShipToNameCopyWith<$Res> {
  factory _$$_ShipToNameCopyWith(
          _$_ShipToName value, $Res Function(_$_ShipToName) then) =
      __$$_ShipToNameCopyWithImpl<$Res>;
  @override
  $Res call({String name1, String name2, String name3, String name4});
}

/// @nodoc
class __$$_ShipToNameCopyWithImpl<$Res> extends _$ShipToNameCopyWithImpl<$Res>
    implements _$$_ShipToNameCopyWith<$Res> {
  __$$_ShipToNameCopyWithImpl(
      _$_ShipToName _value, $Res Function(_$_ShipToName) _then)
      : super(_value, (v) => _then(v as _$_ShipToName));

  @override
  _$_ShipToName get _value => super._value as _$_ShipToName;

  @override
  $Res call({
    Object? name1 = freezed,
    Object? name2 = freezed,
    Object? name3 = freezed,
    Object? name4 = freezed,
  }) {
    return _then(_$_ShipToName(
      name1: name1 == freezed
          ? _value.name1
          : name1 // ignore: cast_nullable_to_non_nullable
              as String,
      name2: name2 == freezed
          ? _value.name2
          : name2 // ignore: cast_nullable_to_non_nullable
              as String,
      name3: name3 == freezed
          ? _value.name3
          : name3 // ignore: cast_nullable_to_non_nullable
              as String,
      name4: name4 == freezed
          ? _value.name4
          : name4 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ShipToName extends _ShipToName {
  const _$_ShipToName(
      {required this.name1,
      required this.name2,
      required this.name3,
      required this.name4})
      : super._();

  @override
  final String name1;
  @override
  final String name2;
  @override
  final String name3;
  @override
  final String name4;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShipToName &&
            const DeepCollectionEquality().equals(other.name1, name1) &&
            const DeepCollectionEquality().equals(other.name2, name2) &&
            const DeepCollectionEquality().equals(other.name3, name3) &&
            const DeepCollectionEquality().equals(other.name4, name4));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name1),
      const DeepCollectionEquality().hash(name2),
      const DeepCollectionEquality().hash(name3),
      const DeepCollectionEquality().hash(name4));

  @JsonKey(ignore: true)
  @override
  _$$_ShipToNameCopyWith<_$_ShipToName> get copyWith =>
      __$$_ShipToNameCopyWithImpl<_$_ShipToName>(this, _$identity);
}

abstract class _ShipToName extends ShipToName {
  const factory _ShipToName(
      {required final String name1,
      required final String name2,
      required final String name3,
      required final String name4}) = _$_ShipToName;
  const _ShipToName._() : super._();

  @override
  String get name1;
  @override
  String get name2;
  @override
  String get name3;
  @override
  String get name4;
  @override
  @JsonKey(ignore: true)
  _$$_ShipToNameCopyWith<_$_ShipToName> get copyWith =>
      throw _privateConstructorUsedError;
}
