import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/setting_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_android/local_auth_android.dart';
// ignore: depend_on_referenced_packages
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:mocktail/mocktail.dart';

import '../../../presentation/home/selectors/shipping_address_selector_test.dart';
import '../../order/repository/order_repository_test.dart';
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

class SettingStorageMock extends Mock implements SettingStorage {}

class AccountSelectorStorageMock extends Mock
    implements AccountSelectorStorage {}

class OktaLoginServicesMock extends Mock implements OktaLoginServices {}

class PushNotificationServiceMock extends Mock
    implements PushNotificationService {}

class LocalAuthenticationMock extends Mock implements LocalAuthentication {}

class RoleNameMock extends Mock implements RoleName {}

void main() {
  late AuthRemoteDataSource remoteDataSourceMock;
  late AuthLocalDataSource localDataSourceMock;
  late TokenStorage tokenStorageMock;
  late CredStorage credStorageMock;
  late CartStorage cartStorageMock;
  late SettingStorage settingStorageMock;
  late AccountSelectorStorage accountSelectorStorageMock;
  late OktaLoginServices oktaLoginServicesMock;
  late PushNotificationService pushNotificationServiceMock;
  late LocalAuthentication localAuthenticationMock;
  late RoleName roleNameMock;
  late MixpanelService mixpanelService;

  late AuthRepository repository;
  late Config configMock;

  const rootAdminToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoidzl4cEFhQkRZUSIsImV4cCI6MTY2MzQwOTAzNiwiaWF0IjoxNjYzMzIyNjM2LCJpZCI6MTE0NjEsInJpZ2h0cyI6W3sidmFsdWUiOlt7ImN1c3RvbWVyQ29kZSI6ImFsbCIsInNhbGVzT3JnIjoiMjYwMSIsInNoaXBUb0NvZGUiOlsiYWxsIl19XX1dLCJyb2xlIjoiWlAgQWRtaW4iLCJzYWxlc09yZ3MiOlsiMjYwMSJdLCJ1c2VybmFtZSI6ImV6cnh0ZXN0MDUifQ.MakZTQ3JUVqeRuXQcBU1cUKmHZft5AmFPJDvuG4DjlA';
  const refreshToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoiZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SkJWVlJJWDFSUFMwVk9Jam9pZHpsNGNFRmhRa1JaVVNJc0lrTlNSVUZVUlVSZlFWUWlPakUyT0RZeU9UWTRPRFFzSW1WNGNDSTZNVFk0TmpNd01EUTROQ3dpYVdGMElqb3hOamcyTWprMk9EZzBMQ0pwWkNJNk16ZzJNQ3dpY21sbmFIUnpJanBiZXlKMllXeDFaU0k2VzNzaVkzVnpkRzl0WlhKRGIyUmxJam9pWVd4c0lpd2ljMkZzWlhOUGNtY2lPaUl5TURBeElpd2ljMmhwY0ZSdlEyOWtaU0k2V3lKaGJHd2lYWDFkZlYwc0luSnZiR1VpT2lKU1QwOVVJRUZrYldsdUlpd2ljMkZzWlhOUGNtZHpJanBiSWpJd01ERWlYU3dpZFhObGNtNWhiV1VpT2lKeWIyOTBZV1J0YVc0aWZRLmp0ZkxBZjcyaFdkVU1EZ0xEYnJoUXpOQmNhd2hsb19PSHJfTmFFTE5fbGMiLCJleHAiOjE2OTQwNzI4ODQsImlhdCI6MTY4NjI5Njg4NH0.fx4Lnfs1omLm81hBAwTetEnddSQnK2hTS_Kj9O25tYA';
  final fakeJWT = JWT(rootAdminToken);

  setUpAll(
    () async {
      configMock = ConfigMock();
      localDataSourceMock = AuthLocalDataSourceMock();

      tokenStorageMock = MockTokenStorage();
      remoteDataSourceMock = AuthRemoteDataSourceMock();
      accountSelectorStorageMock = AccountSelectorStorageMock();
      cartStorageMock = CartStorageMock();
      settingStorageMock = SettingStorageMock();
      credStorageMock = CredStorageMock();
      localAuthenticationMock = LocalAuthenticationMock();
      oktaLoginServicesMock = OktaLoginServicesMock();
      pushNotificationServiceMock = PushNotificationServiceMock();
      roleNameMock = RoleNameMock();
      mixpanelService = MixpanelServiceMock();

      repository = AuthRepository(
        mixpanelService: mixpanelService,
        remoteDataSource: remoteDataSourceMock,
        config: configMock,
        localDataSource: localDataSourceMock,
        tokenStorage: tokenStorageMock,
        accountSelectorStorage: accountSelectorStorageMock,
        cartStorage: cartStorageMock,
        credStorage: credStorageMock,
        localAuthentication: localAuthenticationMock,
        oktaLoginServices: oktaLoginServicesMock,
        pushNotificationService: pushNotificationServiceMock,
        settingStorage: settingStorageMock,
      );
      when(() => credStorageMock.get()).thenAnswer((invocation) async =>
          CredDto(username: 'username', password: 'password'));
      when(
        () => tokenStorageMock.clear(),
      ).thenAnswer((invocation) async => null);
      when(
        () => tokenStorageMock
            .set(JWTDto.fromDomain(JWT(rootAdminToken), JWT(refreshToken))),
      ).thenAnswer((invocation) async => null);
      when(
        () => oktaLoginServicesMock.logout(),
      ).thenAnswer((invocation) async => null);
      when(
        () => accountSelectorStorageMock.delete(),
      ).thenAnswer((invocation) async => '');
      when(
        () => cartStorageMock.clear(),
      ).thenAnswer((invocation) async => '');
      when(
        () async => repository.initTokenStorage(),
      ).thenAnswer(
        (invocation) async => const Right(unit),
      );
      when(
        () => localAuthenticationMock.authenticate(
          localizedReason: 'Complete the biometrics to continue',
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Biometric authentication required!',
              cancelButton: 'No thanks',
              biometricNotRecognized: 'Failed Attempt',
              biometricRequiredTitle: 'Supports Biometric, but not setup',
              biometricSuccess: 'Recognised you',
              goToSettingsButton: 'Let\'s set-up biometric',
              goToSettingsDescription: 'You can set-up biometric on settings',
            ),
            IOSAuthMessages(
              cancelButton: 'No thanks',
              goToSettingsButton: 'Let\'s set-up biometric',
              goToSettingsDescription: 'You can set-up biometric on settings',
              lockOut: 'You have been locked out',
              localizedFallbackTitle: 'Fallback',
            ),
          ],
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
            sensitiveTransaction: true,
          ),
        ),
      ).thenAnswer((invocation) async {
        return true;
      });

      when(
        () => localAuthenticationMock.canCheckBiometrics,
      ).thenAnswer((invocation) async {
        return true;
      });

      when(
        () => localAuthenticationMock.isDeviceSupported(),
      ).thenAnswer((invocation) async {
        return true;
      });

      when(
        () => localAuthenticationMock.getAvailableBiometrics(),
      ).thenAnswer((invocation) async {
        return [BiometricType.fingerprint];
      });

      when(
        () => roleNameMock.isEligibleLoginRoleForZPAdmin,
      ).thenAnswer((invocation) {
        return true;
      });
    },
  );
  group('Auth Repository should - ', () {
    test(
      'User login using password with uat',
      () async {
        repository = AuthRepository(
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
          settingStorage: settingStorageMock,
        );
        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(() => pushNotificationServiceMock.getFCMToken())
            .thenAnswer((invocation) async => fakeJWT.getValue());
        // final testMock = Future<dynamic>.delayed(const Duration(seconds: 1));

        when(() => remoteDataSourceMock.loginWithPassword(
                password: 'old', username: 'old', fcmToken: fakeJWT.getValue()))
            .thenAnswer((invocation) async => Login.empty());
        final pass = Password.login('old');
        final userName = Username('old');

        final result =
            await repository.login(password: pass, username: userName);

        expect(result.isRight(), true);
      },
    );

    test(
      'User failed to login using password with mock',
      () async {
        repository = AuthRepository(
          settingStorage: settingStorageMock,
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
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
          settingStorage: settingStorageMock,
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
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
          settingStorage: settingStorageMock,
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
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
          settingStorage: settingStorageMock,
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
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
          settingStorage: settingStorageMock,
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
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
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
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
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
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
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
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
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
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
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
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
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          settingStorage: settingStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
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
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );
        when(() => tokenStorageMock.get())
            .thenAnswer((invocation) async => JWTDto(access: '', refresh: ''));
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
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        await repository.tokenValid();
        verify(() => tokenStorageMock.get()).called(1);
      },
    );

    test(
      'Allow user to handle cred storage',
      () async {
        repository = AuthRepository(
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
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
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        await repository.tokenValid();

        await repository.storeJWT(
            access: JWT(rootAdminToken), refresh: JWT(refreshToken));
        verify(
          () => tokenStorageMock.get(),
        ).called(1);
      },
    );

    test(
      'Allow user to logout',
      () async {
        repository = AuthRepository(
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
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
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
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

    test(
      'Biometric Check success',
      () async {
        repository = AuthRepository(
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        final result = await repository.doBiometricAuthentication();

        expect(result.isRight(), true);

        verify(
          () => localAuthenticationMock.authenticate(
            localizedReason: 'Complete the biometrics to continue',
            authMessages: const <AuthMessages>[
              AndroidAuthMessages(
                signInTitle: 'Biometric authentication required!',
                cancelButton: 'No thanks',
                biometricNotRecognized: 'Failed Attempt',
                biometricRequiredTitle: 'Supports Biometric, but not setup',
                biometricSuccess: 'Recognised you',
                goToSettingsButton: 'Let\'s set-up biometric',
                goToSettingsDescription: 'You can set-up biometric on settings',
              ),
              IOSAuthMessages(
                cancelButton: 'No thanks',
                goToSettingsButton: 'Let\'s set-up biometric',
                goToSettingsDescription: 'You can set-up biometric on settings',
                lockOut: 'You have been locked out',
                localizedFallbackTitle: 'Fallback',
              ),
            ],
            options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
              sensitiveTransaction: true,
            ),
          ),
        ).called(1);
      },
    );

    test(
      'Biometric canBeAuthenticated success',
      () async {
        repository = AuthRepository(
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          settingStorage: settingStorageMock,
          credStorage: credStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,
        );

        final result = await repository.canBeAuthenticatedAndBioAvailable();

        expect(result.isRight(), true);

        verify(
          () => localAuthenticationMock.canCheckBiometrics,
        ).called(1);
        verify(
          () => localAuthenticationMock.isDeviceSupported(),
        ).called(1);
        verify(
          () => localAuthenticationMock.getAvailableBiometrics(),
        ).called(1);
      },
    );

    test(
      'isEligibleProxyLogin failure',
      () async {
        repository = AuthRepository(
          mixpanelService: mixpanelService,
          remoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
          tokenStorage: tokenStorageMock,
          accountSelectorStorage: accountSelectorStorageMock,
          cartStorage: cartStorageMock,
          credStorage: credStorageMock,
          settingStorage: settingStorageMock,
          localAuthentication: localAuthenticationMock,
          oktaLoginServices: oktaLoginServicesMock,
          pushNotificationService: pushNotificationServiceMock,       
        );

        final result = await repository.isEligibleProxyLogin(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(
              type: RoleType('zp_admin'),
            ),
          ),
          jwt: fakeJWT,
        );

        expect(result.isLeft(), true);
      },
    );
  });
}
