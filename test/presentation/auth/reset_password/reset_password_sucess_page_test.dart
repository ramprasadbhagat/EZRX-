import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/presentation/auth/reset_password_success/reset_password_success_page.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
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

class MaterialPageXMock extends Mock implements MaterialPageX {}

final locator = GetIt.instance;

void main() {
  late AppRouter autoRouterMock;

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
      when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => autoRouterMock.currentPath)
          .thenReturn('reset_password_success');

      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    });

    Widget getWidget() {
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
        ],
        child: const ResetPasswordSuccess(),
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
      final loginButton = find.byKey(WidgetKeys.changePasswordButton);

      expect(logo, findsOneWidget);
      expect(newPasswordSavedText, findsOneWidget);
      expect(passwordChangeSuccess, findsOneWidget);

      expect(loginButton, findsOneWidget);
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
  });
}
