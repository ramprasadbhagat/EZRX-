//Sales org
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';

const _fakeSaleOrgId = 'fake-sale-org-id-1234';
const _fakeVNSalesOrgID = '3072';
const _fakeSaleOrgMyId = 'MY';
SalesOrg fakeVNSalesOrg = SalesOrg(_fakeVNSalesOrgID);
SalesOrg fakeSalesOrg = SalesOrg(_fakeSaleOrgId);
SalesOrg fakeMYSalesOrg = SalesOrg(_fakeSaleOrgMyId);

SalesOrganisation fakeSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg);

SalesOrganisation fakeSalesMYOrganisation = SalesOrganisation.empty().copyWith(
  salesOrg: fakeMYSalesOrg,
);

final fakeEmptySalesConfigs = SalesOrganisationConfigs.empty();

final fakeSalesOrganisationConfigs =
    SalesOrganisationConfigs.empty().copyWith(salesOrg: fakeSalesOrg);

final salesOrgConfigEnabledMaterialWithoutPrice =
    SalesOrganisationConfigs.empty().copyWith(
  materialWithoutPrice: true,
);

final salesOrgConfigEnabledMaterialWithoutPriceAndCombo =
    SalesOrganisationConfigs.empty().copyWith(
  materialWithoutPrice: true,
  enableComboDeals: true,
);

final salesOrgConfigDisabledMaterialWithoutPrice =
    SalesOrganisationConfigs.empty().copyWith(
  materialWithoutPrice: false,
);

final salesOrgConfigEnabledBatchNumDisplay =
    SalesOrganisationConfigs.empty().copyWith(
  batchNumDisplay: true,
);

final salesOrgConfigDisabledBatchNumDisplay =
    SalesOrganisationConfigs.empty().copyWith(
  batchNumDisplay: false,
);

SalesOrganisationConfigs salesOrgConfigEnabledZDP5 =
    SalesOrganisationConfigs.empty().copyWith(
  enableZDP5: true,
  salesOrg: fakeVNSalesOrg,
);
