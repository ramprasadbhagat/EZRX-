import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class MockConfig extends Mock implements Config {}

class MaterialListLocalDataSourceMock extends Mock
    implements MaterialListLocalDataSource {}

class MaterialListRemoteDataSourceMock extends Mock
    implements MaterialListRemoteDataSource {}

class StockInfoLocalDataSourceMock extends Mock
    implements StockInfoLocalDataSource {}

class StockInfoRemoteDataSourceMock extends Mock
    implements StockInfoRemoteDataSource {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  late MaterialListRepository materialListRepository;
  late Config mockConfig;
  late MaterialListLocalDataSource materialListLocalDataSource;
  late MaterialListRemoteDataSource materialListRemoteDataSource;
  late StockInfoLocalDataSource stockInfoLocalDataSource;
  late StockInfoRemoteDataSource stockInfoRemoteDataSource;
  late DeviceStorage deviceStorage;
  final fakeMaterialFilter = MaterialFilter.empty().copyWith(
    countryListSelected: [
      MaterialFilterCountry.empty().copyWith(name: 'Hong Kong', code: 'HK'),
    ],
    manufactureListSelected: [
      'STRYKER CORPORATION (M) SDN BHD',
    ],
  );
  final fakeMaterialFilterWithComboOffers =
      fakeMaterialFilter.copyWith(comboOffers: true);
  const fakePrinciple = '1234';
  final fakePrincipleData = PrincipalData.empty().copyWith(
    principalCode: PrincipalCode(fakePrinciple),
    principalName: PrincipalName('fake-principleName'),
  );
  final fakeStockInfo1 = MaterialStockInfo.empty().copyWith(
    materialNumber: MaterialNumber('123'),
  );
  final fakeStockInfo2 = MaterialStockInfo.empty().copyWith(
    materialNumber: MaterialNumber('456'),
  );
  final fakeStockInfo3 = MaterialStockInfo.empty().copyWith(
    materialNumber: MaterialNumber('789'),
  );
  final fakeMatchMaterialInfo = MaterialInfo.empty().copyWith(
    materialNumber: MaterialNumber('123'),
  );
  final fakeBundle = MaterialInfo.empty().copyWith(
    materialNumber: MaterialNumber('123'),
    type: MaterialInfoType('bundle'),
    dataTotalHidden: DataTotalHidden(1),
  );
  const fakeMarket = 'fake-market';
  late MaterialResponse fakeMaterialResponse;
  late MaterialResponse fakeComboDealMaterialResponse;

  setUpAll(() async {
    mockConfig = MockConfig();
    materialListLocalDataSource = MaterialListLocalDataSourceMock();
    materialListRemoteDataSource = MaterialListRemoteDataSourceMock();
    stockInfoLocalDataSource = StockInfoLocalDataSourceMock();
    stockInfoRemoteDataSource = StockInfoRemoteDataSourceMock();
    deviceStorage = DeviceStorageMock();
    materialListRepository = MaterialListRepository(
      config: mockConfig,
      materialListLocalDataSource: materialListLocalDataSource,
      materialListRemoteDataSource: materialListRemoteDataSource,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
      deviceStorage: deviceStorage,
    );
    fakeMaterialResponse = await MaterialListLocalDataSource().getProductList();
    fakeComboDealMaterialResponse = await MaterialListLocalDataSource()
        .getComboDealMaterialsPrincipalCode();
  });

  group('Material List Repository Test', () {
    group('=> get material List Test', () {
      test('=> get locally fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => materialListLocalDataSource.getProductList())
            .thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getMaterialList(
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: 0,
          pageSize: 10,
          salesOrgConfig: fakeSGSalesOrgConfigs,
          salesOrganisation: fakeSGSalesOrganisation,
          selectedMaterialFilter: fakeMaterialFilter,
          shipToInfo: fakeShipToInfo,
          language: fakeClientUser.preferredLanguage,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get locally success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => materialListLocalDataSource.getProductList()).thenAnswer(
          (invocation) async => fakeMaterialResponse,
        );

        final result = await materialListRepository.getMaterialList(
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: 0,
          pageSize: 10,
          salesOrgConfig: fakeSGSalesOrgConfigs,
          salesOrganisation: fakeSGSalesOrganisation,
          selectedMaterialFilter: fakeMaterialFilter,
          shipToInfo: fakeShipToInfo,
          language: fakeClientUser.preferredLanguage,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('=> get bundle data remotely fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(
          () => materialListRepository.getBundleData(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSGSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            language: fakeClientUser.preferredLanguage,
            materials: [fakeBundle],
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getBundleData(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          language: fakeClientUser.preferredLanguage,
          materials: [fakeBundle],
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get remotely fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => materialListRemoteDataSource.getProductList(
            salesOrgCode: fakeSGSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            pageSize: 10,
            gimmickMaterial: fakeSGSalesOrgConfigs.enableGimmickMaterial,
            language: fakeClientUser.preferredLanguage.languageCode,
            isFavourite: fakeMaterialFilter.isFavourite,
            isCovidSelected: fakeMaterialFilter.isCovidSelected,
            type: fakeMaterialFilter.type,
            isProductOffer: fakeMaterialFilter.isProductOffer,
            principalCode: '',
            offset: 0,
            orderByName: fakeMaterialFilter.sortBy.isAlphabetSort
                ? fakeMaterialFilter.sortBy.valueRequest
                : '',
            orderByPrice: fakeMaterialFilter.sortBy.isPriceSort
                ? fakeMaterialFilter.sortBy.valueRequest
                : '',
            manufactureList: fakeMaterialFilter.manufactureListSelected,
            countryListCode: fakeMaterialFilter.countryListSelected
                .map((e) => e.code)
                .toList(),
            searchKey: '',
            salesDeal: [],
            isComboOffers: fakeMaterialFilter.comboOffers,
            showSampleItem: false,
            market: fakeMarket,
            isMarketPlace: fakeMaterialFilter.isMarketPlace,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getMaterialList(
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: 0,
          pageSize: 10,
          salesOrgConfig: fakeSGSalesOrgConfigs,
          salesOrganisation: fakeSGSalesOrganisation,
          selectedMaterialFilter: fakeMaterialFilter,
          shipToInfo: fakeShipToInfo,
          language: fakeClientUser.preferredLanguage,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get remotely success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => materialListRemoteDataSource.getProductList(
            salesOrgCode: fakeSGSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            pageSize: 10,
            gimmickMaterial: fakeSGSalesOrgConfigs.enableGimmickMaterial,
            language: fakeClientUser.preferredLanguage.languageCode,
            isFavourite: fakeMaterialFilterWithComboOffers.isFavourite,
            isCovidSelected: fakeMaterialFilterWithComboOffers.isCovidSelected,
            type: fakeMaterialFilterWithComboOffers.type,
            isProductOffer: fakeMaterialFilterWithComboOffers.isProductOffer,
            principalCode: '',
            offset: 0,
            orderByName: fakeMaterialFilterWithComboOffers.sortBy.isAlphabetSort
                ? fakeMaterialFilterWithComboOffers.sortBy.valueRequest
                : '',
            orderByPrice: fakeMaterialFilterWithComboOffers.sortBy.isPriceSort
                ? fakeMaterialFilterWithComboOffers.sortBy.valueRequest
                : '',
            manufactureList:
                fakeMaterialFilterWithComboOffers.manufactureListSelected,
            countryListCode: fakeMaterialFilterWithComboOffers
                .countryListSelected
                .map((e) => e.code)
                .toList(),
            searchKey: '',
            salesDeal: [],
            isComboOffers: fakeMaterialFilterWithComboOffers.comboOffers,
            showSampleItem: false,
            market: fakeMarket,
            isMarketPlace: fakeMaterialFilterWithComboOffers.isMarketPlace,
          ),
        ).thenAnswer(
          (invocation) async => fakeMaterialResponse,
        );

        final result = await materialListRepository.getMaterialList(
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: 0,
          pageSize: 10,
          salesOrgConfig: fakeSGSalesOrgConfigs,
          salesOrganisation: fakeSGSalesOrganisation,
          selectedMaterialFilter: fakeMaterialFilterWithComboOffers,
          shipToInfo: fakeShipToInfo,
          language: fakeClientUser.preferredLanguage,
        );
        expect(
          result.isRight(),
          true,
        );
      });
    });

    group('=> get Material Stock Info', () {
      test(
          '=> returns MaterialStockInfo when stockInfoList has matching materialNumber',
          () {
        final result = materialListRepository.getMaterialStockInfo(
          stockInfoList: Right([
            fakeStockInfo1,
            fakeStockInfo2,
          ]),
          materialInfo: fakeMatchMaterialInfo,
        );

        expect(result, fakeStockInfo1);
      });

      test('=> returns empty MaterialStockInfo when stockInfoList is Left', () {
        final result = materialListRepository.getMaterialStockInfo(
          stockInfoList: const Left(ApiFailure.other('fake-fail')),
          materialInfo: fakeMatchMaterialInfo,
        );

        expect(result, MaterialStockInfo.empty());
      });

      test('=> returns empty MaterialStockInfo when stockInfoList is empty',
          () {
        // Act
        final result = materialListRepository.getMaterialStockInfo(
          stockInfoList: const Right([]),
          materialInfo: fakeMatchMaterialInfo,
        );

        expect(result, MaterialStockInfo.empty());
      });

      test(
          '=> returns empty MaterialStockInfo when no matching materialNumber is found',
          () {
        final result = materialListRepository.getMaterialStockInfo(
          stockInfoList: Right([
            fakeStockInfo2,
            fakeStockInfo3,
          ]),
          materialInfo: fakeMatchMaterialInfo,
        );
        expect(result, MaterialStockInfo.empty());
      });
    });

    group('=> get ComboDeal Materials test', () {
      test('=> get locally for principal code fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () =>
              materialListLocalDataSource.getComboDealMaterialsPrincipalCode(),
        ).thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getComboDealMaterials(
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: 0,
          pageSize: 24,
          salesOrganisation: fakeTWSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          user: fakeExternalSalesRepUser,
          principles: [fakePrinciple],
          salesOrgConfig: fakeTWSalesOrgConfigs,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get locally for principal code success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(
          () =>
              materialListLocalDataSource.getComboDealMaterialsPrincipalCode(),
        ).thenAnswer((invocation) async => fakeComboDealMaterialResponse);

        final result = await materialListRepository.getComboDealMaterials(
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: 0,
          pageSize: 24,
          salesOrganisation: fakeTWSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          user: fakeExternalSalesRepUser,
          principles: [fakePrinciple],
          salesOrgConfig: fakeTWSalesOrgConfigs,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('=> get remotely for principal code fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => materialListRemoteDataSource.getComboDealMaterialsPrincipalCode(
            salesOrgCode: fakeTWSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            language: fakeClientUser.preferredLanguage.languageCode,
            pageSize: 10,
            offset: 0,
            principalCodeList: [
              fakePrincipleData.principalCode.getOrDefaultValue(''),
            ],
            market: fakeMarket,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getComboDealMaterials(
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: 0,
          pageSize: 10,
          salesOrganisation: fakeTWSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          principles: [fakePrinciple],
          salesOrgConfig: fakeTWSalesOrgConfigs,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get remotely for principal code success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => materialListRemoteDataSource.getComboDealMaterialsPrincipalCode(
            salesOrgCode: fakeTWSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            pageSize: 10,
            offset: 0,
            principalCodeList: [
              fakePrincipleData.principalCode.getOrDefaultValue(''),
            ],
            language: fakeClientUser.preferredLanguage.languageCode,
            market: fakeMarket,
          ),
        ).thenAnswer((invocation) async => fakeComboDealMaterialResponse);

        final result = await materialListRepository.getComboDealMaterials(
          customerCodeInfo: fakeCustomerCodeInfo,
          offset: 0,
          pageSize: 10,
          salesOrganisation: fakeTWSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          principles: [fakePrinciple],
          salesOrgConfig: fakeTWSalesOrgConfigs,
        );
        expect(
          result.isRight(),
          true,
        );
      });
    });

    group('=> get Stock Info List Test', () {
      test('=> get locally fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => stockInfoLocalDataSource.getMaterialStockInfoList())
            .thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getStockInfoList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          materials: fakeMaterialResponse.products,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get locally success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => stockInfoLocalDataSource.getMaterialStockInfoList())
            .thenAnswer(
          (invocation) async => [fakeStockInfo1],
        );

        final result = await materialListRepository.getStockInfoList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          materials: fakeMaterialResponse.products,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('=> get remotely fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(
          () => stockInfoRemoteDataSource.getMaterialStockInfoList(
            materialNumbers: fakeMaterialResponse.products
                .map((e) => e.materialNumber.getOrCrash())
                .toList(),
            salesOrg: fakeSGSalesOrganisation.salesOrg.getOrCrash(),
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getStockInfoList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          materials: fakeMaterialResponse.products,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get remotely success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(
          () => stockInfoRemoteDataSource.getMaterialStockInfoList(
            materialNumbers: fakeMaterialResponse.products
                .where((element) => element.type.typeMaterial)
                .map((e) => e.materialNumber.getOrCrash())
                .toList(),
            salesOrg: fakeSGSalesOrganisation.salesOrg.getOrCrash(),
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          ),
        ).thenAnswer(
          (invocation) async => [fakeStockInfo1],
        );

        final result = await materialListRepository.getStockInfoList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          materials: fakeMaterialResponse.products,
        );
        expect(
          result.isRight(),
          true,
        );
      });
    });

    group('=> get Material Data Test', () {
      test('=> get locally fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => materialListLocalDataSource.getProductDetails())
            .thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getMaterialData(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          material: fakeMatchMaterialInfo,
          shipToInfo: fakeShipToInfo,
          language: fakeClientUser.preferredLanguage,
          type: '',
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get locally success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => materialListLocalDataSource.getProductDetails()).thenAnswer(
          (invocation) async => fakeMatchMaterialInfo,
        );

        final result = await materialListRepository.getMaterialData(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          material: fakeMatchMaterialInfo,
          shipToInfo: fakeShipToInfo,
          language: fakeClientUser.preferredLanguage,
          type: '',
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('=> get remotely fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => materialListRemoteDataSource.getProductDetails(
            code: fakeMatchMaterialInfo.materialNumber.getOrCrash(),
            salesOrg: fakeSGSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: '',
            language: fakeClientUser.preferredLanguage.languageCode,
            market: fakeMarket,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getMaterialData(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          material: fakeMatchMaterialInfo,
          shipToInfo: fakeShipToInfo,
          language: fakeClientUser.preferredLanguage,
          type: '',
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get remotely success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => materialListRemoteDataSource.getProductDetails(
            code: fakeMatchMaterialInfo.materialNumber.getOrCrash(),
            salesOrg: fakeSGSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: '',
            language: fakeClientUser.preferredLanguage.languageCode,
            market: fakeMarket,
          ),
        ).thenAnswer(
          (invocation) async => fakeMatchMaterialInfo,
        );

        final result = await materialListRepository.getMaterialData(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          material: fakeMatchMaterialInfo,
          shipToInfo: fakeShipToInfo,
          language: fakeClientUser.preferredLanguage,
          type: '',
        );
        expect(
          result.isRight(),
          true,
        );
      });
    });

    group('=> get Material Bonus List Test', () {
      test('=> get locally fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => materialListLocalDataSource.getProductList())
            .thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getMaterialBonusList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          salesOrgConfig: fakeSGSalesOrgConfigs,
          principalData: fakePrincipleData,
          user: fakeExternalSalesRepUser,
          enableGimmickMaterial: false,
          searchKey: SearchKey(''),
          offset: 0,
          pageSize: 10,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get locally success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => materialListLocalDataSource.getProductList()).thenAnswer(
          (invocation) async => fakeMaterialResponse,
        );

        final result = await materialListRepository.getMaterialBonusList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          salesOrgConfig: fakeSGSalesOrgConfigs,
          principalData: fakePrincipleData,
          user: fakeExternalSalesRepUser,
          enableGimmickMaterial: false,
          searchKey: SearchKey(''),
          offset: 0,
          pageSize: 10,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('=> get remotely fail', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => materialListRemoteDataSource.getProductList(
            salesOrgCode: fakeSGSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            language: fakeExternalSalesRepUser
                .settings.languagePreference.languageCode,
            gimmickMaterial: false,
            type: '',
            countryListCode: [],
            isFavourite: false,
            isCovidSelected: false,
            isProductOffer: false,
            manufactureList: [fakePrincipleData.principalName.getOrCrash()],
            orderByName: 'asc',
            orderByPrice: '',
            principalCode: fakePrincipleData.principalCode.getOrCrash(),
            searchKey: '',
            salesDeal: [],
            offset: 0,
            pageSize: 10,
            isComboOffers: fakeMaterialFilter.comboOffers,
            showSampleItem: true,
            market: fakeMarket,
            isMarketPlace: false,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await materialListRepository.getMaterialBonusList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          salesOrgConfig: fakeSGSalesOrgConfigs,
          principalData: fakePrincipleData,
          user: fakeExternalSalesRepUser,
          enableGimmickMaterial: false,
          searchKey: SearchKey(''),
          offset: 0,
          pageSize: 10,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('=> get remotely success', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
        when(
          () => materialListRemoteDataSource.getProductList(
            salesOrgCode: fakeSGSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            language: fakeExternalSalesRepUser
                .settings.languagePreference.languageCode,
            gimmickMaterial: false,
            type: '',
            countryListCode: [],
            isFavourite: false,
            isCovidSelected: false,
            isProductOffer: false,
            manufactureList: [fakePrincipleData.principalName.getOrCrash()],
            orderByName: 'asc',
            orderByPrice: '',
            principalCode: fakePrincipleData.principalCode.getOrCrash(),
            searchKey: '',
            salesDeal: [],
            offset: 0,
            pageSize: 10,
            isComboOffers: fakeMaterialFilter.comboOffers,
            showSampleItem: true,
            market: fakeMarket,
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => fakeMaterialResponse,
        );

        final result = await materialListRepository.getMaterialBonusList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          salesOrgConfig: fakeSGSalesOrgConfigs,
          principalData: fakePrincipleData,
          user: fakeExternalSalesRepUser,
          enableGimmickMaterial: false,
          searchKey: SearchKey(''),
          offset: 0,
          pageSize: 10,
        );
        expect(
          result.isRight(),
          true,
        );
      });
    });
  });
}
