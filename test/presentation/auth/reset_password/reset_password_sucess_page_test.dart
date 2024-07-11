import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/presentation/auth/reset_password_success/reset_password_success_page.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AppRouterMock extends Mock implements AppRouter {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MaterialPageXMock extends Mock implements AutoRoutePage {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

final locator = GetIt.instance;

void main() {
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late AnnouncementBloc announcementBlocMock;

  late AuthBloc authBlocMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouterMock());
  });
  group('ResetPasswordPageSuccess', () {
    setUp(() {
      autoRouterMock = locator<AppRouterMock>();

      announcementBlocMock = AnnouncementBlocMock();
      authBlocMock = AuthBlocMock();
      mockUserBloc = MockUserBloc();
      when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => autoRouterMock.currentPath)
          .thenReturn('reset_password_success');

      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
    });

    Widget getWidget({bool isFirstLogin = false}) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        routeName: ResetPasswordSuccessRoute.name,
        usingLocalization: true,
        providers: [
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          ),
          BlocProvider<UserBloc>(
            create: (context) => mockUserBloc,
          ),
        ],
        child: ResetPasswordSuccess(isFirstLogin: isFirstLogin),
      );
    }

    testWidgets('test ResetPasswordSuccess load widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final logo = find.byType(Logo);
      final newPasswordSavedText = find.text('New password saved!');
      final passwordChangeSuccess =
          find.text('You have successfully changed \n your password.');
      final resetPasswordPageBodyTextForFirstLogin =
          find.byKey(WidgetKeys.resetPasswordPageBodyTextForFirstLogin);
      final loginButton = find.byKey(WidgetKeys.changePasswordButton);

      expect(logo, findsOneWidget);
      expect(resetPasswordPageBodyTextForFirstLogin, findsNothing);
      expect(newPasswordSavedText, findsOneWidget);
      expect(passwordChangeSuccess, findsOneWidget);

      expect(loginButton, findsOneWidget);
    });

    testWidgets(
        'test ResetPasswordSuccess load widgets for the first time login',
        (WidgetTester tester) async {
      await tester.pumpWidget(getWidget(isFirstLogin: true));
      await tester.pumpAndSettle();

      final logo = find.byType(Logo);
      final newPasswordSavedText = find.text('New password saved!');
      final passwordChangeSuccess =
          find.text('You have successfully changed \n your password.');
      final resetPasswordPageBodyTextForFirstLogin =
          find.byKey(WidgetKeys.resetPasswordPageBodyTextForFirstLogin);
      final loginButton = find.byKey(WidgetKeys.changePasswordButton);

      expect(logo, findsNothing);
      expect(resetPasswordPageBodyTextForFirstLogin, findsOneWidget);
      expect(newPasswordSavedText, findsOneWidget);
      expect(passwordChangeSuccess, findsNothing);

      expect(loginButton, findsNothing);
    });

    testWidgets('test Login Button on pressed', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final loginButton = find.byKey(WidgetKeys.changePasswordButton);

      expect(loginButton, findsOneWidget);
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      when(
        () => autoRouterMock.popUntilRouteWithName(LoginPageRoute.name),
      ).thenAnswer((invocation) => true);
      verify(
        () => autoRouterMock.popUntilRouteWithName(LoginPageRoute.name),
      ).called(1);
    });

    testWidgets('test auto route after 5 seconds for the first time login',
        (tester) async {
      when(
        () => autoRouterMock.replaceAll([
          const SplashPageRoute(),
          const HomeNavigationTabbarRoute(),
        ]),
      ).thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getWidget(isFirstLogin: true));
      await tester.pumpAndSettle();

      final loginButton = find.byKey(WidgetKeys.changePasswordButton);

      expect(loginButton, findsNothing);
      await tester.pumpAndSettle(const Duration(seconds: 6));

      verify(
        () => mockUserBloc.add(const UserEvent.fetch()),
      ).called(1);
      verify(
        () => autoRouterMock.replaceAll([
          const SplashPageRoute(),
          const HomeNavigationTabbarRoute(),
        ]),
      ).called(1);
    });
  });
}
