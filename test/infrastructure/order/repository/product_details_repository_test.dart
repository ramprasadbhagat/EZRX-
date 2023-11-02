import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class ProductDetailLocalDataSourceMock extends Mock
    implements ProductDetailLocalDataSource {}

class ProductDetailRemoteDataSourceMock extends Mock
    implements ProductDetailRemoteDataSource {}

class MaterialListLocalDataSourceMock extends Mock
    implements MaterialListLocalDataSource {}

class MaterialListRemoteDataSourceMock extends Mock
    implements MaterialListRemoteDataSource {}

class StockInfoLocalDataSourceMock extends Mock
    implements StockInfoLocalDataSource {}

class StockInfoRemoteDataSourceMock extends Mock
    implements StockInfoRemoteDataSource {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ProductDetailRepository productDetailRepository;
  late Config mockConfig;
  late ProductDetailLocalDataSource productDetailLocalDataSource;
  late ProductDetailRemoteDataSource productDetailRemoteDataSource;
  late MaterialListLocalDataSource materialListLocalDataSource;
  late MaterialListRemoteDataSource materialListRemoteDataSource;
  late StockInfoLocalDataSource stockInfoLocalDataSource;
  late StockInfoRemoteDataSource stockInfoRemoteDataSource;
  late MaterialInfo fakeMaterialInfo;
  late ProductMetaData fakeProductMetaData;
  late StockInfo fakeStockInfo;
  late List<MaterialStockInfo> fakeStockInfoList;

  final mockMaterialNumber = MaterialNumber('12345');
  const mockLocale = Locale(ApiLanguageCode.english);
  final mockPrincipalCode = PrincipalCode('fake_principalCode');
  final mockMaterialInfoTypeBundle = MaterialInfoType.bundle();
  final mockMaterialInfoTypeMaterial = MaterialInfoType.material();

  setUpAll(() async {
    mockConfig = MockConfig();
    productDetailLocalDataSource = ProductDetailLocalDataSourceMock();
    productDetailRemoteDataSource = ProductDetailRemoteDataSourceMock();
    materialListLocalDataSource = MaterialListLocalDataSourceMock();
    materialListRemoteDataSource = MaterialListRemoteDataSourceMock();
    stockInfoLocalDataSource = StockInfoLocalDataSourceMock();
    stockInfoRemoteDataSource = StockInfoRemoteDataSourceMock();
    fakeMaterialInfo = await ProductDetailLocalDataSource().getProductDetails();
    fakeProductMetaData =
        await ProductDetailLocalDataSource().getItemProductMetaData();
    fakeStockInfo = await StockInfoLocalDataSource().getStockInfo();
    fakeStockInfoList =
        await StockInfoLocalDataSource().getMaterialStockInfoList();

    productDetailRepository = ProductDetailRepository(
      config: mockConfig,
      materialListLocalDataSource: materialListLocalDataSource,
      materialListRemoteDataSource: materialListRemoteDataSource,
      productDetailLocalDataSource: productDetailLocalDataSource,
      productDetailRemoteDataSource: productDetailRemoteDataSource,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
    );
  });

  group('ProductDetailRepository should - ', () {
    group('get ProductDetail (for type material)- ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getProductDetails(),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeMaterial,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLocale.languageCode,
            materialNumber: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
          ),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeMaterial,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getProductDetails(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeMaterial,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLocale.languageCode,
            materialNumber: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeMaterial,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });
    group('get ProductDetail (for type bundle)- ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeBundle,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLocale.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeBundle.getValue(),
          ),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeBundle,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeBundle,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLocale.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeBundle.getValue(),
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          shipToInfo: fakeShipToInfo,
          type: mockMaterialInfoTypeBundle,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });

    group('get ProductListDetail - ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
          types: [mockMaterialInfoTypeMaterial],
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLocale.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeMaterial.getValue(),
          ),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getProductListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
          types: [mockMaterialInfoTypeMaterial],
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
          types: [mockMaterialInfoTypeMaterial],
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLocale.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeMaterial.getValue(),
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getProductListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
          types: [mockMaterialInfoTypeMaterial],
        );
        if (result.isRight()) {
          result.fold((l) => {}, (r) {
            expect(
              r.length,
              0,
            );
          });
        }
      });
    });

    group('get getBundleListDetail - ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getBundleListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          bundleCodes: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.entries.first.value,
          fakeMaterialInfo,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLocale.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeBundle.getValue(),
          ),
        ).thenAnswer((invocation) async => fakeMaterialInfo);

        final result = await productDetailRepository.getBundleListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          bundleCodes: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.entries.first.value,
          fakeMaterialInfo,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => materialListLocalDataSource.getProductDetails(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getBundleListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          bundleCodes: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result,
          {},
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => materialListRemoteDataSource.getProductDetails(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            language: mockLocale.languageCode,
            code: mockMaterialNumber.getOrCrash(),
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            type: mockMaterialInfoTypeBundle.getValue(),
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getBundleListDetail(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          bundleCodes: [mockMaterialNumber],
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result,
          {},
        );
      });
    });
    group('get StockInfo - ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => stockInfoLocalDataSource.getStockInfo(),
        ).thenAnswer((invocation) async => fakeStockInfo);

        final result = await productDetailRepository.getStockInfo(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          materialNumber: mockMaterialNumber,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => stockInfoRemoteDataSource.getStockInfo(
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            materialNumber: mockMaterialNumber.getOrCrash(),
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          ),
        ).thenAnswer((invocation) async => fakeStockInfo);

        final result = await productDetailRepository.getStockInfo(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          materialNumber: mockMaterialNumber,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => stockInfoLocalDataSource.getStockInfo(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getStockInfo(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          materialNumber: mockMaterialNumber,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => stockInfoRemoteDataSource.getStockInfo(
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            materialNumber: mockMaterialNumber.getOrCrash(),
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getStockInfo(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          materialNumber: mockMaterialNumber,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });

    group('get getStockInfoList - ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => stockInfoLocalDataSource.getMaterialStockInfoList(),
        ).thenAnswer((invocation) async => fakeStockInfoList);

        final result = await productDetailRepository.getStockInfoList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          materials: [fakeMaterialInfo],
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => stockInfoRemoteDataSource.getMaterialStockInfoList(
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            materialNumbers: [fakeMaterialInfo.materialNumber.getOrCrash()],
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          ),
        ).thenAnswer((invocation) async => fakeStockInfoList);

        final result = await productDetailRepository.getStockInfoList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          materials: [fakeMaterialInfo],
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => stockInfoLocalDataSource.getMaterialStockInfoList(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getStockInfoList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          materials: [fakeMaterialInfo],
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => stockInfoRemoteDataSource.getMaterialStockInfoList(
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            materialNumbers: [fakeMaterialInfo.materialNumber.getOrCrash()],
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getStockInfoList(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          materials: [fakeMaterialInfo],
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });

    group('get SimilarProduct - ', () {
      test('successfully - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getSimilarProduct(),
        ).thenAnswer((invocation) async => [fakeMaterialInfo]);

        final result = await productDetailRepository.getSimilarProduct(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          principalCode: mockPrincipalCode,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote (when material numbet dose not match)',
          () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getSimilarProduct(
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            materialNumber: mockMaterialNumber.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            language: mockLocale.languageCode,
            principalCode: mockPrincipalCode.getOrCrash(),
          ),
        ).thenAnswer((invocation) async => [fakeMaterialInfo]);
        when(
          () => stockInfoRemoteDataSource.getMaterialStockInfoList(
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            materialNumbers: [fakeMaterialInfo.materialNumber.getOrCrash()],
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          ),
        ).thenAnswer((invocation) async => fakeStockInfoList);

        final result = await productDetailRepository.getSimilarProduct(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          principalCode: mockPrincipalCode,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('successfully - remote (when material numbet match)', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getSimilarProduct(
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            materialNumber: mockMaterialNumber.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            language: mockLocale.languageCode,
            principalCode: mockPrincipalCode.getOrCrash(),
          ),
        ).thenAnswer(
          (invocation) async => [
            fakeMaterialInfo.copyWith(materialNumber: MaterialNumber('12345'))
          ],
        );
        when(
          () => stockInfoRemoteDataSource.getMaterialStockInfoList(
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            materialNumbers: [fakeMaterialInfo.materialNumber.getOrCrash()],
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          ),
        ).thenAnswer(
          (invocation) async => [
            fakeStockInfoList.first
                .copyWith(materialNumber: MaterialNumber('12345'))
          ],
        );

        final result = await productDetailRepository.getSimilarProduct(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          principalCode: mockPrincipalCode,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getSimilarProduct(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getSimilarProduct(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          principalCode: mockPrincipalCode,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getSimilarProduct(
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            materialNumber: mockMaterialNumber.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            language: mockLocale.languageCode,
            principalCode: mockPrincipalCode.getOrCrash(),
          ),
        ).thenThrow((invocation) async => MockException());
        when(
          () => stockInfoRemoteDataSource.getMaterialStockInfoList(
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            materialNumbers: [fakeMaterialInfo.materialNumber.getOrCrash()],
            selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getSimilarProduct(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          locale: mockLocale,
          materialNumber: mockMaterialNumber,
          principalCode: mockPrincipalCode,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });

    group('get ItemProductMetaData - ', () {
      test('successfully - local (when response is not empty)', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getItemProductMetaData(),
        ).thenAnswer((invocation) async => fakeProductMetaData);

        final result = await productDetailRepository.getItemProductMetaData(
          productDetailAggregate: ProductDetailAggregate.empty()
              .copyWith(materialInfo: fakeMaterialInfo),
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('successfully - local (when response is empty)', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getItemProductMetaData(),
        ).thenAnswer(
          (invocation) async =>
              fakeProductMetaData.copyWith(items: [], productImages: []),
        );

        final result = await productDetailRepository.getItemProductMetaData(
          productDetailAggregate: ProductDetailAggregate.empty()
              .copyWith(materialInfo: fakeMaterialInfo),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote (when response is not empty)', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getItemProductMetaData(
            materialIDs: [fakeMaterialInfo.materialNumber.getOrCrash()],
          ),
        ).thenAnswer((invocation) async => fakeProductMetaData);

        final result = await productDetailRepository.getItemProductMetaData(
          productDetailAggregate: ProductDetailAggregate.empty()
              .copyWith(materialInfo: fakeMaterialInfo),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('successfully - remote (when response is empty)', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getItemProductMetaData(
            materialIDs: [fakeMaterialInfo.materialNumber.getOrCrash()],
          ),
        ).thenAnswer(
          (invocation) async =>
              fakeProductMetaData.copyWith(items: [], productImages: []),
        );

        final result = await productDetailRepository.getItemProductMetaData(
          productDetailAggregate: ProductDetailAggregate.empty()
              .copyWith(materialInfo: fakeMaterialInfo),
        );
        expect(
          result.isRight(),
          true,
        );
      });
      test('failure - local', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

        when(
          () => productDetailLocalDataSource.getItemProductMetaData(),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getItemProductMetaData(
          productDetailAggregate: ProductDetailAggregate.empty()
              .copyWith(materialInfo: fakeMaterialInfo),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('failure - remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => productDetailRemoteDataSource.getItemProductMetaData(
            materialIDs: [fakeMaterialInfo.materialNumber.getOrCrash()],
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await productDetailRepository.getItemProductMetaData(
          productDetailAggregate: ProductDetailAggregate.empty()
              .copyWith(materialInfo: fakeMaterialInfo),
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });
  });
}
