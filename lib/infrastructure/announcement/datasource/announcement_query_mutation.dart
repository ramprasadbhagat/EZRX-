// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class AnnouncementQueryMutation {
  // For fetching userdata by user ID
  String getAnnouncementsQuery() {
    return '''
    {
      getAnnouncements {
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
}
