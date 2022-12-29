import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IApproverRepository {
  Future<Either<ApiFailure, bool>> getIsApprover(User user);
  bool getReturnsConfig();
}
