//Sales org
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:flutter_test/flutter_test.dart';

const _fakeSaleOrgId = 'fake-sale-org-id-1234';
const _fakeVNSalesOrgId = '3072';
const _fakeMYSalesOrgId = '2001';
const _fakeSGSalesOrgId = '2601';
const _fakeTWSalesOrgId = '2800';
const _fakePHSalesOrgId = '2500';
const _fakeIDSalesOrgId = '1900';
const _fakeTHSalesOrgId = '2902';
const _fakeKHSalesOrgId = '1500';
const _fakeMMSalesOrgId = '2201';

final fakeSalesOrg = SalesOrg(_fakeSaleOrgId);
final fakePHSalesOrg = SalesOrg(_fakePHSalesOrgId);
final fakeSGSalesOrg = SalesOrg(_fakeSGSalesOrgId);
final fakeTWSalesOrg = SalesOrg(_fakeTWSalesOrgId);
final fakeVNSalesOrg = SalesOrg(_fakeVNSalesOrgId);
final fakeMYSalesOrg = SalesOrg(_fakeMYSalesOrgId);
final fakeIDSalesOrg = SalesOrg(_fakeIDSalesOrgId);
final fakeTHSalesOrg = SalesOrg(_fakeTHSalesOrgId);
final fakeKHSalesOrg = SalesOrg(_fakeKHSalesOrgId);
final fakeMMSalesOrg = SalesOrg(_fakeMMSalesOrgId);

final fakeEmptySalesOrganisation = SalesOrganisation.empty();
final fakeSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg);

final fakeMYSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeMYSalesOrg);

final fakeVNSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeVNSalesOrg);

final fakeSGSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeSGSalesOrg);
final fakePHSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakePHSalesOrg);

final fakeIDSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeIDSalesOrg);

final fakeTHSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeTHSalesOrg);

final fakeEmptySalesConfigs = SalesOrganisationConfigs.empty();

final fakeSalesOrganisationConfigs =
    SalesOrganisationConfigs.empty().copyWith(salesOrg: fakeSalesOrg);

final fakeIDSalesOrganisationConfigs =
    SalesOrganisationConfigs.empty().copyWith(
  salesOrg: fakeIDSalesOrg,
);

final fakePHSalesOrganisationConfigsMaterialWithoutPrice =
    SalesOrganisationConfigs.empty().copyWith(
  salesOrg: fakePHSalesOrg,
  materialWithoutPrice: true,
);
final fakeSalesOrganisationConfigsTaxBreakdown =
    SalesOrganisationConfigs.empty()
        .copyWith(salesOrg: fakeIDSalesOrg, displaySubtotalTaxBreakdown: true);

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

final salesOrgConfigDisableMaterialWithoutPriceAndCombo =
    SalesOrganisationConfigs.empty().copyWith(
  materialWithoutPrice: true,
  enableComboDeals: false,
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

final salesOrgConfigEnabledExpiryDisplay = fakeEmptySalesConfigs.copyWith(
  expiryDateDisplay: true,
);

final salesOrgConfigDisabledExpiryDisplay = fakeEmptySalesConfigs.copyWith(
  expiryDateDisplay: false,
);

final salesOrgConfigEnabledZDP5 = SalesOrganisationConfigs.empty().copyWith(
  enableZDP5: true,
  salesOrg: fakeVNSalesOrg,
);

final fakeSalesOrgConfigSpecialInstructionsEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  enableSpecialInstructions: true,
);

final fakeSalesOrganisationDisplaySubtotalTaxBreakdown =
    SalesOrganisationConfigs.empty()
        .copyWith(displaySubtotalTaxBreakdown: true);

