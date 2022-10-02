import 'dart:convert';

import 'package:ezrxmobile/domain/auth/entities/reset_password_entities.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/reset_password_dto.dart';
import 'package:flutter/services.dart';

class ChangePasswordLocalDataSource {
  Future<ResetPasswordEntities> setUserPassword() async {
    final data = json.decode(
        await rootBundle.loadString('assets/json/changePasswordResponse.json'),
    );
    
    return ResetPasswordDto.fromJson(data['data']['changePassword']).toDomain();
  }
}
