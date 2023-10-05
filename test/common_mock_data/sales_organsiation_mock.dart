//Sales org
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';

const _fakeSaleOrgId = 'fake-sale-org-id-1234';

SalesOrg fakeSalesOrg = SalesOrg(_fakeSaleOrgId);
SalesOrganisation fakeSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg);

final fakeEmptySalesConfigs = SalesOrganisationConfigs.empty();

SalesOrganisationConfigs salesOrgConfigEnabledMaterialWithoutPrice =
    SalesOrganisationConfigs.empty().copyWith(
  materialWithoutPrice: true,
);

SalesOrganisationConfigs salesOrgConfigDisabledMaterialWithoutPrice =
    SalesOrganisationConfigs.empty().copyWith(
  materialWithoutPrice: false,
);

SalesOrganisationConfigs salesOrgConfigEnabledBatchNumDisplay =
    SalesOrganisationConfigs.empty().copyWith(
  batchNumDisplay: true,
);

SalesOrganisationConfigs salesOrgConfigDisabledBatchNumDisplay =
    SalesOrganisationConfigs.empty().copyWith(
  batchNumDisplay: false,
);
