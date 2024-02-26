import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

//DO NOT MODIFY THIS FILE - This file contains sales org configs from PROD.
//https://zuelligpharma.atlassian.net/wiki/spaces/eZRxP/pages/281903463/Mobile+v3+Regression+Test

final fakeTWSalesOrgConfigs = SalesOrganisationConfigs.empty().copyWith(
  salesOrg: SalesOrg('2800'),
  poNumberRequired: PoNumberRequired(false),
  priceOverride: true,
  expiryDateDisplay: false,
  batchNumDisplay: false,
  currency: Currency('twd'),
  enableMobileNumber: false,
  enableRemarks: false,
  enableListPrice: true,
  enableTaxDisplay: false,
  addOosMaterials: OosMaterial(true),
  oosValue: OosValue(1),
  enableDefaultMD: false,
  enableZDP8Override: true,
  enableGMC: true,
  enableGMN: false,
  minOrderAmount: 0,
  vatValue: 10,
  netPriceOverride: false,
  enableFutureDeliveryDay: false,
  futureDeliveryDay: FutureDeliveryDay('7'),
  enablePaymentTerms: true,
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
  enableCollectiveNumber: false,
  enableGimmickMaterial: true,
  hideCustomer: false,
  enableBillTo: true,
  disablePaymentTermsDisplay: true,
  disableReturnsAccess: false,
  disablePayment: false,
  disableReturnsAccessSR: false,
  hideStockDisplay: true,
  showPOAttachment: true,
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
