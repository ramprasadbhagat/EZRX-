import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepoMock extends Mock implements AuthRepository {}

void main() {
  final AuthRepository authRepoMock = AuthRepoMock();
  final fakeUserName = Username('fake-proxy_user');
  final fakeJWT = JWT('fake-porxy_success');
  final fakeRefresh = JWT('');
  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(type: RoleType('root_admin')),
  );

  var proxyloginFormState = ProxyLoginFormState.initial();

  group('ProxyLogin Form Bloc', () {
    blocTest(
      'Initialized',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      act: (ProxyLoginFormBloc bloc) =>
          bloc.add(const ProxyLoginFormEvent.initialized()),
      expect: () => [proxyloginFormState],
    );
    blocTest(
      'Change username',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
          .add(const ProxyLoginFormEvent.usernameChanged('new-username-fake')),
      expect: () => [
        proxyloginFormState.copyWith(
          username: Username('new-username-fake'),
          authFailureOrSuccessOption: none(),
        ),
      ],
    );

    blocTest(
      'Login with AD fail',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.proxyLogin(
            username: fakeUserName,
            salesOrg: SalesOrg('2001'),
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
        ..add(const ProxyLoginFormEvent.usernameChanged('fake-proxy_user'))
        ..add(
          ProxyLoginFormEvent.loginWithADButtonPressed(
            salesOrg: SalesOrg('2001'),
            user: fakeUser,
          ),
        ),
      expect: () => [
        proxyloginFormState =
            proxyloginFormState.copyWith(username: fakeUserName),
        proxyloginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        proxyloginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Login with AD empty username input',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.proxyLogin(
            username: Username(''),
            salesOrg: SalesOrg('2001'),
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
        ..add(
          ProxyLoginFormEvent.loginWithADButtonPressed(
            salesOrg: SalesOrg(''),
            user: fakeUser,
          ),
        ),
      expect: () => [
        proxyloginFormState.copyWith(
          username: Username(''),
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: none(),
        ),
      ],
    );

    blocTest(
      'Login with AD success',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.proxyLogin(
            username: fakeUserName,
            salesOrg: SalesOrg('2001'),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            Login(
              access: fakeJWT,
              refresh: fakeRefresh,
              user: User.empty(),
            ),
          ),
        );

        when(
          () => authRepoMock.isEligibleProxyLogin(
            user: fakeUser,
            jwt: fakeJWT,
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(() => authRepoMock.logout()).thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(() => authRepoMock.storeJWT(access: fakeJWT, refresh: fakeRefresh))
            .thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
        ..add(const ProxyLoginFormEvent.usernameChanged('fake-proxy_user'))
        ..add(
          ProxyLoginFormEvent.loginWithADButtonPressed(
            salesOrg: SalesOrg('2001'),
            user: fakeUser,
          ),
        ),
      expect: () => [
        proxyloginFormState =
            proxyloginFormState.copyWith(username: fakeUserName),
        proxyloginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        proxyloginFormState.copyWith(
          isSubmitting: false,
          username: fakeUserName,
          showErrorMessages: false,
          authFailureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ],
    );

    blocTest(
      'proxy login failure for all user roles except root admin and zp admin',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.proxyLogin(
            username: fakeUserName,
            salesOrg: SalesOrg('2001'),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            Login(
              access: fakeJWT,
              refresh: fakeRefresh,
              user: User.empty(),
            ),
          ),
        );

        when(
          () => authRepoMock.isEligibleProxyLogin(
            user: User.empty().copyWith(
              username: Username('fake-user'),
              role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
            ),
            jwt: fakeJWT,
          ),
        ).thenAnswer(
          (invocation) async =>
              const Left(ApiFailure.proxyLoginRolePermissionNotMatch()),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
        ..add(const ProxyLoginFormEvent.usernameChanged('fake-proxy_user'))
        ..add(
          ProxyLoginFormEvent.loginWithADButtonPressed(
            user: User.empty().copyWith(
              username: Username('fake-user'),
              role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
            ),
            salesOrg: SalesOrg('2001'),
          ),
        ),
      expect: () => [
        proxyloginFormState =
            proxyloginFormState.copyWith(username: fakeUserName),
        proxyloginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        proxyloginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            const Left(ApiFailure.proxyLoginRolePermissionNotMatch()),
          ),
        ),
      ],
    );

    blocTest(
      'zp admin proxy login for sales rep users and client users with different sales org account',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.proxyLogin(
            username: fakeUserName,
            salesOrg: SalesOrg('2001'),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            Login(
              access: fakeJWT,
              refresh: fakeRefresh,
              user: User.empty(),
            ),
          ),
        );

        when(
          () => authRepoMock.isEligibleProxyLogin(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('zp_admin')),
            ),
            jwt: fakeJWT,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.proxyLoginZPSalesOrgNotMatch(),
          ),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
        ..add(const ProxyLoginFormEvent.usernameChanged('fake-proxy_user'))
        ..add(
          ProxyLoginFormEvent.loginWithADButtonPressed(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('zp_admin')),
            ),
            salesOrg: SalesOrg('2001'),
          ),
        ),
      expect: () => [
        proxyloginFormState =
            proxyloginFormState.copyWith(username: fakeUserName),
        proxyloginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        proxyloginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.proxyLoginZPSalesOrgNotMatch(),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'zp admin proxy login for sales rep users and client users with  same sales org account',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.proxyLogin(
            username: fakeUserName,
            salesOrg: SalesOrg('2001'),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            Login(
              access: fakeJWT,
              refresh: fakeRefresh,
              user: User.empty(),
            ),
          ),
        );

        when(
          () => authRepoMock.isEligibleProxyLogin(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('zp_admin')),
            ),
            jwt: fakeJWT,
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            unit,
          ),
        );

        when(() => authRepoMock.logout()).thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(() => authRepoMock.storeJWT(access: fakeJWT, refresh: fakeRefresh))
            .thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
        ..add(const ProxyLoginFormEvent.usernameChanged('fake-proxy_user'))
        ..add(
          ProxyLoginFormEvent.loginWithADButtonPressed(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('zp_admin')),
            ),
            salesOrg: SalesOrg('2001'),
          ),
        ),
      expect: () => [
        proxyloginFormState =
            proxyloginFormState.copyWith(username: fakeUserName),
        proxyloginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        proxyloginFormState.copyWith(
          isSubmitting: false,
          username: fakeUserName,
          showErrorMessages: false,
          authFailureOrSuccessOption: optionOf(
            const Right(
              unit,
            ),
          ),
        ),
      ],
    );

    blocTest(
      'zp admin proxy login with proxy user role mismatch',
      build: () => ProxyLoginFormBloc(authRepository: authRepoMock),
      setUp: () {
        when(() => authRepoMock.loadCredential()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(
          () => authRepoMock.proxyLogin(
            username: fakeUserName,
            salesOrg: SalesOrg('2001'),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            Login(
              access: JWT('fake-JWT-client'),
              refresh: fakeRefresh,
              user: User.empty(),
            ),
          ),
        );

        when(
          () => authRepoMock.isEligibleProxyLogin(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('zp_admin')),
            ),
            jwt: JWT('fake-JWT-client'),
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.proxyLoginZPTargetRoleNotMatch(),
          ),
        );
      },
      act: (ProxyLoginFormBloc bloc) => bloc
        ..add(const ProxyLoginFormEvent.usernameChanged('fake-proxy_user'))
        ..add(
          ProxyLoginFormEvent.loginWithADButtonPressed(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(type: RoleType('zp_admin')),
            ),
            salesOrg: SalesOrg('2001'),
          ),
        ),
      expect: () => [
        proxyloginFormState =
            proxyloginFormState.copyWith(username: fakeUserName),
        proxyloginFormState.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
        proxyloginFormState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.proxyLoginZPTargetRoleNotMatch(),
            ),
          ),
        ),
      ],
    );
  });
}
