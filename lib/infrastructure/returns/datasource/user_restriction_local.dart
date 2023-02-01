import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/return_approval_and_approver_rights.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restrictions_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';
import 'package:flutter/services.dart';


import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_status_dto.dart';

import 'package:ezrxmobile/domain/returns/entities/user_restriction_status.dart';



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

  Future<UserRestrictionStatus> addApprovalLimit() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getAddUserRestrictionDetails.json'),
    );
    final finalData = data['data'];

    return UserRestrictionStatusDto.fromJson(finalData).toDomain();
  }

  Future<UserRestrictionStatus> configureUserRestriction() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getConfigureUserRestrictionDetails.json'),
    );
    final finalData = data['data'];

    return UserRestrictionStatusDto.fromJson(finalData).toDomain();
  }

  Future<UserRestrictionStatus> deleteApprovalRights() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getDeleteUserRestriction.json'),
    );
    final finalData = data['data'];

    return UserRestrictionStatusDto.fromJson(finalData).toDomain();
  }

  Future<UserRestrictionStatus> deleteApprovalLimit() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getDeleteReturnApprovalLimit.json'),
    );
    final finalData = data['data'];

    return UserRestrictionStatusDto.fromJson(finalData).toDomain();
  }
}
