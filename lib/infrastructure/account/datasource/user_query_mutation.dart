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

  String updateUAPQuery() {
    return '''
      mutation updateUserMutation(\$input: updateUserInput!) {
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
              acceptMobileTC
          }
        }
      }
    ''';
  }

  String updateUserAcceptMobileTC() {
    return '''
      mutation updateUserMutation(\$input: updateUserInput!) {
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
              acceptMobileTC
          }
        }
      }
    ''';
  }
}
