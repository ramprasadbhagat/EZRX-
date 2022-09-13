import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/auth/proxy_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/material_frame_wrapper.dart';

class ProxyLoginFormBlocMock
    extends MockBloc<ProxyLoginFormEvent, ProxyLoginFormState>
    implements ProxyLoginFormBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  late ProxyLoginFormBloc proxyloginBlocMock;
  late AuthBloc authBlocMock;

  setUpAll(() {
    GetIt.instance.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  });

  group('Proxy Login Screen', () {
    setUp(() {
      proxyloginBlocMock = ProxyLoginFormBlocMock();
      authBlocMock = AuthBlocMock();

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
              optionOf(Right(LoginV2(jwt: JWT('fake-success')))),
        ),
        UserState.initial().copyWith(
          user: User.empty(),
          userFailureOrSuccessOption:
              optionOf(Right(LoginV2(jwt: JWT('fake-success')))),
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
  });
}
