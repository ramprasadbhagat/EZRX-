import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_ship_to_info.dart';
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
import 'package:ezrxmobile/infrastructure/core/common/dto_helper.dart';
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
    @JsonKey(name: 'acceptTCTimestamp', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
        required String acceptTCTimestamp,
    @JsonKey(name: 'acceptAUP') required bool acceptAUP,
    @JsonKey(name: 'enableOrderType') required bool enableOrderType,
    @JsonKey(name: 'acceptAUPTC', defaultValue: '1970-01-01 00:00:00', readValue: dateTimeStringFormatCheck)
        required String acceptAUPTimestamp,
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
      userSalesOrganisations: _splitSalesOrg(user.userSalesOrganisations),
      emailNotifications: user.settings.emailNotifications,
      mobileNotifications: user.settings.mobileNotifications,
      languagePreference: user.settings.languagePreference,
      acceptTC: user.settingTc.acceptTC,
      acceptTCTimestamp: user.settingTc.acceptTCTimestamp.toIso8601String(),
      acceptAUP: user.settingAup.acceptAUP,
      enableOrderType: user.enableOrderType,
      acceptAUPTimestamp: user.settingAup.acceptAUPTimestamp.toIso8601String(),
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
      userSalesOrganisations: _mergeSalesOrg(userSalesOrganisations),
      settings: Settings(
        emailNotifications: emailNotifications,
        mobileNotifications: mobileNotifications,
        languagePreference: languagePreference,
      ),
      settingTc: SettingTc(
        acceptTC: acceptTC,
        acceptTCTimestamp: DateTime.parse(acceptTCTimestamp),
      ),
      settingAup: SettingAup(
        acceptAUP: acceptAUP,
        acceptAUPTimestamp: DateTime.parse(acceptAUPTimestamp),
      ),
      enableOrderType: enableOrderType,
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

class _SalesOrganisationListConverter
    extends JsonConverter<List<SalesOrganisationDto>, Map<String, dynamic>> {
  const _SalesOrganisationListConverter();

//======================================================================
// Response give an extra 'value' level that no useful on our DTO and Entity
// We use this way to remove it
//
//======================================================================
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

//======================================================================
// From response we might receive same salesOrg but have different customer
// We need to merge those saleOrg become single object
//
//======================================================================
List<SalesOrganisation> _mergeSalesOrg(
  List<SalesOrganisationDto> salesOrganisations,
) {
  final saleOrgs = <SalesOrganisation>[];

  for (final e in salesOrganisations) {
    // find the coming salesOrg DTO have the same salesOrg code exist on
    // salesOrgList or not, if yes return the existing SalesOrg domain object
    // else will return empty
    final customerExistsSalesOrg = saleOrgs.firstWhere(
      (f) => f.salesOrg.getOrCrash() == e.salesOrg,
      orElse: () => SalesOrganisation.empty(),
    );

    if (customerExistsSalesOrg == SalesOrganisation.empty()) {
      // New customer directly add to the salesOrg List
      saleOrgs.add(e.toDomain());
    } else {
      // Customer exist in the salesOrg List will merge together
      final index = saleOrgs.indexOf(customerExistsSalesOrg);
      final newSalesOrg = customerExistsSalesOrg.copyWith(
        customerInfos: [
          ...customerExistsSalesOrg.customerInfos,
          SalesOrgCustomerInfo(
            customerCodeSoldTo: CustomerCode(e.customerCode),
            shipToInfos: e.shipToCodes
                .map((e) => SalesOrgShipToInfo(shipToCustomerCode: e))
                .toList(),
          ),
        ],
      );
      saleOrgs[index] = newSalesOrg;
    }
  }

  return saleOrgs;
}

//======================================================================
// From saleOrg Entity we might have more than one customer
// Need to split to two different DTO
//
//======================================================================
List<SalesOrganisationDto> _splitSalesOrg(
  List<SalesOrganisation> salesOrganisations,
) {
  final saleOrgs = <SalesOrganisationDto>[];

  for (final e in salesOrganisations) {
    for (var i = 0; e.customerInfos.length > i; i++) {
      saleOrgs.add(SalesOrganisationDto.fromDomain(e, index: i));
    }
  }

  return saleOrgs;
}
