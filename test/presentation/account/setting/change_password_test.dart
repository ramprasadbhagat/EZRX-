import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password_entities.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/change_password_repository.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/change_password/change_password_page.dart';
import 'package:ezrxmobile/presentation/account/settings_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/tester_utils.dart';

class ResetPasswordBlocMock
    extends MockBloc<ResetPasswordEvent, ResetPasswordState>
    implements ResetPasswordBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockResetPassword extends Mock implements ChangePasswordRepository {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ResetPasswordBloc resetPasswordBlocMock;
  late AuthBloc authBlocMock;
  late UserBloc mockUserBloc;
  late AppRouter autoRouterMock;
  setUpAll(() async {
    setupLocator();
  });

  group('ChangePassword Test', () {
    setUp(() {
      resetPasswordBlocMock = ResetPasswordBlocMock();
      mockUserBloc = MockUserBloc();
      authBlocMock = AuthBlocMock();
      autoRouterMock = locator<AppRouter>();
    });

     Future getScopedWidget(Widget home, WidgetTester tester) {
      return TesterUtils.setUpLocalizationWrapper(
        tester: tester,
        home: home,
        locale: const Locale('en', 'SG'),
        isAutoRouteEnabled: true,
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AuthBloc>(create: ((context) => authBlocMock)),
          BlocProvider<UserBloc>(create: (context) => mockUserBloc),
          BlocProvider<ResetPasswordBloc>(
            create: (context) => resetPasswordBlocMock,
          ),
        ],
      );
      
    }

    testWidgets('Tap Change Password', (tester) async {
      await getScopedWidget( const SettingsPage(),tester);
      await tester.pump();
      final changepasswordOnTap = find.byKey(const Key('changePasswordTile'));
      expect(changepasswordOnTap, findsOneWidget);
      await tester.tap(changepasswordOnTap);
      await tester.pump();
      expect(autoRouterMock.current.name, ChangePasswordPageRoute.name);
    });

    testWidgets('Change Password Page', (tester) async {
      final expectedStates = [ResetPasswordState.initial()];
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => resetPasswordBlocMock.state)
          .thenReturn(ResetPasswordState.initial());
      whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));
      await getScopedWidget(const ChangePasswordPage(),tester);
      final changePasswordForm = find.byKey(const Key('changePasswordFrom'));
      final resetPasswordValidation =
          find.byKey(const Key('resetPasswordValidation'));
      final resetPasswordButton = find.byKey(const Key('resetPasswordButton'));
      final noteText = find.byKey(const Key('noteText'));
      expect(changePasswordForm, findsOneWidget);
      expect(resetPasswordValidation, findsOneWidget);
      expect(noteText, findsOneWidget);
      expect(resetPasswordButton, findsOneWidget);
      await tester.pump();
      final changePasswordButton =
          find.byKey(const Key('changePasswordButton'));
      expect(changePasswordButton, findsOneWidget);
    });

    testWidgets('Change Password Form', (tester) async {
      final expectedStates = [ResetPasswordState.initial()];
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => resetPasswordBlocMock.state)
          .thenReturn(ResetPasswordState.initial());
      whenListen(resetPasswordBlocMock, Stream.fromIterable(expectedStates));

      /// Finders for form fields ///
      await getScopedWidget(const ChangePasswordPage(),tester);
      final oldPasswordTextField =
          find.byKey(const Key('oldPasswordTextField'));
      final newPasswordTextField =
          find.byKey(const Key('newPasswordTextField'));
      final confirmPasswordTextField =
          find.byKey(const Key('confirmPasswordTextField'));
      expect(oldPasswordTextField, findsOneWidget);
      expect(newPasswordTextField, findsOneWidget);
      expect(confirmPasswordTextField, findsOneWidget);
      await tester.pump();

      /// Password Fields Enter text validations ///
      await tester.enterText(oldPasswordTextField, 'Auron@2022');
      await tester.enterText(newPasswordTextField, 'Auron@2022!');
      await tester.enterText(confirmPasswordTextField, 'Auron@2022!');
      final oldPasswordText = find.text('Auron@2022');
      final newPasswordText = find.text('Auron@2022');
      final confirmPasswordText = find.text('Auron@2022');
      expect(oldPasswordText, findsOneWidget);
      expect(newPasswordText, findsOneWidget);
      expect(confirmPasswordText, findsOneWidget);
      await tester.pump();

      /// Old Password Validation ///
      final oldpasswordvalidationtextFinder = find.text('Enter Old Password.');
      final oldvalidationMessageFinder = find.descendant(
          of: oldPasswordTextField, matching: oldpasswordvalidationtextFinder);
      expect(oldvalidationMessageFinder, findsOneWidget);
      await tester.pump();
      final oldPasswordToggle = find.byKey(const Key('oldPasswordToggle'));
      expect(oldPasswordToggle, findsOneWidget);
      await tester.tap(oldPasswordToggle);
      await tester.pump();

      /// New Password Validations ///
      final newpasswordvalidationtextFinder = find.text('Enter New Password.');
      final newvalidationMessageFinder = find.descendant(
          of: newPasswordTextField, matching: newpasswordvalidationtextFinder);
      expect(newvalidationMessageFinder, findsOneWidget);
      final newPasswordToggle = find.byKey(const Key('newPasswordToggle'));
      expect(newPasswordToggle, findsOneWidget);
      await tester.tap(newPasswordToggle);
      await tester.pump();

      /// Confirm Password Validation ///
      final confirmpasswordvalidationtextFinder =
          find.text('Enter Confirm Password.');
      final confirmvalidationMessageFinder = find.descendant(
          of: confirmPasswordTextField,
          matching: confirmpasswordvalidationtextFinder);
      expect(confirmvalidationMessageFinder, findsOneWidget);
      final confirmPasswordToggle =
          find.byKey(const Key('confirmPasswordToggle'));
      expect(confirmPasswordToggle, findsOneWidget);
      await tester.tap(confirmPasswordToggle);
      await tester.pump();
    });

    testWidgets('Failure Change Password Button', (tester) async {
      final expectedfailureStates = [
        ResetPasswordState.initial().copyWith(
            passwordResetFailureOrSuccessOption: optionOf(
          const Left(ApiFailure.other('fake-message')),
        ))
      ];
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => resetPasswordBlocMock.state)
          .thenReturn(ResetPasswordState.initial());
      whenListen(
          resetPasswordBlocMock, Stream.fromIterable(expectedfailureStates));
      await getScopedWidget(const ChangePasswordPage(),tester);
      await tester.pump();
      final changePasswordButton =
          find.byKey(const Key('changePasswordButton'));
      final errorMessage = find.byKey(const Key('snackBarMessage'));
      expect(changePasswordButton, findsOneWidget);
      expect(errorMessage, findsOneWidget);
      await tester.tap(changePasswordButton);
    });

    testWidgets('Sucess Change Password Button', (tester) async {
      final expectedSuccessStates = [
        ResetPasswordState.initial().copyWith(
            passwordResetFailureOrSuccessOption: optionOf(const Right(
                ResetPasswordEntities(success: true, status: 'Success'))))
      ];
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => resetPasswordBlocMock.state)
          .thenReturn(ResetPasswordState.initial());
      whenListen(
          resetPasswordBlocMock, Stream.fromIterable(expectedSuccessStates));
      await getScopedWidget(const ChangePasswordPage(),tester);
      await tester.pump();
      final changePasswordButton =
          find.byKey(const Key('changePasswordButton'));
      final errorMessage = find.byKey(const Key('snackBarMessage'));
      expect(changePasswordButton, findsOneWidget);
      await tester.tap(changePasswordButton);
      expect(errorMessage, findsOneWidget);
    });
  });
}