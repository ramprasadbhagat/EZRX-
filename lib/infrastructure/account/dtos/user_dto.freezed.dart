// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstName', defaultValue: '')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName', defaultValue: '')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  RoleDto get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerCode')
  String get customerCode => throw _privateConstructorUsedError;
  @_SalesOrganisationListConverter()
  @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
  List<SalesOrganisationDto> get userSalesOrganisations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'emailNotifications', defaultValue: false)
  bool get emailNotifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileNotifications', defaultValue: false)
  bool get mobileNotifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'languagePreference', defaultValue: 'en')
  String get languagePreference => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptTC', defaultValue: false)
  bool get acceptTC => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'acceptTCTimestamp',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptTCTimestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptAUP', defaultValue: false)
  bool get acceptAUP => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableOrderType', defaultValue: false)
  bool get enableOrderType => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'acceptAUPTC',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptAUPTimestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @JsonKey(name: 'username')
          String username,
      @JsonKey(name: 'email')
          String email,
      @JsonKey(name: 'firstName', defaultValue: '')
          String firstName,
      @JsonKey(name: 'lastName', defaultValue: '')
          String lastName,
      @JsonKey(name: 'role')
          RoleDto role,
      @JsonKey(name: 'customerCode')
          String customerCode,
      @_SalesOrganisationListConverter()
      @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
          List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'emailNotifications', defaultValue: false)
          bool emailNotifications,
      @JsonKey(name: 'mobileNotifications', defaultValue: false)
          bool mobileNotifications,
      @JsonKey(name: 'languagePreference', defaultValue: 'en')
          String languagePreference,
      @JsonKey(name: 'acceptTC', defaultValue: false)
          bool acceptTC,
      @JsonKey(name: 'acceptTCTimestamp', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptTCTimestamp,
      @JsonKey(name: 'acceptAUP', defaultValue: false)
          bool acceptAUP,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
          bool enableOrderType,
      @JsonKey(name: 'acceptAUPTC', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptAUPTimestamp});

  $RoleDtoCopyWith<$Res> get role;
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res> implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  final UserDto _value;
  // ignore: unused_field
  final $Res Function(UserDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? role = freezed,
    Object? customerCode = freezed,
    Object? userSalesOrganisations = freezed,
    Object? emailNotifications = freezed,
    Object? mobileNotifications = freezed,
    Object? languagePreference = freezed,
    Object? acceptTC = freezed,
    Object? acceptTCTimestamp = freezed,
    Object? acceptAUP = freezed,
    Object? enableOrderType = freezed,
    Object? acceptAUPTimestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleDto,
      customerCode: customerCode == freezed
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      userSalesOrganisations: userSalesOrganisations == freezed
          ? _value.userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisationDto>,
      emailNotifications: emailNotifications == freezed
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNotifications: mobileNotifications == freezed
          ? _value.mobileNotifications
          : mobileNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      languagePreference: languagePreference == freezed
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String,
      acceptTC: acceptTC == freezed
          ? _value.acceptTC
          : acceptTC // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptTCTimestamp: acceptTCTimestamp == freezed
          ? _value.acceptTCTimestamp
          : acceptTCTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
      acceptAUP: acceptAUP == freezed
          ? _value.acceptAUP
          : acceptAUP // ignore: cast_nullable_to_non_nullable
              as bool,
      enableOrderType: enableOrderType == freezed
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptAUPTimestamp: acceptAUPTimestamp == freezed
          ? _value.acceptAUPTimestamp
          : acceptAUPTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $RoleDtoCopyWith<$Res> get role {
    return $RoleDtoCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$_UserDtoCopyWith(
          _$_UserDto value, $Res Function(_$_UserDto) then) =
      __$$_UserDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @JsonKey(name: 'username')
          String username,
      @JsonKey(name: 'email')
          String email,
      @JsonKey(name: 'firstName', defaultValue: '')
          String firstName,
      @JsonKey(name: 'lastName', defaultValue: '')
          String lastName,
      @JsonKey(name: 'role')
          RoleDto role,
      @JsonKey(name: 'customerCode')
          String customerCode,
      @_SalesOrganisationListConverter()
      @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
          List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'emailNotifications', defaultValue: false)
          bool emailNotifications,
      @JsonKey(name: 'mobileNotifications', defaultValue: false)
          bool mobileNotifications,
      @JsonKey(name: 'languagePreference', defaultValue: 'en')
          String languagePreference,
      @JsonKey(name: 'acceptTC', defaultValue: false)
          bool acceptTC,
      @JsonKey(name: 'acceptTCTimestamp', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptTCTimestamp,
      @JsonKey(name: 'acceptAUP', defaultValue: false)
          bool acceptAUP,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
          bool enableOrderType,
      @JsonKey(name: 'acceptAUPTC', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptAUPTimestamp});

  @override
  $RoleDtoCopyWith<$Res> get role;
}

