import 'package:countly_flutter/countly_flutter.dart';
import 'package:flutter/foundation.dart';

class CountlyService {
  Future<void> recordCountlyView(String screenName) async {
    await Countly.recordView(screenName);
  }

  Future<void> addCountlyEvent(String keyValue, {dynamic segmentation}) async {
    var event = {'key': keyValue, 'count': 1};
    if (segmentation != null) {
      event['segmentation'] = segmentation;
    }
    await Countly.recordEvent(event).then((value) => debugPrint(value));
  }
}
