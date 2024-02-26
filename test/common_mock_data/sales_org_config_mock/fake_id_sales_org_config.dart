import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

//DO NOT MODIFY THIS FILE - This file contains sales org configs from PROD.
//https://zuelligpharma.atlassian.net/wiki/spaces/eZRxP/pages/281903463/Mobile+v3+Regression+Test

final fakeIDSalesOrgConfigs = SalesOrganisationConfigs.empty().copyWith(
  salesOrg: SalesOrg('1900'),
  poNumberRequired: PoNumberRequired(true),
  priceOverride: false,
  expiryDateDisplay: true,
  batchNumDisplay: false,
  currency: Currency('idr'),
  enableMobileNumber: false,
  enableRemarks: false,
  enableListPrice: true,
  enableTaxDisplay: false,
  addOosMaterials: OosMaterial(true),
  oosValue: OosValue(1),
  enableDefaultMD: false,
  enableZDP8Override: false,
  enableGMC: false,
  enableGMN: false,
  minOrderAmount: 100.0,
  vatValue: 0,
  netPriceOverride: true,
  enableFutureDeliveryDay: false,
  futureDeliveryDay: FutureDeliveryDay('7'),
  enablePaymentTerms: false,
  enableVat: false,
  enableZDP5: false,
  materialWithoutPrice: true,
  enableBatchNumber: false,
  enableOHPrice: true,
  enableSpecialInstructions: false,
  enableReferenceNote: false,
  displayOrderDiscount: false,
  enableIRN: false,
  enableTaxClassification: false,
  disablePrincipals: true,
  principalList: <SalesOrganisationConfigsPrincipal>[],
  disableBundles: true,
  disableProcessingStatus: false,
  disableOrderType: false,
  displayItemTaxBreakdown: true,
  displaySubtotalTaxBreakdown: true,
  enableCollectiveNumber: false,
  enableGimmickMaterial: false,
  hideCustomer: false,
  enableBillTo: true,
  disablePaymentTermsDisplay: false,
  disableReturnsAccess: false,
  disablePayment: false,
  disableReturnsAccessSR: false,
  hideStockDisplay: false,
  showPOAttachment: true,
  disableOverrideFieldSR: true,
  disableOverrideFieldCustomer: false,
  disableDeliveryDate: true,
  allowReturnsOutsidePolicy: false,
  enableTaxAtTotalLevelOnly: false,
  hideCredit: true,
  enablePOAttachmentRequired: true,
  enableComboDeals: false,
  comboDealsUserRole: ComboDealUserRole(0),
);
