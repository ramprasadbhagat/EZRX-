import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/return_approval_and_approver_rights.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restrictions_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_status_dto.dart';

import 'package:ezrxmobile/domain/returns/entities/user_restriction_status.dart';

enum UserRestrictionType {
  addApprovalLimit,
  configureUser,
  deleteApprovalLimit,
  deleteApprovalRight,
}

extension on UserRestrictionType {
  String get mockDataPath {
    switch (this) {
      case UserRestrictionType.addApprovalLimit:
        return 'getAddUserRestrictionDetails.json';
      case UserRestrictionType.configureUser:
        return 'getConfigureUserRestrictionDetails.json';
      case UserRestrictionType.deleteApprovalLimit:
        return 'getDeleteReturnApprovalLimit.json';
      case UserRestrictionType.deleteApprovalRight:
        return 'getDeleteUserRestriction.json';
    }
  }
}

class UserRestrictionLocalDataSource {
  Future<UserRestrictionListDto> fetch() async {
    await Future.delayed(const Duration(seconds: 3));
    final data = json.decode(
      await rootBundle.loadString('assets/json/userRestrictionResponse.json'),
    );
    final finalData = data['data']['approverRights'];

    return UserRestrictionListDto.fromJson(finalData);
  }

  Future<UserRestrictions> getUserRestrictions() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getReturnApprovalAndApproverRights.json'),
    );
    final finalData = data['data'];

    return UserRestrictionsDto.fromJson(finalData).toDomain();
  }

  Future<UserRestrictionStatus> getUserRestrictionStatus({
    UserRestrictionType type = UserRestrictionType.configureUser,
  }) async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/${type.mockDataPath}'),
    );
    final finalData = data['data'];

    return UserRestrictionStatusDto.fromJson(finalData).toDomain();
  }
}
