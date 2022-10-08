import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/reset_password.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/reset_password_dto.dart';
import 'package:flutter/services.dart';

class ChangePasswordLocalDataSource {
  Future<ResetPassword> setUserPassword() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/changePasswordResponse.json'),
    );

    return ResetPasswordDto.fromJson(data['data']['changePassword']).toDomain();
  }
}
