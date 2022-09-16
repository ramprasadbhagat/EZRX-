import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'proxy_login_form_event.dart';
part 'proxy_login_form_state.dart';
part 'proxy_login_form_bloc.freezed.dart';

class ProxyLoginFormBloc
    extends Bloc<ProxyLoginFormEvent, ProxyLoginFormState> {
  final IAuthRepository authRepository;

  ProxyLoginFormBloc({
    required this.authRepository,
  }) : super(ProxyLoginFormState.initial()) {
    on<ProxyLoginFormEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ProxyLoginFormEvent event,
    Emitter<ProxyLoginFormState> emit,
  ) async {
    await event.map(
      usernameChanged: (e) {
        emit(state.copyWith(
          username: Username(e.usernameStr),
          authFailureOrSuccessOption: none(),
        ));
      },
      loginWithADButtonPressed: (e) async {
        final isProxyUsernameValid = state.username.isValid();
        if (isProxyUsernameValid) {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));
          final failureOrSuccess = await authRepository.proxyLogin(
            username: state.username,
          );
          await failureOrSuccess.fold(
            (_) {},
            (login) => authRepository.storeJWT(jwt: login.jwt),
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
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }

  @override
  void onChange(Change<ProxyLoginFormState> change) {
    super.onChange(change);
    // print(change);
  }
}
