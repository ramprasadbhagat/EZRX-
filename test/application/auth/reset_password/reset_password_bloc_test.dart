import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password_cred.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/change_password_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockResetPassword extends Mock implements ChangePasswordRepository {}

class MockTokenStorage extends Mock implements TokenStorage {}

void main() {
  late MockResetPassword mockRepository;
  final resetPasswordState = ResetPasswordState.initial();
  late TokenStorage tokenStorage;

  const invalidPassword = 'rootadmin1234@';
  const validPassword = 'New12345678@';
  const oldPassword = 'old';
  const fakeUserName = 'fake-user';

  final invalidResetPasswordState = resetPasswordState.copyWith(
    oldPassword: Password.login('old'),
    newPassword: Password.resetV2(
      invalidPassword,
      'old',
      'fake-user',
    ),
    confirmPassword: Password.confirm(
      invalidPassword,
      invalidPassword,
    ),
  );
  final validResetPasswordState = resetPasswordState.copyWith(
    user: User.empty().copyWith(username: Username(fakeUserName)),
    oldPassword: Password.login('old'),
    newPassword: Password.resetV2(
      validPassword,
      oldPassword,
      fakeUserName,
    ),
    confirmPassword: Password.confirm(
      validPassword,
      validPassword,
    ),
  );

  final resetPasswordCred = ResetPasswordCred.empty().copyWith(
    token: StringValue('fake-token'),
    username: Username('fake-user'),
  );

  final fakePassword = Password.confirm('new-password@N9', 'new-password@N9');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockRepository = MockResetPassword();
    tokenStorage = MockTokenStorage();
    when(() => tokenStorage.get())
        .thenAnswer((invocation) async => JWTDto(access: '', refresh: ''));
  });

  group('Reset Password Form Bloc', () {
    blocTest(
      'togglePasswordVisibility oldPassword test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.togglePasswordVisibility(
          PasswordFieldType.oldPassword,
          true,
        ),
      ),
      expect: () => [
        resetPasswordState.copyWith(
          isOldPasswordObscure: true,
        ),
      ],
    );

    blocTest(
      'togglePasswordVisibility newPassword test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.togglePasswordVisibility(
          PasswordFieldType.newPassword,
          true,
        ),
      ),
      expect: () => [
        resetPasswordState.copyWith(
          isNewPasswordObscure: true,
        ),
      ],
    );

    blocTest(
      'togglePasswordVisibility confirmPassword test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.togglePasswordVisibility(
          PasswordFieldType.confirmPassword,
          true,
        ),
      ),
      expect: () => [
        resetPasswordState.copyWith(
          isConfirmPasswordObscure: true,
        ),
      ],
    );

    blocTest(
      'onTextChange oldPassword test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.onTextChange(
          PasswordFieldType.oldPassword,
          oldPassword,
        ),
      ),
      expect: () => [
        resetPasswordState.copyWith(
          oldPassword: Password.login(oldPassword),
        ),
      ],
    );

    blocTest(
      'onTextChange newPassword test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.onTextChange(
          PasswordFieldType.newPassword,
          validPassword,
        ),
      ),
      expect: () => [
        resetPasswordState.copyWith(
          newPassword: Password.resetV2(
            validPassword,
            resetPasswordState.confirmPassword.getValue(),
            resetPasswordState.user.username.getValue(),
          ),
        ),
      ],
    );

    blocTest(
      'onTextChange confirmPassword test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.onTextChange(
          PasswordFieldType.confirmPassword,
          validPassword,
        ),
      ),
      expect: () => [
        resetPasswordState.copyWith(
          confirmPassword: Password.confirm(
            validPassword,
            resetPasswordState.newPassword.getValue(),
          ),
        ),
      ],
    );

    blocTest(
      'invalid resetPasswordPressed test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      seed: () => invalidResetPasswordState,
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.changePassword(),
      ),
      expect: () => [
        invalidResetPasswordState.copyWith(showErrorMessages: true),
      ],
      verify: (ResetPasswordBloc bloc) {
        expect(
          bloc.state.showNewPasswordPatternMismatchError,
          true,
        );
      },
    );

    blocTest(
      'resetPasswordPressed failed test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      seed: () => validResetPasswordState,
      setUp: () {
        when(
          () => mockRepository.changePassword(
            user: validResetPasswordState.user,
            oldPassword: validResetPasswordState.oldPassword,
            newPassword: validResetPasswordState.newPassword,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.changePassword(),
      ),
      expect: () => [
        validResetPasswordState.copyWith(isSubmitting: true),
        validResetPasswordState.copyWith(
          passwordResetFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'resetPasswordPressed success test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      seed: () => validResetPasswordState,
      setUp: () {
        when(
          () => mockRepository.changePassword(
            user: validResetPasswordState.user,
            oldPassword: validResetPasswordState.oldPassword,
            newPassword: validResetPasswordState.newPassword,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            ResetPassword.empty(),
          ),
        );
      },
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.changePassword(),
      ),
      expect: () => [
        validResetPasswordState.copyWith(isSubmitting: true),
        ResetPasswordState.initial(),
      ],
    );

    blocTest(
      'Add reset password cred  test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        ResetPasswordEvent.initialize(
          resetPasswordCred: resetPasswordCred,
          user: User.empty(),
        ),
      ),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          resetPasswordCred: resetPasswordCred,
        ),
      ],
    );

    blocTest(
      'Reset password new password not valid Test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      seed: () => ResetPasswordState.initial().copyWith(
        newPassword: Password.confirm('new-password@N9', 'new-password'),
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.resetPassword(),
      ),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          newPassword: Password.confirm('new-password@N9', 'new-password'),
          showErrorMessages: true,
        ),
      ],
    );

    blocTest(
      'Reset password failure test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      setUp: () {
        when(
          () => mockRepository.resetPassword(
            token: StringValue('fake-token'),
            username: Username('fake-user'),
            newPassword: fakePassword,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      seed: () => ResetPasswordState.initial().copyWith(
        newPassword: fakePassword,
        confirmPassword: fakePassword,
        resetPasswordCred: resetPasswordCred,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.resetPassword(),
      ),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          newPassword: fakePassword,
          confirmPassword: fakePassword,
          resetPasswordCred: resetPasswordCred,
          isSubmitting: true,
        ),
        ResetPasswordState.initial().copyWith(
          newPassword: fakePassword,
          confirmPassword: fakePassword,
          resetPasswordCred: resetPasswordCred,
          passwordResetFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Reset password Success test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      setUp: () {
        when(
          () => mockRepository.resetPassword(
            token: StringValue('fake-token'),
            username: Username('fake-user'),
            newPassword: fakePassword,
          ),
        ).thenAnswer(
          (invocation) async => Right(ResetPassword.empty()),
        );
      },
      seed: () => ResetPasswordState.initial().copyWith(
        newPassword: fakePassword,
        confirmPassword: fakePassword,
        resetPasswordCred: resetPasswordCred,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.resetPassword(),
      ),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          newPassword: fakePassword,
          confirmPassword: fakePassword,
          resetPasswordCred: resetPasswordCred,
          isSubmitting: true,
        ),
        ResetPasswordState.initial(),
      ],
    );

    blocTest(
      'clear test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      seed: () => validResetPasswordState,
      act: (ResetPasswordBloc bloc) => bloc.add(
        const ResetPasswordEvent.clear(),
      ),
      expect: () => [ResetPasswordState.initial()],
    );
  });
}
