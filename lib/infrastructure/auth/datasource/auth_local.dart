import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/login_dto.dart';
import 'package:flutter/services.dart';

class AuthLocalDataSource {
  Future<Login> loginWithPassword() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/loginAdResponse.json'),
    );

    return LoginDto.fromJson(data['data']['loginV4']).toDomain();
  }

  Future<Login> loginWithOktaToken() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/loginAdResponse.json'),
    );

    return LoginDto.fromJson(data['data']['loginV4']).toDomain();
  }

  Future<Login> proxyLoginWithUsername() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/proxyLoginResponse.json'),
    );

    return LoginDto.fromJson(data['data']['proxyLoginV4']).toDomain();
  }

  Future<Login> getAccessToken() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getAccessToken.json'),
    );

    return LoginDto.fromJson(data['data']['getAccessToken']).toDomain();
  }
}
