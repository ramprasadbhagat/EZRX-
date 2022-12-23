import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/change_password_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockResetPassword extends Mock implements ChangePasswordRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ChangePasswordRepository resetPasswordRepoMock;
  late User user;
  late ResetPassword resetPasswordMockData;
  late ResetPasswordState resetPasswordState;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    resetPasswordRepoMock = MockResetPassword();
    resetPasswordMockData =
        await ChangePasswordLocalDataSource().setUserPassword();
    user = User.empty().copyWith(
        email: EmailAddress('abc@gmail.com'),
        fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
        username: Username('fake-username'));
    resetPasswordState = ResetPasswordState.initial();
  });

  group('Reset Password Form Bloc', () {
    blocTest<ResetPasswordBloc, ResetPasswordState>(
      'Init Reset Password Bloc',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      setUp: () {},
    );

    blocTest(
      'Old password visiblity',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
          const ResetPasswordEvent.togglePasswordVisibility(
              PasswordFieldType.oldPassword, true)),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          isOldPasswordObscure: true,
          passwordResetFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'New password visiblity',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
          const ResetPasswordEvent.togglePasswordVisibility(
              PasswordFieldType.newPassword, false)),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          isNewPasswordObscure: false,
          passwordResetFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'Confirm password visiblity',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
          const ResetPasswordEvent.togglePasswordVisibility(
              PasswordFieldType.confirmPassword, true)),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          isNewPasswordObscure: true,
          passwordResetFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'old password text onChange',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        ResetPasswordEvent.onTextChange(
            PasswordFieldType.oldPassword, 'old', user),
      ),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          oldPassword: Password.login('old'),
          passwordResetFailureOrSuccessOption: none(),
          newPassword: Password.resetV2(
            ResetPasswordState.initial().newPassword.getValue(),
            'old',
            user,
          ),
        )
      ],
    );

    blocTest(
      'new password text onChange',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(ResetPasswordEvent.onTextChange(
          PasswordFieldType.newPassword, 'Stays@fe2022!', user)),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          oldPassword: Password.login(''),
          passwordResetFailureOrSuccessOption: none(),
          newPassword: Password.resetV2(
            'Stays@fe2022!',
            ResetPasswordState.initial().oldPassword.getValue(),
            user,
          ),
          confirmPassword: Password.comfirm(
            ResetPasswordState.initial().confirmPassword.getValue(),
            'Stays@fe2022!',
          ),
        )
      ],
    );

    blocTest(
      'confrim password text onChange',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(ResetPasswordEvent.onTextChange(
          PasswordFieldType.confirmPassword, 'confirm', user)),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          confirmPassword: Password.comfirm(
            'confirm',
            ResetPasswordState.initial().newPassword.getValue(),
          ),
          passwordResetFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'Restart state',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      act: (ResetPasswordBloc bloc) =>
          bloc.add(const ResetPasswordEvent.onRestart()),
      expect: () => [ResetPasswordState.initial()],
    );

    blocTest(
      'Reset Password fails',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      setUp: () {
        when(() => resetPasswordRepoMock.setPassword(
              newPassword: Password.resetV2('Auron@2022!', 'Auron@2022', user),
              oldPassword: Password.login('Auron@2022'),
              user: user,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ResetPasswordBloc bloc) {
        bloc
          ..add(ResetPasswordEvent.onTextChange(
              PasswordFieldType.oldPassword, 'Auron@2022', user))
          ..add(ResetPasswordEvent.onTextChange(
              PasswordFieldType.newPassword, 'Auron@2022!', user))
          ..add(ResetPasswordEvent.onTextChange(
              PasswordFieldType.confirmPassword, 'Auron@2022!', user))
          ..add(ResetPasswordEvent.resetPasswordPressed(user: user));
      },
      expect: () => [
        resetPasswordState = resetPasswordState.copyWith(
          oldPassword: Password.login('Auron@2022'),
          newPassword: Password.resetV2(
            resetPasswordState.newPassword.getValue(),
            'Auron@2022',
            user,
          ),
          passwordResetFailureOrSuccessOption: none(),
        ),
        resetPasswordState = resetPasswordState.copyWith(
          newPassword: Password.resetV2('Auron@2022!', 'Auron@2022', user),
          confirmPassword: Password.comfirm(
            resetPasswordState.confirmPassword.getValue(),
            'Auron@2022!',
          ),
          passwordResetFailureOrSuccessOption: none(),
        ),
        resetPasswordState = resetPasswordState.copyWith(
          confirmPassword: Password.comfirm(
            'Auron@2022!',
            resetPasswordState.newPassword.getValue(),
          ),
          passwordResetFailureOrSuccessOption: none(),
        ),
        resetPasswordState.copyWith(
          isSubmitting: true,
          passwordResetFailureOrSuccessOption: none(),
        ),
        resetPasswordState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          passwordResetFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        )
      ],
    );

    blocTest(
      'Reset Password Success',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      setUp: () {
        resetPasswordState = ResetPasswordState.initial();
        when(() => resetPasswordRepoMock.setPassword(
              newPassword: Password.resetV2('Auron@2022!', 'Auron@2022', user),
              oldPassword: Password.login('Auron@2022'),
              user: user,
            )).thenAnswer((invocation) async => Right(resetPasswordMockData));
      },
      act: (ResetPasswordBloc bloc) {
        bloc
          ..add(ResetPasswordEvent.onTextChange(
              PasswordFieldType.oldPassword, 'Auron@2022', user))
          ..add(ResetPasswordEvent.onTextChange(
              PasswordFieldType.newPassword, 'Auron@2022!', user))
          ..add(ResetPasswordEvent.onTextChange(
              PasswordFieldType.confirmPassword, 'Auron@2022!', user))
          ..add(ResetPasswordEvent.resetPasswordPressed(user: user));
      },
      expect: () => [
        resetPasswordState = resetPasswordState.copyWith(
          oldPassword: Password.login('Auron@2022'),
          newPassword: Password.resetV2(
            resetPasswordState.newPassword.getValue(),
            'Auron@2022',
            user,
          ),
          passwordResetFailureOrSuccessOption: none(),
        ),
        resetPasswordState = resetPasswordState.copyWith(
          newPassword: Password.resetV2('Auron@2022!', 'Auron@2022', user),
          confirmPassword: Password.comfirm(
            resetPasswordState.confirmPassword.getValue(),
            'Auron@2022!',
          ),
          passwordResetFailureOrSuccessOption: none(),
        ),
        resetPasswordState = resetPasswordState.copyWith(
          confirmPassword: Password.comfirm(
            'Auron@2022!',
            resetPasswordState.newPassword.getValue(),
          ),
          passwordResetFailureOrSuccessOption: none(),
        ),
        resetPasswordState.copyWith(
          isSubmitting: true,
          passwordResetFailureOrSuccessOption: none(),
        ),
        resetPasswordState.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          passwordResetFailureOrSuccessOption: optionOf(
            Right(resetPasswordMockData),
          ),
        )
      ],
    );
    blocTest(
      'Tab Reset Password with invalid old, new, confirm password',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
      ),
      act: (ResetPasswordBloc bloc) =>
          bloc.add(ResetPasswordEvent.resetPasswordPressed(user: user)),
      expect: () => [
        ResetPasswordState.initial().copyWith(
          showErrorMessages: true,
          passwordResetFailureOrSuccessOption: none(),
        )
      ],
    );
  });
}
