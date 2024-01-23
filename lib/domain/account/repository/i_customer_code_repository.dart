import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class ICustomerCodeRepository {
  Future<Either<ApiFailure, CustomerInformation>> getCustomerCode({
    required SalesOrganisation salesOrganisation,
    required List<String> customerCodes,
    required bool hideCustomer,
    required int offset,
    required User user,
    required int pageSize,
  });

  Future<Either<ApiFailure, Unit>> storeCustomerInfo({
    required String customerCode,
    required String shippingAddress,
  });

  Future<Either<ApiFailure, AccountSelector>> getCustomerCodeStorage();
}
