import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/returns_overview.dart';

abstract class IReturnsOverviewRepository {
  Future<Either<ApiFailure, ReturnsOverview>> getReturnsOverview({
    required String soldTo,
    required String shipTo,
    required SalesOrg salesOrg,
    required Username username,
  });
}
