part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = _AuthInit;
  const factory AuthEvent.bioCheck() = _BioCheck;
  const factory AuthEvent.authCheck() = _AuthCheck;
  const factory AuthEvent.refreshOktaToken() = _RefreshOktaToken;
  const factory AuthEvent.refreshEZRXToken(JWT oktaAccessToken) =
      _RefreshEZRXToken;
  const factory AuthEvent.logout() = _Logout;
}
