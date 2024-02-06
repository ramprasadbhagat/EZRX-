import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/update_language_response.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/user_mock.dart';

class UserRepoMock extends Mock implements UserRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserRepository userRepoMock;
  late UserState userState;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    userState = UserState.initial();
    userRepoMock = UserRepoMock();
  });
  group('User Bloc Testing', () {
    blocTest<UserBloc, UserState>(
      'Initialized',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      act: (UserBloc bloc) => bloc.add(const UserEvent.initialized()),
      expect: () => [userState],
    );

    blocTest<UserBloc, UserState>(
      'Fetch user failed',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (UserBloc bloc) => bloc.add(const UserEvent.fetch()),
      expect: () => [
        userState.copyWith(
          userFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest<UserBloc, UserState>(
      'Fetch user success',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            fakeClientUser,
          ),
        );
      },
      act: (UserBloc bloc) => bloc.add(const UserEvent.fetch()),
      expect: () => [
        userState.copyWith(user: fakeClientUser),
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
        userState,
      ],
    );
    blocTest<UserBloc, UserState>(
      'T&c failed',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      setUp: () {
        when(() => userRepoMock.updateUserTc()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('tnc failed')),
        );
      },
      act: (UserBloc bloc) => bloc.add(const UserEvent.acceptTnc()),
      expect: () => [
        userState.copyWith(
          userFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('tnc failed'))),
        )
      ],
    );

    test('Check if User have SalesOrganisation', () {
      expect(userState.haveSalesOrganisation, false);
    });
    test('Check if User isSalesRep', () {
      expect(userState.isSalesRep, false);
    });
    test('Check if User isNotEmpty', () {
      expect(userState.isNotEmpty, false);
    });
    test('Check if User userRoleName', () {
      expect(userState.userRoleName, '');
    });
    test('Check if User userFullName', () {
      expect(userState.userFullName, FullName.empty());
    });
    test('Check if User userCanLoginOnBehalf', () {
      expect(userState.userCanLoginOnBehalf, false);
    });
    test('Check if User userHasReturnsAdminAccess', () {
      expect(userState.userHasReturnsAdminAccess, false);
    });
    test('Check if User emailNotifications', () {
      expect(userState.emailNotifications, false);
    });
    // test('Check if User languagePreference', () {
    //   expect(
    //     userState.,
    //     const Locale(ApiLanguageCode.english),
    //   );
    // });
    test('Check if User userSalesOrganisations', () {
      expect(
        userState.userSalesOrganisations,
        List<SalesOrganisation>.empty(),
      );
    });
    test('Check if User salesOrgValue', () {
      expect(
        userState.salesOrgValue,
        List<String>.empty(),
      );
    });
    blocTest<UserBloc, UserState>(
      'Create bloc and fetch',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            fakeClientUser,
          ),
        );
      },
      act: (UserBloc bloc) => bloc.add(const UserEvent.fetch()),
      expect: () => [userState.copyWith(user: fakeClientUser)],
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
        userState.copyWith(
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
      seed: () => UserState.initial().copyWith(
        user: fakeClientUser,
      ),
      setUp: () {
        when(
          () => userRepoMock.updateNotificationSettings(
            fakeClientUser.copyWith(
              settings: Settings.empty().copyWith(
                languagePreference: Language.english(),
                emailNotifications: true,
              ),
            ),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            fakeClientUser.copyWith(
              settings: Settings.empty().copyWith(
                languagePreference: Language.english(),
                emailNotifications: true,
              ),
            ),
          ),
        );
      },
      act: (UserBloc bloc) => bloc.add(
        UserEvent.updateNotificationSettings(
          languagePreference: Language.english(),
          emailNotifications: true,
        ),
      ),
      expect: () => [
        userState.copyWith(
          user: fakeClientUser.copyWith(
            settings: Settings.empty().copyWith(
              languagePreference: Language.english(),
              emailNotifications: true,
            ),
          ),
        )
      ],
    );

    blocTest<UserBloc, UserState>(
      'on [updateNotifificationSettings] throws error',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      seed: () => UserState.initial().copyWith(
        user: fakeClientUser,
      ),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            fakeClientUser,
          ),
        );
        when(
          () => userRepoMock.updateNotificationSettings(
            fakeClientUser.copyWith(
              settings: Settings.empty().copyWith(
                languagePreference: Language.english(),
                emailNotifications: true,
              ),
            ),
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        );
      },
      act: (UserBloc bloc) => bloc.add(
        UserEvent.updateNotificationSettings(
          languagePreference: Language.english(),
          emailNotifications: true,
        ),
      ),
      expect: () => [
        userState.copyWith(
          user: fakeClientUser,
          userFailureOrSuccessOption:
              some(const Left(ApiFailure.other('Fake Error'))),
        )
      ],
    );
    blocTest<UserBloc, UserState>(
      'on updatePaymentNotificationSettings',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      seed: () => UserState.initial().copyWith(
        user: fakeClientUser,
      ),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            fakeClientUser,
          ),
        );
      },
      act: (UserBloc bloc) => bloc.add(
        UserEvent.updatePaymentNotificationSettings(
          paymentNotification: PaymentNotification.empty().copyWith(
            disablePaymentNotification: false,
          ),
        ),
      ),
      expect: () => [
        userState.copyWith(
          user: fakeClientUser.copyWith(
            settings: Settings.empty().copyWith(
              paymentNotification: PaymentNotification.empty().copyWith(
                disablePaymentNotification: false,
              ),
            ),
          ),
        )
      ],
    );
    blocTest<UserBloc, UserState>(
      'update language successful',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      seed: () => UserState.initial().copyWith(
        user: fakeClientUser,
      ),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            fakeClientUser,
          ),
        );
        when(
          () => userRepoMock.updateLanguage(
            language: Language.vietnamese(),
          ),
        ).thenAnswer(
          (invocation) async => Right(UpdateLanguageResponse(success: true)),
        );
      },
      act: (UserBloc bloc) => bloc.add(
        UserEvent.updateLanguage(Language.vietnamese()),
      ),
      expect: () => [
        userState.copyWith(
          user: fakeClientUser.copyWith(
            preferredLanguage: Language.vietnamese(),
          ),
        )
      ],
    );

    blocTest<UserBloc, UserState>(
      'update language failed',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      setUp: () {
        when(() => userRepoMock.getUser()).thenAnswer(
          (invocation) async => Right(
            fakeClientUser,
          ),
        );
        when(
          () => userRepoMock.updateLanguage(
            language: Language.english(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake Error')),
        );
      },
      act: (UserBloc bloc) => bloc.add(
        UserEvent.updateLanguage(Language.english()),
      ),
      expect: () => [
        userState,
        userState.copyWith(
          userFailureOrSuccessOption:
              some(const Left(ApiFailure.other('Fake Error'))),
        )
      ],
    );
    blocTest<UserBloc, UserState>(
      'select language',
      build: () => UserBloc(
        userRepository: userRepoMock,
      ),
      act: (UserBloc bloc) => bloc.add(
        UserEvent.selectLanguage(Language.vietnamese()),
      ),
      expect: () => [
        userState.copyWith(
          activeLanguage: Language.vietnamese(),
        ),
      ],
    );

    group('Set marketPlace TnC acceptance -', () {
      final fakeAcceptanceStatus = MarketPlaceTnCAcceptance.reject();
      const fakeError = ApiFailure.other('fake-error');
      blocTest<UserBloc, UserState>(
        'failure',
        build: () => UserBloc(
          userRepository: userRepoMock,
        ),
        setUp: () {
          when(() => userRepoMock.updateUserMarketPlaceTc(fakeAcceptanceStatus))
              .thenAnswer((_) async => const Left(fakeError));
        },
        act: (UserBloc bloc) => bloc
            .add(UserEvent.setMarketPlaceTncAcceptance(fakeAcceptanceStatus)),
        expect: () => [
          userState.copyWith(
            userFailureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
        ],
      );

      blocTest<UserBloc, UserState>(
        'success',
        build: () => UserBloc(
          userRepository: userRepoMock,
        ),
        setUp: () {
          when(() => userRepoMock.updateUserMarketPlaceTc(fakeAcceptanceStatus))
              .thenAnswer((_) async => const Right(unit));
        },
        act: (UserBloc bloc) => bloc
            .add(UserEvent.setMarketPlaceTncAcceptance(fakeAcceptanceStatus)),
        seed: () => userState.copyWith(user: fakeClientUser),
        expect: () => [
          userState.copyWith(
            user: fakeClientUser.copyWith(
              acceptMPTC: fakeAcceptanceStatus,
            ),
          )
        ],
      );
    });
  });
}
