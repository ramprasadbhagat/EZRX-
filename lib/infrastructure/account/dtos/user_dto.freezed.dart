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
  @JsonKey(name: 'languagePreference', readValue: handleEmptyLanguagePreference)
  String get languagePreference => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableOrderType', defaultValue: false)
  bool get enableOrderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
  bool get acceptPrivacyPolicy => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'acceptPrivacyPolicyTime',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptPrivacyPolicyTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
  String get privacyPolicyAcceptedPlatform =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
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
      @JsonKey(name: 'languagePreference', readValue: handleEmptyLanguagePreference)
          String languagePreference,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
          bool enableOrderType,
      @JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
          bool acceptPrivacyPolicy,
      @JsonKey(name: 'acceptPrivacyPolicyTime', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptPrivacyPolicyTime,
      @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
          String privacyPolicyAcceptedPlatform});

  $RoleDtoCopyWith<$Res> get role;
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

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
    Object? firstName = null,
    Object? lastName = null,
    Object? role = null,
    Object? customerCode = null,
    Object? userSalesOrganisations = null,
    Object? emailNotifications = null,
    Object? mobileNotifications = null,
    Object? languagePreference = null,
    Object? enableOrderType = null,
    Object? acceptPrivacyPolicy = null,
    Object? acceptPrivacyPolicyTime = null,
    Object? privacyPolicyAcceptedPlatform = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleDto,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      userSalesOrganisations: null == userSalesOrganisations
          ? _value.userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisationDto>,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNotifications: null == mobileNotifications
          ? _value.mobileNotifications
          : mobileNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      languagePreference: null == languagePreference
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String,
      enableOrderType: null == enableOrderType
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptPrivacyPolicy: null == acceptPrivacyPolicy
          ? _value.acceptPrivacyPolicy
          : acceptPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptPrivacyPolicyTime: null == acceptPrivacyPolicyTime
          ? _value.acceptPrivacyPolicyTime
          : acceptPrivacyPolicyTime // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyAcceptedPlatform: null == privacyPolicyAcceptedPlatform
          ? _value.privacyPolicyAcceptedPlatform
          : privacyPolicyAcceptedPlatform // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleDtoCopyWith<$Res> get role {
    return $RoleDtoCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$_UserDtoCopyWith(
          _$_UserDto value, $Res Function(_$_UserDto) then) =
      __$$_UserDtoCopyWithImpl<$Res>;
  @override
  @useResult
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
      @JsonKey(name: 'languagePreference', readValue: handleEmptyLanguagePreference)
          String languagePreference,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
          bool enableOrderType,
      @JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
          bool acceptPrivacyPolicy,
      @JsonKey(name: 'acceptPrivacyPolicyTime', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          String acceptPrivacyPolicyTime,
      @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
          String privacyPolicyAcceptedPlatform});

  @override
  $RoleDtoCopyWith<$Res> get role;
}

