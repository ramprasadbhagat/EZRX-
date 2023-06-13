import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      act: (UserBloc bloc) => bloc.add(const UserEvent.initialized()),
      expect: () => [UserState.initial()],
    );

    blocTest<UserBloc, UserState>(
      'Fetch user',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            User.empty().copyWith(id: 'fakeId'),
          ),
        );
      },
      act: (UserBloc bloc) => bloc.add(const UserEvent.fetch()),
      expect: () => [
        UserState.initial().copyWith(user: User.empty().copyWith(id: 'fakeId')),
      ],
    );

    blocTest<UserBloc, UserState>(
      'T&c accept',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      setUp: () {
        when(
          () => userRepoMock.updateUserTc(),
        ).thenAnswer(
          (invocation) async => Right(SettingTc.empty()),
        );
      },
      act: (UserBloc bloc) => bloc.add(
        const UserEvent.acceptTnc(),
      ),
      expect: () => [
        UserState.initial().copyWith(user: User.empty()),
      ],
    );
    blocTest<UserBloc, UserState>(
      'T&c failed',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      setUp: () {
        when(() => userRepoMock.updateUserTc())
            .thenAnswer(
          (invocation) async => const Left(ApiFailure.other('tnc failed')),
        );
      },
      act: (UserBloc bloc) => bloc.add(const UserEvent.acceptTnc()),
      expect: () => [
        UserState.initial().copyWith(
            userFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('tnc failed'))))
      ],
    );

    test('Check if User have SalesOrganisation', () {
      final userState = UserState.initial();
      expect(userState.haveSalesOrganisation, false);
    });

    blocTest<UserBloc, UserState>(
      'Create bloc and fetch',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
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
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
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

    blocTest<UserBloc, UserState>(
      'on [updateNotificationSettings] emits successful user state',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            User.empty(),
          ),
        );
        when(() => userRepoMock.updateNotificationSettings(User.empty()
            .copyWith(
                settings: Settings.empty().copyWith(
                    languagePreference: LanguageValue(ApiLanguageCode.english),
                    emailNotifications: true)))).thenAnswer(
          (invocation) async => Right(User.empty()),
        );
      },
      act: (UserBloc bloc) => bloc.add(UserEvent.updateNotificationSettings(
          languagePreference: LanguageValue(ApiLanguageCode.english),
          emailNotifications: true)),
      expect: () => [UserState.initial()],
    );

    blocTest<UserBloc, UserState>(
      'on [updateNotifificationSettings] throws error',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            User.empty(),
          ),
        );
        when(() => userRepoMock.updateNotificationSettings(User.empty()
            .copyWith(
                settings: Settings.empty().copyWith(
                    languagePreference: LanguageValue(ApiLanguageCode.english),
                    emailNotifications: true)))).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        );
      },
      act: (UserBloc bloc) => bloc.add(UserEvent.updateNotificationSettings(
          languagePreference: LanguageValue(ApiLanguageCode.english),
          emailNotifications: true)),
      expect: () => [
        UserState.initial().copyWith(
            userFailureOrSuccessOption:
                some(const Left(ApiFailure.other('Fake Error'))))
      ],
    );
  });
}
