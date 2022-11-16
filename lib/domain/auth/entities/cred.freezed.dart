// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cred.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Cred {
  Username get username => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CredCopyWith<Cred> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredCopyWith<$Res> {
  factory $CredCopyWith(Cred value, $Res Function(Cred) then) =
      _$CredCopyWithImpl<$Res>;
  $Res call({Username username, Password password});
}

/// @nodoc
class _$CredCopyWithImpl<$Res> implements $CredCopyWith<$Res> {
  _$CredCopyWithImpl(this._value, this._then);

  final Cred _value;
  // ignore: unused_field
  final $Res Function(Cred) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }
}

/// @nodoc
abstract class _$$_CredCopyWith<$Res> implements $CredCopyWith<$Res> {
  factory _$$_CredCopyWith(_$_Cred value, $Res Function(_$_Cred) then) =
      __$$_CredCopyWithImpl<$Res>;
  @override
  $Res call({Username username, Password password});
}

/// @nodoc
class __$$_CredCopyWithImpl<$Res> extends _$CredCopyWithImpl<$Res>
    implements _$$_CredCopyWith<$Res> {
  __$$_CredCopyWithImpl(_$_Cred _value, $Res Function(_$_Cred) _then)
      : super(_value, (v) => _then(v as _$_Cred));

  @override
  _$_Cred get _value => super._value as _$_Cred;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_Cred(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }
}

/// @nodoc

class _$_Cred extends _Cred {
  const _$_Cred({required this.username, required this.password}) : super._();

  @override
  final Username username;
  @override
  final Password password;

  @override
  String toString() {
    return 'Cred(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cred &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_CredCopyWith<_$_Cred> get copyWith =>
      __$$_CredCopyWithImpl<_$_Cred>(this, _$identity);
}

abstract class _Cred extends Cred {
  const factory _Cred(
      {required final Username username,
      required final Password password}) = _$_Cred;
  const _Cred._() : super._();

  @override
  Username get username;
  @override
  Password get password;
  @override
  @JsonKey(ignore: true)
  _$$_CredCopyWith<_$_Cred> get copyWith => throw _privateConstructorUsedError;
}
