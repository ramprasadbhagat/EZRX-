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
  PrincipalCode get principalCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrincipalDataCopyWith<PrincipalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrincipalDataCopyWith<$Res> {
  factory $PrincipalDataCopyWith(
          PrincipalData value, $Res Function(PrincipalData) then) =
      _$PrincipalDataCopyWithImpl<$Res, PrincipalData>;
  @useResult
  $Res call({String principalName, PrincipalCode principalCode});
}

/// @nodoc
class _$PrincipalDataCopyWithImpl<$Res, $Val extends PrincipalData>
    implements $PrincipalDataCopyWith<$Res> {
  _$PrincipalDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principalName = null,
    Object? principalCode = null,
  }) {
    return _then(_value.copyWith(
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as PrincipalCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrincipalDataCopyWith<$Res>
    implements $PrincipalDataCopyWith<$Res> {
  factory _$$_PrincipalDataCopyWith(
          _$_PrincipalData value, $Res Function(_$_PrincipalData) then) =
      __$$_PrincipalDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String principalName, PrincipalCode principalCode});
}

/// @nodoc
class __$$_PrincipalDataCopyWithImpl<$Res>
    extends _$PrincipalDataCopyWithImpl<$Res, _$_PrincipalData>
    implements _$$_PrincipalDataCopyWith<$Res> {
  __$$_PrincipalDataCopyWithImpl(
      _$_PrincipalData _value, $Res Function(_$_PrincipalData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principalName = null,
    Object? principalCode = null,
  }) {
    return _then(_$_PrincipalData(
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as PrincipalCode,
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
  final PrincipalCode principalCode;

  @override
  String toString() {
    return 'PrincipalData(principalName: $principalName, principalCode: $principalCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrincipalData &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, principalName, principalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrincipalDataCopyWith<_$_PrincipalData> get copyWith =>
      __$$_PrincipalDataCopyWithImpl<_$_PrincipalData>(this, _$identity);
}

abstract class _PrincipalData extends PrincipalData {
  const factory _PrincipalData(
      {required final String principalName,
      required final PrincipalCode principalCode}) = _$_PrincipalData;
  const _PrincipalData._() : super._();

  @override
  String get principalName;
  @override
  PrincipalCode get principalCode;
  @override
  @JsonKey(ignore: true)
  _$$_PrincipalDataCopyWith<_$_PrincipalData> get copyWith =>
      throw _privateConstructorUsedError;
}
