import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/error/sales_org_failure.dart';

abstract class ISalesOrgRepository {
  Future<Either<SalesOrgFailure, SalesOrganisationConfigs>>
      getSalesOrganisationConfigs(SalesOrganisation salesOrganisation);
}
