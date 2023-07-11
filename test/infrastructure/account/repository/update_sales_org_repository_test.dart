import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/sales_org_id.dart';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/update_sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/account_selector_storage_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/update_sales_org/update_sales_organisation_configs_variable_dto.dart';
import 'package:ezrxmobile/infrastructure/account/repository/update_sales_org_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UpdateSalesOrgLocalDataSourceMock extends Mock
    implements UpdateSalesOrgLocalDataSource {}

class UpdateSalesOrgRemoteDataSourceMock extends Mock
    implements UpdateSalesOrgRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late Config configMock;
  late SalesOrganisation mockSalesOrg;
  late SalesOrg salesOrg;
  late SalesOrgId salesOrgId;
  late UpdateSalesOrganisationConfigs configs;
  late UpdateSalesOrgRepository updateSalesOrgRepository;
  late UpdateSalesOrgLocalDataSource updateSalesOrgLocalDataSourceMock;
  late UpdateSalesOrgRemoteDataSource updateSalesOrgRemoteDataSourceMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    configMock = ConfigMock();
    updateSalesOrgLocalDataSourceMock = UpdateSalesOrgLocalDataSourceMock();
    updateSalesOrgRemoteDataSourceMock = UpdateSalesOrgRemoteDataSourceMock();

    salesOrg = SalesOrg('1500');
    mockSalesOrg = SalesOrganisation.empty().copyWith(
      salesOrg: salesOrg,
    );

    updateSalesOrgRepository = UpdateSalesOrgRepository(
      config: configMock,
      localDataSource: updateSalesOrgLocalDataSourceMock,
      remoteDataSource: updateSalesOrgRemoteDataSourceMock,
    );

    salesOrgId = const SalesOrgId(id: 53);
    configs = UpdateSalesOrganisationConfigs(
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

    registerFallbackValue(AccountSelectorStorageDto.empty());
  });

  group('Sales Org Repository Test', () {
    test(
        'Update Sales Organisation Config from local data source successfully test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => updateSalesOrgLocalDataSourceMock.updateSalesOrgConfig(
          salesOrg: mockSalesOrg.salesOrg.country,
        ),
      ).thenAnswer((invocation) async => configs);

      final result = await updateSalesOrgRepository
          .getUpdateSalesOrganisationConfigs(mockSalesOrg, salesOrgId, configs);

      expect(result.isRight(), true);
    });

    test(
        'Update Sales Organisation Config from local data source failed due to exception test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => updateSalesOrgLocalDataSourceMock.updateSalesOrgConfig(
          salesOrg: mockSalesOrg.salesOrg.country,
        ),
      ).thenThrow((invocation) async => MockException());

      final result =
          await updateSalesOrgRepository.getUpdateSalesOrganisationConfigs(
              mockSalesOrg, salesOrgId, configs);

      expect(result.isLeft(), true);
    });

    test(
        'Update Sales Organisation Config from remote data source successfully test',
        () async {
      final variableData = UpdateSalesOrganisationConfigsVariableDto.fromDomain(
              salesOrgId, configs,)
          .toJson();
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => updateSalesOrgRemoteDataSourceMock.updateSalesOrgConfig(
          variableData : variableData,
        ),
      ).thenAnswer((invocation) async => configs);

      final result = await updateSalesOrgRepository
          .getUpdateSalesOrganisationConfigs(mockSalesOrg, salesOrgId, configs);

      expect(result.isRight(), true);
    });

    test('Update Sales Organisation Config from remote data source failed test',
        () async {
      final variableData = UpdateSalesOrganisationConfigsVariableDto.fromDomain(
              salesOrgId, configs,)
          .toJson();
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => updateSalesOrgRemoteDataSourceMock.updateSalesOrgConfig(
          variableData : variableData,
        ),
      ).thenThrow((invocation) async => Exception());

      final result = await updateSalesOrgRepository
          .getUpdateSalesOrganisationConfigs(mockSalesOrg, salesOrgId, configs);

      expect(result.isLeft(), true);
    });
  });
}
