//Sales org
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

const _fakeSaleOrgId = 'fake-sale-org-id-1234';
const _fakeVNSalesOrgId = '3072';
const _fakeMYSalesOrgId = '2001';
const _fakeSaleOrgPhId = '2500';

final fakeVNSalesOrg = SalesOrg(_fakeVNSalesOrgId);
final fakeMYSalesOrg = SalesOrg(_fakeMYSalesOrgId);
final fakeSalesOrg = SalesOrg(_fakeSaleOrgId);
SalesOrg fakePHSalesOrg = SalesOrg(_fakeSaleOrgPhId);

final fakeSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg);

final fakeMYSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeMYSalesOrg);

final fakeVNSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeVNSalesOrg);

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

final salesOrgConfigEnabledZDP5 = SalesOrganisationConfigs.empty().copyWith(
  enableZDP5: true,
  salesOrg: fakeVNSalesOrg,
);

final fakeSalesOrgConfigSpecialInstructionsEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  enableSpecialInstructions: true,
);

final fakeSalesOrgConfigPoNumberRequired =
    SalesOrganisationConfigs.empty().copyWith(
  poNumberRequired: PoNumberRequired(true),
);

final fakeSalesOrgConfigPaymentTermsEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  enablePaymentTerms: true,
);

final fakeVNSalesOrgConfigItemTaxBreakdownEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  displayItemTaxBreakdown: true,
  vatValue: 5,
  currency: Currency('vnd'),
);

final fakeVNSalesOrgConfigTaxBreakdownEnabled =
    fakeVNSalesOrgConfigItemTaxBreakdownEnabled.copyWith(
  displaySubtotalTaxBreakdown: true,
);

final fakeMYSalesOrgConfigTaxBreakdownEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  displayItemTaxBreakdown: true,
  displaySubtotalTaxBreakdown: true,
  vatValue: 5,
  currency: Currency('myr'),
);

final fakeMYSalesOrgConfigFutureDeliveryDayEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  enableFutureDeliveryDay: true,
  futureDeliveryDay: FutureDeliveryDay('7'),
  salesOrg: fakeMYSalesOrg,
);

SalesOrganisationConfigs salesOrganisationPHConfigsWithEnablePrincipalList =
    SalesOrganisationConfigs.empty().copyWith(
  salesOrg: fakePHSalesOrg,
  currency: Currency('PHP'),
  disablePrincipals: true,
  principalList: [
    SalesOrganisationConfigsPrincipal.empty().copyWith(
      date: DateTimeStringValue('2093041107'),
      principalCode: PrincipalCode('0000140332'),
    ),
    SalesOrganisationConfigsPrincipal.empty().copyWith(
      date: DateTimeStringValue('2023041107'),
      principalCode: PrincipalCode('0000000000'),
    )
  ],
);
