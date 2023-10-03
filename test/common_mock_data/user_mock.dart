import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

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

User fakeRootAdminUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeRootAdmin),
  ),
);

User fakeClientUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeClientUser),
  ),
);

User fakeClient = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeClient),
  ),
);

User fakeInternalSalesRepUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeInternalSalesRep),
  ),
);

User fakeExternalSalesRepUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeExternalSalesRep),
  ),
);

User fakeSalesRepUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeSalesRep),
  ),
);

User fakeReturnApproverUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeReturnApprover),
  ),
);

User fakeZPAdminUser = User.empty().copyWith(
  username: Username(_fakeUserName),
  id: _fakeId,
  role: Role.empty().copyWith(
    description: _fakeRoleDesc,
    id: _fakeRoleId,
    type: RoleType(_roleTypeZPAdmin),
  ),
);
