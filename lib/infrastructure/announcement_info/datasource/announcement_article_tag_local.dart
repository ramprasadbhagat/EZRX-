import 'dart:convert';

import 'package:flutter/services.dart';

class AnnouncementArticleTagLocalDataSource {
  Future<List<String>> getAnnouncementArticleTags() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/announcementArticleTag.json'),
    );

    final List<String> tagList =
        res.data['data']['search'].map((e) => e['displayName']).toList();
    tagList.removeWhere((element) => element.isEmpty);

    return tagList;
  }
}
