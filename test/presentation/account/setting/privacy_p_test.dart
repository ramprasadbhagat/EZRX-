import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/settings_page.dart';
import 'package:ezrxmobile/presentation/core/webview_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../utils/widget_utils.dart';

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SettingBlocMock extends MockBloc<SettingEvent, SettingState>
    implements SettingBloc {}

class AutoRouterMock extends Mock implements AppRouter {
  @override
  String currentPath = '';
}

void main() {
  late AuthBloc authBlocMock;
  late SettingBloc settingBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    authBlocMock = AuthBlocMock();
    autoRouterMock = AutoRouterMock();
    settingBlocMock = SettingBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => settingBlocMock.state).thenReturn(SettingState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
  });
  setUpAll(() async {
    setupLocator();
    PackageInfo.setMockInitialValues(
        appName: '',
        packageName: '"packageName"',
        version: '',
        buildNumber: '',
        buildSignature: '',
        installerStore: '');

    locator<Config>().appFlavor = Flavor.mock;

    locator<Config>().appName;
    locator<Config>().getPrivacyPolicyFile;
    locator<Config>().getTnCFile;
    locator<Config>().oktaConfig;
    locator<Config>().packageName;
  });

  testWidgets('Tap Privacy Policy', (tester) async {
    EasyLocalization.logger.enableBuildModes = [];

    await tester.pumpWidget(WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        assetLoader: CsvAssetLoader(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock),
            BlocProvider<SettingBloc>(
              create: (context) => settingBlocMock,
            ),
          ],
          child: const SettingsPage(),
        ),
      ),
    ));
    await tester.pump();
    final privacyPolicyOnTap = find.byKey(const Key('Privacy_Policy'));
    expect(privacyPolicyOnTap, findsOneWidget);
  });

  group('WebViewPage Page', () {
    setUp(() {});
    testWidgets('WebPage Mock Load', (tester) async {
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(create: (context) => authBlocMock),
              BlocProvider<AnnouncementBloc>(
                  create: (context) => announcementBlocMock),
              BlocProvider<SettingBloc>(
                create: (context) => settingBlocMock,
              ),
            ],
            child: WebViewPage(
              initialFile: locator<Config>().getPrivacyPolicyFile,
            ),
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
