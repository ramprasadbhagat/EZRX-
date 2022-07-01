import 'dart:convert';

import 'package:ezrxmobile/domain/auth/login/I_login_service.dart';
import 'package:flutter/services.dart';
import 'package:okta_oidc/okta_oidc.dart';

class OktaLoginServices implements ILoginService {
  final _oktaOidcPlugin = OktaOidc();

  OktaLoginServices() {
    _init();
  }

  Future<void> _init() async {
    try {
      final response =
          await rootBundle.loadString('assets/okta/okta_config.json');
      await _oktaOidcPlugin.initOkta(jsonDecode(response));
      print('@@XXXX');
    } catch (e) {
      print('@@@@ $e');
    }
  }

  @override
  Future<Map?> login() async {
    try {
      final response =
          await rootBundle.loadString('assets/okta/okta_config.json');
      await _oktaOidcPlugin.initOkta(jsonDecode(response));
      print('@@XXXX');
    } catch (e) {
      print('@@@@ $e');
    }
    return _oktaOidcPlugin.login();
  }

  @override
  Future<Map?> getAccessToken() async {
    return _oktaOidcPlugin.getAccessToken().then((value) {
      return value;
    });
  }

  @override
  Future<bool?> logout() async {
    return _oktaOidcPlugin.logout();
  }

  @override
  Future<dynamic> getUserProfile() async {
    return _oktaOidcPlugin.getUserProfile();
  }
}
