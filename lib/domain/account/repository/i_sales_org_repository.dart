import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class ISalesOrgRepository {
  Future<Either<ApiFailure, SalesOrganisationConfigs>>
      getSalesOrganisationConfigs(SalesOrganisation salesOrganisation);
}
