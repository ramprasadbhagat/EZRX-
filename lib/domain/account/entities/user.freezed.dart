// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  AccessRight get accessRight => throw _privateConstructorUsedError;
  Settings get settings => throw _privateConstructorUsedError;
  SettingTc get settingTc => throw _privateConstructorUsedError;
  bool get enableOrderType => throw _privateConstructorUsedError;
  bool get hasBonusOverride => throw _privateConstructorUsedError;
  bool get disableCreateOrder => throw _privateConstructorUsedError;
  bool get disableReturns => throw _privateConstructorUsedError;
  bool get hasPriceOverride => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      Username username,
      EmailAddress email,
      FullName fullName,
      Role role,
      CustomerCode customerCode,
      List<SalesOrganisation> userSalesOrganisations,
      AccessRight accessRight,
      Settings settings,
      SettingTc settingTc,
      bool enableOrderType,
      bool hasBonusOverride,
      bool disableCreateOrder,
      bool disableReturns,
      bool hasPriceOverride});

  $FullNameCopyWith<$Res> get fullName;
  $RoleCopyWith<$Res> get role;
  $AccessRightCopyWith<$Res> get accessRight;
  $SettingsCopyWith<$Res> get settings;
  $SettingTcCopyWith<$Res> get settingTc;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? fullName = null,
    Object? role = null,
    Object? customerCode = null,
    Object? userSalesOrganisations = null,
    Object? accessRight = null,
    Object? settings = null,
    Object? settingTc = null,
    Object? enableOrderType = null,
    Object? hasBonusOverride = null,
    Object? disableCreateOrder = null,
    Object? disableReturns = null,
    Object? hasPriceOverride = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      userSalesOrganisations: null == userSalesOrganisations
          ? _value.userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
      accessRight: null == accessRight
          ? _value.accessRight
          : accessRight // ignore: cast_nullable_to_non_nullable
              as AccessRight,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      settingTc: null == settingTc
          ? _value.settingTc
          : settingTc // ignore: cast_nullable_to_non_nullable
              as SettingTc,
      enableOrderType: null == enableOrderType
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBonusOverride: null == hasBonusOverride
          ? _value.hasBonusOverride
          : hasBonusOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disableCreateOrder: null == disableCreateOrder
          ? _value.disableCreateOrder
          : disableCreateOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturns: null == disableReturns
          ? _value.disableReturns
          : disableReturns // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPriceOverride: null == hasPriceOverride
          ? _value.hasPriceOverride
          : hasPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FullNameCopyWith<$Res> get fullName {
    return $FullNameCopyWith<$Res>(_value.fullName, (value) {
      return _then(_value.copyWith(fullName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleCopyWith<$Res> get role {
    return $RoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccessRightCopyWith<$Res> get accessRight {
    return $AccessRightCopyWith<$Res>(_value.accessRight, (value) {
      return _then(_value.copyWith(accessRight: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingTcCopyWith<$Res> get settingTc {
    return $SettingTcCopyWith<$Res>(_value.settingTc, (value) {
      return _then(_value.copyWith(settingTc: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Username username,
      EmailAddress email,
      FullName fullName,
      Role role,
      CustomerCode customerCode,
      List<SalesOrganisation> userSalesOrganisations,
      AccessRight accessRight,
      Settings settings,
      SettingTc settingTc,
      bool enableOrderType,
      bool hasBonusOverride,
      bool disableCreateOrder,
      bool disableReturns,
      bool hasPriceOverride});

  @override
  $FullNameCopyWith<$Res> get fullName;
  @override
  $RoleCopyWith<$Res> get role;
  @override
  $AccessRightCopyWith<$Res> get accessRight;
  @override
  $SettingsCopyWith<$Res> get settings;
  @override
  $SettingTcCopyWith<$Res> get settingTc;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? fullName = null,
    Object? role = null,
    Object? customerCode = null,
    Object? userSalesOrganisations = null,
    Object? accessRight = null,
    Object? settings = null,
    Object? settingTc = null,
    Object? enableOrderType = null,
    Object? hasBonusOverride = null,
    Object? disableCreateOrder = null,
    Object? disableReturns = null,
    Object? hasPriceOverride = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      userSalesOrganisations: null == userSalesOrganisations
          ? _value._userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
      accessRight: null == accessRight
          ? _value.accessRight
          : accessRight // ignore: cast_nullable_to_non_nullable
              as AccessRight,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      settingTc: null == settingTc
          ? _value.settingTc
          : settingTc // ignore: cast_nullable_to_non_nullable
              as SettingTc,
      enableOrderType: null == enableOrderType
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBonusOverride: null == hasBonusOverride
          ? _value.hasBonusOverride
          : hasBonusOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disableCreateOrder: null == disableCreateOrder
          ? _value.disableCreateOrder
          : disableCreateOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturns: null == disableReturns
          ? _value.disableReturns
          : disableReturns // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPriceOverride: null == hasPriceOverride
          ? _value.hasPriceOverride
          : hasPriceOverride // ignore: cast_nullable_to_non_nullable
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
      required this.accessRight,
      required this.settings,
      required this.settingTc,
      required this.enableOrderType,
      required this.hasBonusOverride,
      required this.disableCreateOrder,
      required this.disableReturns,
      required this.hasPriceOverride})
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
    if (_userSalesOrganisations is EqualUnmodifiableListView)
      return _userSalesOrganisations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userSalesOrganisations);
  }

  @override
  final AccessRight accessRight;
  @override
  final Settings settings;
  @override
  final SettingTc settingTc;
  @override
  final bool enableOrderType;
  @override
  final bool hasBonusOverride;
  @override
  final bool disableCreateOrder;
  @override
  final bool disableReturns;
  @override
  final bool hasPriceOverride;

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, fullName: $fullName, role: $role, customerCode: $customerCode, userSalesOrganisations: $userSalesOrganisations, accessRight: $accessRight, settings: $settings, settingTc: $settingTc, enableOrderType: $enableOrderType, hasBonusOverride: $hasBonusOverride, disableCreateOrder: $disableCreateOrder, disableReturns: $disableReturns, hasPriceOverride: $hasPriceOverride)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            const DeepCollectionEquality().equals(
                other._userSalesOrganisations, _userSalesOrganisations) &&
            (identical(other.accessRight, accessRight) ||
                other.accessRight == accessRight) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.settingTc, settingTc) ||
                other.settingTc == settingTc) &&
            (identical(other.enableOrderType, enableOrderType) ||
                other.enableOrderType == enableOrderType) &&
            (identical(other.hasBonusOverride, hasBonusOverride) ||
                other.hasBonusOverride == hasBonusOverride) &&
            (identical(other.disableCreateOrder, disableCreateOrder) ||
                other.disableCreateOrder == disableCreateOrder) &&
            (identical(other.disableReturns, disableReturns) ||
                other.disableReturns == disableReturns) &&
            (identical(other.hasPriceOverride, hasPriceOverride) ||
                other.hasPriceOverride == hasPriceOverride));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      email,
      fullName,
      role,
      customerCode,
      const DeepCollectionEquality().hash(_userSalesOrganisations),
      accessRight,
      settings,
      settingTc,
      enableOrderType,
      hasBonusOverride,
      disableCreateOrder,
      disableReturns,
      hasPriceOverride);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      required final AccessRight accessRight,
      required final Settings settings,
      required final SettingTc settingTc,
      required final bool enableOrderType,
      required final bool hasBonusOverride,
      required final bool disableCreateOrder,
      required final bool disableReturns,
      required final bool hasPriceOverride}) = _$_User;
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
  AccessRight get accessRight;
  @override
  Settings get settings;
  @override
  SettingTc get settingTc;
  @override
  bool get enableOrderType;
  @override
  bool get hasBonusOverride;
  @override
  bool get disableCreateOrder;
  @override
  bool get disableReturns;
  @override
  bool get hasPriceOverride;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
