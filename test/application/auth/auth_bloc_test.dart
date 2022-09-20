import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepoMock extends Mock implements AuthRepository {}

void main() {
  final AuthRepository authRepoMock = AuthRepoMock();
  final fakeJWT = JWT('fake-success');
  group('Auth Bloc ', () {
    blocTest(
      'Unauthenticated On Auth Check Test',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')));
        when(() => authRepoMock.initCredStorage()).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')));
        when(() => authRepoMock.initOkta()).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')));
        when(() => authRepoMock.tokenValid()).thenAnswer(
            (invocation) async => const Left(ApiFailure.tokenExpired()));
        when(() => authRepoMock.getOktaAccessToken()).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')));
      },
      expect: () =>
          [const AuthState.loading(), const AuthState.unauthenticated()],
    );
    blocTest(
      'Authenticated On Auth Check Test ',
      build: () => AuthBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.initTokenStorage()).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')));
        when(() => authRepoMock.initCredStorage()).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')));
        when(() => authRepoMock.initOkta()).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')));
        when(() => authRepoMock.tokenValid())
            .thenAnswer((invocation) async => const Right(unit));
      },
      expect: () => [const AuthState.authenticated()],
    );
    blocTest('Unauthenticated On Okta Token Test',
        build: () => AuthBloc(authRepository: authRepoMock),
        setUp: () {
          when(() => authRepoMock.initTokenStorage()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.initCredStorage()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.initOkta()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.tokenValid()).thenAnswer(
              (invocation) async => const Left(ApiFailure.tokenExpired()));
          when(() => authRepoMock.getOktaAccessToken()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
        },
        expect: () =>
            [const AuthState.loading(), const AuthState.unauthenticated()]);
    blocTest('Unauthenticated On EZRX JWT Test',
        build: () => AuthBloc(authRepository: authRepoMock),
        setUp: () {
          when(() => authRepoMock.initTokenStorage()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.initCredStorage()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.initOkta()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.tokenValid()).thenAnswer(
              (invocation) async => const Left(ApiFailure.tokenExpired()));
          when(() => authRepoMock.getOktaAccessToken())
              .thenAnswer((invocation) async => Right(fakeJWT));
          when(() => authRepoMock.getEZRXJWT(fakeJWT)).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
        },
        expect: () =>
            [const AuthState.loading(), const AuthState.unauthenticated()]);
    blocTest('Authenticated On EZRX JWT Test',
        build: () => AuthBloc(authRepository: authRepoMock),
        setUp: () {
          when(() => authRepoMock.initTokenStorage()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.initCredStorage()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.initOkta()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.tokenValid()).thenAnswer(
              (invocation) async => const Left(ApiFailure.tokenExpired()));
          when(() => authRepoMock.getOktaAccessToken())
              .thenAnswer((invocation) async => Right(fakeJWT));
          when(() => authRepoMock.getEZRXJWT(fakeJWT))
              .thenAnswer((invocation) async => Right(Login(jwt: fakeJWT)));
          when(() => authRepoMock.storeJWT(jwt: fakeJWT))
              .thenAnswer((invocation) async => const Right(unit));
        },
        expect: () =>
            [const AuthState.loading(), const AuthState.authenticated()]);

    blocTest('Logout Test',
        build: () => AuthBloc(authRepository: authRepoMock),
        setUp: () {
          when(() => authRepoMock.initTokenStorage()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.initCredStorage()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.initOkta()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('fake-error')));
          when(() => authRepoMock.tokenValid())
              .thenAnswer((invocation) async => const Right(unit));
          when(() => authRepoMock.logout())
              .thenAnswer((invocation) async => const Right(unit));
        },
        act: (AuthBloc bloc) async {
          await Future.delayed(const Duration(milliseconds: 0));
          bloc.add(const AuthEvent.logout());
        },
        expect: () => [
              const AuthState.authenticated(),
              const AuthState.unauthenticated()
            ]);
  });
}
