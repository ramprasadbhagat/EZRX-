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
  final salesOrg = SalesOrg('2601');
  const salesOrgId = SalesOrgId(id: 10);
  final configs = UpdateSalesOrganisationConfigs(
      salesOrg: salesOrg,
      poNumberRequired: false,
      priceOverride: true,
      expiryDateDisplay: true,
      batchNumDisplay: true,
      currency: Currency('sgd'),
      minOrderAmount: '100',
      vatValue: 8,
      netPriceOverride: true,
      languageFilter: false,
      languageValue: LanguageValue(''),
      materialWithoutPrice: true,
      enablePaymentTerms: false,
      enableMobileNumber: false,
      enableRemarks: true,
      enableListPrice: false,
      enableTaxDisplay: false,
      addOosMaterials: true,
      oosValue: OosValue(1),
      enableDefaultMD: false,
      enableZDP5: false,
      enableZDP8Override: false,
      enableGMC: false,
      enableGMN: false,
      enableBatchNumber: false,
      enableOHPrice: true,
      enableSpecialInstructions: true,
      enableReferenceNote: false,
      displayOrderDiscount: true,
      enableIRN: false,
      enableTaxClassification: false,
      disableBundles: false,
      disableProcessingStatus: false,
      disableOrderType: true,
      enableCollectiveNumber: false,
      enableGimmickMaterial: false,
      enableVat: false,
      hideCustomer: false,
      enableBillTo: false,
      disablePaymentTermsDisplay: false,
      hideStockDisplay: false,
      showPOAttachment: false,
      disableDeliveryDate: false,
      enableTaxAtTotalLevelOnly: true,
      enableGreenDelivery: false,
      greenDeliveryUserRole: GreenDeliveryUserRole(0),
      greenDeliveryDelayInDays: 2);

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
