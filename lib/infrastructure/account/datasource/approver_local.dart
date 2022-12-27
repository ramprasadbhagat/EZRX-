import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/is_approver_dto.dart';
import 'package:flutter/services.dart';

class ApproverLocalDataSource {
  Future<IsApproverDto> fetch() async {
    await Future.delayed(const Duration(seconds: 3));
    final data = json.decode(
      await rootBundle.loadString('assets/json/getIsApproverResponse.json'),
    );
    final finalData = data['data']['isApprover'];

    return IsApproverDto.fromJson(finalData);
  }
}
