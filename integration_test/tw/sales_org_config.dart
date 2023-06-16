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
  final salesOrg = SalesOrg('2800');
  const salesOrgId = SalesOrgId(id: 19);
  final configs = UpdateSalesOrganisationConfigs(
      salesOrg: salesOrg,
      poNumberRequired: false,
      priceOverride: false,
      expiryDateDisplay: false,
      batchNumDisplay: true,
      currency: Currency('twd'),
      minOrderAmount: '0',
      vatValue: 0,
      netPriceOverride: false,
      languageFilter: true,
      languageValue: LanguageValue('M'),
      materialWithoutPrice: true,
      enablePaymentTerms: true,
      enableMobileNumber: true,
      enableRemarks: false,
      enableListPrice: true,
      enableTaxDisplay: true,
      addOosMaterials: true,
      oosValue: OosValue(1),
      enableDefaultMD: true,
      enableZDP5: false,
      enableZDP8Override: false,
      enableGMC: true,
      enableGMN: false,
      enableBatchNumber: false,
      enableOHPrice: true,
      enableSpecialInstructions: true,
      enableReferenceNote: false,
      displayOrderDiscount: true,
      enableIRN: false,
      enableTaxClassification: false,
      disableBundles: true,
      disableProcessingStatus: false,
      disableOrderType: true,
      enableCollectiveNumber: false,
      enableGimmickMaterial: true,
      enableVat: false,
      hideCustomer: true,
      enableBillTo: false,
      disablePaymentTermsDisplay: false,
      hideStockDisplay: true,
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
