// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class AnnouncementQueryMutation {
  // For fetching userdata by user ID
  String getAnnouncementsQuery() {
    return '''
    {
      getAnnouncements {
        active
        descriptionList {
            language
            languageCode
            announcement
        }
        startTime
        endTime
        type
        day
        functionLabel
        id
        created_at
        updated_at
        isModuleSpecific
        moduleName
        loginType
        isCrossButton
      }
    }
    ''';
  }
}
