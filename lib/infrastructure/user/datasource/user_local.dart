import 'dart:convert';

import 'package:ezrxmobile/domain/user/entities/user.dart';
import 'package:ezrxmobile/infrastructure/user/dtos/user_dto.dart';
import 'package:flutter/services.dart';

class UserLocalDataSource {
  Future<User> getUser() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/userResponse.json'),
    );

    return UserDto.fromJson(data['data']['user']).toDomain();
  }
}
