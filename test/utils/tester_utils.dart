import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TesterUtils {
  static Future setUpLocalizationWrapper({
    required WidgetTester tester,
    required Widget widget,
  }) async {
    await tester.runAsync(() async {
      SharedPreferences.setMockInitialValues({});
      await EasyLocalization.ensureInitialized();
      EasyLocalization.logger.enableBuildModes = [];
      EasyLocalization.logger.enableLevels = [];
      await tester.pumpWidget(widget);
      await Future.delayed(const Duration(seconds: 1), () {});
    });

    await tester.pump();
  }
}
