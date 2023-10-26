import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/payment_notification/payment_notification_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_expiry_notification.dart';
import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
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

class PaymentNotificationMockBloc
    extends MockBloc<PaymentNotificationEvent, PaymentNotificationState>
    implements PaymentNotificationBloc {}

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableLevels = [];
  late final AppRouter autoRouterMock;

  late UserBloc userBloc;
  late AuthBloc authBlocMock;
  late PaymentNotificationBloc paymentNotificationBlocMock;
  late RemoteConfigService remoteConfigServiceMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  setUpAll(() async {
    //setupLocator();
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    locator.registerLazySingleton(() => UserBlocMock());
    locator.registerLazySingleton(() => AnnouncementBlocMock());
    locator.registerLazySingleton(() => AuthBlocMock());
    locator.registerLazySingleton(() => PaymentNotificationMockBloc());
    locator.registerLazySingleton(() => EligibilityBlocMock());
    locator.registerLazySingleton(() => remoteConfigServiceMock);
  });

  group('Notification Settings Page should - ', () {
    Widget getScopedWidget() {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBloc),
            BlocProvider<PaymentNotificationBloc>(
              create: (context) => paymentNotificationBlocMock,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
          ],
          child: const NotificationSettingsPage(),
        ),
      );
    }

    setUp(() {
      userBloc = UserBlocMock();
      paymentNotificationBlocMock = PaymentNotificationMockBloc();
      remoteConfigServiceMock = RemoteConfigServiceMock();
      eligibilityBlocMock = EligibilityBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      when(() => userBloc.state).thenReturn(
        UserState(
          isLoginOnBehalf: false,
          activeLanguage: const Locale(
            ApiLanguageCode.english,
          ),
          user: User.empty().copyWith(
            settings: User.empty().settings.copyWith(
                  languagePreference: const Locale(ApiLanguageCode.english),
                  emailNotifications: false,
                  paymentNotification: PaymentNotification.empty().copyWith(
                    disablePaymentNotification: false,
                    paymentAdviceExpiryNotificationList: [
                      const PaymentAdviceExpiryNotification(
                        day: '3',
                        disabled: false,
                      ),
                      const PaymentAdviceExpiryNotification(
                        day: '5',
                        disabled: false,
                      ),
                      const PaymentAdviceExpiryNotification(
                        day: '7',
                        disabled: false,
                      ),
                    ],
                  ),
                ),
          ),
          userFailureOrSuccessOption: none(),
        ),
      );
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => paymentNotificationBlocMock.state)
          .thenReturn(PaymentNotificationState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            settings: User.empty().settings.copyWith(
                  languagePreference: const Locale(ApiLanguageCode.english),
                  emailNotifications: false,
                  paymentNotification: PaymentNotification.empty().copyWith(
                    disablePaymentNotification: false,
                    paymentAdviceExpiryNotificationList: [
                      const PaymentAdviceExpiryNotification(
                        day: '3',
                        disabled: false,
                      ),
                      const PaymentAdviceExpiryNotification(
                        day: '5',
                        disabled: false,
                      ),
                      const PaymentAdviceExpiryNotification(
                        day: '7',
                        disabled: false,
                      ),
                    ],
                  ),
                ),
          ),
        ),
      );
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
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

    // testWidgets(
    //   'tap on language preferences, changing the language',
    //   (tester) async {
    //     await tester.pumpWidget(getScopedWidget());
    //     await tester
    //         .tap(find.byKey(const Key('gestureDetectorForLanguagePicker')));
    //     await tester.pumpAndSettle();

    //     // select TH
    //     expect(
    //       find.byKey(const Key('notificationSettingsLanguagePicker')),
    //       findsOneWidget,
    //     );
    //     final thaiLanguageTile = find.byKey(const Key('thaiLanguageTile'));
    //     expect(thaiLanguageTile, findsOneWidget);
    //     await tester.tap(thaiLanguageTile, warnIfMissed: false);
    //     await tester.pump();
    //     verify(
    //       () => userBloc.add(
    //         const UserEvent.updateNotificationSettings(
    //           languagePreference: Locale(ApiLanguageCode.thai),
    //           emailNotifications: false,
    //         ),
    //       ),
    //     ).called(1);
    //     expect(find.text('ภาษาไทย'), findsOneWidget);
    //     await tester.pump(const Duration(seconds: 1));

    //     // select TW
    //     await tester
    //         .tap(find.byKey(const Key('notificationSettingsLanguagePicker')));
    //     final mandarinLanguageTile =
    //         find.byKey(const Key('mandarinLanguageTile'));
    //     expect(mandarinLanguageTile, findsOneWidget);
    //     await tester.tap(mandarinLanguageTile, warnIfMissed: false);
    //     await tester.pump();
    //     verify(
    //       () => userBloc.add(
    //         const UserEvent.updateNotificationSettings(
    //           languagePreference: Locale(ApiLanguageCode.mandarin),
    //           emailNotifications: false,
    //         ),
    //       ),
    //     ).called(1);
    //     expect(find.text('繁體中文'), findsOneWidget);
    //     await tester.pump(const Duration(seconds: 1));

    //     // select MM
    //     await tester
    //         .tap(find.byKey(const Key('notificationSettingsLanguagePicker')));
    //     final burmeseLanguageTile =
    //         find.byKey(const Key('burmeseLanguageTile'));
    //     expect(burmeseLanguageTile, findsOneWidget);
    //     await tester.tap(burmeseLanguageTile, warnIfMissed: false);
    //     await tester.pump();
    //     verify(
    //       () => userBloc.add(
    //         const UserEvent.updateNotificationSettings(
    //           languagePreference: Locale(ApiLanguageCode.burmese),
    //           emailNotifications: false,
    //         ),
    //       ),
    //     ).called(1);
    //     expect(find.text('ဗမာဘာသာစကား'), findsOneWidget);
    //     await tester.pump(const Duration(seconds: 1));

    //     // select VN
    //     await tester
    //         .tap(find.byKey(const Key('notificationSettingsLanguagePicker')));
    //     final vietnameseLanguageTile =
    //         find.byKey(const Key('vietnameseLanguageTile'));
    //     expect(vietnameseLanguageTile, findsOneWidget);
    //     await tester.tap(vietnameseLanguageTile, warnIfMissed: false);
    //     await tester.pump();
    //     verify(
    //       () => userBloc.add(
    //         const UserEvent.updateNotificationSettings(
    //           languagePreference: Locale(ApiLanguageCode.vietnamese),
    //           emailNotifications: false,
    //         ),
    //       ),
    //     ).called(1);
    //     expect(find.text('Tiếng Việt'), findsOneWidget);
    //     await tester.pump(const Duration(seconds: 1));

    //     // select KH
    //     await tester
    //         .tap(find.byKey(const Key('notificationSettingsLanguagePicker')));
    //     final khmerLanguageTile = find.byKey(const Key('khmerLanguageTile'));
    //     expect(khmerLanguageTile, findsOneWidget);
    //     await tester.tap(khmerLanguageTile, warnIfMissed: false);
    //     await tester.pump();
    //     verify(
    //       () => userBloc.add(
    //         const UserEvent.updateNotificationSettings(
    //           languagePreference: Locale(ApiLanguageCode.khmer),
    //           emailNotifications: false,
    //         ),
    //       ),
    //     ).called(1);
    //     expect(find.text('ភាសាខ្មែរ'), findsOneWidget);
    //     await tester.pump(const Duration(seconds: 1));

    //     // select EN
    //     await tester
    //         .tap(find.byKey(const Key('notificationSettingsLanguagePicker')));
    //     final englishLanguageTile =
    //         find.byKey(const Key('englishLanguageTile'));
    //     expect(englishLanguageTile, findsOneWidget);
    //     await tester.tap(englishLanguageTile, warnIfMissed: false);
    //     await tester.pump();
    //     verify(
    //       () => userBloc.add(
    //         const UserEvent.updateNotificationSettings(
    //           languagePreference: Locale(ApiLanguageCode.english),
    //           emailNotifications: false,
    //         ),
    //       ),
    //     ).called(1);
    //     expect(find.text('English'), findsAtLeastNWidgets(1));
    //   },
    // );

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
