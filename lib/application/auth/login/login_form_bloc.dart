import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/error/auth_failure.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';
part 'login_form_bloc.freezed.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final IAuthRepository authRepository;

  LoginFormBloc({
    required this.authRepository,
  }) : super(LoginFormState.initial()) {
    on<LoginFormEvent>(_onEvent);
    // add(const LoginFormEvent.loadLastSavedCred());
  }

  Future<void> _onEvent(
    LoginFormEvent event,
    Emitter<LoginFormState> emit,
  ) async {
    await event.map(
      // loadLastSavedCred: (e) async {
      //   final failureOrSuccess = await authRepository.loadCredential();

      //   failureOrSuccess.fold(
      //     (_) {},
      //     (cred) {
      //       emit(state.copyWith(
      //         username: Username(cred.username),
      //         password: Password.login(cred.password),
      //         authFailureOrSuccessOption: none(),
      //       ));
      //     },
      //   );
      // },
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
            (loginv2) {
              authRepository.storeJWT(jwt: loginv2.jwt);
              // if (state.rememberPassword) {
              //   authRepository.storeCredential(
              //     username: state.username,
              //     password: state.password,
              //   );
              // }
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
        final failureOrSuccess = await authRepository.loginWithOkta();
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
