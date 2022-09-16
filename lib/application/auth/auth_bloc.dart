import 'dart:async';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);
    add(const AuthEvent.init());
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.map(
      init: (e) async {
        await authRepository.initTokenStorage();
        await authRepository.initCredStorage();
        await authRepository.initOkta();
        add(const AuthEvent.authCheck());
      },
      authCheck: (e) async {
        final result = await authRepository.tokenValid();
        await result.fold(
          (invalid) async => add(const AuthEvent.refreshOktaToken()),
          (valid) async => emit(const AuthState.authenticated()),
        );
      },
      refreshOktaToken: (e) async {
        emit(const AuthState.loading());
        final oktaResult = await authRepository.getOktaAccessToken();
        await oktaResult.fold(
          (failure) async => emit(const AuthState.unauthenticated()),
          (oktaAccessToken) async => add(
            AuthEvent.refreshEZRXToken(oktaAccessToken),
          ),
        );
      },
      refreshEZRXToken: (e) async {
        final ezrxResult = await authRepository.getEZRXJWT(e.oktaAccessToken);
        await ezrxResult.fold(
          (failure) async => emit(const AuthState.unauthenticated()),
          (login) async {
            await authRepository.storeJWT(jwt: login.jwt);
            emit(const AuthState.authenticated());
          },
        );
      },
      logout: (e) {
        authRepository.logout();
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
    // print(change);
  }
}
