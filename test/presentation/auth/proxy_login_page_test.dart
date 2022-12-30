import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/auth/proxy_login_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/material_frame_wrapper.dart';
import '../../utils/widget_utils.dart';

class ProxyLoginFormBlocMock
    extends MockBloc<ProxyLoginFormEvent, ProxyLoginFormState>
    implements ProxyLoginFormBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late ProxyLoginFormBloc proxyloginBlocMock;
  late AuthBloc authBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late UserBloc userBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(() {
    GetIt.instance.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    GetIt.instance.registerLazySingleton(() => AppRouter());
  });

  group('Proxy Login Screen', () {
    setUp(() {
      proxyloginBlocMock = ProxyLoginFormBlocMock();
      authBlocMock = AuthBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      userBlocMock = UserBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      autoRouterMock = GetIt.instance<AppRouter>();

      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());

      when(() => proxyloginBlocMock.state)
          .thenReturn(ProxyLoginFormState.initial());
    });

    testWidgets("Test don't have AD credential", (tester) async {
      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: BlocProvider<ProxyLoginFormBloc>(
            create: (context) => proxyloginBlocMock,
            child: const LoginOnBehalfPage(),
          ),
        ),
      );

      // Create the Finders.
      final userNameTextField =
          find.byKey(const Key('proxyLoginUsernameField'));
      final proxyLoginSubmitButton =
          find.byKey(const Key('proxyLoginSubmitButton'));

      expect(userNameTextField, findsOneWidget);
      expect(proxyLoginSubmitButton, findsOneWidget);
    });

    testWidgets('Test Proxy login error', (tester) async {
      final expectedStates = [
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-message'))),
          showErrorMessages: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.serverError('fake-message'))),
          showErrorMessages: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.poorConnection())),
          showErrorMessages: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.serverError('fake-message'))),
          showErrorMessages: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.accountExpired())),
          showErrorMessages: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.accountLocked())),
          showErrorMessages: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption: optionOf(
              const Left(ApiFailure.invalidEmailAndPasswordCombination())),
          showErrorMessages: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.serverTimeout())),
          showErrorMessages: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.tokenExpired())),
          showErrorMessages: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.tokenExpired())),
          showErrorMessages: true,
        ),
      ];

      whenListen(proxyloginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: BlocProvider<ProxyLoginFormBloc>(
            create: (context) => proxyloginBlocMock,
            child: const LoginOnBehalfPage(),
          ),
        ),
      );

      final errorMessage = find.byKey(const Key('snackBarMessage'));

      expect(errorMessage, findsNothing);
      await tester.pump();

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('Test Proxy login success', (tester) async {
      final expectedStates = [
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(Right(Login(jwt: JWT('fake-success')))),
        ),
        UserState.initial().copyWith(
          user: User.empty(),
          userFailureOrSuccessOption:
              optionOf(Right(Login(jwt: JWT('fake-success')))),
        )
      ];
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());

      whenListen(proxyloginBlocMock, Stream.fromIterable(expectedStates));
      final userNameTextField =
          find.byKey(const Key('proxyLoginUsernameField'));
      final proxyLoginSubmitButton =
          find.byKey(const Key('proxyLoginSubmitButton'));

      expect(userNameTextField, findsNothing);
      expect(proxyLoginSubmitButton, findsNothing);
    });

    testWidgets('Test Proxy login success with listner', (tester) async {
      final expectedStates = [
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption: none(),
        ),
        ProxyLoginFormState.initial().copyWith(
          authFailureOrSuccessOption:
              optionOf(Right(Login(jwt: JWT('fake-success')))),
        ),
      ];
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());
      when(() => userBlocMock.state).thenReturn(UserState.initial());

      whenListen(proxyloginBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<ProxyLoginFormBloc>(
              create: (context) => proxyloginBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(
              create: (context) => salesOrgBlocMock,
            ),
            BlocProvider<UserBloc>(
              create: (context) => userBlocMock,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
          ],
          child: const LoginOnBehalfPage(),
        ),
      );
      final userNameTextField =
          find.byKey(const Key('proxyLoginUsernameField'));
      expect(userNameTextField, findsOneWidget);
      await tester.enterText(userNameTextField, 'syadev');
      await tester.pump();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      final proxyLoginSubmitButton =
          find.byKey(const Key('proxyLoginSubmitButton'));

      expect(proxyLoginSubmitButton, findsOneWidget);
      await tester.tap(proxyLoginSubmitButton);
      await tester.pump();
    });

    testWidgets('username is valid', (tester) async {
      final expectedStates = [
        ProxyLoginFormState.initial().copyWith(
          username: Username('validname1'),
          showErrorMessages: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          username: Username('validname'),
          showErrorMessages: true,
        ),
      ];
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => proxyloginBlocMock.state).thenReturn(
        ProxyLoginFormState.initial().copyWith(
          username: Username('validname'),
          showErrorMessages: true,
        ),
      );

      whenListen(proxyloginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<ProxyLoginFormBloc>(
              create: (context) => proxyloginBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(
              create: (context) => salesOrgBlocMock,
            ),
            BlocProvider<UserBloc>(
              create: (context) => userBlocMock,
            ),
          ],
          child: const LoginOnBehalfPage(),
        ),
      );
      await tester.pump(const Duration(
        seconds: 2,
      ));
      await tester.enterText(
          find.byKey(const Key('proxyLoginUsernameField')), 'syadev');
      await tester.pump(const Duration(
        seconds: 2,
      ));
      expect(find.byKey(const Key('proxyLoginUsernameField')), findsOneWidget);
    });
  });
}
