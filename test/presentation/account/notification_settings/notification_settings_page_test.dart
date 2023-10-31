import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/notification_settings/notification_settings_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_local.dart';
import 'package:ezrxmobile/presentation/account/notification_settings/notification_settings_page.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class AutoRouterMock extends Mock implements AppRouter {}

class NotificationSettingsBlocMock
    extends MockBloc<NotificationSettingsEvent, NotificationSettingsState>
    implements NotificationSettingsBloc {}

final locator = GetIt.instance;

void main() {
  late AppRouter autoRouterMock;
  late NotificationSettingsBloc notificationSettingsBlocMock;
  late NotificationSettings settingsMock;
  late NotificationSettings newSettingsMock;
  const fakeError = ApiFailure.other('fake-error');

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => notificationSettingsBlocMock);
    settingsMock =
        await NotificationSettingsLocalDataSource().getNotificationSettings();
    newSettingsMock = settingsMock.copyWith(
      orderConfirmation: NotificationSetting(true),
    );
    notificationSettingsBlocMock = NotificationSettingsBlocMock();
    autoRouterMock = locator<AppRouter>();
    when(() => notificationSettingsBlocMock.state).thenReturn(
      NotificationSettingsState.initial(),
    );
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<NotificationSettingsBloc>(
          create: (context) => notificationSettingsBlocMock,
        ),
      ],
      child: const Scaffold(
        body: NotificationSettingsPage(),
      ),
    );
  }

  group(
    'Notification Settings Page',
    () {
      testWidgets(
        'Test Page Display',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          expect(find.byType(AppBar), findsOneWidget);
          final clearButtonFinder =
              find.byKey(WidgetKeys.notificationSettingsClearButton);
          expect(clearButtonFinder, findsOneWidget);
          final submitButtonFinder =
              find.byKey(WidgetKeys.notificationSettingsSubmitButton);
          expect(submitButtonFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Test Page Fetch Failure Show SnackBar Error',
        (tester) async {
          final expectedState = [
            NotificationSettingsState.initial().copyWith(
              failureOrSuccessOption: optionOf(
                const Left(
                  fakeError,
                ),
              ),
            ),
          ];
          whenListen(
            notificationSettingsBlocMock,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final snackBarFinder = find.byKey(WidgetKeys.customSnackBar);
          expect(snackBarFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Test  Submit Failure Show SnackBar Error',
        (tester) async {
          final expectedState = [
            NotificationSettingsState.initial().copyWith(
              submitFailureOrSuccessOption: optionOf(
                const Left(
                  fakeError,
                ),
              ),
            ),
          ];
          whenListen(
            notificationSettingsBlocMock,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final snackBarFinder = find.byKey(WidgetKeys.customSnackBar);
          expect(snackBarFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Test  Submit Success Show SnackBar Success',
        (tester) async {
          final expectedState = [
            NotificationSettingsState.initial().copyWith(
              submitFailureOrSuccessOption: optionOf(
                Right(NotificationSettings.empty()),
              ),
            ),
          ];
          whenListen(
            notificationSettingsBlocMock,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final snackBarFinder =
              find.byKey(WidgetKeys.notificationSettingsSuccessSnackBar);
          expect(snackBarFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Test On Tap Order Confirmation Tile',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final tileFinder = find.byKey(WidgetKeys.orderConfirmationTile);
          expect(tileFinder, findsOneWidget);
          await tester.tap(tileFinder);
          verify(
            () => notificationSettingsBlocMock.add(
              const NotificationSettingsEvent.updateOrderConfirmation(
                value: true,
              ),
            ),
          );
        },
      );

      testWidgets(
        'Test On Tap Payment Confirmation Tile',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final tileFinder = find.byKey(WidgetKeys.paymentConfirmationTile);
          expect(tileFinder, findsOneWidget);
          await tester.tap(tileFinder);
          verify(
            () => notificationSettingsBlocMock.add(
              const NotificationSettingsEvent.updatePaymentConfirmation(
                value: true,
              ),
            ),
          );
        },
      );

      testWidgets(
        'Test On Tap Clear Changes Button',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final clearButtonFinder =
              find.byKey(WidgetKeys.notificationSettingsClearButton);

          await tester.tap(clearButtonFinder);
          verify(
            () => notificationSettingsBlocMock.add(
              const NotificationSettingsEvent.clear(),
            ),
          );
        },
      );

      testWidgets(
        'Test On Tap Submit Button',
        (tester) async {
          when(() => notificationSettingsBlocMock.state).thenReturn(
            NotificationSettingsState.initial().copyWith(
              currentNotificationSettings: settingsMock,
              previousNotificationSettings: newSettingsMock,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final submitButtonFinder =
              find.byKey(WidgetKeys.notificationSettingsSubmitButton);

          await tester.tap(submitButtonFinder);
          verify(
            () => notificationSettingsBlocMock.add(
              const NotificationSettingsEvent.submit(),
            ),
          );
        },
      );
    },
  );
}
