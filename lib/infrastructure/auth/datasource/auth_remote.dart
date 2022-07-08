import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/loginv2_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class AuthRemoteDataSource {
  HttpService httpService;
  AuthRemoteDataSource({required this.httpService});

  Future<LoginV2> loginWithPassword({
    required String username,
    required String password,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '/ezrxapi/api/loginAd',
      data: jsonEncode({'query': passwordLoginData(username, password, '')}),
    );

    if (res.statusCode != 200) {
      throw const AuthException.serverError();
    } else if (res.data['errors'] != null && res.data['data'] == null) {
      throw AuthException.other(res.data['errors'][0]['message']);
    } else if (res.data['data']['loginV2']['authenticated'] == false) {
      throw const AuthException.invalidEmailAndPasswordCombination();
    } else if (res.data['data']['loginV2']['isAccountLocked'] == true) {
      throw const AuthException.accountLocked();
    } else if (res.data['data']['loginV2']['isAccountExpired'] == true) {
      throw const AuthException.accountExpired();
    }

    return LoginV2Dto.fromJson(res.data['data']['loginV2']).toDomain();
  }

  Future<LoginV2> loginWithOktaToken({
    required String oktaAccessToken,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '/ezrxapi/api/loginAd',
      data: jsonEncode({'query': oktaTokenLoginData(oktaAccessToken)}),
    );

    if (res.statusCode != 200) {
      throw const AuthException.serverError();
    } else if (res.data['errors'] != null && res.data['data'] == null) {
      throw AuthException.other(res.data['errors'][0]['message']);
    } else if (res.data['data']['loginV2']['authenticated'] == false) {
      throw const AuthException.invalidEmailAndPasswordCombination();
    } else if (res.data['data']['loginV2']['isAccountLocked'] == true) {
      throw const AuthException.accountLocked();
    } else if (res.data['data']['loginV2']['isAccountExpired'] == true) {
      throw const AuthException.accountExpired();
    }

    return LoginV2Dto.fromJson(res.data['data']['loginV2']).toDomain();
  }

  String passwordLoginData(String username, String password, String fcmtoken) {
    return '''{
      loginV2(
          username: "$username"
          password: "$password"
          includeStrapi: "true"
      ) {
          authenticated
          eZRxJWT
          isAccountLocked
          isAccountExpired
      }
    }''';
  }

  String oktaTokenLoginData(String oktaToken) {
    return '''{
      loginV2(
          accessToken: "$oktaToken" 
          username: "mobiledemo"
          oktaAuhenticated: true
      ) {
          authenticated
          eZRxJWT
          isAccountLocked
          isAccountExpired
      }
    }''';
  }
}


//   String loginData(String username, String password, String fcmtoken) {
//     return '''{
//       loginV2(
//           username: "$username"
//           password: "$password"
//           includeStrapi: "true"
//           mobileToken: {mobileTokens:[{token:"$fcmtoken",provider:"firebase"}]}
//       ) {
//           user {
//           id
//           role {
//               id
//               name
//               type
//               description
//           }
//           passwordLastUpdate
//           username
//           firstName
//           lastName
//           email
//           isFromAD
//           userSalesOrganisationList{
//             value{
//               customerCode
//               shipToCode
//               salesOrg
//             }
//           }
//           mobileNumber
//           countryCode
//           initialLogin
//           accessRight {
//               Users
//               Orders
//               Promos
//               HCPHUB
//               Products
//               Services
//               Analytics
//           }
//           hasBonusOverride
//           hasPriceOverride
//           acceptTC
//           acceptAUP
//           acceptLocalTC
//           acceptMobileTC
//           mobileAccess
//           disable2fa
//           totp2fa
//           }
//           authenticated
//           eZRxJWT
//           passwordLastReset
//           passwordExpiry
//           email
//           isAccountLocked
//           isAccountExpired
//           accountExpiryDate
//       }
//     }''';
//   }
// }
