import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/settings_page.dart';
import 'package:ezrxmobile/presentation/core/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../utils/material_frame_wrapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    setupLocator();
    PackageInfo.setMockInitialValues(
        appName: '',
        packageName: '"packageName"',
        version: '',
        buildNumber: '',
        buildSignature: '',
        installerStore: '');
  });

  testWidgets('Tap Privacy Policy', (tester) async {
    EasyLocalization.logger.enableBuildModes = [];

    await tester.pumpWidget(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'SG'),
      ],
      path: 'assets/langs/langs.csv',
      startLocale: const Locale('en', 'SG'),
      fallbackLocale: const Locale('en', 'SG'),
      saveLocale: true,
      useOnlyLangCode: false,
      assetLoader: CsvAssetLoader(),
      child: const MaterialFrameWrapper(child: SettingsPage()),
    ));
    await tester.pump();
    final privacyPolicyOnTap = find.byKey(const Key('Privacy_Policy'));
    expect(privacyPolicyOnTap, findsOneWidget);
  });

  group('WebViewPage Page', () {
    setUp(() {});
    testWidgets('WebPage Mock Load', (tester) async {
      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: WebViewPage(
            initialFile: locator<Config>().getPrivacyInitialFile,
          ),
        ),
      );
      final webview = find.byKey(const ValueKey('webview'));
      final loader = find.byKey(const ValueKey('loader'));
      expect(webview, findsOneWidget);
      expect(loader, findsOneWidget);
    });
  });
}
