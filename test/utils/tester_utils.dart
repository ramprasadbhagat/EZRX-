import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'material_frame_wrapper.dart';
import 'widget_utils.dart';

class TesterUtils {
  static Future setUpLocalizationWrapper({
    required WidgetTester tester,
    required Widget home,
    required Locale locale,
    bool isAutoRouteEnabled = false,
    AppRouter? autoRouterMock,
    List<BlocProvider<StateStreamableSource<Object?>>>? providers,
    List<Locale>? supportedLocales,
  }) async {
    await tester.runAsync(() async {
      SharedPreferences.setMockInitialValues({});
      await EasyLocalization.ensureInitialized();
      EasyLocalization.logger.enableBuildModes = [];
      EasyLocalization.logger.enableLevels = [];
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: supportedLocales ??
              [
                locale,
              ],
          path: 'assets/langs/langs.csv',
          startLocale: locale,
          fallbackLocale: locale,
          saveLocale: true,
          useOnlyLangCode: true,
          assetLoader: CsvAssetLoader(),
          child: isAutoRouteEnabled
              ? MaterialFrameWrapper(
                  usingLocalization: true,
                  child: WidgetUtils.getScopedWidget(
                    autoRouterMock: autoRouterMock!,
                    providers: providers!,
                    child: home,
                  ),
                )
              : MaterialFrameWrapper(
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
