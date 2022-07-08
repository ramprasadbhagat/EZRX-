import 'package:ezrxmobile/domain/auth/login/I_login_service.dart';
import 'package:ezrxmobile/infrastructure/constant/okta_config.dart';
import 'package:flutter/services.dart';
import 'package:okta_oidc/okta_oidc.dart';

class OktaLoginServices implements ILoginService {
  final _oktaOidcPlugin = OktaOidc();

  @override
  Future<bool?> init() async {
    return _oktaOidcPlugin.initOkta(OktaConfig.config).then((value) {
      return value ?? (throw PlatformException(code: '0'));
    }).catchError((error) => throw error as PlatformException);
  }

  @override
  Future<Map?> login() async {
    return _oktaOidcPlugin.login().then((value) {
      return !value?['status']
          ? throw PlatformException(code: '0', message: value?['message'])
          : value;
    }).catchError((error) => throw error as PlatformException);
  }

  @override
  Future<Map?> getAccessToken() async {
    return _oktaOidcPlugin.getAccessToken().then((value) {
      return !value?['status']
          ? throw PlatformException(code: '0', message: value?['message'])
          : value;
    }).catchError((error) => throw error as PlatformException);
  }

  @override
  Future<bool?> logout() async {
    return _oktaOidcPlugin.logout().then((value) {
      return value ?? (throw PlatformException(code: '0'));
    }).catchError((error) => throw error as PlatformException);
  }

  @override
  Future<dynamic> getUserProfile() async {
    return _oktaOidcPlugin.getUserProfile().then((value) {
      return value;
    }).catchError((error) => throw error as PlatformException);
  }
}
