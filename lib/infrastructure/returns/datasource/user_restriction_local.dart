import 'dart:convert';

import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';
import 'package:flutter/services.dart';

class UserRestrictionLocalDataSource {
  Future<UserRestrictionListDto> fetch() async {
    await Future.delayed(const Duration(seconds: 3));
    final data = json.decode(
      await rootBundle.loadString('assets/json/userRestrictionResponse.json'),
    );
    final finalData = data['data']['approverRights'];

    return UserRestrictionListDto.fromJson(finalData);
  }
}
