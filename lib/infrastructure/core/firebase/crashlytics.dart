import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseCrashlyticsService {
  static final _crashlytics = FirebaseCrashlytics.instance;
  FirebaseCrashlytics get crashlytics => _crashlytics;
}
