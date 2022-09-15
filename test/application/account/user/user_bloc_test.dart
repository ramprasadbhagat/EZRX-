import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRepoMock extends Mock implements UserRepository {}

class AuthRepoMock extends Mock implements AuthRepository {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AuthStateMock extends Mock implements AuthState {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  UserRepository userRepoMock = UserRepoMock();
  AuthBloc authBlocMock = AuthBlocMock();
  group('User Bloc Testing', () {
    blocTest<UserBloc, UserState>(
      'Test AuthBlocStream for Initialize',
      build: () =>
          UserBloc(authBloc: authBlocMock, userRepository: userRepoMock),
      setUp: () {
        when(() => authBlocMock.stream).thenAnswer((invocation) {
          return Stream.value(const AuthState.initial());
        });
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            User.empty(),
          ),
        );
      },
      expect: () => [UserState.initial()],
    );

    blocTest<UserBloc, UserState>(
      'Test AuthBlocStream for Loading',
      build: () =>
          UserBloc(authBloc: authBlocMock, userRepository: userRepoMock),
      setUp: () {
        when(() => authBlocMock.stream).thenAnswer((invocation) {
          return Stream.value(const AuthState.loading());
        });
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            User.empty(),
          ),
        );
      },
      expect: () => [UserState.initial()],
    );

    blocTest<UserBloc, UserState>(
      'Test AuthBlocStream for unauthenticated',
      build: () =>
          UserBloc(authBloc: authBlocMock, userRepository: userRepoMock),
      setUp: () {
        when(() => authBlocMock.stream).thenAnswer((invocation) {
          return Stream.value(const AuthState.unauthenticated());
        });
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            User.empty(),
          ),
        );
      },
      act: (UserBloc bloc) {
        bloc.add(const UserEvent.fetch());
      },
      expect: () => [UserState.initial()],
    );

    blocTest<UserBloc, UserState>(
      'Test AuthBlocStream for authenticated',
      build: () =>
          UserBloc(authBloc: authBlocMock, userRepository: userRepoMock),
      setUp: () {
        when(() => authBlocMock.stream).thenAnswer((invocation) {
          return Stream.value(const AuthState.authenticated());
        });
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            User.empty().copyWith(id: 'fakeId'),
          ),
        );
      },
      act: (UserBloc bloc) {
        bloc.add(const UserEvent.fetch());
      },
      expect: () => [
        UserState.initial().copyWith(user: User.empty().copyWith(id: 'fakeId'))
      ],
    );

    blocTest<UserBloc, UserState>(
      'Create bloc and fetch',
      build: () =>
          UserBloc(authBloc: authBlocMock, userRepository: userRepoMock),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            User.empty().copyWith(id: 'fakeId'),
          ),
        );
      },
      act: (UserBloc bloc) => bloc.add(const UserEvent.fetch()),
      expect: () => [
        UserState.initial().copyWith(user: User.empty().copyWith(id: 'fakeId'))
      ],
    );

    blocTest<UserBloc, UserState>(
      'Create bloc and failure on fetch',
      build: () =>
          UserBloc(authBloc: authBlocMock, userRepository: userRepoMock),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake Error')),
        );
      },
      act: (UserBloc bloc) => bloc.add(const UserEvent.fetch()),
      expect: () => [
        UserState.initial().copyWith(
          user: User.empty(),
          userFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake Error'),
            ),
          ),
        )
      ],
    );
  });
}
