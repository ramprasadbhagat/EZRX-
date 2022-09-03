import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/loginv2_dto.dart';
import 'package:flutter/services.dart';

class AuthLocalDataSource {
  Future<LoginV2> loginWithPassword({
    required String username,
    required String password,
  }) async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/loginAdResponse.json'),
    );

    return LoginV2Dto.fromJson(data['data']['loginV2']).toDomain();
  }

  Future<LoginV2> loginWithOktaToken({
    required String oktaAccessToken,
  }) async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/loginAdResponse.json'),
    );

    return LoginV2Dto.fromJson(data['data']['loginV2']).toDomain();
  }

  Future<LoginV2> proxyLoginWithUsername({required String username}) async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/proxyLoginResponse.json'),
    );

    return LoginV2Dto.fromJson(data['data']['proxyLoginV2']).toDomain();
  }
}
