import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'material_frame_wrapper.dart';

class TesterUtils {
  static Future setUpLocalizationWrapper(
      {required WidgetTester tester,
      required Widget home,
      required Locale locale}) async {
    await tester.runAsync(() async {
      SharedPreferences.setMockInitialValues({});
      await EasyLocalization.ensureInitialized();
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: [
            locale,
          ],
          path: 'assets/langs/langs.csv',
          startLocale: locale,
          fallbackLocale: locale,
          saveLocale: true,
          useOnlyLangCode: false,
          assetLoader: CsvAssetLoader(),
          child: MaterialFrameWrapper(
            usingLocalization: true,
            child: home,
          ),
        ),
      );
      await Future.delayed(const Duration(seconds: 1), () {});
    });

    await tester.pump();
  }
}
