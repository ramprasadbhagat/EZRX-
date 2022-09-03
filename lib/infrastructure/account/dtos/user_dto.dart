import 'package:ezrxmobile/domain/account/entities/setting_aup.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/role_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'firstName') required String firstName,
    @JsonKey(name: 'lastName') required String lastName,
    @JsonKey(name: 'role') required RoleDto role,
    @JsonKey(name: 'customerCode') required String customerCode,
    @_SalesOrganisationListConverter()
    @JsonKey(name: 'userSalesOrganisationList')
        required List<SalesOrganisationDto> userSalesOrganisations,
    @JsonKey(name: 'emailNotifications') required bool emailNotifications,
    @JsonKey(name: 'mobileNotifications') required bool mobileNotifications,
    @JsonKey(name: 'languagePreference') required String languagePreference,
    @JsonKey(name: 'acceptTC') required bool acceptTC,
    @JsonKey(name: 'acceptTCTimestamp') required String acceptTCTimestamp,
    @JsonKey(name: 'acceptAUP') required bool acceptAUP,
    @JsonKey(name: 'acceptAUPTC') required String acceptAUPTC,
  }) = _UserDto;

  factory UserDto.fromDomain(User user) {
    return UserDto(
      id: user.id,
      username: user.username.getOrCrash(),
      email: user.email.getOrCrash(),
      firstName: user.fullName.firstName,
      lastName: user.fullName.lastName,
      role: RoleDto.fromDomain(user.role),
      customerCode: user.customerCode.getOrCrash(),
      userSalesOrganisations: user.userSalesOrganisations
          .map((e) => SalesOrganisationDto.fromDomain(e))
          .toList(),
      emailNotifications: user.settings.emailNotifications,
      mobileNotifications: user.settings.mobileNotifications,
      languagePreference: user.settings.languagePreference,
      acceptTC: user.settingTc.acceptTC,
      acceptTCTimestamp: user.settingTc.acceptTCTimestamp,
      acceptAUP: user.settingAup.acceptAUP,
      acceptAUPTC: user.settingAup.acceptAUPTC,
    );
  }

  User toDomain() {
    return User(
      id: id,
      username: Username(username),
      email: EmailAddress(email),
      fullName: FullName(firstName: firstName, lastName: lastName),
      role: Role(
        id: role.id,
        name: role.name,
        type: RoleType(role.type),
        description: role.description,
      ),
      customerCode: CustomerCode(customerCode),
      userSalesOrganisations: userSalesOrganisations
          .map((e) => SalesOrganisation(salesOrg: SalesOrg(e.salesOrg)))
          .toList(),
      settings: Settings(
        emailNotifications: emailNotifications,
        mobileNotifications: mobileNotifications,
        languagePreference: languagePreference,
      ),
      settingTc: SettingTc(
        acceptTC: acceptTC,
        acceptTCTimestamp: acceptTCTimestamp,
      ),
      settingAup: SettingAup(
        acceptAUP: acceptAUP,
        acceptAUPTC: acceptAUPTC,
      ),
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

class _SalesOrganisationListConverter
    extends JsonConverter<List<SalesOrganisationDto>, Map<String, dynamic>> {
  const _SalesOrganisationListConverter();

  @override
  List<SalesOrganisationDto> fromJson(Map<String, dynamic> json) {
    return List.from(json['value'])
        .map((e) => SalesOrganisationDto.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson(List<SalesOrganisationDto> object) {
    return {
      'value': object.map((e) => {'salesOrg': e}).toList(),
    };
  }
}
