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
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstName')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  RoleDto get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerCode')
  String get customerCode => throw _privateConstructorUsedError;
  @_SalesOrganisationListConverter()
  @JsonKey(name: 'userSalesOrganisationList')
  List<SalesOrganisationDto> get userSalesOrganisations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'emailNotifications')
  bool get emailNotifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileNotifications')
  bool get mobileNotifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'languagePreference')
  String get languagePreference => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptTC')
  bool get acceptTC => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptTCTimestamp')
  String get acceptTCTimestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptAUP')
  bool get acceptAUP => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptAUPTC')
  String get acceptAUPTC => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          String id,
      @JsonKey(name: 'username')
          String username,
      @JsonKey(name: 'email')
          String email,
      @JsonKey(name: 'firstName')
          String firstName,
      @JsonKey(name: 'lastName')
          String lastName,
      @JsonKey(name: 'role')
          RoleDto role,
      @JsonKey(name: 'customerCode')
          String customerCode,
      @_SalesOrganisationListConverter()
      @JsonKey(name: 'userSalesOrganisationList')
          List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'emailNotifications')
          bool emailNotifications,
      @JsonKey(name: 'mobileNotifications')
          bool mobileNotifications,
      @JsonKey(name: 'languagePreference')
          String languagePreference,
      @JsonKey(name: 'acceptTC')
          bool acceptTC,
      @JsonKey(name: 'acceptTCTimestamp')
          String acceptTCTimestamp,
      @JsonKey(name: 'acceptAUP')
          bool acceptAUP,
      @JsonKey(name: 'acceptAUPTC')
          String acceptAUPTC});

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
    Object? acceptAUPTC = freezed,
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
      acceptAUPTC: acceptAUPTC == freezed
          ? _value.acceptAUPTC
          : acceptAUPTC // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'id')
          String id,
      @JsonKey(name: 'username')
          String username,
      @JsonKey(name: 'email')
          String email,
      @JsonKey(name: 'firstName')
          String firstName,
      @JsonKey(name: 'lastName')
          String lastName,
      @JsonKey(name: 'role')
          RoleDto role,
      @JsonKey(name: 'customerCode')
          String customerCode,
      @_SalesOrganisationListConverter()
      @JsonKey(name: 'userSalesOrganisationList')
          List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'emailNotifications')
          bool emailNotifications,
      @JsonKey(name: 'mobileNotifications')
          bool mobileNotifications,
      @JsonKey(name: 'languagePreference')
          String languagePreference,
      @JsonKey(name: 'acceptTC')
          bool acceptTC,
      @JsonKey(name: 'acceptTCTimestamp')
          String acceptTCTimestamp,
      @JsonKey(name: 'acceptAUP')
          bool acceptAUP,
      @JsonKey(name: 'acceptAUPTC')
          String acceptAUPTC});

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
    Object? acceptAUPTC = freezed,
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
      acceptAUPTC: acceptAUPTC == freezed
          ? _value.acceptAUPTC
          : acceptAUPTC // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDto extends _UserDto {
  const _$_UserDto(
      {@JsonKey(name: 'id')
          required this.id,
      @JsonKey(name: 'username')
          required this.username,
      @JsonKey(name: 'email')
          required this.email,
      @JsonKey(name: 'firstName')
          required this.firstName,
      @JsonKey(name: 'lastName')
          required this.lastName,
      @JsonKey(name: 'role')
          required this.role,
      @JsonKey(name: 'customerCode')
          required this.customerCode,
      @_SalesOrganisationListConverter()
      @JsonKey(name: 'userSalesOrganisationList')
          required final List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'emailNotifications')
          required this.emailNotifications,
      @JsonKey(name: 'mobileNotifications')
          required this.mobileNotifications,
      @JsonKey(name: 'languagePreference')
          required this.languagePreference,
      @JsonKey(name: 'acceptTC')
          required this.acceptTC,
      @JsonKey(name: 'acceptTCTimestamp')
          required this.acceptTCTimestamp,
      @JsonKey(name: 'acceptAUP')
          required this.acceptAUP,
      @JsonKey(name: 'acceptAUPTC')
          required this.acceptAUPTC})
      : _userSalesOrganisations = userSalesOrganisations,
        super._();

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'firstName')
  final String firstName;
  @override
  @JsonKey(name: 'lastName')
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
  @JsonKey(name: 'userSalesOrganisationList')
  List<SalesOrganisationDto> get userSalesOrganisations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userSalesOrganisations);
  }

  @override
  @JsonKey(name: 'emailNotifications')
  final bool emailNotifications;
  @override
  @JsonKey(name: 'mobileNotifications')
  final bool mobileNotifications;
  @override
  @JsonKey(name: 'languagePreference')
  final String languagePreference;
  @override
  @JsonKey(name: 'acceptTC')
  final bool acceptTC;
  @override
  @JsonKey(name: 'acceptTCTimestamp')
  final String acceptTCTimestamp;
  @override
  @JsonKey(name: 'acceptAUP')
  final bool acceptAUP;
  @override
  @JsonKey(name: 'acceptAUPTC')
  final String acceptAUPTC;

  @override
  String toString() {
    return 'UserDto(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, role: $role, customerCode: $customerCode, userSalesOrganisations: $userSalesOrganisations, emailNotifications: $emailNotifications, mobileNotifications: $mobileNotifications, languagePreference: $languagePreference, acceptTC: $acceptTC, acceptTCTimestamp: $acceptTCTimestamp, acceptAUP: $acceptAUP, acceptAUPTC: $acceptAUPTC)';
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
                .equals(other.acceptAUPTC, acceptAUPTC));
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
      const DeepCollectionEquality().hash(acceptAUPTC));

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
      {@JsonKey(name: 'id')
          required final String id,
      @JsonKey(name: 'username')
          required final String username,
      @JsonKey(name: 'email')
          required final String email,
      @JsonKey(name: 'firstName')
          required final String firstName,
      @JsonKey(name: 'lastName')
          required final String lastName,
      @JsonKey(name: 'role')
          required final RoleDto role,
      @JsonKey(name: 'customerCode')
          required final String customerCode,
      @_SalesOrganisationListConverter()
      @JsonKey(name: 'userSalesOrganisationList')
          required final List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'emailNotifications')
          required final bool emailNotifications,
      @JsonKey(name: 'mobileNotifications')
          required final bool mobileNotifications,
      @JsonKey(name: 'languagePreference')
          required final String languagePreference,
      @JsonKey(name: 'acceptTC')
          required final bool acceptTC,
      @JsonKey(name: 'acceptTCTimestamp')
          required final String acceptTCTimestamp,
      @JsonKey(name: 'acceptAUP')
          required final bool acceptAUP,
      @JsonKey(name: 'acceptAUPTC')
          required final String acceptAUPTC}) = _$_UserDto;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'firstName')
  String get firstName;
  @override
  @JsonKey(name: 'lastName')
  String get lastName;
  @override
  @JsonKey(name: 'role')
  RoleDto get role;
  @override
  @JsonKey(name: 'customerCode')
  String get customerCode;
  @override
  @_SalesOrganisationListConverter()
  @JsonKey(name: 'userSalesOrganisationList')
  List<SalesOrganisationDto> get userSalesOrganisations;
  @override
  @JsonKey(name: 'emailNotifications')
  bool get emailNotifications;
  @override
  @JsonKey(name: 'mobileNotifications')
  bool get mobileNotifications;
  @override
  @JsonKey(name: 'languagePreference')
  String get languagePreference;
  @override
  @JsonKey(name: 'acceptTC')
  bool get acceptTC;
  @override
  @JsonKey(name: 'acceptTCTimestamp')
  String get acceptTCTimestamp;
  @override
  @JsonKey(name: 'acceptAUP')
  bool get acceptAUP;
  @override
  @JsonKey(name: 'acceptAUPTC')
  String get acceptAUPTC;
  @override
  @JsonKey(ignore: true)
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
