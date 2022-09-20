import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class ICustomerCodeRepository {
  Future<Either<ApiFailure, List<CustomerCodeInfo>>> getCustomerCode(
    SalesOrganisation salesOrganisation,
    String customerCode,
    bool hideCustomer,
    int pageIndex,
    String loginUserRoleType,
    String userName,
  );
}
