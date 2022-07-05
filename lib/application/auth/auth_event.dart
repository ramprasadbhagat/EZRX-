part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = _AuthInit;
  const factory AuthEvent.authCheck() = _AuthCheck;
  const factory AuthEvent.logout() = _Logout;
}
