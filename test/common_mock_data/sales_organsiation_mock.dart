//Sales org
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:flutter/material.dart';

const _fakeSaleOrgId = 'fake-sale-org-id-1234';
const _fakeVNSalesOrgId = '3072';
const _fakeMYSalesOrgId = '2001';
const _fakeSGSalesOrgId = '2601';
const _fakePHSalesOrgId = '2500';
const _fakeIDSalesOrgId = '1900';

final fakeSalesOrg = SalesOrg(_fakeSaleOrgId);
final fakePHSalesOrg = SalesOrg(_fakePHSalesOrgId);
final fakeSGSalesOrg = SalesOrg(_fakeSGSalesOrgId);
final fakeVNSalesOrg = SalesOrg(_fakeVNSalesOrgId);
final fakeMYSalesOrg = SalesOrg(_fakeMYSalesOrgId);
final fakeIDSalesOrg = SalesOrg(_fakeIDSalesOrgId);

final fakeSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg);

final fakeMYSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeMYSalesOrg);

final fakeVNSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeVNSalesOrg);

final fakeSGSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeVNSalesOrg);
final fakeIDSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeIDSalesOrg);

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
  comboDealsUserRole: ComboDealUserRole(1),
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

final salesOrganisationPHConfigsWithEnablePrincipalList =
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

final fakeSGSalesOrgConfigGimmickMaterialEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  languageFilter: true,
  languageValue: const Locale(ApiLanguageCode.english),
  enableGimmickMaterial: true,
  principalList: [
    SalesOrganisationConfigsPrincipal.empty().copyWith(
      principalCode: PrincipalCode('123'),
    ),
    SalesOrganisationConfigsPrincipal.empty().copyWith(
      principalCode: PrincipalCode('234'),
    ),
    SalesOrganisationConfigsPrincipal.empty().copyWith(
      principalCode: PrincipalCode('345'),
    ),
  ],
  currency: Currency('sgd'),
  salesOrg: fakeSGSalesOrg,
);