/// @nodoc
class __$$_UserDtoCopyWithImpl<$Res> extends _$UserDtoCopyWithImpl<$Res>
    implements _$$_UserDtoCopyWith<$Res> {
  __$$_UserDtoCopyWithImpl(_$_UserDto _value, $Res Function(_$_UserDto) _then)
      : super(_value, (v) => _then(v as _$_UserDto));

  @override
  _$_UserDto get _value => super._value as _$_UserDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? role = freezed,
    Object? customerCode = freezed,
    Object? userSalesOrganisations = freezed,
    Object? emailNotifications = freezed,
    Object? mobileNotifications = freezed,
    Object? languagePreference = freezed,
    Object? acceptTC = freezed,
    Object? acceptTCTimestamp = freezed,
    Object? acceptAUP = freezed,
    Object? enableOrderType = freezed,
    Object? acceptAUPTimestamp = freezed,
  }) {
    return _then(_$_UserDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleDto,
      customerCode: customerCode == freezed
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      userSalesOrganisations: userSalesOrganisations == freezed
          ? _value._userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisationDto>,
      emailNotifications: emailNotifications == freezed
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNotifications: mobileNotifications == freezed
          ? _value.mobileNotifications
          : mobileNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      languagePreference: languagePreference == freezed
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String,
      acceptTC: acceptTC == freezed
          ? _value.acceptTC
          : acceptTC // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptTCTimestamp: acceptTCTimestamp == freezed
          ? _value.acceptTCTimestamp
          : acceptTCTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
      acceptAUP: acceptAUP == freezed
          ? _value.acceptAUP
          : acceptAUP // ignore: cast_nullable_to_non_nullable
              as bool,
      enableOrderType: enableOrderType == freezed
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptAUPTimestamp: acceptAUPTimestamp == freezed
          ? _value.acceptAUPTimestamp
          : acceptAUPTimestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDto extends _UserDto {
  const _$_UserDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required this.id,
      @JsonKey(name: 'username')
          required this.username,
      @JsonKey(name: 'email')
          required this.email,
      @JsonKey(name: 'firstName', defaultValue: '')
          required this.firstName,
      @JsonKey(name: 'lastName', defaultValue: '')
          required this.lastName,
      @JsonKey(name: 'role')
          required this.role,
      @JsonKey(name: 'customerCode')
          required this.customerCode,
      @_SalesOrganisationListConverter()
      @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
          required final List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'emailNotifications', defaultValue: false)
          required this.emailNotifications,
      @JsonKey(name: 'mobileNotifications', defaultValue: false)
          required this.mobileNotifications,
      @JsonKey(name: 'languagePreference', defaultValue: 'en')
          required this.languagePreference,
      @JsonKey(name: 'acceptTC', defaultValue: false)
          required this.acceptTC,
      @JsonKey(name: 'acceptTCTimestamp', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required this.acceptTCTimestamp,
      @JsonKey(name: 'acceptAUP', defaultValue: false)
          required this.acceptAUP,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
          required this.enableOrderType,
      @JsonKey(name: 'acceptAUPTC', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required this.acceptAUPTimestamp})
      : _userSalesOrganisations = userSalesOrganisations,
        super._();

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDtoFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'firstName', defaultValue: '')
  final String firstName;
  @override
  @JsonKey(name: 'lastName', defaultValue: '')
  final String lastName;
  @override
  @JsonKey(name: 'role')
  final RoleDto role;
  @override
  @JsonKey(name: 'customerCode')
  final String customerCode;
  final List<SalesOrganisationDto> _userSalesOrganisations;
  @override
  @_SalesOrganisationListConverter()
  @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
  List<SalesOrganisationDto> get userSalesOrganisations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userSalesOrganisations);
  }

  @override
  @JsonKey(name: 'emailNotifications', defaultValue: false)
  final bool emailNotifications;
  @override
  @JsonKey(name: 'mobileNotifications', defaultValue: false)
  final bool mobileNotifications;
  @override
  @JsonKey(name: 'languagePreference', defaultValue: 'en')
  final String languagePreference;
  @override
  @JsonKey(name: 'acceptTC', defaultValue: false)
  final bool acceptTC;
  @override
  @JsonKey(
      name: 'acceptTCTimestamp',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  final String acceptTCTimestamp;
  @override
  @JsonKey(name: 'acceptAUP', defaultValue: false)
  final bool acceptAUP;
  @override
  @JsonKey(name: 'enableOrderType', defaultValue: false)
  final bool enableOrderType;
  @override
  @JsonKey(
      name: 'acceptAUPTC',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  final String acceptAUPTimestamp;

  @override
  String toString() {
    return 'UserDto(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, role: $role, customerCode: $customerCode, userSalesOrganisations: $userSalesOrganisations, emailNotifications: $emailNotifications, mobileNotifications: $mobileNotifications, languagePreference: $languagePreference, acceptTC: $acceptTC, acceptTCTimestamp: $acceptTCTimestamp, acceptAUP: $acceptAUP, enableOrderType: $enableOrderType, acceptAUPTimestamp: $acceptAUPTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality()
                .equals(other.customerCode, customerCode) &&
            const DeepCollectionEquality().equals(
                other._userSalesOrganisations, _userSalesOrganisations) &&
            const DeepCollectionEquality()
                .equals(other.emailNotifications, emailNotifications) &&
            const DeepCollectionEquality()
                .equals(other.mobileNotifications, mobileNotifications) &&
            const DeepCollectionEquality()
                .equals(other.languagePreference, languagePreference) &&
            const DeepCollectionEquality().equals(other.acceptTC, acceptTC) &&
            const DeepCollectionEquality()
                .equals(other.acceptTCTimestamp, acceptTCTimestamp) &&
            const DeepCollectionEquality().equals(other.acceptAUP, acceptAUP) &&
            const DeepCollectionEquality()
                .equals(other.enableOrderType, enableOrderType) &&
            const DeepCollectionEquality()
                .equals(other.acceptAUPTimestamp, acceptAUPTimestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(customerCode),
      const DeepCollectionEquality().hash(_userSalesOrganisations),
      const DeepCollectionEquality().hash(emailNotifications),
      const DeepCollectionEquality().hash(mobileNotifications),
      const DeepCollectionEquality().hash(languagePreference),
      const DeepCollectionEquality().hash(acceptTC),
      const DeepCollectionEquality().hash(acceptTCTimestamp),
      const DeepCollectionEquality().hash(acceptAUP),
      const DeepCollectionEquality().hash(enableOrderType),
      const DeepCollectionEquality().hash(acceptAUPTimestamp));

  @JsonKey(ignore: true)
  @override
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      __$$_UserDtoCopyWithImpl<_$_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDtoToJson(
      this,
    );
  }
}

abstract class _UserDto extends UserDto {
  const factory _UserDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required final String id,
      @JsonKey(name: 'username')
          required final String username,
      @JsonKey(name: 'email')
          required final String email,
      @JsonKey(name: 'firstName', defaultValue: '')
          required final String firstName,
      @JsonKey(name: 'lastName', defaultValue: '')
          required final String lastName,
      @JsonKey(name: 'role')
          required final RoleDto role,
      @JsonKey(name: 'customerCode')
          required final String customerCode,
      @_SalesOrganisationListConverter()
      @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
          required final List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'emailNotifications', defaultValue: false)
          required final bool emailNotifications,
      @JsonKey(name: 'mobileNotifications', defaultValue: false)
          required final bool mobileNotifications,
      @JsonKey(name: 'languagePreference', defaultValue: 'en')
          required final String languagePreference,
      @JsonKey(name: 'acceptTC', defaultValue: false)
          required final bool acceptTC,
      @JsonKey(name: 'acceptTCTimestamp', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required final String acceptTCTimestamp,
      @JsonKey(name: 'acceptAUP', defaultValue: false)
          required final bool acceptAUP,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
          required final bool enableOrderType,
      @JsonKey(name: 'acceptAUPTC', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required final String acceptAUPTimestamp}) = _$_UserDto;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'firstName', defaultValue: '')
  String get firstName;
  @override
  @JsonKey(name: 'lastName', defaultValue: '')
  String get lastName;
  @override
  @JsonKey(name: 'role')
  RoleDto get role;
  @override
  @JsonKey(name: 'customerCode')
  String get customerCode;
  @override
  @_SalesOrganisationListConverter()
  @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
  List<SalesOrganisationDto> get userSalesOrganisations;
  @override
  @JsonKey(name: 'emailNotifications', defaultValue: false)
  bool get emailNotifications;
  @override
  @JsonKey(name: 'mobileNotifications', defaultValue: false)
  bool get mobileNotifications;
  @override
  @JsonKey(name: 'languagePreference', defaultValue: 'en')
  String get languagePreference;
  @override
  @JsonKey(name: 'acceptTC', defaultValue: false)
  bool get acceptTC;
  @override
  @JsonKey(
      name: 'acceptTCTimestamp',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptTCTimestamp;
  @override
  @JsonKey(name: 'acceptAUP', defaultValue: false)
  bool get acceptAUP;
  @override
  @JsonKey(name: 'enableOrderType', defaultValue: false)
  bool get enableOrderType;
  @override
  @JsonKey(
      name: 'acceptAUPTC',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptAUPTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
