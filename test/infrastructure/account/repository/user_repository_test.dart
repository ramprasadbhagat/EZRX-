import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ConfigMock extends Mock implements Config {}

class UserLocalDataSourceMock extends Mock implements UserLocalDataSource {}

class UserRemoteDataSourceMock extends Mock implements UserRemoteDataSource {}

class FirebaseAnalyticsMock extends Mock implements FirebaseAnalytics {}

class FirebaseAnalyticsObserverMock extends Mock
    implements FirebaseAnalyticsObserver {}

class FirebaseCrashlyticsMock extends Mock implements FirebaseCrashlytics {}

void main() {
  late UserRepository repository;
  late Config configMock;
  late UserLocalDataSource localDataSourceMock;
  late FirebaseAnalyticsService firebaseAnalyticsServiceMock;
  late UserRemoteDataSource remoteDataSourceMock;
  late FirebaseCrashlyticsService firebaseCrashlyticsServiceMock;
  late FirebaseAnalytics firebaseAnalyticsMock;
  late FirebaseAnalyticsObserver firebaseAnalyticsObserverMock;
  late FirebaseCrashlytics firebaseCrashlyticsMock;

  setUpAll(
    () async {
      configMock = ConfigMock();
      localDataSourceMock = UserLocalDataSourceMock();
      firebaseAnalyticsMock = FirebaseAnalyticsMock();
      firebaseAnalyticsObserverMock = FirebaseAnalyticsObserverMock();
      firebaseAnalyticsServiceMock = FirebaseAnalyticsService(
        analytics: firebaseAnalyticsMock,
        observer: firebaseAnalyticsObserverMock,
      );
      firebaseCrashlyticsMock = FirebaseCrashlyticsMock();
      remoteDataSourceMock = UserRemoteDataSourceMock();
      firebaseCrashlyticsServiceMock = FirebaseCrashlyticsService(
        crashlytics: firebaseCrashlyticsMock,
      );
      repository = UserRepository(
        firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
        firebaseAnalyticsService: firebaseAnalyticsServiceMock,
        remoteDataSource: remoteDataSourceMock,
        config: configMock,
        localDataSource: localDataSourceMock,
      );
    },
  );
  group('User Repository should - ', () {
    test(
      'update notification from local datasource successfully with mock',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock
                .updateUserNotificationAndLanguagePreference())
            .thenAnswer((invocation) async => User.empty());

        final result =
            await repository.updateNotificationSettings(User.empty());
        expect(result.isRight(), true);
      },
    );

    test(
      'update notification from local datasource throws error with mock',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock
                .updateUserNotificationAndLanguagePreference())
            .thenThrow(MockException(message: 'mockException'));

        final result =
            await repository.updateNotificationSettings(User.empty());
        expect(result.isLeft(), true);
      },
    );

    test(
      'update notification from remote datasource successfully with uat',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() =>
            remoteDataSourceMock.updateUserNotificationAndLanguagePreference(
              languagePreference: '',
              emailNotification: false,
              userId: '',
            )).thenAnswer((invocation) async => User.empty());

        final result =
            await repository.updateNotificationSettings(User.empty());
        expect(result.isRight(), true);
      },
    );

    test(
      'update notification from remote datasource throws error with uat',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() =>
            remoteDataSourceMock.updateUserNotificationAndLanguagePreference(
              languagePreference: '',
              emailNotification: false,
              userId: '',
            )).thenThrow(Error());

        final result =
            await repository.updateNotificationSettings(User.empty());
        expect(result.isLeft(), true);
      },
    );

    test(
      'update user aup from local datasource successfully with mock',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.updateUserAup())
            .thenAnswer((invocation) async => User.empty().settingAup);

        final result = await repository.updateUserAup(User.empty());
        expect(result.isRight(), true);
      },
    );

    test(
      'update user aup from local datasource throws error with mock',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.updateUserAup())
            .thenThrow(MockException(message: 'mockException'));

        final result = await repository.updateUserAup(User.empty());
        expect(result.isLeft(), true);
      },
    );

    test(
      'update user aup from remote datasource successfully with uat',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => remoteDataSourceMock.updateUserAup(
              userId: User.empty().id,
            )).thenAnswer((invocation) async => User.empty().settingAup);

        final result = await repository.updateUserAup(User.empty());
        expect(result.isRight(), true);
      },
    );

    test(
      'update user aup from remote datasource throws error with uat',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => remoteDataSourceMock.updateUserAup(
              userId: User.empty().id,
            )).thenThrow(Error());

        final result = await repository.updateUserAup(User.empty());
        expect(result.isLeft(), true);
      },
    );

    test(
      'update user tc from local datasource successfully with mock',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.updateUserTC())
            .thenAnswer((invocation) async => User.empty().settingTc);

        final result = await repository.updateUserTc(User.empty());
        expect(result.isRight(), true);
      },
    );

    test(
      'update user tc from local datasource throws error with mock',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.updateUserTC())
            .thenThrow(MockException(message: 'mockException'));

        final result = await repository.updateUserTc(User.empty());
        expect(result.isLeft(), true);
      },
    );

    test(
      'update user tc from remote datasource successfully with uat',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => remoteDataSourceMock.updateUserTC(
              userId: User.empty().id,
            )).thenAnswer((invocation) async => User.empty().settingTc);

        final result = await repository.updateUserTc(User.empty());
        expect(result.isRight(), true);
      },
    );

    test(
      'update user tc from remote datasource throws error with uat',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => remoteDataSourceMock.updateUserTC(
              userId: User.empty().id,
            )).thenThrow(Error());

        final result = await repository.updateUserTc(User.empty());
        expect(result.isLeft(), true);
      },
    );

    test(
      'get user from local datasource successfully with mock',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.getUser())
            .thenAnswer((invocation) async => User.empty());

        final result = await repository.getUser();
        expect(result.isRight(), true);
      },
    );

    test(
      'get user from local datasource throws error with mock',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.getUser())
            .thenThrow(MockException(message: 'mockException'));

        final result = await repository.getUser();
        expect(result.isLeft(), true);
      },
    );

    test(
      'get user from remote datasource successfully with uat',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => remoteDataSourceMock.getUser())
            .thenAnswer((invocation) async => User.empty());

        when(() => firebaseAnalyticsServiceMock.analytics
                .setUserId(id: User.empty().id))
            .thenAnswer((invocation) async => User.empty());

        when(() => firebaseCrashlyticsServiceMock.crashlytics
                .setUserIdentifier(User.empty().id))
            .thenAnswer((invocation) async => User.empty());

        final result = await repository.getUser();
        expect(result.isRight(), true);
      },
    );

    test(
      'get user from remote datasource throws error with uat',
      () async {
        repository = UserRepository(
          firebaseCrashlyticsService: firebaseCrashlyticsServiceMock,
          firebaseAnalyticsService: firebaseAnalyticsServiceMock,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => remoteDataSourceMock.getUser()).thenThrow(Error());

        final result = await repository.getUser();
        expect(result.isLeft(), true);
      },
    );
  });
}
