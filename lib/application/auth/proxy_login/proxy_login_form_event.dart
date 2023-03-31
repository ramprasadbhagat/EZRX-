part of 'proxy_login_form_bloc.dart';

@freezed
class ProxyLoginFormEvent with _$ProxyLoginFormEvent {
  const factory ProxyLoginFormEvent.initialized() = _Initialized;
  const factory ProxyLoginFormEvent.usernameChanged(String usernameStr) =
      _UsernameChanged;
  const factory ProxyLoginFormEvent.loginWithADButtonPressed(User user) =
      _LoginWithADButtonPressed;
}
