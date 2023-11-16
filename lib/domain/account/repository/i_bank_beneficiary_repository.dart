import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IBankBeneficiaryRepository {
  Future<Either<ApiFailure, List<BankBeneficiary>>> getBankBeneficiaries();
  Future<Either<ApiFailure, List<SalesDistrict>>> getSalesDistrict({
    required SalesOrg salesOrg,
  });
  Future<Either<ApiFailure, BankBeneficiaryResponse>> addOrUpdateBeneficiary({
    required BankBeneficiary beneficiaryData,
  });

  Future<Either<ApiFailure, BankBeneficiaryResponse>> deleteBeneficiary({
    required SalesOrg salesOrg,
    required String salesDistrict,
  });

  Future<Either<ApiFailure, List<BankBeneficiary>>>
      getBankBeneficiariesBySaleOrg({
    required SalesOrg salesOrg,
  });
}
