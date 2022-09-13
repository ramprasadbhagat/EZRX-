import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepoMock extends Mock implements AuthRepository {}

void main() {
  final AuthRepository authRepoMock = AuthRepoMock();
  final fakeUser = Username('fake-proxy_user');
  final fakeJWT = JWT('fake-porxy_success');

  var proxyloginFormState = ProxyLoginFormState.initial();

  group('ProxyLogin Form Bloc', () {
    blocTest(
      'Change username',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
          .add(const ProxyLoginFormEvent.usernameChanged('new-username-fake')),
      expect: () => [
        proxyloginFormState.copyWith(
          username: Username('new-username-fake'),
          authFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'Login with AD fail',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(() => authRepoMock.proxyLogin(username: fakeUser)).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
        ..add(const ProxyLoginFormEvent.usernameChanged('fake-proxy_user'))
        ..add(const ProxyLoginFormEvent.loginWithADButtonPressed()),
      expect: () => [
        proxyloginFormState = proxyloginFormState.copyWith(username: fakeUser),
        proxyloginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        proxyloginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Login with AD empty username input',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(() => authRepoMock.proxyLogin(username: Username(''))).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ProxyLoginFormBloc bloc) =>
          bloc..add(const ProxyLoginFormEvent.loginWithADButtonPressed()),
      expect: () => [
        proxyloginFormState.copyWith(
          username: Username(''),
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: none(),
        ),
      ],
    );

    blocTest(
      'Login with AD success',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(() => authRepoMock.proxyLogin(username: fakeUser)).thenAnswer(
          (invocation) async => Right(LoginV2(jwt: fakeJWT)),
        );

        when(() => authRepoMock.storeJWT(jwt: fakeJWT)).thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(() => authRepoMock.deleteCredential()).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
        ..add(const ProxyLoginFormEvent.usernameChanged('fake-proxy_user'))
        ..add(const ProxyLoginFormEvent.loginWithADButtonPressed()),
      expect: () => [
        proxyloginFormState = proxyloginFormState.copyWith(username: fakeUser),
        proxyloginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        proxyloginFormState.copyWith(
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
