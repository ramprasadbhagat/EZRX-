import 'dart:async';

import 'package:ezrxmobile/domain/user/repository/i_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  final IUserRepository userRepository;

  AuthBloc({
    required this.authRepository,
    required this.userRepository,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);
    add(const AuthEvent.init());
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.map(
      init: (e) async {
        await authRepository.initTokenStorage();
        await authRepository.initOkta();
        add(const AuthEvent.authCheck());
      },
      authCheck: (e) async {
        final result = await userRepository.getUser();
        result.fold(
          (failure) => emit(const AuthState.unauthenticated()),
          (success) => emit(const AuthState.authenticated()),
        );

        // final oktaResult = await authRepository.getOktaAccessToken();
        // oktaResult.fold(
        //   (failure) => emit(const AuthState.unauthenticated()),
        //   (success) => emit(const AuthState.authenticated()),
        // );

        // oktaResult.fold(
        //   (failure) => emit(const AuthState.unauthenticated()),
        //   (oktaAccessToken) async {
        //     final ezrxResult = await authRepository.getEZRXJWT(oktaAccessToken);
        //     ezrxResult.fold(
        //       (failure) => emit(const AuthState.unauthenticated()),
        //       (success) => emit(const AuthState.authenticated()),
        //     );
        //   },
        // );
      },
      logout: (e) async {
        await authRepository.logout();
        emit(const AuthState.unauthenticated());
      },
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    // debugPrint(change);
  }
}
