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
  final salesOrg = SalesOrg('1500');
  const salesOrgId = SalesOrgId(id: 53);
  final configs = UpdateSalesOrganisationConfigs(
      salesOrg: salesOrg,
      poNumberRequired: true,
      priceOverride: false,
      expiryDateDisplay: true,
      batchNumDisplay: true,
      currency: Currency('usd'),
      minOrderAmount: '20',
      vatValue: 0,
      netPriceOverride: false,
      languageFilter: false,
      languageValue: LanguageValue(''),
      materialWithoutPrice: false,
      enablePaymentTerms: false,
      enableMobileNumber: true,
      enableRemarks: true,
      enableListPrice: true,
      enableTaxDisplay: true,
      addOosMaterials: false,
      oosValue: OosValue(0),
      enableDefaultMD: true,
      enableZDP5: false,
      enableZDP8Override: true,
      enableGMC: false,
      enableGMN: true,
      enableBatchNumber: false,
      enableOHPrice: true,
      enableSpecialInstructions: true,
      enableReferenceNote: false,
      displayOrderDiscount: true,
      enableIRN: false,
      enableTaxClassification: false,
      disableBundles: false,
      disableProcessingStatus: true,
      disableOrderType: true,
      enableCollectiveNumber: false,
      enableGimmickMaterial: false,
      enableVat: false,
      hideCustomer: false,
      enableBillTo: true,
      disablePaymentTermsDisplay: true,
      hideStockDisplay: true,
      showPOAttachment: false,
      disableDeliveryDate: false,
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
