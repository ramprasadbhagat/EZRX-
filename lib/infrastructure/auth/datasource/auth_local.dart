import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/login_dto.dart';
import 'package:flutter/services.dart';

class AuthLocalDataSource {
  Future<Login> loginWithPassword({
    required String username,
    required String password,
  }) async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/loginAdResponse.json'),
    );

    return LoginDto.fromJson(data['data']['loginV3']).toDomain();
  }

  Future<Login> loginWithOktaToken({
    required String oktaAccessToken,
  }) async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/loginAdResponse.json'),
    );

    return LoginDto.fromJson(data['data']['loginV3']).toDomain();
  }

  Future<Login> proxyLoginWithUsername({required String username}) async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/proxyLoginResponse.json'),
    );

    return LoginDto.fromJson(data['data']['proxyLoginV3']).toDomain();
  }
}
