import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_bloc.freezed.dart';
part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final IAuthRepository authRepository;

  LoginFormBloc({
    required this.authRepository,
  }) : super(LoginFormState.initial()) {
    on<LoginFormEvent>(_onEvent);
    add(const LoginFormEvent.loadLastSavedCred());
  }

  Future<void> _onEvent(
    LoginFormEvent event,
    Emitter<LoginFormState> emit,
  ) async {
    await event.map(
      loadLastSavedCred: (e) async {
        final failureOrSuccess = await authRepository.loadCredential();
        await failureOrSuccess.fold(
          (_) {},
          (cred) async {
            if (cred.username.isValid() && cred.password.isValid()) {
              emit(state.copyWith(
                username: cred.username,
                password: cred.password,
                rememberPassword: true,
                authFailureOrSuccessOption: none(),
              ));
            }
          },
        );
      },
      usernameChanged: (e) {
        emit(state.copyWith(
          username: Username(e.usernameStr),
          authFailureOrSuccessOption: none(),
        ));
      },
      passwordChanged: (e) {
        emit(state.copyWith(
          password: Password.login(e.passwordStr),
          authFailureOrSuccessOption: none(),
        ));
      },
      passwordVisibilityChanged: (e) {
        emit(state.copyWith(passwordVisible: !state.passwordVisible));
      },
      rememberCheckChanged: (e) {
        emit(state.copyWith(rememberPassword: !state.rememberPassword));
      },
      loginWithEmailAndPasswordPressed: (e) async {
        final isUsernameValid = state.username.isValid();
        final isPasswordValid = state.password.isValid();

        if (isUsernameValid && isPasswordValid) {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));
          final failureOrSuccess = await authRepository.login(
            username: state.username,
            password: state.password,
          );

          failureOrSuccess.fold(
            (_) {},
            (login) {
              authRepository.storeJWT(jwt: login.jwt);
              if (state.rememberPassword) {
                authRepository.storeCredential(
                  username: state.username,
                  password: state.password,
                );
              } else {
                authRepository.deleteCredential();
              }
            },
          );

          emit(state.copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: optionOf(failureOrSuccess),
          ));
        } else {
          emit(state.copyWith(showErrorMessages: true));
        }
      },
      loginWithOktaButtonPressed: (e) async {
        emit(state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ));
        final failureOrSuccess = await authRepository.loginWithOkta();
        emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      },
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }

  @override
  void onChange(Change<LoginFormState> change) {
    super.onChange(change);
    // print(change);
  }
}
