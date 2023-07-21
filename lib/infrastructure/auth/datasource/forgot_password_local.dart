import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/forgot_password_dto.dart';
import 'package:flutter/services.dart';

class ForgotPasswordLocalDataSource {
  Future<ForgotPassword> requestResetPassword() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/requestResetPasswordLinkResponse.json'),
    );

    return ForgotPasswordDto.fromJson(data['data']['requestResetPassword'])
        .toDomain();
  }
}
