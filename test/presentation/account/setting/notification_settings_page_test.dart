import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/notification_settings/notification_settings_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableLevels = [];

  late UserBloc userBlocMock;

  late AppRouter autoRouterMock;
  setUpAll(() async {
    setupLocator();
  });

  group('Notification Settings Page should - ', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => userBlocMock.state).thenReturn(UserState(
        user: User.empty().copyWith(
          settings: User.empty().settings.copyWith(
                languagePreference: 'en',
                emailNotifications: false,
              ),
        ),
        userFailureOrSuccessOption: none(),
      ));
    });

    testWidgets('Load [NotificationSettingsPage] widgets', (tester) async {
      await _pumpWidget(tester, userBlocMock, autoRouterMock);
      final titleFinder = find.text('Set Up Email Notifications'.tr());
      final finder = find.byWidgetPredicate((w) => w is ListTile);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(titleFinder, findsOneWidget);
      expect(finder, findsAtLeastNWidgets(2));
      expect(find.byType(Scaffold), findsOneWidget);
      expect(titleFinder, findsOneWidget);
      expect(find.text('Language Preferences'.tr()), findsOneWidget);
      expect(find.text('Order Summary Update'.tr()), findsOneWidget);
      expect(find.byKey(const Key('flutterSwitch')), findsOneWidget);
    });

    testWidgets(
      'successfully work on tapping for language preferences',
      (tester) async {
        await _pumpWidget(tester, userBlocMock, autoRouterMock);
        await tester
            .tap(find.byKey(const Key('gestureDetectorForLanguagePicker')));
        await tester.pumpAndSettle();

        final languagePicker =
            find.byWidgetPredicate((w) => w is PlatformDialogAction);
        await tester.pump(const Duration(seconds: 2));
        expect(languagePicker, findsNWidgets(6));
        final salesOrg = find.byType(PlatformDialogAction).first;
        await tester.tap(salesOrg, warnIfMissed: false);
        await tester.pumpAndSettle(const Duration(seconds: 3));
      },
    );

    testWidgets(
      'successfully work on tapping for email notifications',
      (tester) async {
        final expectedStates = [
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              settings: Settings.empty().copyWith(
                emailNotifications: false,
                languagePreference: 'en',
              ),
            ),
          ),
        ];
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              settings: Settings.empty().copyWith(
                emailNotifications: false,
                languagePreference: 'tw',
              ),
            ),
          ),
        );
        whenListen(userBlocMock, Stream.fromIterable(expectedStates));
        await _pumpWidget(tester, userBlocMock, autoRouterMock);
        final switchFinder = find.byKey(const Key('flutterSwitch'));
        await tester.tap(switchFinder);
        await tester.pumpAndSettle();
        final flutterSwitchCurrent =
            tester.widget<PlatformSwitch>(switchFinder);
        expect(
          flutterSwitchCurrent.value,
          false,
        );
      },
    );
  });
}

Future<void> _pumpWidget(WidgetTester tester, UserBloc userBlocMock,
    AppRouter autoRouterMock) async {
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
      child: WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
        ],
        child: const NotificationSettingsPage(),
      )));
}