final fakeSalesOrgConfigPoNumberRequired =
    SalesOrganisationConfigs.empty().copyWith(
  poNumberRequired: PoNumberRequired(true),
);
final fakeSalesOrgConfigEnableFutureDeliveryDayRequired =
    SalesOrganisationConfigs.empty().copyWith(
  enableFutureDeliveryDay: true,
);
final fakeSalesOrgConfigEnableReferenceNoteRequired =
    SalesOrganisationConfigs.empty().copyWith(
  enableReferenceNote: true,
);
final fakeSalesOrgConfigShowPOAttachmentRequired =
    SalesOrganisationConfigs.empty().copyWith(
  showPOAttachment: true,
);
final fakeSalesOrgConfigEnableMobileNumberRequired =
    SalesOrganisationConfigs.empty().copyWith(
  enableMobileNumber: true,
);

final fakeSalesOrgConfigPaymentTermsEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  enablePaymentTerms: true,
);

final fakeSalesOrgConfigDisablePaymentTermsDisplay =
    SalesOrganisationConfigs.empty().copyWith(
  disablePaymentTermsDisplay: true,
);

final fakeSalesOrgConfigShowPoAttachment =
    SalesOrganisationConfigs.empty().copyWith(showPOAttachment: true);

final fakeVNSalesOrgConfigItemTaxBreakdownEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  displayItemTaxBreakdown: true,
  vatValue: 5,
  currency: Currency('vnd'),
  salesOrg: fakeVNSalesOrg,
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

final fakeTHSalesOrgConfigTaxBreakdownEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  displaySubtotalTaxBreakdown: true,
  vatValue: 6,
  currency: Currency('thb'),
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
  enableFutureDeliveryDay: true,
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

final fakeTWSalesOrgConfigGMCEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  enableGMC: true,
  salesOrg: fakeTWSalesOrg,
);

final fakeSGSalesOrgConfigGimmickMaterialEnabled =
    SalesOrganisationConfigs.empty().copyWith(
  languageFilter: true,
  languageValue: Language.english(),
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
final fakeSGSalesOrgConfigForBundle = SalesOrganisationConfigs.empty().copyWith(
  enableReferenceNote: true,
  enableVat: true,
  enableFutureDeliveryDay: true,
  enableMobileNumber: true,
  enableSpecialInstructions: true,
  disableOrderType: false,
  enableCollectiveNumber: true,
  enablePaymentTerms: true,
  enableRemarks: true,
  priceOverride: true,
);
final fakeSGSalesOrgConfigPriceOverride =
    SalesOrganisationConfigs.empty().copyWith(priceOverride: true);

final fakeMYSalesOrgConfigWithOOSPreOrder =
    SalesOrganisationConfigs.empty().copyWith(
  addOosMaterials: OosMaterial(true),
  displayItemTaxBreakdown: true,
  salesOrg: fakeMYSalesOrg,
);
final fakeSalesOrgConfigWithOOSPreOrderValue =
    SalesOrganisationConfigs.empty().copyWith(
  addOosMaterials: OosMaterial(true),
  oosValue: OosValue(1),
);
final fakeSalesOrgConfigAllowReturnsOutsidePolicy =
    SalesOrganisationConfigs.empty().copyWith(
  allowReturnsOutsidePolicy: true,
);

final fakeSalesOrgConfigWithOOSPreOrderValueAndHideStockDisplay =
    SalesOrganisationConfigs.empty().copyWith(
  addOosMaterials: OosMaterial(true),
  oosValue: OosValue(1),
  hideStockDisplay: true,
);

final fakeSalesOrgConfigWithHideStockDisplay =
    SalesOrganisationConfigs.empty().copyWith(
  hideStockDisplay: true,
);
final fakeSalesOrgConfigWithdisableBundles =
    SalesOrganisationConfigs.empty().copyWith(
  disableBundles: true,
);

final salesOrgVariant = ValueVariant<SalesOrg>(
  {
    fakePHSalesOrg,
    fakeSGSalesOrg,
    fakeVNSalesOrg,
    fakeMYSalesOrg,
    fakeIDSalesOrg,
    fakeTHSalesOrg,
    fakeKHSalesOrg,
    fakeMMSalesOrg,
    fakeTWSalesOrg,
  },
);

final fakeLanguageSalesOrganisationConfigs =
    fakeSalesOrganisationConfigs.copyWith(languageValue: Language.english());
