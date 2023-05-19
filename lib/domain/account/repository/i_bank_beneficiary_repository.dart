import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/bank_benificiary.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IBankBeneficiaryRepository {
  Future<Either<ApiFailure, List<BankBeneficiary>>> getBankBeneficiaries();
}
