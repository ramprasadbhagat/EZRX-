import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IUserRestrictionRepository {
  Future<Either<ApiFailure, List<String>>> getUserRestrictionsList(
    SalesOrg salesOrg,
  );
}
