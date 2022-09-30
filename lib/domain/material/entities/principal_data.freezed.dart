// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'principal_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PrincipalData {
  String get principalName => throw _privateConstructorUsedError;
  String get principalCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrincipalDataCopyWith<PrincipalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrincipalDataCopyWith<$Res> {
  factory $PrincipalDataCopyWith(
          PrincipalData value, $Res Function(PrincipalData) then) =
      _$PrincipalDataCopyWithImpl<$Res>;
  $Res call({String principalName, String principalCode});
}

/// @nodoc
class _$PrincipalDataCopyWithImpl<$Res>
    implements $PrincipalDataCopyWith<$Res> {
  _$PrincipalDataCopyWithImpl(this._value, this._then);

  final PrincipalData _value;
  // ignore: unused_field
  final $Res Function(PrincipalData) _then;

  @override
  $Res call({
    Object? principalName = freezed,
    Object? principalCode = freezed,
  }) {
    return _then(_value.copyWith(
      principalName: principalName == freezed
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: principalCode == freezed
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PrincipalDataCopyWith<$Res>
    implements $PrincipalDataCopyWith<$Res> {
  factory _$$_PrincipalDataCopyWith(
          _$_PrincipalData value, $Res Function(_$_PrincipalData) then) =
      __$$_PrincipalDataCopyWithImpl<$Res>;
  @override
  $Res call({String principalName, String principalCode});
}

/// @nodoc
class __$$_PrincipalDataCopyWithImpl<$Res>
    extends _$PrincipalDataCopyWithImpl<$Res>
    implements _$$_PrincipalDataCopyWith<$Res> {
  __$$_PrincipalDataCopyWithImpl(
      _$_PrincipalData _value, $Res Function(_$_PrincipalData) _then)
      : super(_value, (v) => _then(v as _$_PrincipalData));

  @override
  _$_PrincipalData get _value => super._value as _$_PrincipalData;

  @override
  $Res call({
    Object? principalName = freezed,
    Object? principalCode = freezed,
  }) {
    return _then(_$_PrincipalData(
      principalName: principalName == freezed
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: principalCode == freezed
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PrincipalData extends _PrincipalData {
  const _$_PrincipalData(
      {required this.principalName, required this.principalCode})
      : super._();

  @override
  final String principalName;
  @override
  final String principalCode;

  @override
  String toString() {
    return 'PrincipalData(principalName: $principalName, principalCode: $principalCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrincipalData &&
            const DeepCollectionEquality()
                .equals(other.principalName, principalName) &&
            const DeepCollectionEquality()
                .equals(other.principalCode, principalCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(principalName),
      const DeepCollectionEquality().hash(principalCode));

  @JsonKey(ignore: true)
  @override
  _$$_PrincipalDataCopyWith<_$_PrincipalData> get copyWith =>
      __$$_PrincipalDataCopyWithImpl<_$_PrincipalData>(this, _$identity);
}

abstract class _PrincipalData extends PrincipalData {
  const factory _PrincipalData(
      {required final String principalName,
      required final String principalCode}) = _$_PrincipalData;
  const _PrincipalData._() : super._();

  @override
  String get principalName;
  @override
  String get principalCode;
  @override
  @JsonKey(ignore: true)
  _$$_PrincipalDataCopyWith<_$_PrincipalData> get copyWith =>
      throw _privateConstructorUsedError;
}
