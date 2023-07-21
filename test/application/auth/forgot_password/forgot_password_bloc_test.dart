import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/forget_password_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ForgotPasswordRepositoryMock extends Mock
    implements ForgotPasswordRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ForgotPasswordRepository forgotPasswordRepositoryMock;
  final userName = Username('fake-username');
  const local = Locale('en');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    forgotPasswordRepositoryMock = ForgotPasswordRepositoryMock();
  });

  group('forgot password Bloc', () {

    blocTest(
      'Initialized forget password bloc',
      build: () => ForgotPasswordBloc(
        forgotPasswordRepository: forgotPasswordRepositoryMock,
      ),
      act: (ForgotPasswordBloc bloc) => bloc.add(
        const ForgotPasswordEvent.initialized(),
      ),
      expect: () => [
        ForgotPasswordState.initial(),
      ],
    );
    blocTest(
      'User name change',
      build: () => ForgotPasswordBloc(
        forgotPasswordRepository: forgotPasswordRepositoryMock,
      ),
      act: (ForgotPasswordBloc bloc) => bloc.add(
        ForgotPasswordEvent.usernameChanged(
          userName.getOrDefaultValue(''),
        ),
      ),
      expect: () => [
        ForgotPasswordState.initial().copyWith(username: userName),
      ],
    );

    blocTest(
      'Try forget password with empty username',
      build: () => ForgotPasswordBloc(
        forgotPasswordRepository: forgotPasswordRepositoryMock,
      ),
      seed: () =>
          ForgotPasswordState.initial().copyWith(username: Username('')),
      act: (ForgotPasswordBloc bloc) => bloc.add(
        const ForgotPasswordEvent.requestPasswordReset(local),
      ),
      expect: () => [
        ForgotPasswordState.initial().copyWith(showErrorMessages: true),
      ],
    );

    blocTest(
      'Forget password success',
      build: () => ForgotPasswordBloc(
        forgotPasswordRepository: forgotPasswordRepositoryMock,
      ),
      setUp: () {
        when(
          () => forgotPasswordRepositoryMock.requestResetPassword(
            locale: local,
            username: userName,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            ForgotPassword(success: false, email: ''),
          ),
        );
      },
      seed: () => ForgotPasswordState.initial().copyWith(username: userName),
      act: (ForgotPasswordBloc bloc) => bloc.add(
        const ForgotPasswordEvent.requestPasswordReset(local),
      ),
      expect: () => [
        ForgotPasswordState.initial().copyWith(
          isSubmitting: true,
          username: userName,
        ),
        ForgotPasswordState.initial().copyWith(
          username: userName,
          resetPasswordFailureOrSuccessOption: optionOf(
            Right(
              ForgotPassword(success: false, email: ''),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Forget password fail',
      build: () => ForgotPasswordBloc(
        forgotPasswordRepository: forgotPasswordRepositoryMock,
      ),
      setUp: () {
        when(
          () => forgotPasswordRepositoryMock.requestResetPassword(
            locale: local,
            username: userName,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      seed: () => ForgotPasswordState.initial().copyWith(username: userName),
      act: (ForgotPasswordBloc bloc) => bloc.add(
        const ForgotPasswordEvent.requestPasswordReset(local),
      ),
      expect: () => [
        ForgotPasswordState.initial().copyWith(
          isSubmitting: true,
          username: userName,
        ),
        ForgotPasswordState.initial().copyWith(
          username: userName,
          showErrorMessages: true,
          resetPasswordFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );
  });
}
