// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_password_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordEntities {
  bool get success => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordEntitiesCopyWith<ResetPasswordEntities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordEntitiesCopyWith<$Res> {
  factory $ResetPasswordEntitiesCopyWith(ResetPasswordEntities value,
          $Res Function(ResetPasswordEntities) then) =
      _$ResetPasswordEntitiesCopyWithImpl<$Res>;
  $Res call({bool success, String status});
}

/// @nodoc
class _$ResetPasswordEntitiesCopyWithImpl<$Res>
    implements $ResetPasswordEntitiesCopyWith<$Res> {
  _$ResetPasswordEntitiesCopyWithImpl(this._value, this._then);

  final ResetPasswordEntities _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordEntities) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ResetPasswordEntitiesCopyWith<$Res>
    implements $ResetPasswordEntitiesCopyWith<$Res> {
  factory _$$_ResetPasswordEntitiesCopyWith(_$_ResetPasswordEntities value,
          $Res Function(_$_ResetPasswordEntities) then) =
      __$$_ResetPasswordEntitiesCopyWithImpl<$Res>;
  @override
  $Res call({bool success, String status});
}

/// @nodoc
class __$$_ResetPasswordEntitiesCopyWithImpl<$Res>
    extends _$ResetPasswordEntitiesCopyWithImpl<$Res>
    implements _$$_ResetPasswordEntitiesCopyWith<$Res> {
  __$$_ResetPasswordEntitiesCopyWithImpl(_$_ResetPasswordEntities _value,
      $Res Function(_$_ResetPasswordEntities) _then)
      : super(_value, (v) => _then(v as _$_ResetPasswordEntities));

  @override
  _$_ResetPasswordEntities get _value =>
      super._value as _$_ResetPasswordEntities;

  @override
  $Res call({
    Object? success = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ResetPasswordEntities(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordEntities extends _ResetPasswordEntities {
  const _$_ResetPasswordEntities({required this.success, required this.status})
      : super._();

  @override
  final bool success;
  @override
  final String status;

  @override
  String toString() {
    return 'ResetPasswordEntities(success: $success, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordEntities &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ResetPasswordEntitiesCopyWith<_$_ResetPasswordEntities> get copyWith =>
      __$$_ResetPasswordEntitiesCopyWithImpl<_$_ResetPasswordEntities>(
          this, _$identity);
}

abstract class _ResetPasswordEntities extends ResetPasswordEntities {
  const factory _ResetPasswordEntities(
      {required final bool success,
      required final String status}) = _$_ResetPasswordEntities;
  const _ResetPasswordEntities._() : super._();

  @override
  bool get success;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordEntitiesCopyWith<_$_ResetPasswordEntities> get copyWith =>
      throw _privateConstructorUsedError;
}
