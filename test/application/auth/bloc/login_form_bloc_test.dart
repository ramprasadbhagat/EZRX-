import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/error/auth_failure.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepoMock extends Mock implements AuthRepository {}

void main() {
  final AuthRepository authRepoMock = AuthRepoMock();
  final fakeUser = Username('fake-user');
  final fakePassword = Password.login('fake-password');
  final fakeJWT = JWT('fake-success');

  var loginFormState = LoginFormState.initial();

  final credMock = Cred(
    username: fakeUser,
    password: fakePassword,
  );
  group('Login Form Bloc', () {
    blocTest(
      'Create bloc and load last saved cred fail',
      build: () => LoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );
      },
      expect: () => [],
    );

    blocTest(
      'Create bloc and load last saved cred success',
      build: () => LoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential())
            .thenAnswer((invocation) async => Right(credMock));
      },
      expect: () => [
        loginFormState.copyWith(
          username: credMock.username,
          password: credMock.password,
          rememberPassword: true,
          authFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'Change username',
      build: () => LoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.usernameChanged('new-username-fake')),
      expect: () => [
        loginFormState.copyWith(
          username: Username('new-username-fake'),
          authFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'Change password',
      build: () => LoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.passwordChanged('new-password-fake')),
      expect: () => [
        loginFormState.copyWith(
          password: Password.login('new-password-fake'),
          authFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'Change password visible',
      build: () => LoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.passwordVisibilityChanged()),
      expect: () => [
        loginFormState.copyWith(
          passwordVisible: !loginFormState.passwordVisible,
          authFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'Change remember password',
      build: () => LoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.rememberCheckChanged()),
      expect: () => [
        loginFormState.copyWith(
          rememberPassword: !loginFormState.rememberPassword,
          authFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'Login with okta button failed',
      build: () => LoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );

        when(() => authRepoMock.loginWithOkta()).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.loginWithOktaButtonPressed()),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          authFailureOrSuccessOption: optionOf(
            const Left(
              AuthFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Login with okta button success',
      build: () => LoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.loginWithOkta(),
        ).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) =>
          bloc.add(const LoginFormEvent.loginWithOktaButtonPressed()),
      expect: () => [
        loginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          authFailureOrSuccessOption: optionOf(
            const Left(
              AuthFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Login with email fail',
      build: () => LoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );

        when(() =>
                authRepoMock.login(username: fakeUser, password: fakePassword))
            .thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );
      },
      act: (LoginFormBloc bloc) => bloc
        ..add(const LoginFormEvent.usernameChanged('fake-user'))
        ..add(const LoginFormEvent.passwordChanged('fake-password'))
        ..add(const LoginFormEvent.loginWithEmailAndPasswordPressed()),
      expect: () => [
        loginFormState = loginFormState.copyWith(username: fakeUser),
        loginFormState = loginFormState.copyWith(password: fakePassword),
        loginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            const Left(
              AuthFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Login with email success',
      build: () => LoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        loginFormState = LoginFormState.initial();
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            AuthFailure.other('fake-error'),
          ),
        );

        when(() =>
                authRepoMock.login(username: fakeUser, password: fakePassword))
            .thenAnswer(
          (invocation) async => Right(LoginV2(jwt: fakeJWT)),
        );

        when(() => authRepoMock.storeJWT(jwt: fakeJWT)).thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(() => authRepoMock.deleteCredential()).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (LoginFormBloc bloc) => bloc
        ..add(const LoginFormEvent.usernameChanged('fake-user'))
        ..add(const LoginFormEvent.passwordChanged('fake-password'))
        ..add(const LoginFormEvent.loginWithEmailAndPasswordPressed()),
      expect: () => [
        loginFormState = loginFormState.copyWith(username: fakeUser),
        loginFormState = loginFormState.copyWith(password: fakePassword),
        loginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        loginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            Right(LoginV2(jwt: fakeJWT)),
          ),
        ),
      ],
    );
  });
}
