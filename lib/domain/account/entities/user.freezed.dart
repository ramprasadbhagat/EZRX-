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
  String get id => throw _privateConstructorUsedError;
  Username get username => throw _privateConstructorUsedError;
  EmailAddress get email => throw _privateConstructorUsedError;
  FullName get fullName => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  CustomerCode get customerCode => throw _privateConstructorUsedError;
  List<SalesOrganisation> get userSalesOrganisations =>
      throw _privateConstructorUsedError;
  Settings get settings => throw _privateConstructorUsedError;
  SettingTc get settingTc => throw _privateConstructorUsedError;
  SettingAup get settingAup => throw _privateConstructorUsedError;
  bool get enableOrderType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      Username username,
      EmailAddress email,
      FullName fullName,
      Role role,
      CustomerCode customerCode,
      List<SalesOrganisation> userSalesOrganisations,
      Settings settings,
      SettingTc settingTc,
      SettingAup settingAup,
      bool enableOrderType});

  $FullNameCopyWith<$Res> get fullName;
  $RoleCopyWith<$Res> get role;
  $SettingsCopyWith<$Res> get settings;
  $SettingTcCopyWith<$Res> get settingTc;
  $SettingAupCopyWith<$Res> get settingAup;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? role = freezed,
    Object? customerCode = freezed,
    Object? userSalesOrganisations = freezed,
    Object? settings = freezed,
    Object? settingTc = freezed,
    Object? settingAup = freezed,
    Object? enableOrderType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      settingTc: settingTc == freezed
          ? _value.settingTc
          : settingTc // ignore: cast_nullable_to_non_nullable
              as SettingTc,
      settingAup: settingAup == freezed
          ? _value.settingAup
          : settingAup // ignore: cast_nullable_to_non_nullable
              as SettingAup,
      enableOrderType: enableOrderType == freezed
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
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

  @override
  $SettingTcCopyWith<$Res> get settingTc {
    return $SettingTcCopyWith<$Res>(_value.settingTc, (value) {
      return _then(_value.copyWith(settingTc: value));
    });
  }

  @override
  $SettingAupCopyWith<$Res> get settingAup {
    return $SettingAupCopyWith<$Res>(_value.settingAup, (value) {
      return _then(_value.copyWith(settingAup: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      Username username,
      EmailAddress email,
      FullName fullName,
      Role role,
      CustomerCode customerCode,
      List<SalesOrganisation> userSalesOrganisations,
      Settings settings,
      SettingTc settingTc,
      SettingAup settingAup,
      bool enableOrderType});

  @override
  $FullNameCopyWith<$Res> get fullName;
  @override
  $RoleCopyWith<$Res> get role;
  @override
  $SettingsCopyWith<$Res> get settings;
  @override
  $SettingTcCopyWith<$Res> get settingTc;
  @override
  $SettingAupCopyWith<$Res> get settingAup;
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
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
    Object? role = freezed,
    Object? customerCode = freezed,
    Object? userSalesOrganisations = freezed,
    Object? settings = freezed,
    Object? settingTc = freezed,
    Object? settingAup = freezed,
    Object? enableOrderType = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      settingTc: settingTc == freezed
          ? _value.settingTc
          : settingTc // ignore: cast_nullable_to_non_nullable
              as SettingTc,
      settingAup: settingAup == freezed
          ? _value.settingAup
          : settingAup // ignore: cast_nullable_to_non_nullable
              as SettingAup,
      enableOrderType: enableOrderType == freezed
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_User extends _User {
  const _$_User(
      {required this.id,
      required this.username,
      required this.email,
      required this.fullName,
      required this.role,
      required this.customerCode,
      required final List<SalesOrganisation> userSalesOrganisations,
      required this.settings,
      required this.settingTc,
      required this.settingAup,
      required this.enableOrderType})
      : _userSalesOrganisations = userSalesOrganisations,
        super._();

  @override
  final String id;
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
  final SettingTc settingTc;
  @override
  final SettingAup settingAup;
  @override
  final bool enableOrderType;

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, fullName: $fullName, role: $role, customerCode: $customerCode, userSalesOrganisations: $userSalesOrganisations, settings: $settings, settingTc: $settingTc, settingAup: $settingAup, enableOrderType: $enableOrderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality()
                .equals(other.customerCode, customerCode) &&
            const DeepCollectionEquality().equals(
                other._userSalesOrganisations, _userSalesOrganisations) &&
            const DeepCollectionEquality().equals(other.settings, settings) &&
            const DeepCollectionEquality().equals(other.settingTc, settingTc) &&
            const DeepCollectionEquality()
                .equals(other.settingAup, settingAup) &&
            const DeepCollectionEquality()
                .equals(other.enableOrderType, enableOrderType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(customerCode),
      const DeepCollectionEquality().hash(_userSalesOrganisations),
      const DeepCollectionEquality().hash(settings),
      const DeepCollectionEquality().hash(settingTc),
      const DeepCollectionEquality().hash(settingAup),
      const DeepCollectionEquality().hash(enableOrderType));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      required final Username username,
      required final EmailAddress email,
      required final FullName fullName,
      required final Role role,
      required final CustomerCode customerCode,
      required final List<SalesOrganisation> userSalesOrganisations,
      required final Settings settings,
      required final SettingTc settingTc,
      required final SettingAup settingAup,
      required final bool enableOrderType}) = _$_User;
  const _User._() : super._();

  @override
  String get id;
  @override
  Username get username;
  @override
  EmailAddress get email;
  @override
  FullName get fullName;
  @override
  Role get role;
  @override
  CustomerCode get customerCode;
  @override
  List<SalesOrganisation> get userSalesOrganisations;
  @override
  Settings get settings;
  @override
  SettingTc get settingTc;
  @override
  SettingAup get settingAup;
  @override
  bool get enableOrderType;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
