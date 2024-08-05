import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

//DO NOT MODIFY THIS FILE - This file contains sales org configs from PROD.
//https://zuelligpharma.atlassian.net/wiki/spaces/eZRxP/pages/281903463/Mobile+v3+Regression+Test

final fakeSGSalesOrgConfigs = SalesOrganisationConfigs.empty().copyWith(
  salesOrg: SalesOrg('2601'),
  poNumberRequired: PoNumberRequired(false),
  priceOverride: true,
  expiryDateDisplay: true,
  batchNumDisplay: false,
  currency: Currency('sgd'),
  enableMobileNumber: false,
  enableRemarks: false,
  enableListPrice: true,
  enableTaxDisplay: false,
  addOosMaterials: OosMaterial(true),
  oosValue: OosValue(1),
  enableDefaultMD: true,
  enableZDP8Override: true,
  enableGMC: false,
  enableGMN: false,
  minOrderAmount: 100,
  vatValue: 9,
  netPriceOverride: true,
  enableFutureDeliveryDay: false,
  futureDeliveryDay: FutureDeliveryDay('1'),
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
  displaySubtotalTaxBreakdown: true,
  enableCollectiveNumber: false,
  enableGimmickMaterial: false,
  hideCustomer: true,
  enableBillTo: false,
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
  statementOfAccountEnabled: true,
);

final fakeSGSalesOrgConfigsWithSmallOrderFee = fakeSGSalesOrgConfigs.copyWith(
  sapMinOrderAmount: 300,
  enableSmallOrderFee: true,
  smallOrderFeeUserRoles: ['External Sales Rep'],
  smallOrderFee: 23,
  mpSAPMinOrderAmount: 300,
  enableMPSmallOrderFee: true,
  mpSmallOrderFeeUserRoles: ['Client User'],
  mpSmallOrderFee: 23,
);
