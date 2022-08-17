// common method to add countly events
import 'package:countly_flutter/countly_flutter.dart';
import 'package:flutter/foundation.dart';

// Add Print Statement for Debug mode
void printStatement(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}

void recordCountlyView(String screenName){
  Countly.recordView(screenName);
}

void addCountlyEvent(String keyValue, {dynamic segmentation}) {
  var event = {'key': keyValue, 'count': 1};
  if (segmentation != null) {
    event['segmentation'] = segmentation;
  }
  Countly.recordEvent(event).then((value) => printStatement(value));
}