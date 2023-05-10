// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class UserQueryMutation {
  // For fetching userdata by user ID
  String getUserQuery() {
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
            type,
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
            LoyaltyScheme,
            AdminPOAttachment
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
          optIn,
          optInTimestamp,
          totp2fa,
          totpSecret,
          hasPriceOverride,
          hasBonusOverride,
          principalOverrideList,
          mobileAccess,
          disable2fa,
          emailNotifications,
          mobileNotifications,
          acceptPrivacyPolicy
          acceptPrivacyPolicyTime
          privacyPolicyAcceptedPlatform
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

  String getAnnouncementsQuery() {
    return '''
    {
      announcements {
        id
        active
        description
        startTime
        endTime
        type
      }
    }
    ''';
  }
  /* Query for updation of the users's notification preference accordingly for their language preference  */

  String updateNotification() {
    return '''
      mutation updateUserMutation(\$input: UpdateUserInput!) {
        updateUser(input: \$input) {
          user {
              username
              email
              provider
              role{
                  id
              }
              customerCode
              shipToAddr
              mobileNumber
              emailNotifications
              languagePreference
          }
        }
      }
    ''';
  }

  String updatePrivacyPolicy() {
    return '''
      mutation updateUserMutation(\$input: UpdateUserInput!) {
        updateUser(input: \$input) {
          user {
            username
            email
            acceptPrivacyPolicy
            acceptPrivacyPolicyTime
            privacyPolicyAcceptedPlatform
          }
        }
      }
    ''';
  }
}