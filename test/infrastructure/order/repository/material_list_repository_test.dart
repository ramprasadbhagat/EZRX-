import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
  late MaterialListRepository materialListRepository;
  late Config mockConfig;
  late MaterialListLocalDataSource materialListLocalDataSource;
  late MaterialListRemoteDataSource materialListRemoteDataSource;
  late StockInfoLocalDataSource stockInfoLocalDataSource;
  late StockInfoRemoteDataSource stockInfoRemoteDataSource;

  final fakeSaleOrg =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
      customerCodeSoldTo: '100000345',
      customerAttr7: CustomerAttr7('ZEV'),
      customerGrp4: CustomerGrp4('VR'),
      status: Status('fake_status'));
  final fakeShipToInfo = ShipToInfo.empty()
      .copyWith(shipToCustomerCode: '1234567', status: Status('fake_status'));
  final mockUser = User.empty();
  // final mockSalesOrganisationConfigs =
  //     SalesOrganisationConfigs.empty().copyWith(
  //         languageFilter: true,
  //         languageValue: LanguageValue(ApiLanguageCode.english),
  //         disablePrincipals: false,
  //         enableGimmickMaterial: true,
  //         principalList: [
  //           SalesOrganisationConfigsPrincipal.empty()
  //               .copyWith(principalCode: PrincipalCode('123')),
  //           SalesOrganisationConfigsPrincipal.empty()
  //               .copyWith(principalCode: PrincipalCode('234')),
  //           SalesOrganisationConfigsPrincipal.empty()
  //               .copyWith(principalCode: PrincipalCode('345')),
  //         ],
  //         currency: Currency('SG'),
  //         salesOrg: SalesOrg('2601'));
  // final mockOrderDocumentType = OrderDocumentType.empty().copyWith(
  //     documentType: DocumentType('Sample (ZPFB)'), salesOrg: SalesOrg('2601'));
  // final mockMaterialFilter = MaterialFilter.empty().copyWith(
  //   countryListSelected: [
  //     MaterialFilterCountry.empty().copyWith(name: 'Hong Kong', code: 'HK'),
  //   ],
  //   manufactureListSelected: [
  //     'STRYKER CORPORATION (M) SDN BHD',
  //   ],
  // );

  setUpAll(() {
    mockConfig = MockConfig();
    materialListLocalDataSource = MaterialListLocalDataSourceMock();
    materialListRemoteDataSource = MaterialListRemoteDataSourceMock();
    stockInfoLocalDataSource = StockInfoLocalDataSourceMock();
    stockInfoRemoteDataSource = StockInfoRemoteDataSourceMock();
    materialListRepository = MaterialListRepository(
      config: mockConfig,
      materialListLocalDataSource: materialListLocalDataSource,
      materialListRemoteDataSource: materialListRemoteDataSource,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
    );
  });

  group('materialListRepository should - ', () {
    // test('get materialList successfully locally for salesrep', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
    //   when(() => materialListLocalDataSource.getMaterialListSalesRep())
    //       .thenAnswer((invocation) async => <MaterialInfo>[]);

    //   final result = await materialListRepository.getMaterialList(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     offset: 0,
    //     orderBy: 'OrderDate',
    //     orderDocumentType: OrderDocumentType.empty(),
    //     pageSize: 10,
    //     pickAndPack: '',
    //     salesOrgConfig: mockSalesOrganisationConfigs,
    //     salesOrganisation: fakeSaleOrg,
    //     searchKey: '',
    //     selectedMaterialFilter: MaterialFilter.empty(),
    //     shipToInfo: fakeShipToInfo,
    //     user: mockUser.copyWith(
    //       role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
    //     ),
    //     isForFoc: false,
    //   );
    //   expect(
    //     result.isRight(),
    //     true,
    //   );
    // });

    // test('get materialList successfully locally', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
    //   when(() => materialListLocalDataSource.getMaterialList())
    //       .thenAnswer((invocation) async => <MaterialInfo>[]);

    //   final result = await materialListRepository.getMaterialList(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     offset: 0,
    //     orderBy: 'OrderDate',
    //     orderDocumentType: OrderDocumentType.empty(),
    //     pageSize: 10,
    //     pickAndPack: '',
    //     salesOrgConfig: mockSalesOrganisationConfigs,
    //     salesOrganisation: fakeSaleOrg,
    //     searchKey: '',
    //     selectedMaterialFilter: MaterialFilter.empty(),
    //     shipToInfo: fakeShipToInfo,
    //     user: mockUser,
    //     isForFoc: false,
    //   );
    //   expect(
    //     result.isRight(),
    //     true,
    //   );
    // });
    // test('get materialList fail locally for salesrep', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
    //   when(() => materialListLocalDataSource.getMaterialListSalesRep())
    //       .thenThrow((invocation) async => MockException());

    //   final result = await materialListRepository.getMaterialList(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     offset: 0,
    //     orderBy: 'OrderDate',
    //     orderDocumentType: OrderDocumentType.empty(),
    //     pageSize: 10,
    //     pickAndPack: '',
    //     salesOrgConfig: mockSalesOrganisationConfigs,
    //     salesOrganisation: fakeSaleOrg,
    //     searchKey: '',
    //     selectedMaterialFilter: MaterialFilter.empty(),
    //     shipToInfo: fakeShipToInfo,
    //     user: mockUser.copyWith(
    //       role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
    //     ),
    //     isForFoc: false,
    //   );
    //   expect(
    //     result.isLeft(),
    //     true,
    //   );
    // });
    // test('get materialList fail locally', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
    //   when(() => materialListLocalDataSource.getMaterialList())
    //       .thenThrow((invocation) async => MockException());

    //   final result = await materialListRepository.getMaterialList(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     offset: 0,
    //     orderBy: 'OrderDate',
    //     orderDocumentType: OrderDocumentType.empty(),
    //     pageSize: 10,
    //     pickAndPack: '',
    //     salesOrgConfig: mockSalesOrganisationConfigs,
    //     salesOrganisation: fakeSaleOrg,
    //     searchKey: '',
    //     selectedMaterialFilter: MaterialFilter.empty(),
    //     shipToInfo: fakeShipToInfo,
    //     user: mockUser,
    //     isForFoc: false,
    //   );
    //   expect(
    //     result.isLeft(),
    //     true,
    //   );
    // });
    // test('get materialList successfully remote for salesrep', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
    //   when(() =>
    //       materialListRemoteDataSource.getMaterialListSalesRep(
    //           userName: 'mock_user',
    //           salesOrgCode: '2601',
    //           customerCode: '100000345',
    //           shipToCode: '1234567',
    //           excludePrincipal:
    //               mockSalesOrganisationConfigs.getPrincipalCodeList,
    //           pageSize: 10,
    //           offset: 0,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '1673',
    //           language: ApiLanguageCode.english,
    //           gimmickMaterial: true,
    //           pickAndPack: 'include',
    //           principalNameList: ['GSK Consumer Healthcare'],
    //           therapeuticClassList: ['Other multivitamins with minerals'],
    //           itemBrandList: ['Ribena RTD Blueberry'],
    //           isSample: mockOrderDocumentType.documentType.isZPFB,
    //           isForFOC: false)).thenAnswer((invocation) async => <MaterialInfo>[
    //         MaterialInfo.empty().copyWith(
    //           materialNumber: MaterialNumber('123456'),
    //         )
    //       ]);

    //   final result = await materialListRepository.getMaterialList(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     offset: 0,
    //     orderBy: 'materialDescription_asc',
    //     orderDocumentType: mockOrderDocumentType,
    //     pageSize: 10,
    //     pickAndPack: 'include',
    //     salesOrgConfig: mockSalesOrganisationConfigs,
    //     salesOrganisation: fakeSaleOrg,
    //     searchKey: '1673',
    //     selectedMaterialFilter: mockMaterialFilter,
    //     shipToInfo: fakeShipToInfo,
    //     user: mockUser.copyWith(
    //         role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
    //         id: '1',
    //         username: Username('mock_user'),
    //         email: EmailAddress('user@gmail.com'),
    //         customerCode: CustomerCode('100000345')),
    //     isForFoc: false,
    //   );

    //   expect(
    //     result.isRight(),
    //     true,
    //   );
    // });
    // test('get materialList successfully remote ', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
    //   when(() => materialListRemoteDataSource.getMaterialList(
    //       salesOrgCode: '2601',
    //       customerCode: '100000345',
    //       shipToCode: '1234567',
    //       excludePrincipal: mockSalesOrganisationConfigs.getPrincipalCodeList,
    //       pageSize: 10,
    //       offset: 0,
    //       orderBy: 'materialDescription_asc',
    //       searchKey: '1673',
    //       language: ApiLanguageCode.english,
    //       principalNameList: ['GSK Consumer Healthcare'],
    //       therapeuticClassList: ['Other multivitamins with minerals'],
    //       itemBrandList: ['Ribena RTD Blueberry'],
    //       isForFOC: false)).thenAnswer((invocation) async => <MaterialInfo>[]);

    //   final result = await materialListRepository.getMaterialList(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     offset: 0,
    //     orderBy: 'materialDescription_asc',
    //     orderDocumentType: mockOrderDocumentType,
    //     pageSize: 10,
    //     pickAndPack: 'include',
    //     salesOrgConfig: mockSalesOrganisationConfigs,
    //     salesOrganisation: fakeSaleOrg,
    //     searchKey: '1673',
    //     selectedMaterialFilter: mockMaterialFilter,
    //     shipToInfo: fakeShipToInfo,
    //     user: mockUser.copyWith(
    //         role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
    //         id: '1',
    //         username: Username('mock_user'),
    //         email: EmailAddress('user@gmail.com'),
    //         customerCode: CustomerCode('100000345')),
    //     isForFoc: false,
    //   );
    //   expect(
    //     result.isRight(),
    //     true,
    //   );
    // });
    // test('get materialList fail remote ', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
    //   when(() => materialListRemoteDataSource.getMaterialList(
    //       salesOrgCode: '2601',
    //       customerCode: '100000345',
    //       shipToCode: '1234567',
    //       excludePrincipal: mockSalesOrganisationConfigs.getPrincipalCodeList,
    //       pageSize: 10,
    //       offset: 0,
    //       orderBy: 'orderDate',
    //       searchKey: '',
    //       language: ApiLanguageCode.english,
    //       principalNameList: [
    //         'GSK Consumer Healthcare',
    //         'Pfizer PFE Private Limited test'
    //       ],
    //       therapeuticClassList: [
    //         'Other multivitamins with minerals',
    //         'Plain vitamin C (including vit. C salts)',
    //         'Throat preparations',
    //         'Growth hormones',
    //         'Specific antirheumatic agents',
    //         'Emollients, protectives',
    //         'All other stomatologicals',
    //       ],
    //       itemBrandList: [
    //         'Ribena RTD Blueberry',
    //         'Ribena Glucose 1L bw',
    //         'Ribena Conc Apple 1L',
    //         'Sensodyne Repair N P',
    //         'Sensodyne Freshmint',
    //       ],
    //       isForFOC: mockOrderDocumentType.documentType
    //           .isZPFC)).thenThrow((invocation) async => MockException());

    //   final result = await materialListRepository.getMaterialList(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     offset: 0,
    //     orderBy: 'OrderDate',
    //     orderDocumentType: mockOrderDocumentType,
    //     pageSize: 10,
    //     pickAndPack: '',
    //     salesOrgConfig: mockSalesOrganisationConfigs,
    //     salesOrganisation: fakeSaleOrg,
    //     searchKey: '',
    //     selectedMaterialFilter: mockMaterialFilter,
    //     shipToInfo: fakeShipToInfo,
    //     user: mockUser.copyWith(
    //         id: '1',
    //         username: Username('user'),
    //         email: EmailAddress('user@gmail.com'),
    //         customerCode: CustomerCode('100007654')),
    //     isForFoc: mockOrderDocumentType.documentType.isZPFC,
    //   );
    //   expect(
    //     result.isLeft(),
    //     true,
    //   );
    // });
    // test('get materialList fail remote for salesrep', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
    //   when(() => materialListRemoteDataSource.getMaterialListSalesRep(
    //       userName: 'user',
    //       salesOrgCode: '2601',
    //       customerCode: '100000345',
    //       shipToCode: '1234567',
    //       excludePrincipal: mockSalesOrganisationConfigs.getPrincipalCodeList,
    //       pageSize: 10,
    //       offset: 0,
    //       orderBy: 'orderDate',
    //       searchKey: '',
    //       language: ApiLanguageCode.english,
    //       gimmickMaterial: true,
    //       pickAndPack: '',
    //       principalNameList: [
    //         'GSK Consumer Healthcare',
    //         'Pfizer PFE Private Limited test'
    //       ],
    //       therapeuticClassList: [
    //         'Other multivitamins with minerals',
    //         'Plain vitamin C (including vit. C salts)',
    //         'Throat preparations',
    //         'Growth hormones',
    //         'Specific antirheumatic agents',
    //         'Emollients, protectives',
    //         'All other stomatologicals',
    //       ],
    //       itemBrandList: [
    //         'Ribena RTD Blueberry',
    //         'Ribena Glucose 1L bw',
    //         'Ribena Conc Apple 1L',
    //         'Sensodyne Repair N P',
    //         'Sensodyne Freshmint',
    //       ],
    //       isSample: mockOrderDocumentType.documentType.isZPFB,
    //       isForFOC: true)).thenThrow((invocation) async => MockException());

    //   final result = await materialListRepository.getMaterialList(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     offset: 0,
    //     orderBy: 'OrderDate',
    //     orderDocumentType: mockOrderDocumentType,
    //     pageSize: 10,
    //     pickAndPack: '',
    //     salesOrgConfig: mockSalesOrganisationConfigs,
    //     salesOrganisation: fakeSaleOrg,
    //     searchKey: '',
    //     selectedMaterialFilter: MaterialFilter.empty(),
    //     shipToInfo: fakeShipToInfo,
    //     user: mockUser.copyWith(
    //         role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
    //         id: '1',
    //         username: Username('user'),
    //         email: EmailAddress('user@gmail.com'),
    //         customerCode: CustomerCode('100007654')),
    //     isForFoc: true,
    //   );
    //   expect(
    //     result.isLeft(),
    //     true,
    //   );
    // });
  });

  group('Materials for combo deal', () {
    test('get successfully local', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialListLocalDataSource.getMaterialList())
          .thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialListRepository.getComboDealMaterials(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        pageSize: 10,
        salesOrganisation: fakeSaleOrg,
        shipToInfo: fakeShipToInfo,
        user: mockUser,
        principles: ['fake'],
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('get success remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => materialListRemoteDataSource.getComboDealMaterials(
          offset: 0,
          pageSize: 10,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          principalNameList: ['000000fake'],
          salesOrgCode: fakeSaleOrg.salesOrg.getOrDefaultValue(''),
          shipToCode: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenAnswer((invocation) async => [MaterialInfo.empty()]);

      final result = await materialListRepository.getComboDealMaterials(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        pageSize: 10,
        salesOrganisation: fakeSaleOrg,
        shipToInfo: fakeShipToInfo,
        user: mockUser,
        principles: ['fake'],
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get failure remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => materialListRemoteDataSource.getComboDealMaterials(
          offset: 0,
          pageSize: 10,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          principalNameList: ['000000fake'],
          salesOrgCode: fakeSaleOrg.salesOrg.getOrDefaultValue(''),
          shipToCode: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await materialListRepository.getComboDealMaterials(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        pageSize: 10,
        salesOrganisation: fakeSaleOrg,
        shipToInfo: fakeShipToInfo,
        user: mockUser,
        principles: ['fake'],
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get success remote SalesRep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => materialListRemoteDataSource.getComboDealMaterialsForSaleRep(
          offset: 0,
          pageSize: 10,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          principalNameList: ['000000fake'],
          salesOrgCode: fakeSaleOrg.salesOrg.getOrDefaultValue(''),
          shipToCode: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenAnswer((invocation) async => [MaterialInfo.empty()]);

      final result = await materialListRepository.getComboDealMaterials(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        pageSize: 10,
        salesOrganisation: fakeSaleOrg,
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
        ),
        principles: ['fake'],
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get failure remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => materialListRemoteDataSource.getComboDealMaterialsForSaleRep(
          offset: 0,
          pageSize: 10,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          principalNameList: ['000000fake'],
          salesOrgCode: fakeSaleOrg.salesOrg.getOrDefaultValue(''),
          shipToCode: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await materialListRepository.getComboDealMaterials(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        pageSize: 10,
        salesOrganisation: fakeSaleOrg,
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
        ),
        principles: ['fake'],
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
