// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class AuthQueryMutation {
  // For Loggin in by username and Password and updating the FCM token
  // for notifications using Firebase Cloud Messaging
  String passwordLoginData(String username, String password, String fcmtoken) {
    return '''{
      loginV2(
          username: "$username"
          password: "$password"
          mobileToken: {mobileTokens:[{token:"$fcmtoken",provider:"firebase"}]}
          includeStrapi: "true"
      ) {
          authenticated
          eZRxJWT
          isAccountLocked
          isAccountExpired
      }
    }''';
  }

  // For Loggin in by Okta access token and updating the FCM token
  // for notifications using Firebase Cloud Messaging
  String oktaTokenLoginData(String oktaToken, String fcmtoken) {
    return '''{
      loginV2(
          accessToken: "$oktaToken" 
          isOktaAuthenticated: true
          mobileToken: {mobileTokens:[{token:"$fcmtoken",provider:"firebase"}]}
      ) {
          authenticated
          eZRxJWT
          isAccountLocked
          isAccountExpired
      }
    }''';
  }

  // For Admin Login on behalf
  String proxyLoginData(String username) {
    return '''{
      proxyLoginV2(request:{ 
          username: "$username"
      }) {
          authenticated
          eZRxJWT
          isAccountLocked
          isAccountExpired
      }
    }''';
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

}
