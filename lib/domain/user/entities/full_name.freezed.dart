// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'full_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FullName {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FullNameCopyWith<FullName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullNameCopyWith<$Res> {
  factory $FullNameCopyWith(FullName value, $Res Function(FullName) then) =
      _$FullNameCopyWithImpl<$Res>;
  $Res call({String firstName, String lastName});
}

/// @nodoc
class _$FullNameCopyWithImpl<$Res> implements $FullNameCopyWith<$Res> {
  _$FullNameCopyWithImpl(this._value, this._then);

  final FullName _value;
  // ignore: unused_field
  final $Res Function(FullName) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FullNameCopyWith<$Res> implements $FullNameCopyWith<$Res> {
  factory _$$_FullNameCopyWith(
          _$_FullName value, $Res Function(_$_FullName) then) =
      __$$_FullNameCopyWithImpl<$Res>;
  @override
  $Res call({String firstName, String lastName});
}

/// @nodoc
class __$$_FullNameCopyWithImpl<$Res> extends _$FullNameCopyWithImpl<$Res>
    implements _$$_FullNameCopyWith<$Res> {
  __$$_FullNameCopyWithImpl(
      _$_FullName _value, $Res Function(_$_FullName) _then)
      : super(_value, (v) => _then(v as _$_FullName));

  @override
  _$_FullName get _value => super._value as _$_FullName;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$_FullName(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FullName extends _FullName {
  const _$_FullName({required this.firstName, required this.lastName})
      : super._();

  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'FullName(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullName &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName));

  @JsonKey(ignore: true)
  @override
  _$$_FullNameCopyWith<_$_FullName> get copyWith =>
      __$$_FullNameCopyWithImpl<_$_FullName>(this, _$identity);
}

abstract class _FullName extends FullName {
  const factory _FullName(
      {required final String firstName,
      required final String lastName}) = _$_FullName;
  const _FullName._() : super._();

  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FullNameCopyWith<_$_FullName> get copyWith =>
      throw _privateConstructorUsedError;
}
