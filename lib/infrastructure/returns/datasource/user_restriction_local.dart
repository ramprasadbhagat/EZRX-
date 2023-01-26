import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/return_approval_and_approver_rights.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restrictions_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';
import 'package:flutter/services.dart';


import 'package:ezrxmobile/infrastructure/returns/dtos/add_user_restrictions_dto.dart';

import 'package:ezrxmobile/domain/returns/entities/add_return_approval_limit.dart';



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

  Future<AddConfigureUserRestrictionStatus> addApprovalLimit() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getAddUserRestrictionDetails.json'),
    );
    final finalData = data['data'];

    return AddConfigureUserRestrictionDto.fromJson(finalData).toDomain();
  }

  Future<AddConfigureUserRestrictionStatus> configureUserRestriction() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getConfigureUserRestrictionDetails.json'),
    );
    final finalData = data['data'];

    return AddConfigureUserRestrictionDto.fromJson(finalData).toDomain();
  }
}
