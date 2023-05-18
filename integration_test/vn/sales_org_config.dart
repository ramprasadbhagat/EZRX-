import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/sales_org_id.dart';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/update_sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/update_sales_org_repository.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final salesOrg = SalesOrg('3050');
  const salesOrgId = SalesOrgId(id: 45);
  final configs = UpdateSalesOrganisationConfigs(
      salesOrg: salesOrg,
      poNumberRequired: false,
      priceOverride: false,
      expiryDateDisplay: false,
      batchNumDisplay: false,
      currency: Currency('vnd'),
      minOrderAmount: '1000000',
      vatValue: 0,
      netPriceOverride: false,
      languageFilter: false,
      languageValue: LanguageValue(''),
      materialWithoutPrice: false,
      enablePaymentTerms: false,
      enableMobileNumber: false,
      enableRemarks: false,
      enableListPrice: false,
      enableTaxDisplay: true,
      addOosMaterials: true,
      oosValue: OosValue(1),
      enableDefaultMD: false,
      enableZDP5: true,
      enableZDP8Override: false,
      enableGMC: false,
      enableGMN: false,
      enableBatchNumber: false,
      enableOHPrice: true,
      enableSpecialInstructions: true,
      enableReferenceNote: false,
      displayOrderDiscount: false,
      enableIRN: false,
      enableTaxClassification: true,
      disableBundles: true,
      disableProcessingStatus: false,
      disableOrderType: true,
      enableCollectiveNumber: true,
      enableGimmickMaterial: true,
      enableVat: true,
      hideCustomer: true,
      enableBillTo: true,
      disablePaymentTermsDisplay: false,
      hideStockDisplay: false,
      showPOAttachment: false,
      disableDeliveryDate: true,
      enableTaxAtTotalLevelOnly: false,
      enableGreenDelivery: false,
      greenDeliveryUserRole: GreenDeliveryUserRole(0),
      greenDeliveryDelayInDays: 0);

  testWidgets('Reset sales org - ${salesOrg.country}', (tester) async {
    await initialSetup(flavor: Flavor.uat);
    final repository = locator<UpdateSalesOrgRepository>();
    final result = await repository.getUpdateSalesOrganisationConfigs(
        SalesOrganisation.empty().copyWith(salesOrg: salesOrg),
        salesOrgId,
        configs);
    result.fold(
        (l) => tester.printToConsole(l.failureMessage),
        (r) => tester.printToConsole(
            'Your ${r.salesOrg.country} sales org config has been successfully reset'));
  });
}
