import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepoMock extends Mock implements AuthRepository {}

final locator = GetIt.instance;

void main() {
  final AuthRepository authRepoMock = AuthRepoMock();
  final fakeJWT = JWT('fake-success');
  group('Auth Bloc ', () {
    setUpAll(() {
      locator.registerLazySingleton(() => LocalAuthentication());
    });
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
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
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
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable()).thenAnswer(
            (invocation) async =>
                const Left(ApiFailure.deviceNotSupportBiometirc()));
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [const AuthState.authenticated()],
    );
    blocTest(
      'Authenticated On Auth Check Test With Biometric Failure ',
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
        when(() => authRepoMock.canBeAuthenticatedAndBioAvailable())
            .thenAnswer((invocation) async => const Right(true));
        when(() => authRepoMock.doBiometricAuthentication()).thenAnswer(
            (invocation) async => const Left(ApiFailure.invalidBiometirc()));
      },
      act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
      expect: () => [const AuthState.unauthenticated()],
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
        act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
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
        act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
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
          when(() => authRepoMock.canBeAuthenticatedAndBioAvailable())
              .thenAnswer((invocation) async => const Right(true));
          when(() => authRepoMock.doBiometricAuthentication())
              .thenAnswer((invocation) async => const Right(true));
        },
        act: (AuthBloc bloc) async => bloc.add(const AuthEvent.authCheck()),
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
          when(() => authRepoMock.canBeAuthenticatedAndBioAvailable())
              .thenAnswer((invocation) async =>
                  const Left(ApiFailure.deviceNotSupportBiometirc()));
          when(() => authRepoMock.logout())
              .thenAnswer((invocation) async => const Right(unit));
        },
        act: (AuthBloc bloc) async {
          bloc.add(const AuthEvent.authCheck());
          await Future.delayed(const Duration(milliseconds: 0));
          bloc.add(const AuthEvent.logout());
        },
        expect: () => [
              const AuthState.authenticated(),
              const AuthState.unauthenticated()
            ]);
  });
}
