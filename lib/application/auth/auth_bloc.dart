import 'dart:async';

import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  AuthBloc({
    required this.authRepository,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.map(
      init: (e) async => add(const AuthEvent.authCheck()),
      bioCheck: (e) async {
        final isBiometricPossibleResult =
            await authRepository.canBeAuthenticatedAndBioAvailable();
        await isBiometricPossibleResult.fold(
          (error) async => emit(const AuthState.authenticated()),
          (response) async {
            final authResultEither =
                await authRepository.doBiometricAuthentication();
            await authResultEither.fold(
              (error) async => add(const AuthEvent.logout()),
              (response) async => emit(const AuthState.authenticated()),
            );
          },
        );
      },
      authCheck: (e) async {
        final result = await authRepository.tokenValid();
        await result.fold(
          (invalid) async => add(const AuthEvent.refreshEZRXToken()),
          (valid) async {
            final isBiometricEnabledResult =
                authRepository.isBiometricEnabled();
            await isBiometricEnabledResult.fold(
              (error) async => emit(const AuthState.authenticated()),
              (isEnable) async {
                isEnable
                    ? add(const AuthEvent.checkIfBiometricDenied())
                    : emit(const AuthState.authenticated());
              },
            );
          },
        );
      },
      refreshOktaToken: (e) async {
        final oktaResult = await authRepository.getOktaAccessToken();
        await oktaResult.fold(
          (failure) async => emit(const AuthState.unauthenticated()),
          (oktaAccessToken) async => add(
            const AuthEvent.refreshEZRXToken(),
          ),
        );
      },
      refreshEZRXToken: (e) async {
        final refreshResult = await authRepository.getRefreshToken();
        await refreshResult.fold(
          (failure) async => emit(const AuthState.unauthenticated()),
          (refreshToken) async {
            final ezrxResult =
                await authRepository.getAccessToken(refreshToken);
            await ezrxResult.fold(
              (failure) async => emit(const AuthState.unauthenticated()),
              (login) async {
                await authRepository.storeJWT(
                  access: login.access,
                  refresh: login.refresh,
                );
                final isBiometricEnabledResult =
                    authRepository.isBiometricEnabled();
                await isBiometricEnabledResult.fold(
                  (error) async => emit(const AuthState.authenticated()),
                  (isEnable) async {
                    isEnable
                        ? add(const AuthEvent.bioCheck())
                        : emit(const AuthState.authenticated());
                  },
                );
              },
            );
          },
        );
      },
      logout: (e) {
        authRepository.logout();
        emit(const AuthState.unauthenticated());
      },
      checkIfBiometricDenied: (e) async {
        final failureOrSuccess =
            await authRepository.checkBiometricPermission();
        failureOrSuccess.fold(
          (failure) {
            emit(const AuthState.biometricDenied());
          },
          (isBiometricPossible) {
            add(const AuthEvent.bioCheck());
          },
        );
      },
      visitedAppSettings: (e) async {
        emit(const AuthState.visitedAppSettings());
      },
    );
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    // print(change);
  }
}
