import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password_cred.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/presentation/auth/reset_password/reset_password_page.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class ResetPasswordBlocMock
    extends MockBloc<ResetPasswordEvent, ResetPasswordState>
    implements ResetPasswordBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AppRouterMock extends Mock implements AppRouter {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

final locator = GetIt.instance;

void main() {
  late AppRouter autoRouterMock;
  late ResetPasswordBloc resetPasswordBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AuthBloc authBlocMock;

  final fakeValidPassword =
      Password.confirm('new-password@N9', 'new-password@N9');

  final fakeInValidPassword = Password.confirm('FakeP@55word', 'FakeP@55word');

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouterMock());
  });
  group('ResetPasswordPage', () {
    setUp(() {
      autoRouterMock = locator<AppRouterMock>();
      resetPasswordBlocMock = ResetPasswordBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      authBlocMock = AuthBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
      when(() => autoRouterMock.currentPath).thenReturn('reset_password');
      when(() => resetPasswordBlocMock.state)
          .thenReturn(ResetPasswordState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
    });

    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        routeName: ForgetPasswordPageRoute.name,
        usingLocalization: true,
        providers: [
          BlocProvider<ResetPasswordBloc>(
            create: (context) => resetPasswordBlocMock,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: const Scaffold(body: ResetPasswordPage()),
      );
    }

    testWidgets('Test all widgets visibility', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final newPasswordField = find.byKey(WidgetKeys.newPasswordTextField);
      final newPasswordHintText = find.text('Enter your new password');
      final confirmPasswordField = find.byKey(WidgetKeys.confirmPasswordField);
      final confirmPasswordHintText =
          find.text('Enter your new password again');
      final passwordValidationTitle =
          find.text('Your new password should have :');
      final minTenChars = find.text('Minimum length of 10 characters');
      final oneUpperCase =
          find.text('At least 1 Upper case character (A to Z)');
      final oneLoweCase = find.text('At least 1 Lower case character (a to z)');
      final numericChar = find.text('At least a numeric character (0 to 9)');
      final specialChar = find.text(
        'At least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )',
      );
      final twoRepeatingChars = find.text(
        'New password cannot contain more than 2 consecutive characters from username and/or name of the user',
      );
      final resetPasswordButton = find.byKey(WidgetKeys.resetPasswordButton);
      final backToLoginButton = find.byKey(WidgetKeys.loginSubmitButton);

      expect(newPasswordField, findsOneWidget);
      expect(newPasswordHintText, findsOneWidget);
      expect(confirmPasswordField, findsOneWidget);
      expect(confirmPasswordHintText, findsOneWidget);
      expect(passwordValidationTitle, findsOneWidget);
      expect(minTenChars, findsOneWidget);
      expect(oneUpperCase, findsOneWidget);
      expect(oneLoweCase, findsOneWidget);
      expect(numericChar, findsOneWidget);
      expect(specialChar, findsOneWidget);
      expect(twoRepeatingChars, findsOneWidget);
      expect(resetPasswordButton, findsOneWidget);
      expect(backToLoginButton, findsOneWidget);
    });

    testWidgets(
        'Enter New Password that does not meet the requirements and reset password button disabled',
        (WidgetTester tester) async {
      final expectedStates = [
        ResetPasswordState.initial(),
        ResetPasswordState.initial().copyWith(
          showErrorMessages: true,
          newPassword: Password.resetV2('', '', 'fake-user'),
        ),
      ];
      whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final warning = find.byKey(WidgetKeys.errorRequirementsFillAllField);
      final confirmPasswordEmptyWarning =
          find.text('Confirm password cannot be empty.');

      expect(warning, findsOneWidget);
      expect(confirmPasswordEmptyWarning, findsOneWidget);

      final resetPasswordButton = find.byKey(WidgetKeys.resetPasswordButton);

      await tester.tap(resetPasswordButton);
      await tester.pumpAndSettle();
      verifyNever(
        () => resetPasswordBlocMock.add(
          const ResetPasswordEvent.resetPassword(),
        ),
      );
    });

    testWidgets('test confirm password does not match with new password',
        (WidgetTester tester) async {
      final expectedStates = [
        ResetPasswordState.initial(),
        ResetPasswordState.initial().copyWith(
          showErrorMessages: true,
          newPassword: Password.confirm('new-password@N9', 'new-password'),
          confirmPassword: Password.confirm('new-password', 'new-password@N9'),
        ),
      ];
      whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final passwordMismatchWarning = find.text('Password mismatch');
      final checkIcon = find.byIcon(Icons.check);

      expect(passwordMismatchWarning, findsOneWidget);
      expect(checkIcon, findsNWidgets(6));

      final resetPasswordButton = find.byKey(WidgetKeys.resetPasswordButton);
      expect(resetPasswordButton, findsOneWidget);
      await tester.tap(resetPasswordButton);
      await tester.pumpAndSettle();
      verifyNever(
        () => resetPasswordBlocMock.add(
          const ResetPasswordEvent.resetPassword(),
        ),
      );
    });

    testWidgets(
        'test new password must not contain more than two consecutive characters of username',
        (WidgetTester tester) async {
      when(() => resetPasswordBlocMock.state).thenReturn(
        ResetPasswordState.initial().copyWith(
          showErrorMessages: true,
          resetPasswordCred: ResetPasswordCred.empty().copyWith(
            username: Username('test-P@5-'),
          ),
          newPassword: fakeInValidPassword,
          confirmPassword: fakeInValidPassword,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final bullets = find.byIcon(Icons.circle);

      final checkIcon = find.byIcon(Icons.check);

      expect(checkIcon, findsNWidgets(5));
      expect(bullets, findsOneWidget);
    });

    testWidgets('test New Password and confirm password meet all requirements',
        (WidgetTester tester) async {
      final expectedStates = [
        ResetPasswordState.initial(),
        ResetPasswordState.initial().copyWith(
          showErrorMessages: true,
          newPassword: fakeValidPassword,
          confirmPassword: fakeValidPassword,
        ),
      ];
      whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final passwordMismatchWarning = find.text('Password mismatch');
      final checkIcon = find.byIcon(Icons.check);
      final warning = find.byKey(WidgetKeys.errorRequirementsFillAllField);

      expect(passwordMismatchWarning, findsNothing);
      expect(checkIcon, findsNWidgets(6));
      expect(warning, findsNothing);

      final resetPasswordButton = find.byKey(WidgetKeys.resetPasswordButton);
      expect(resetPasswordButton, findsOneWidget);
      await tester.tap(resetPasswordButton);
      await tester.pump();

      verify(
        () => resetPasswordBlocMock.add(
          const ResetPasswordEvent.resetPassword(),
        ),
      ).called(1);
    });
  });
}
