import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/change_password_repository.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mocktail/mocktail.dart';

class ConfigMock extends Mock implements Config {}

class ChangePasswordLocalDataSourceMock extends Mock
    implements ChangePasswordLocalDataSource {}

class ChangePasswordRemoteDataSourceMock extends Mock
    implements ChangePasswordRemoteDataSource {}

class FirebaseAnalyticsMock extends Mock implements FirebaseAnalytics {}

class MockTokenStorage extends Mock implements TokenStorage {}

class CredStorageMock extends Mock implements CredStorage {}

class AccountSelectorStorageMock extends Mock
    implements AccountSelectorStorage {}

class OktaLoginServicesMock extends Mock implements OktaLoginServices {}

class PushNotificationServiceMock extends Mock
    implements PushNotificationService {}

class LocalAuthenticationMock extends Mock implements LocalAuthentication {}

void main() {
  late ChangePasswordRemoteDataSourceMock remoteDataSourceMock;
  late ChangePasswordLocalDataSourceMock localDataSourceMock;
  late ChangePasswordRepository repository;
  late Config configMock;

  setUpAll(
    () async {
      configMock = ConfigMock();
      localDataSourceMock = ChangePasswordLocalDataSourceMock();

      remoteDataSourceMock = ChangePasswordRemoteDataSourceMock();

      repository = ChangePasswordRepository(
        changePasswordRemoteDataSource: remoteDataSourceMock,
        config: configMock,
        localDataSource: localDataSourceMock,
      );
    },
  );
  group('Change Repository should - ', () {
    test(
      'Allow user to reset password with mock',
      () async {
        repository = ChangePasswordRepository(
          changePasswordRemoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.setUserPassword())
            .thenAnswer((invocation) async => ResetPassword.empty());
        final oldPassword = Password.login('old');

        final newPassword = Password.login('new');
        final result = await repository.setPassword(
          oldPassword: oldPassword,
          newPassword: newPassword,
          user: User.empty(),
        );
        expect(result.isRight(), true);
      },
    );

    test(
      'failed user to reset password with mock',
      () async {
        repository = ChangePasswordRepository(
          changePasswordRemoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor)
            .thenAnswer((invocation) => Flavor.mock);

        when(() => localDataSourceMock.setUserPassword())
            .thenThrow((invocation) async => Exception('fake-error'));
        final oldPassword = Password.login('old');

        final newPassword = Password.login('old');
        final result = await repository.setPassword(
          oldPassword: oldPassword,
          newPassword: newPassword,
          user: User.empty(),
        );
        expect(result.isLeft(), true);
      },
    );

    test(
      'failed user to reset password with uat',
      () async {
        repository = ChangePasswordRepository(
          changePasswordRemoteDataSource: remoteDataSourceMock,
          config: configMock,
          localDataSource: localDataSourceMock,
        );

        when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

        when(
          () => remoteDataSourceMock.setUserPassword(
            'test',
            'old',
            'new',
          ),
        ).thenThrow((invocation) async => Exception('fake-error'));
        final oldPassword = Password.login('old');

        final newPassword = Password.login('old');
        final result = await repository.setPassword(
          oldPassword: oldPassword,
          newPassword: newPassword,
          user: User.empty(),
        );
        expect(result.isLeft(), true);
      },
    );

    // test(
    //   'Allow user to reset password with uat',
    //   () async {
    //     repository = ChangePasswordRepository(
    //       changePasswordRemoteDataSource: remoteDataSourceMock,
    //       config: configMock,
    //       localDataSource: localDataSourceMock,
    //     );

    //     when(() => configMock.appFlavor).thenAnswer((invocation) => Flavor.uat);

    //     when(
    //       () => remoteDataSourceMock.setUserPassword(
    //         'test',
    //         'old',
    //         'new',
    //       ),
    //     ).thenAnswer((invocation) async => ResetPassword.empty());
    //     final oldPassword = Password.login('old');

    //     final newPassword = Password.login('new');
    //     final result = await repository.setPassword(
    //       oldPassword: oldPassword,
    //       newPassword: newPassword,
    //       user: User.empty().copyWith(username: Username('test')),
    //     );
    //     expect(result.isRight(), true);
    //   },
    // );
  });
}