/// @nodoc
class __$$_UserDtoCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$_UserDto>
    implements _$$_UserDtoCopyWith<$Res> {
  __$$_UserDtoCopyWithImpl(_$_UserDto _value, $Res Function(_$_UserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = null,
    Object? customerCode = null,
    Object? userSalesOrganisations = null,
    Object? emailNotifications = null,
    Object? mobileNotifications = null,
    Object? languagePreference = null,
    Object? enableOrderType = null,
    Object? acceptPrivacyPolicy = null,
    Object? acceptPrivacyPolicyTime = null,
    Object? privacyPolicyAcceptedPlatform = null,
  }) {
    return _then(_$_UserDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleDto,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      userSalesOrganisations: null == userSalesOrganisations
          ? _value._userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisationDto>,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNotifications: null == mobileNotifications
          ? _value.mobileNotifications
          : mobileNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      languagePreference: null == languagePreference
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String,
      enableOrderType: null == enableOrderType
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptPrivacyPolicy: null == acceptPrivacyPolicy
          ? _value.acceptPrivacyPolicy
          : acceptPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptPrivacyPolicyTime: null == acceptPrivacyPolicyTime
          ? _value.acceptPrivacyPolicyTime
          : acceptPrivacyPolicyTime // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyAcceptedPlatform: null == privacyPolicyAcceptedPlatform
          ? _value.privacyPolicyAcceptedPlatform
          : privacyPolicyAcceptedPlatform // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'languagePreference', readValue: handleEmptyLanguagePreference)
          required this.languagePreference,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
          required this.enableOrderType,
      @JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
          required this.acceptPrivacyPolicy,
      @JsonKey(name: 'acceptPrivacyPolicyTime', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required this.acceptPrivacyPolicyTime,
      @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
          required this.privacyPolicyAcceptedPlatform})
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
  @JsonKey(name: 'languagePreference', readValue: handleEmptyLanguagePreference)
  final String languagePreference;
  @override
  @JsonKey(name: 'enableOrderType', defaultValue: false)
  final bool enableOrderType;
  @override
  @JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
  final bool acceptPrivacyPolicy;
  @override
  @JsonKey(
      name: 'acceptPrivacyPolicyTime',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  final String acceptPrivacyPolicyTime;
  @override
  @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
  final String privacyPolicyAcceptedPlatform;

  @override
  String toString() {
    return 'UserDto(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, role: $role, customerCode: $customerCode, userSalesOrganisations: $userSalesOrganisations, emailNotifications: $emailNotifications, mobileNotifications: $mobileNotifications, languagePreference: $languagePreference, enableOrderType: $enableOrderType, acceptPrivacyPolicy: $acceptPrivacyPolicy, acceptPrivacyPolicyTime: $acceptPrivacyPolicyTime, privacyPolicyAcceptedPlatform: $privacyPolicyAcceptedPlatform)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            const DeepCollectionEquality().equals(
                other._userSalesOrganisations, _userSalesOrganisations) &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.mobileNotifications, mobileNotifications) ||
                other.mobileNotifications == mobileNotifications) &&
            (identical(other.languagePreference, languagePreference) ||
                other.languagePreference == languagePreference) &&
            (identical(other.enableOrderType, enableOrderType) ||
                other.enableOrderType == enableOrderType) &&
            (identical(other.acceptPrivacyPolicy, acceptPrivacyPolicy) ||
                other.acceptPrivacyPolicy == acceptPrivacyPolicy) &&
            (identical(
                    other.acceptPrivacyPolicyTime, acceptPrivacyPolicyTime) ||
                other.acceptPrivacyPolicyTime == acceptPrivacyPolicyTime) &&
            (identical(other.privacyPolicyAcceptedPlatform,
                    privacyPolicyAcceptedPlatform) ||
                other.privacyPolicyAcceptedPlatform ==
                    privacyPolicyAcceptedPlatform));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      email,
      firstName,
      lastName,
      role,
      customerCode,
      const DeepCollectionEquality().hash(_userSalesOrganisations),
      emailNotifications,
      mobileNotifications,
      languagePreference,
      enableOrderType,
      acceptPrivacyPolicy,
      acceptPrivacyPolicyTime,
      privacyPolicyAcceptedPlatform);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      @JsonKey(name: 'languagePreference', readValue: handleEmptyLanguagePreference)
          required final String languagePreference,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
          required final bool enableOrderType,
      @JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
          required final bool acceptPrivacyPolicy,
      @JsonKey(name: 'acceptPrivacyPolicyTime', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
          required final String acceptPrivacyPolicyTime,
      @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
          required final String privacyPolicyAcceptedPlatform}) = _$_UserDto;
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
  @JsonKey(name: 'languagePreference', readValue: handleEmptyLanguagePreference)
  String get languagePreference;
  @override
  @JsonKey(name: 'enableOrderType', defaultValue: false)
  bool get enableOrderType;
  @override
  @JsonKey(name: 'acceptPrivacyPolicy', defaultValue: false)
  bool get acceptPrivacyPolicy;
  @override
  @JsonKey(
      name: 'acceptPrivacyPolicyTime',
      defaultValue: '1970-01-01 00:00:00',
      readValue: dateTimeStringFormatCheck)
  String get acceptPrivacyPolicyTime;
  @override
  @JsonKey(name: 'privacyPolicyAcceptedPlatform', defaultValue: '')
  String get privacyPolicyAcceptedPlatform;
  @override
  @JsonKey(ignore: true)
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
