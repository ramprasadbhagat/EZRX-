// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$User {
  Username get username => throw _privateConstructorUsedError;
  EmailAddress get email => throw _privateConstructorUsedError;
  FullName get fullName => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  CustomerCode get customerCode => throw _privateConstructorUsedError;
  List<SalesOrganisation> get userSalesOrganisations =>
      throw _privateConstructorUsedError;
  Settings get settings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {Username username,
      EmailAddress email,
      FullName fullName,
      Role role,
      CustomerCode customerCode,
      List<SalesOrganisation> userSalesOrganisations,
      Settings settings});

  $FullNameCopyWith<$Res> get fullName;
  $RoleCopyWith<$Res> get role;
  $SettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? role = freezed,
    Object? customerCode = freezed,
    Object? userSalesOrganisations = freezed,
    Object? settings = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      customerCode: customerCode == freezed
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      userSalesOrganisations: userSalesOrganisations == freezed
          ? _value.userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ));
  }

  @override
  $FullNameCopyWith<$Res> get fullName {
    return $FullNameCopyWith<$Res>(_value.fullName, (value) {
      return _then(_value.copyWith(fullName: value));
    });
  }

  @override
  $RoleCopyWith<$Res> get role {
    return $RoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value));
    });
  }

  @override
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {Username username,
      EmailAddress email,
      FullName fullName,
      Role role,
      CustomerCode customerCode,
      List<SalesOrganisation> userSalesOrganisations,
      Settings settings});

  @override
  $FullNameCopyWith<$Res> get fullName;
  @override
  $RoleCopyWith<$Res> get role;
  @override
  $SettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? role = freezed,
    Object? customerCode = freezed,
    Object? userSalesOrganisations = freezed,
    Object? settings = freezed,
  }) {
    return _then(_$_User(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      customerCode: customerCode == freezed
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      userSalesOrganisations: userSalesOrganisations == freezed
          ? _value._userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ));
  }
}

/// @nodoc

class _$_User extends _User {
  const _$_User(
      {required this.username,
      required this.email,
      required this.fullName,
      required this.role,
      required this.customerCode,
      required final List<SalesOrganisation> userSalesOrganisations,
      required this.settings})
      : _userSalesOrganisations = userSalesOrganisations,
        super._();

  @override
  final Username username;
  @override
  final EmailAddress email;
  @override
  final FullName fullName;
  @override
  final Role role;
  @override
  final CustomerCode customerCode;
  final List<SalesOrganisation> _userSalesOrganisations;
  @override
  List<SalesOrganisation> get userSalesOrganisations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userSalesOrganisations);
  }

  @override
  final Settings settings;

  @override
  String toString() {
    return 'User(username: $username, email: $email, fullName: $fullName, role: $role, customerCode: $customerCode, userSalesOrganisations: $userSalesOrganisations, settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality()
                .equals(other.customerCode, customerCode) &&
            const DeepCollectionEquality().equals(
                other._userSalesOrganisations, _userSalesOrganisations) &&
            const DeepCollectionEquality().equals(other.settings, settings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(customerCode),
      const DeepCollectionEquality().hash(_userSalesOrganisations),
      const DeepCollectionEquality().hash(settings));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);
}

abstract class _User extends User {
  const factory _User(
      {required final Username username,
      required final EmailAddress email,
      required final FullName fullName,
      required final Role role,
      required final CustomerCode customerCode,
      required final List<SalesOrganisation> userSalesOrganisations,
      required final Settings settings}) = _$_User;
  const _User._() : super._();

  @override
  Username get username => throw _privateConstructorUsedError;
  @override
  EmailAddress get email => throw _privateConstructorUsedError;
  @override
  FullName get fullName => throw _privateConstructorUsedError;
  @override
  Role get role => throw _privateConstructorUsedError;
  @override
  CustomerCode get customerCode => throw _privateConstructorUsedError;
  @override
  List<SalesOrganisation> get userSalesOrganisations =>
      throw _privateConstructorUsedError;
  @override
  Settings get settings => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
