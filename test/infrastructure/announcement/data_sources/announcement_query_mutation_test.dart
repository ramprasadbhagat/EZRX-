import 'dart:convert';

import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_query_mutation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
    },
  );
  group(
    'Announcement Query',
    (() {
      test('Get announcement query with local storage', () async {
        final announcementQuery = AnnouncementQueryMutation();

        final announcementQueryLocal = json.decode(
          await rootBundle.loadString('assets/json/getAnnouncementsQuery.json'),
        )['query'];

        expect(
          announcementQuery.getAnnouncementsQuery(),
          announcementQueryLocal,
        );
      });
    }),
  );
}
