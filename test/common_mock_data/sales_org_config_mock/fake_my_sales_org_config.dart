import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

//DO NOT MODIFY THIS FILE - This file contains sales org configs from PROD.
//https://zuelligpharma.atlassian.net/wiki/spaces/eZRxP/pages/281903463/Mobile+v3+Regression+Test

final fakeMYSalesOrgConfigs = SalesOrganisationConfigs.empty().copyWith(
  salesOrg: SalesOrg('2001'),
  poNumberRequired: PoNumberRequired(false),
  priceOverride: true,
  expiryDateDisplay: true,
  batchNumDisplay: true,
  currency: Currency('myr'),
  enableMobileNumber: false,
  enableRemarks: false,
  enableListPrice: false,
  enableTaxDisplay: false,
  addOosMaterials: OosMaterial(true),
  oosValue: OosValue(1),
  enableDefaultMD: false,
  enableZDP8Override: false,
  enableGMC: false,
  enableGMN: false,
  minOrderAmount: 300,
  vatValue: 0,
  netPriceOverride: false,
  enableFutureDeliveryDay: false,
  futureDeliveryDay: FutureDeliveryDay('7'),
  enablePaymentTerms: false,
  enableVat: false,
  enableZDP5: false,
  materialWithoutPrice: true,
  enableBatchNumber: false,
  enableOHPrice: true,
  enableSpecialInstructions: true,
  enableReferenceNote: false,
  displayOrderDiscount: false,
  enableIRN: false,
  enableTaxClassification: false,
  disablePrincipals: false,
  principalList: <SalesOrganisationConfigsPrincipal>[],
  disableBundles: false,
  disableProcessingStatus: false,
  disableOrderType: false,
  displayItemTaxBreakdown: false,
  displaySubtotalTaxBreakdown: false,
  enableCollectiveNumber: true,
  enableGimmickMaterial: false,
  hideCustomer: false,
  enableBillTo: true,
  disablePaymentTermsDisplay: false,
  disableReturnsAccess: false,
  disablePayment: false,
  disableReturnsAccessSR: false,
  hideStockDisplay: false,
  showPOAttachment: false,
  disableOverrideFieldSR: false,
  disableOverrideFieldCustomer: false,
  disableDeliveryDate: false,
  allowReturnsOutsidePolicy: false,
  enableTaxAtTotalLevelOnly: false,
  hideCredit: false,
  enablePOAttachmentRequired: false,
  enableComboDeals: false,
  comboDealsUserRole: ComboDealUserRole(0),
  enableMarketPlace: true,
  mpMinOrderAmount: 0.0,
  statementOfAccountEnabled: true,
);
