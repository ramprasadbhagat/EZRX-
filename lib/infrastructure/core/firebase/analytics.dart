import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  static final _analytics = FirebaseAnalytics.instance;
  FirebaseAnalytics get analytics => _analytics;
  static final FirebaseAnalyticsObserver _observer =
      FirebaseAnalyticsObserver(analytics: _analytics);
  FirebaseAnalyticsObserver get observer => _observer;

  // Future<void> logEvent({
  //   required String eventName,
  //   required Map<String, dynamic> parameters,
  // }) async {
  //   await _analytics.logEvent(
  //     name: eventName,
  //     parameters: parameters,
  //   );
  // }

  // Future<void> setUserId({required String userId}) async {
  //   await _analytics.setUserId(id: userId);
  // }

  // Future<void> setUserProperty({
  //   required String userName,
  //   required String value,
  // }) async {
  //   await _analytics.setUserProperty(name: userName, value: value);
  // }

  // Future<void> setCurrentScreen({required String screenName}) async {
  //   await _analytics.setCurrentScreen(
  //     screenName: screenName,
  //     screenClassOverride: screenName,
  //   );
  // }
}
