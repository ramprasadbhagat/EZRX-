// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class TncQueryMutation {
  // For fetching userdata by user ID
  String updateUserAcceptMobileTC() {
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
              acceptMobileTC
          }
        }
      }
    ''';
  }
}
