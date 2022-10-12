import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';

import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRepoMock extends Mock implements UserRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final UserRepository userRepoMock = UserRepoMock();

  group('User Bloc Testing', () {
    blocTest<UserBloc, UserState>(
      'Initialized',
      build: () => UserBloc(userRepository: userRepoMock),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            User.empty().copyWith(id: 'fakeId'),
          ),
        );
      },
      act: (UserBloc bloc) => bloc.add(const UserEvent.initialized()),
      expect: () => [
        UserState.initial().copyWith(user: User.empty().copyWith(id: 'fakeId')),
        UserState.initial()
      ],
    );

    test('Check if User have SalesOrganisation', () {
      final userState = UserState.initial();
      expect(userState.haveSalesOrganisation, false);
    });

    blocTest<UserBloc, UserState>(
      'Check if User have SalesOrganisation',
      build: () => UserBloc(userRepository: userRepoMock),
      act: (UserBloc bloc) => bloc.add(const UserEvent.initialized()),
      expect: () => [
        UserState.initial().copyWith(user: User.empty().copyWith(id: 'fakeId')),
        UserState.initial()
      ],
    );

    blocTest<UserBloc, UserState>(
      'Create bloc and fetch',
      build: () => UserBloc(userRepository: userRepoMock),
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
      build: () => UserBloc(userRepository: userRepoMock),
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
