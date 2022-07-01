import 'dart:convert';

import 'package:ezrxmobile/domain/user/entities/user.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/user/dtos/user_dto.dart';

class UserRemoteDataSource {
  HttpService httpService;
  UserRemoteDataSource({required this.httpService});

  Future<User> getUser() async {
    final res = await httpService.request(
      method: 'POST',
      url: '/api/strapiEngine',
      data: jsonEncode({
        'query': fetchUserData(),
        'variables': {'id': '276'}, //@@@@@@@
      }),
    );

    return UserDto.fromJson(res.data['data']['user']).toDomain();
  }

  String fetchUserData() {
    return '''
      query userQuery(\$id: Int!) {
        user(id: \$id) {
          id,
          username,
          email,
          provider,
          confirmed,
          blocked,
          role
          {
            id,
            name,
            description
          },
          initialLogin,
          customerCode,
          accessRight
          {
            Users,
            Orders,
            Promos,
            HCPHUB,
            Products,
            Services,
            Analytics,
            LoyaltyScheme
          },
          salesOrganization,
          firstName,
          lastName,
          adName,
          isFromAD,
          shipToAddr,
          salesOrganizationTwo,
          customerCodeTwo
          shipToAddrTwo,
          customerCodeSet
          {
            value
            {
              customerCode,
              shipToCode
            }
          },
          customerCodeSetTwo
          {
            value
            {
              customerCode,
              shipToCode
            }
          },
          lastLogin,
          acceptTC,
          acceptMobileTC,
          mobileNumber,
          countryCode,
          acceptTCTimestamp,
          optIn,
          optInTimestamp,
          acceptLocalTC,
          acceptLTCTimestamp,
          totp2fa,
          totpSecret,
          hasPriceOverride,
          hasBonusOverride,
          principalOverrideList,
          mobileAccess,
          disable2fa,
          acceptAUP,
          acceptAUPTC,
          emailNotifications,
          mobileNotifications,
          mobileToken
          {
            token,
            provider,
            dateUpdated,
          },
          passwordLastUpdate,
          disableReturns,
          passwordLastRetained,
          languagePreference,
          userSalesOrganisationList
          {
            value 
            {
              salesOrg,
              customerCode,
              shipToCode,
            }
          },
          passwordActionName,
          passwordActionTime,
          disablePaymentAccess,
          disableCreateOrder,
          createdAt,
          updatedAt,
          enableOrderType
        }
      }
    ''';
  }
}
