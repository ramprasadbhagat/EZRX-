import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

//DO NOT MODIFY THIS FILE - This file contains sales org configs from PROD.
//https://zuelligpharma.atlassian.net/wiki/spaces/eZRxP/pages/281903463/Mobile+v3+Regression+Test

final fakePHSalesOrgConfigs = SalesOrganisationConfigs.empty().copyWith(
  salesOrg: SalesOrg('2500'),
  poNumberRequired: PoNumberRequired(false),
  priceOverride: true,
  expiryDateDisplay: false,
  batchNumDisplay: false,
  currency: Currency('php'),
  enableMobileNumber: false,
  enableRemarks: false,
  enableListPrice: false,
  enableTaxDisplay: false,
  addOosMaterials: OosMaterial(true),
  oosValue: OosValue(1),
  enableDefaultMD: false,
  enableZDP8Override: true,
  enableGMC: false,
  enableGMN: false,
  minOrderAmount: 100,
  vatValue: 10,
  netPriceOverride: false,
  enableFutureDeliveryDay: false,
  futureDeliveryDay: FutureDeliveryDay('7'),
  enablePaymentTerms: false,
  enableVat: false,
  enableZDP5: false,
  materialWithoutPrice: false,
  enableBatchNumber: false,
  enableOHPrice: true,
  enableSpecialInstructions: true,
  enableReferenceNote: false,
  displayOrderDiscount: false,
  enableIRN: false,
  enableTaxClassification: false,
  disablePrincipals: true,
  principalList: <SalesOrganisationConfigsPrincipal>[],
  disableBundles: false,
  disableProcessingStatus: false,
  disableOrderType: false,
  displayItemTaxBreakdown: false,
  displaySubtotalTaxBreakdown: false,
  enableCollectiveNumber: false,
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
  disableDeliveryDate: true,
  allowReturnsOutsidePolicy: false,
  enableTaxAtTotalLevelOnly: false,
  hideCredit: false,
  enablePOAttachmentRequired: false,
  enableComboDeals: false,
  comboDealsUserRole: ComboDealUserRole(0),
);
