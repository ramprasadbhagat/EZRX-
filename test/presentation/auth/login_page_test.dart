import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/announcement/bloc/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/presentation/auth/login_page.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/material_frame_wrapper.dart';

class LoginFormBlocMock extends MockBloc<LoginFormEvent, LoginFormState>
    implements LoginFormBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AnnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

void main() {
  late LoginFormBloc loginBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late Announcement announcementMock;

  setUpAll(() async {
    GetIt.instance.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    announcementMock = await AnnouncementLocalDataSource().getAnnouncements();
  });

  group('Login Screen', () {
    setUp(() {
      loginBlocMock = LoginFormBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnnouncementBlocMock();

      when(() => loginBlocMock.state).thenReturn(LoginFormState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    });
    testWidgets("Test don't have credential", (tester) async {
      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LoginFormBloc>(
                create: (context) => loginBlocMock,
              ),
              BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock,
              ),
            ],
            child: const LoginPage(),
          ),
        ),
      );
      // Create the Finders.
      final userNameTextField = find.byKey(const Key('loginUsernameField'));
      final passwordTextField = find.byKey(const Key('loginPasswordField'));
      final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
      final ssoLoginButton = find.byKey(const Key('ssoLoginButton'));
      final rememberPassWordCheckBox =
          find.byKey(const Key('loginRememberPasswordCheckbox'));

      expect(userNameTextField, findsOneWidget);
      expect(passwordTextField, findsOneWidget);
      expect(loginSubmitButton, findsOneWidget);
      expect(ssoLoginButton, findsOneWidget);
      expect(rememberPassWordCheckBox, findsOneWidget);
    });

    testWidgets('Test login error', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          authFailureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake-message')),
          ),
          showErrorMessages: true,
        ),
      ];

      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LoginFormBloc>(
                create: (context) => loginBlocMock,
              ),
              BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock,
              ),
            ],
            child: const LoginPage(),
          ),
        ),
      );

      final errorMessage = find.byKey(const Key('snackBarMessage'));

      expect(errorMessage, findsNothing);
      await tester.pump();

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('Test login success', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          authFailureOrSuccessOption: optionOf(
            Right(Login(jwt: JWT('fake-success'))),
          ),
        ),
      ];

      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());

      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LoginFormBloc>(
                create: (context) => loginBlocMock,
              ),
              BlocProvider<AuthBloc>(
                create: (context) => authBlocMock,
              ),
              BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock,
              ),
            ],
            child: const LoginPage(),
          ),
        ),
      );

      await tester.pump();

      await tester.pumpWidget(MaterialFrameWrapper(
        child: BlocProvider(
          create: (context) => authBlocMock,
          child: const SplashPage(),
        ),
      ));

      // Create the Finders.
      final userNameTextField = find.byKey(const Key('loginUsernameField'));
      final passwordTextField = find.byKey(const Key('loginPasswordField'));
      final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
      final ssoLoginButton = find.byKey(const Key('ssoLoginButton'));
      final rememberPassWordCheckBox =
          find.byKey(const Key('loginRememberPasswordCheckbox'));

      expect(userNameTextField, findsNothing);
      expect(passwordTextField, findsNothing);
      expect(loginSubmitButton, findsNothing);
      expect(ssoLoginButton, findsNothing);
      expect(rememberPassWordCheckBox, findsNothing);
    });

    testWidgets("Test don't have credential and have announcement",
        (tester) async {
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial().copyWith(
          announcement: announcementMock,
          isLoading: false,
        ),
      );

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LoginFormBloc>(
                create: (context) => loginBlocMock,
              ),
              BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock,
              ),
            ],
            child: const LoginPage(),
          ),
        ),
      );

      final userNameTextField = find.byKey(const Key('loginUsernameField'));
      final passwordTextField = find.byKey(const Key('loginPasswordField'));
      final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
      final ssoLoginButton = find.byKey(const Key('ssoLoginButton'));
      final rememberPassWordCheckBox =
          find.byKey(const Key('loginRememberPasswordCheckbox'));

      expect(userNameTextField, findsOneWidget);
      expect(passwordTextField, findsOneWidget);
      expect(loginSubmitButton, findsOneWidget);
      expect(ssoLoginButton, findsOneWidget);
      expect(rememberPassWordCheckBox, findsOneWidget);

      final loadingIndicator =
          find.byKey(const Key('announcementLoadingIndicator'));
      final reloadIcon = find.byKey(const Key('announcementReloadIcon'));
      final announcementDescription =
          find.byKey(const Key('announcementDescription'));
      final closeIcon = find.byKey(const Key('announcementCloseIcon'));

      expect(loadingIndicator, findsNothing);
      expect(reloadIcon, findsOneWidget);
      expect(announcementDescription, findsOneWidget);
      expect(closeIcon, findsOneWidget);
    });
  });
}
