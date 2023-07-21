import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/domain/auth/repository/i_forgot_password_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final IForgotPasswordRepository forgotPasswordRepository;
  ForgotPasswordBloc({
    required this.forgotPasswordRepository,
  }) : super(ForgotPasswordState.initial()) {
    on<ForgotPasswordEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    ForgotPasswordEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized value) async => emit(
        ForgotPasswordState.initial(),
      ),
      usernameChanged: (_ForgotPasswordEvent e) async => emit(
        state.copyWith(
          username: Username(e.usernameStr),
          resetPasswordFailureOrSuccessOption: none(),
          showErrorMessages: false,
        ),
      ),
      requestPasswordReset: (_RequestPasswordReset e) async {
        if (!state.username.isValid()) {
          emit(
            state.copyWith(showErrorMessages: true),
          );

          return;
        }
        emit(
          state.copyWith(
            isSubmitting: true,
            resetPasswordFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await forgotPasswordRepository.requestResetPassword(
          username: state.username,
          locale: e.local,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isSubmitting: false,
              resetPasswordFailureOrSuccessOption: optionOf(failureOrSuccess),
              showErrorMessages: true,
            ),
          ),
          (resetPasswordResponse) => emit(
            state.copyWith(
              isSubmitting: false,
              resetPasswordFailureOrSuccessOption: optionOf(failureOrSuccess),
              showErrorMessages: false,
              resetPasswordResponse: resetPasswordResponse,
            ),
          ),
        );
      },
    );
  }
}
