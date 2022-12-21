import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mocktail/mocktail.dart';
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages

class ConfigMock extends Mock implements Config {}

class AuthRemoteDataSourceMock extends Mock implements AuthRemoteDataSource {}

class AuthLocalDataSourceMock extends Mock implements AuthLocalDataSource {}

class FirebaseAnalyticsMock extends Mock implements FirebaseAnalytics {}

class MockTokenStorage extends Mock implements TokenStorage {}

class CredStorageMock extends Mock implements CredStorage {}

class CartStorageMock extends Mock implements CartStorage {}

class AccountSelectorStorageMock extends Mock
    implements AccountSelectorStorage {}

class OktaLoginServicesMock extends Mock implements OktaLoginServices {}

class PushNotificationServiceMock extends Mock
    implements PushNotificationService {}

class LocalAuthenticationMock extends Mock implements LocalAuthentication {}

class CountlyServiceMock extends Mock implements CountlyService {}

void main() {
  late AuthRemoteDataSource remoteDataSourceMock;
  late AuthLocalDataSource localDataSourceMock;
  late TokenStorage tokenStorageMock;
  late CredStorage credStorageMock;
  late CartStorage cartStorageMock;
  late AccountSelectorStorage accountSelectorStorageMock;
  late OktaLoginServices oktaLoginServicesMock;
  late PushNotificationService pushNotificationServiceMock;
  late LocalAuthentication localAuthenticationMock;
  late CountlyService countlyServiceMock;

  late AuthRepository repository;
  late Config configMock;

  const rootAdminToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoidzl4cEFhQkRZUSIsImV4cCI6MTY2MzQwOTAzNiwiaWF0IjoxNjYzMzIyNjM2LCJpZCI6MTE0NjEsInJpZ2h0cyI6W3sidmFsdWUiOlt7ImN1c3RvbWVyQ29kZSI6ImFsbCIsInNhbGVzT3JnIjoiMjYwMSIsInNoaXBUb0NvZGUiOlsiYWxsIl19XX1dLCJyb2xlIjoiWlAgQWRtaW4iLCJzYWxlc09yZ3MiOlsiMjYwMSJdLCJ1c2VybmFtZSI6ImV6cnh0ZXN0MDUifQ.MakZTQ3JUVqeRuXQcBU1cUKmHZft5AmFPJDvuG4DjlA';
  final fakeJWT = JWT(rootAdminToken);

  final locator = GetIt.instance;

  setUpAll(
    () async {
      configMock = ConfigMock();
      localDataSourceMock = AuthLocalDataSourceMock();

      tokenStorageMock = MockTokenStorage();
      remoteDataSourceMock = AuthRemoteDataSourceMock();
      accountSelectorStorageMock = AccountSelectorStorageMock();
      cartStorageMock = CartStorageMock();
      countlyServiceMock = CountlyServiceMock();
      credStorageMock = CredStorageMock();
      localAuthenticationMock = LocalAuthenticationMock();
      oktaLoginServicesMock = OktaLoginServicesMock();
      pushNotificationServiceMock = PushNotificationServiceMock();

      locator.registerLazySingleton(
          () => CountlyService(config: locator<Config>()));

      repository = AuthRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock,
        localDataSource: localDataSourceMock,
        tokenStorage: tokenStorageMock,
        accountSelectorStorage: accountSelectorStorageMock,
        cartStorage: cartStorageMock,
        countlyService: countlyServiceMock,
        credStorage: credStorageMock,
        localAuthentication: localAuthenticationMock,
        oktaLoginServices: oktaLoginServicesMock,
        pushNotificationService: pushNotificationServiceMock,
      );
      when(() => credStorageMock.get()).thenAnswer((invocation) async =>
          CredDto(username: 'username', password: 'password'));
      when(
        () => tokenStorageMock.clear(),
      ).thenAnswer((invocation) async => null);
      when(
        () => tokenStorageMock.set(JWTDto.fromDomain(JWT(rootAdminToken))),
      ).thenAnswer((invocation) async => null);
      when(
        () => oktaLoginServicesMock.logout(),
      ).thenAnswer((invocation) async => null);
      when(
        () => accountSelectorStorageMock.delete(),
      ).thenAnswer((invocation) async => null);
      when(
        () => cartStorageMock.clear(),
      ).thenAnswer((invocation) async => null);
      when(
        () async => repository.initTokenStorage(),
      ).thenAnswer(
        (invocation) async => const Right(unit),
      );
    },
  );
  group('Auth Repository should - ', () {
    test(
      'User login using password with uat',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );
        when(() => countlyServiceMock.addCountlyEvent('Login Success'))
            .thenAnswer((invocation) async {
          return;
        });
        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => pushNotificationServiceMock.getFCMToken())
            .thenAnswer((invocation) async => fakeJWT.getValue());
        final testMock = Future<dynamic>.delayed(const Duration(seconds: 1));

        when(() => remoteDataSourceMock.loginWithPassword(
                password: 'old', username: 'old', fcmToken: fakeJWT.getValue()))
            .thenAnswer((invocation) async => Login.empty());
        final pass = Password.login('old');
        final userName = Username('old');

        final result =
            await repository.login(password: pass, username: userName);

        expect(result.isRight(), true);

        verify(() => countlyServiceMock.addCountlyEvent('Login Success'))
            .called(1);
      },
    );

    test(
      'User failed to login using password with mock',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.loginWithPassword(
              password: 'od',
              username: 'old',
            )).thenThrow((invocation) async => Exception('fake-error'));
        final pass = Password.login('old');
        final userName = Username('old');

        final result =
            await repository.login(password: pass, username: userName);
        expect(result.isLeft(), true);
      },
    );

    test(
      'Allow user to login using password with mock',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.loginWithPassword(
            password: 'old',
            username: 'old')).thenAnswer((invocation) async => Login.empty());
        final pass = Password.login('old');
        final userName = Username('old');
        final result =
            await repository.login(password: pass, username: userName);
        expect(result.isRight(), true);
      },
    );

    test(
      'Allow user to proxy login with mock',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.proxyLoginWithUsername(username: 'old'))
            .thenAnswer((invocation) async => Login.empty());
        final userName = Username('old');
        final result = await repository.proxyLogin(username: userName);
        expect(result.isRight(), true);
      },
    );

    test(
      'User failed to proxy login with mock',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.proxyLoginWithUsername(username: 'old'))
            .thenThrow((invocation) async => Exception('fake-error'));
        final userName = Username('old');
        final result = await repository.proxyLogin(username: userName);
        expect(result.isRight(), false);
      },
    );
    test(
      'User failed to proxy login with uat',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => remoteDataSourceMock.proxyLoginWithUsername(username: 'old'))
            .thenThrow((invocation) async => Exception('fake-error'));
        final userName = Username('old');
        final result = await repository.proxyLogin(username: userName);
        expect(result.isRight(), false);
      },
    );

    test(
      'Allow user to proxy login with uat',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => remoteDataSourceMock.proxyLoginWithUsername(username: 'old'))
            .thenAnswer((invocation) async => Login.empty());
        final userName = Username('old');
        final result = await repository.proxyLogin(username: userName);
        expect(result.isRight(), true);
      },
    );
    test(
      'Allow user to get getEZRXJWT with mock',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.loginWithOktaToken(
                oktaAccessToken: fakeJWT.getOrCrash()))
            .thenAnswer((invocation) async => Login.empty());
        final result = await repository.getEZRXJWT(fakeJWT);
        expect(result.isRight(), true);
      },
    );

    test(
      'User failed to login using password with uat',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => pushNotificationServiceMock.getFCMToken())
            .thenAnswer((invocation) async => fakeJWT.getValue());

        when(() => remoteDataSourceMock.loginWithPassword(
                password: 'od', username: 'old', fcmToken: fakeJWT.getValue()))
            .thenThrow((invocation) async => MockException(message: 'test'));
        final pass = Password.login('old');
        final userName = Username('old');

        final result =
            await repository.login(password: pass, username: userName);
        expect(result.isRight(), true);
      },
    );
    test(
      'User failed to get getEZRXJWT with mock',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.loginWithOktaToken(
                oktaAccessToken: fakeJWT.getOrCrash()))
            .thenThrow((invocation) async => Exception('fake-error'));
        final result = await repository.getEZRXJWT(fakeJWT);
        expect(result.isLeft(), true);
      },
    );
    test(
      'User failed to get getEZRXJWT with uat',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);
        when(() => pushNotificationServiceMock.getFCMToken())
            .thenAnswer((invocation) async => fakeJWT.getValue());
        when(() => remoteDataSourceMock.loginWithOktaToken(
                oktaAccessToken: fakeJWT.getOrCrash(),
                fcmToken: fakeJWT.getOrCrash()))
            .thenThrow((invocation) async => Exception('fake-error'));
        final result = await repository.getEZRXJWT(fakeJWT);
        expect(result.isLeft(), true);
      },
    );
    test(
      'Allow user to getEZRXJWT with uat',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);
        when(() => pushNotificationServiceMock.getFCMToken())
            .thenAnswer((invocation) async => fakeJWT.getValue());
        when(() => remoteDataSourceMock.loginWithOktaToken(
              fcmToken: fakeJWT.getValue(),
              oktaAccessToken: rootAdminToken,
            )).thenAnswer((invocation) async => Login.empty());
        final result = await repository.getEZRXJWT(fakeJWT);
        expect(result.isRight(), true);
      },
    );

    test(
      'Allow user to handle token storage',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );
        when(() => tokenStorageMock.get())
            .thenAnswer((invocation) async => JWTDto(access: ''));
        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => tokenStorageMock.init());

        await repository.initTokenStorage();

        await repository.tokenValid();
        verify(
          () => tokenStorageMock.init(),
        ).called(1);
        verify(
          () => tokenStorageMock.get(),
        ).called(1);
      },
    );

    test(
      'user failed validated token.',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        final result = await repository.tokenValid();
        verify(() => tokenStorageMock.get()).called(1);
      },
    );

    test(
      'Allow user to handle cred storage',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        await repository.initCredStorage();

        final result = await repository.loadCredential();
        expect(result.isRight(), true);
        final pass = Password.login('old');
        final userName = Username('old');
        await repository.storeCredential(password: pass, username: userName);
        await repository.deleteCredential();

        verify(() => credStorageMock.init()).called(1);

        verify(
          () => credStorageMock.get(),
        ).called(1);
      },
    );

    test(
      'Allow user to storeJWT',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        await repository.tokenValid();

        await repository.storeJWT(jwt: JWT(rootAdminToken));
        verify(
          () => tokenStorageMock.get(),
        ).called(1);
      },
    );

    test(
      'Allow user to logout',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        await repository.logout();
        verify(
          () => oktaLoginServicesMock.logout(),
        ).called(1);
        verify(
          () => tokenStorageMock.clear(),
        ).called(1);
        verify(
          () => accountSelectorStorageMock.delete(),
        ).called(1);
        verify(
          () => cartStorageMock.clear(),
        ).called(1);
      },
    );

    test(
      'Allow user to handle okta login',
      () async {
        repository = AuthRepository(
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          countlyService: countlyServiceMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        await repository.initOkta();
        await repository.loginWithOkta();
        await repository.getOktaAccessToken();

        verify(
          () => oktaLoginServicesMock.init(),
        ).called(1);

        verify(
          () => oktaLoginServicesMock.getAccessToken(),
        ).called(1);
        verify(
          () => oktaLoginServicesMock.login(),
        ).called(1);
      },
    );
  });
}
