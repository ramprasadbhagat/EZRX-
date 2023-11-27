import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:flutter/material.dart';

//user
const _roleTypeInternalSalesRep = 'internal_sales_rep';
const _roleTypeExternalSalesRep = 'external_sales_rep';
const _roleTypeRootAdmin = 'root_admin';
const _roleTypeZPAdmin = 'zp_admin';
const _roleTypeSalesRep = 'salesRep';
const _roleTypeClient = 'client';
const _roleTypeClientUser = 'client_user';
const _roleTypeReturnApprover = 'return_approver';
const _fakeUserName = 'fake-user';
const _fakeId = 'fake-id';
const _fakeRoleDesc = 'fake-role-desc';
const _fakeRoleId = 'fake-role-id';

final fakeRootAdminUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeRootAdmin),
  ),
);

final fakeClientUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeClientUser),
  ),
);

final fakeClient = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeClient),
  ),
);

final fakeClientOrderTypeEnabled = fakeClient.copyWith(
  enableOrderType: true,
);

final fakeInternalSalesRepUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeInternalSalesRep),
  ),
);

final fakeExternalSalesRepUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeExternalSalesRep),
  ),
);

final fakeSalesRepUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeSalesRep),
  ),
);

final fakeReturnApproverUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeReturnApprover),
  ),
);

final fakeZPAdminUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeZPAdmin),
  ),
);
final fakeUserWithBonusOverride =
    User.empty().copyWith(hasBonusOverride: false);
final fakeUserWithName = User.empty().copyWith(
  id: 'testId',
  fullName: const FullName(firstName: 'test', lastName: 'test'),
);

final fakeUserWithLanguageCode = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  preferredLanguage: const Locale(ApiLanguageCode.english),
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeRootAdmin),
  ),
);
