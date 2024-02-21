import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
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
  late User user;

  const invalidPassword = 'rootadmin1234@';
  const validPassword = 'New12345678@';
  const oldPassword = 'old';

  final invalidResetPasswordState = resetPasswordState.copyWith(
    oldPassword: Password.login('old'),
    newPassword: Password.resetV2(
      invalidPassword,
      'old',
    ),
    confirmPassword: Password.confirm(
      invalidPassword,
      invalidPassword,
    ),
  );
  final validResetPasswordState = resetPasswordState.copyWith(
    oldPassword: Password.login('old'),
    newPassword: Password.resetV2(
      validPassword,
      oldPassword,
    ),
    confirmPassword: Password.confirm(
      validPassword,
      validPassword,
    ),
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockRepository = MockResetPassword();
    tokenStorage = MockTokenStorage();
    when(() => tokenStorage.get())
        .thenAnswer((invocation) async => JWTDto(access: '', refresh: ''));
    user = await UserLocalDataSource(tokenStorage: tokenStorage).getUser();
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
        )
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
        )
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
        )
      ],
    );

    blocTest(
      'onTextChange oldPassword test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        ResetPasswordEvent.onTextChange(
          PasswordFieldType.oldPassword,
          oldPassword,
          user,
        ),
      ),
      expect: () => [
        resetPasswordState.copyWith(
          oldPassword: Password.login(oldPassword),
        )
      ],
    );

    blocTest(
      'onTextChange newPassword test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        ResetPasswordEvent.onTextChange(
          PasswordFieldType.newPassword,
          validPassword,
          user,
        ),
      ),
      expect: () => [
        resetPasswordState.copyWith(
          newPassword: Password.resetV2(
            validPassword,
            resetPasswordState.confirmPassword.getValue(),
          ),
        )
      ],
    );

    blocTest(
      'onTextChange confirmPassword test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
        ResetPasswordEvent.onTextChange(
          PasswordFieldType.confirmPassword,
          validPassword,
          user,
        ),
      ),
      expect: () => [
        resetPasswordState.copyWith(
          confirmPassword: Password.confirm(
            validPassword,
            resetPasswordState.newPassword.getValue(),
          ),
        )
      ],
    );

    blocTest(
      'invalid resetPasswordPressed test',
      build: () => ResetPasswordBloc(
        changePasswordRepository: mockRepository,
      ),
      seed: () => invalidResetPasswordState,
      act: (ResetPasswordBloc bloc) => bloc.add(
        ResetPasswordEvent.changePassword(
          user: user,
        ),
      ),
      expect: () => [
        invalidResetPasswordState.copyWith(showErrorMessages: true),
      ],
      verify: (ResetPasswordBloc bloc) {
        expect(
          bloc.state.showNewPasswordPatternMismatchError(user),
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
            user: user,
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
        ResetPasswordEvent.changePassword(
          user: user,
        ),
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
            user: user,
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
        ResetPasswordEvent.changePassword(
          user: user,
        ),
      ),
      expect: () => [
        validResetPasswordState.copyWith(isSubmitting: true),
        validResetPasswordState.copyWith(
          passwordResetFailureOrSuccessOption:
              optionOf(Right(ResetPassword.empty())),
        ),
        ResetPasswordState.initial()
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
