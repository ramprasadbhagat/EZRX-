import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/setting_aup.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/change_password_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockResetPassword extends Mock implements ChangePasswordRepository {}

void main() {
  late ChangePasswordRepository resetPasswordRepoMock;
  late UserBloc mockUserBloc;
  late ResetPasswordBloc resetPasswordBloc;
  late ResetPasswordState resetPasswordState;
  late User user;
  late UserState userBlocState;

  setUpAll(() {
    user = User(
      id: '1',
      username: Username('choo'),
      email: EmailAddress('abc@gmail.com'),
      fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
      role: Role(
          id: '2',
          description: 'Developer',
          name: 'abc',
          type: RoleType('Developer')),
      customerCode: CustomerCode('2606'),
      userSalesOrganisations: [],
      settings: Settings.empty(),
      settingTc: SettingTc.empty(),
      settingAup: SettingAup.empty(),
      enableOrderType: false,
    );
    resetPasswordRepoMock = MockResetPassword();
    mockUserBloc = MockUserBloc();
    resetPasswordBloc = ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
        userBloc: mockUserBloc);
    resetPasswordState = ResetPasswordState.initial();
    userBlocState = UserState.initial().copyWith(user: user);
  });

  group('Reset Password Form Bloc', () {
    blocTest<ResetPasswordBloc, ResetPasswordState>(
      'Init Reset Password Bloc',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
        userBloc: mockUserBloc,
      ),
      setUp: () {},
    );

    blocTest(
      'Old password visiblity',
      build: () => resetPasswordBloc,
      act: (ResetPasswordBloc bloc) => bloc.add(
          const ResetPasswordEvent.togglePasswordVisibility(
              PasswordFieldType.oldPassword, true)),
      expect: () => [
        resetPasswordState.copyWith(
          isOldPasswordObscure: true,
          passwordResetFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'New password visiblity',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
        userBloc: mockUserBloc,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
          const ResetPasswordEvent.togglePasswordVisibility(
              PasswordFieldType.newPassword, false)),
      expect: () => [
        resetPasswordState.copyWith(
          isNewPasswordObscure: false,
          passwordResetFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'Confirm password visiblity',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
        userBloc: mockUserBloc,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
          const ResetPasswordEvent.togglePasswordVisibility(
              PasswordFieldType.confirmPassword, true)),
      expect: () => [
        resetPasswordState.copyWith(
          isNewPasswordObscure: true,
          passwordResetFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'old password text onChange',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
        userBloc: mockUserBloc,
      ),
      setUp: () {
        when(() => mockUserBloc.state).thenAnswer(
            (invocation) => UserState.initial().copyWith(user: user));
      },
      act: (ResetPasswordBloc bloc) => bloc.add(
          const ResetPasswordEvent.onTextChange(
              PasswordFieldType.oldPassword, 'old')),
      expect: () => [
        resetPasswordState.copyWith(
          oldPassword: Password.login('old'),
          passwordResetFailureOrSuccessOption: none(),
          newPassword: Password.resetV2(
            resetPasswordState.newPassword.getValue(),
            'old',
            userBlocState.user,
          ),
        )
      ],
    );

    blocTest(
      'new password text onChange',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
        userBloc: mockUserBloc,
      ),
      setUp: () {
        when(() => mockUserBloc.state).thenAnswer(
            (invocation) => UserState.initial().copyWith(user: user));
      },
      act: (ResetPasswordBloc bloc) => bloc.add(
          const ResetPasswordEvent.onTextChange(
              PasswordFieldType.newPassword, 'Stays@fe2022!')),
      expect: () => [
        resetPasswordState.copyWith(
          oldPassword: Password.login(''),
          passwordResetFailureOrSuccessOption: none(),
          newPassword: Password.resetV2(
            'Stays@fe2022!',
            resetPasswordState.oldPassword.getValue(),
            userBlocState.user,
          ),
          confirmPassword: Password.comfirm(
            resetPasswordState.confirmPassword.getValue(),
            'Stays@fe2022!',
          ),
        )
      ],
    );

    blocTest(
      'confrim password text onChange',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
        userBloc: mockUserBloc,
      ),
      act: (ResetPasswordBloc bloc) => bloc.add(
          const ResetPasswordEvent.onTextChange(
              PasswordFieldType.confirmPassword, 'confirm')),
      expect: () => [
        resetPasswordState.copyWith(
          confirmPassword: Password.comfirm(
            'confirm',
            resetPasswordState.newPassword.getValue(),
          ),
          passwordResetFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest(
      'Restart state',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
        userBloc: mockUserBloc,
      ),
      act: (ResetPasswordBloc bloc) =>
          bloc.add(const ResetPasswordEvent.onRestart()),
      expect: () => [ResetPasswordState.initial()],
    );

    // TODO: need Dipankar to fix this
    // blocTest(
    //   'Reset Password fails',
    //   build: () => ResetPasswordBloc(
    //     changePasswordRepository: resetPasswordRepoMock,
    //     userBloc: mockUserBloc,
    //   ),
    //   setUp: () {
    //     when(() => mockUserBloc.state).thenAnswer(
    //         (invocation) => UserState.initial().copyWith(user: user));

    //     when(() => resetPasswordRepoMock.setPassword(
    //           newPassword: Password.resetV2(
    //               'Auron@2022!', 'Auron@2022', userBlocState.user),
    //           oldPassword: Password.login('Auron@2022'),
    //           userName: userBlocState.user.username,
    //         )).thenAnswer(
    //       (invocation) async => Left(
    //         FailureHandler.handleFailure(const ApiFailure.other('fake-error')),
    //       ),
    //     );
    //   },
    //   act: (ResetPasswordBloc bloc) {
    //     return bloc
    //       ..add(const ResetPasswordEvent.onTextChange(
    //           PasswordFieldType.oldPassword, 'Auron@2022'))
    //       ..add(const ResetPasswordEvent.onTextChange(
    //           PasswordFieldType.newPassword, 'Auron@2022!'))
    //       ..add(const ResetPasswordEvent.onTextChange(
    //           PasswordFieldType.confirmPassword, 'Auron@2022!'))
    //       ..add(const ResetPasswordEvent.resetPasswordPressed());
    //   },
    //   expect: () => [
    //     resetPasswordState = resetPasswordState.copyWith(
    //       oldPassword: Password.login('Auron@2022'),
    //       newPassword: Password.resetV2(
    //         resetPasswordState.newPassword.getValue(),
    //         'Auron@2022',
    //         userBlocState.user,
    //       ),
    //       passwordResetFailureOrSuccessOption: none(),
    //     ),
    //     resetPasswordState = resetPasswordState.copyWith(
    //       newPassword:
    //           Password.resetV2('Auron@2022!', 'Auron@2022', userBlocState.user),
    //       confirmPassword: Password.comfirm(
    //         resetPasswordState.confirmPassword.getValue(),
    //         'Auron@2022!',
    //       ),
    //       passwordResetFailureOrSuccessOption: none(),
    //     ),
    //     resetPasswordState = resetPasswordState.copyWith(
    //       confirmPassword: Password.comfirm(
    //         'Auron@2022!',
    //         resetPasswordState.newPassword.getValue(),
    //       ),
    //       passwordResetFailureOrSuccessOption: none(),
    //     ),
    //     resetPasswordState.copyWith(
    //       isSubmitting: true,
    //       passwordResetFailureOrSuccessOption: none(),
    //     ),
    //     resetPasswordState.copyWith(
    //         isSubmitting: false,
    //         passwordResetFailureOrSuccessOption: optionOf(Left(
    //             FailureHandler.handleFailure(
    //                 const ApiFailure.other('fake-error')))))
    //   ],
    // );

    blocTest(
      'Reset Password Success',
      build: () => ResetPasswordBloc(
        changePasswordRepository: resetPasswordRepoMock,
        userBloc: mockUserBloc,
      ),
      setUp: () {
        resetPasswordState = ResetPasswordState.initial();
        when(() => mockUserBloc.state)
            .thenReturn(UserState.initial().copyWith(user: user));

        when(() => resetPasswordRepoMock.setPassword(
                  newPassword: Password.resetV2(
                      'Auron@2022!', 'Auron@2022', userBlocState.user),
                  oldPassword: Password.login('Auron@2022'),
                  userName: userBlocState.user.username,
                ))
            .thenAnswer((invocation) async =>
                const Right(ResetPassword(status: 'sucess', success: true)));
      },
      act: (ResetPasswordBloc bloc) {
        bloc
          ..add(const ResetPasswordEvent.onTextChange(
              PasswordFieldType.oldPassword, 'Auron@2022'))
          ..add(const ResetPasswordEvent.onTextChange(
              PasswordFieldType.newPassword, 'Auron@2022!'))
          ..add(const ResetPasswordEvent.onTextChange(
              PasswordFieldType.confirmPassword, 'Auron@2022!'))
          ..add(const ResetPasswordEvent.resetPasswordPressed());
      },
      expect: () => [
        resetPasswordState = resetPasswordState.copyWith(
          oldPassword: Password.login('Auron@2022'),
          newPassword: Password.resetV2(
            resetPasswordState.newPassword.getValue(),
            'Auron@2022',
            userBlocState.user,
          ),
          passwordResetFailureOrSuccessOption: none(),
        ),
        resetPasswordState = resetPasswordState.copyWith(
          newPassword:
              Password.resetV2('Auron@2022!', 'Auron@2022', userBlocState.user),
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
            const Right(ResetPassword(status: 'sucess', success: true)),
          ),
        )
      ],
    );
  });
}
