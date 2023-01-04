import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
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
  late final AppRouter autoRouterMock;

  late UserBloc userBlocMock;
  setUpAll(() async {
    setupLocator();
    autoRouterMock = locator<AppRouter>();
  });

  group('Notification Settings Page should - ', () {
    Widget getScopedWidget() {
      return EasyLocalization(
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
        ),
      );
    }

    setUp(() {
      userBlocMock = UserBlocMock();
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
      await tester.pumpWidget(getScopedWidget());
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
        await tester.pumpWidget(getScopedWidget());
        await tester
            .tap(find.byKey(const Key('gestureDetectorForLanguagePicker')));
        await tester.pumpAndSettle();
        expect(
          find.byKey(const Key('notificationSettingsLanguagePicker')),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'tapp on language preferences, changing the language',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester
            .tap(find.byKey(const Key('gestureDetectorForLanguagePicker')));
        await tester.pumpAndSettle();
        expect(
          find.byKey(const Key('notificationSettingsLanguagePicker')),
          findsOneWidget,
        );

        final thaiLanguageTile = find.byKey(const Key('thaiLanguageTile'));
        expect(thaiLanguageTile, findsOneWidget);
        await tester.tap(thaiLanguageTile, warnIfMissed: false);
        await tester.pump();
        expect(find.text('ภาษาไทย'), findsOneWidget);
        await tester.pump(const Duration(seconds: 2));

        await tester
            .tap(find.byKey(const Key('notificationSettingsLanguagePicker')));
        final mandarinLanguageTile =
            find.byKey(const Key('mandarinLanguageTile'));
        expect(mandarinLanguageTile, findsOneWidget);
        await tester.tap(mandarinLanguageTile, warnIfMissed: false);
        await tester.pump();
        expect(find.text('繁體中文'), findsOneWidget);

        await tester
            .tap(find.byKey(const Key('notificationSettingsLanguagePicker')));
        final burmeseLanguageTile =
            find.byKey(const Key('burmeseLanguageTile'));
        expect(burmeseLanguageTile, findsOneWidget);
        await tester.tap(burmeseLanguageTile, warnIfMissed: false);
        await tester.pump();
        expect(find.text('ဗမာဘာသာစကား'), findsOneWidget);

        await tester
            .tap(find.byKey(const Key('notificationSettingsLanguagePicker')));
        final vietnameseLanguageTile =
            find.byKey(const Key('vietnameseLanguageTile'));
        expect(vietnameseLanguageTile, findsOneWidget);
        await tester.tap(vietnameseLanguageTile, warnIfMissed: false);
        await tester.pump();
        expect(find.text('Tiếng Việt'), findsOneWidget);

        await tester
            .tap(find.byKey(const Key('notificationSettingsLanguagePicker')));
        final khmerLanguageTile = find.byKey(const Key('khmerLanguageTile'));
        expect(khmerLanguageTile, findsOneWidget);
        await tester.tap(khmerLanguageTile, warnIfMissed: false);
        await tester.pump();
        expect(find.text('ភាសាខ្មែរ'), findsOneWidget);

        await tester
            .tap(find.byKey(const Key('notificationSettingsLanguagePicker')));
        final englishLanguageTile =
            find.byKey(const Key('englishLanguageTile'));
        expect(englishLanguageTile, findsOneWidget);
        await tester.tap(englishLanguageTile, warnIfMissed: false);
        await tester.pump();
        expect(find.text('English'), findsAtLeastNWidgets(1));
      },
    );

    testWidgets(
      'successfully work on tapping for email notifications',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
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
