import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/domain/auth/repository/i_change_password_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_bloc.freezed.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  IChangePasswordRepository changePasswordRepository;
  ResetPasswordBloc({
    required this.changePasswordRepository,
  }) : super(ResetPasswordState.initial()) {
    on<ResetPasswordEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    await event.map(
      togglePasswordVisibility: (e) {
        switch (e.fieldType) {
          case PasswordFieldType.oldPassword:
            emit(
              state.copyWith(
                isOldPasswordObscure: e.toggleValue,
                passwordResetFailureOrSuccessOption: none(),
              ),
            );
            break;
          case PasswordFieldType.newPassword:
            emit(
              state.copyWith(
                isNewPasswordObscure: e.toggleValue,
                passwordResetFailureOrSuccessOption: none(),
              ),
            );
            break;
          case PasswordFieldType.confirmPassword:
            emit(
              state.copyWith(
                isConfirmPasswordObscure: e.toggleValue,
                passwordResetFailureOrSuccessOption: none(),
              ),
            );
            break;
        }
      },
      onTextChange: (e) {
        switch (e.fieldType) {
          case PasswordFieldType.oldPassword:
            emit(
              state.copyWith(
                oldPassword: Password.login(e.newValue),
                newPassword: Password.resetV2(
                  state.newPassword.getValue(),
                  e.newValue,
                  e.user,
                ),
                passwordResetFailureOrSuccessOption: none(),
              ),
            );
            break;
          case PasswordFieldType.newPassword:
            emit(
              state.copyWith(
                newPassword: Password.resetV2(
                  e.newValue,
                  state.oldPassword.getValue(),
                  e.user,
                ),
                confirmPassword: Password.confirm(
                  state.confirmPassword.getValue(),
                  e.newValue,
                ),
                passwordResetFailureOrSuccessOption: none(),
              ),
            );
            break;
          case PasswordFieldType.confirmPassword:
            emit(
              state.copyWith(
                confirmPassword: Password.confirm(
                  e.newValue,
                  state.newPassword.getValue(),
                ),
                passwordResetFailureOrSuccessOption: none(),
              ),
            );
            break;
        }
      },
      resetPasswordPressed: (e) async {
        final isOldPasswordValid = state.oldPassword.isValid();
        final isNewPasswordValid = state.newPassword.isValid();
        final isConfirmPasswordValid = state.confirmPassword.isValid();
        if (isOldPasswordValid &&
            isNewPasswordValid &&
            isConfirmPasswordValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              passwordResetFailureOrSuccessOption: none(),
            ),
          );

          final failureOrSuccess = await changePasswordRepository.setPassword(
            newPassword: state.newPassword,
            oldPassword: state.oldPassword,
            user: e.user,
          );

          failureOrSuccess.fold(
            (l) => emit(
              state.copyWith(
                passwordResetFailureOrSuccessOption: optionOf(failureOrSuccess),
                isSubmitting: false,
                showErrorMessages: true,
              ),
            ),
            (r) => emit(
              state.copyWith(
                passwordResetFailureOrSuccessOption: optionOf(failureOrSuccess),
                isSubmitting: false,
                showErrorMessages: true,
              ),
            ),
          );
        } else {
          emit(state.copyWith(showErrorMessages: true));
        }
      },
      onRestart: (e) {
        emit(ResetPasswordState.initial());
      },
    );
  }

  @override
  void onChange(Change<ResetPasswordState> change) {
    super.onChange(change);
    // print(change);
  }
}
