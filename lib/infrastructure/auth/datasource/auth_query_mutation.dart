// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class AuthQueryMutation {
  // For Loggin in by username and Password
  // Or Loggin in by Okta access token
  // updating the FCM token for notifications using Firebase Cloud Messaging
  String getLoginQuery() {
    return '''
      query (\$input:loginV3Input!){
        loginV3(input:\$input){
          userID
          authenticated
          eZRxJWT
          passwordLastReset
          passwordExpiry
          email
          isAccountLocked
          isAccountExpired
          accountExpiryDate
      }
    }
    ''';
  }

  // For Admin Login on behalf
  // By given admin access token + target username to get target access token
  String getProxyLoginQuery() {
    return '''
      query (\$input:proxyLoginV3Input!){
        proxyLoginV3(input:\$input){
          userID
          authenticated
          eZRxJWT
          passwordLastReset
          passwordExpiry
          email
          isAccountLocked
          isAccountExpired
          accountExpiryDate
      }
    }
    ''';
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

  String changePassword() {
    return '''
      mutation(\$username: String!, \$oldPassword: String!, \$newPassword : String!){
        changePassword(username: \$username, oldPassword: \$oldPassword, newPassword: \$newPassword){
          success
          status
        }
      }
    ''';
  }

}
