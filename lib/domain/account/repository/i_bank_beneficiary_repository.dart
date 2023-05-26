import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/add_or_update_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IBankBeneficiaryRepository {
  Future<Either<ApiFailure, List<BankBeneficiary>>> getBankBeneficiaries();
   Future<Either<ApiFailure, List<SalesDistrict>>> getSalesDistrict({
    required SalesOrg salesOrg,
   });
  Future<Either<ApiFailure, AddOrUpdateBeneficiary>> addOrUpdateBeneficiary({
    required BankBeneficiary beneficiaryData,
  });
}
