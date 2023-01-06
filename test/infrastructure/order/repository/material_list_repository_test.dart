import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class MaterialListLocalDataSourceMock extends Mock
    implements MaterialListLocalDataSource {}

class MaterialListRemoteDataSourceMock extends Mock
    implements MaterialListRemoteDataSource {}

class CountlyServiceMock extends Mock implements CountlyService {}

void main() {
  late MaterialListRepository materialListRepository;
  late Config mockConfig;
  late MaterialListLocalDataSource materialListLocalDataSource;
  late MaterialListRemoteDataSource materialListRemoteDataSource;
  late CountlyService countlyService;

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
  final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty()
      .copyWith(
          languageFilter: true,
          languageValue: LanguageValue('EN'),
          disablePrincipals: false,
          enableGimmickMaterial: true,
          principalList: ['123', '234', '345'],
          currency: Currency('SG'),
          salesOrg: SalesOrg('2601'));
  final mockOrderDocumentType = OrderDocumentType.empty()
      .copyWith(documentType: 'ZPFB', salesOrg: SalesOrg('2601'));
  final mockMaterialFilter = MaterialFilter.empty().copyWith(uniqueItemBrand: [
    'Ribena RTD Blueberry',
  ], uniqueTherapeuticClass: [
    'Other multivitamins with minerals',
  ], uniquePrincipalName: [
    'GSK Consumer Healthcare',
  ]);

  setUpAll(() {
    mockConfig = MockConfig();
    materialListLocalDataSource = MaterialListLocalDataSourceMock();
    materialListRemoteDataSource = MaterialListRemoteDataSourceMock();
    countlyService = CountlyServiceMock();

    materialListRepository = MaterialListRepository(
        config: mockConfig,
        materialListLocalDataSource: materialListLocalDataSource,
        materialListRemoteDataSource: materialListRemoteDataSource,
        countlyService: countlyService);
  });

  group('materialListRepository should - ', () {
    test('get materialList successfully locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialListLocalDataSource.getMaterialListSalesRep())
          .thenAnswer((invocation) async => <MaterialInfo>[]);

      if (mockMaterialFilter != MaterialFilter.empty()) {
        when(
          () => countlyService.addCountlyEvent(
            'select_principal',
            segmentation: {
              'principalName': mockMaterialFilter,
            },
          ),
        ).thenAnswer((invocation) async {
          return;
        });
        when(
          () => countlyService.addCountlyEvent(
            'Use filterl',
            segmentation: {
              'principal_nam': mockMaterialFilter,
            },
          ),
        ).thenAnswer((invocation) async {
          return;
        });
        when(
          () => countlyService.addCountlyEvent(
            'select_thera_class',
            segmentation: {
              'theraClassName': mockMaterialFilter,
              'numSelected': mockMaterialFilter
            },
          ),
        ).thenAnswer((invocation) async {
          return;
        });
        when(
          () => countlyService.addCountlyEvent(
            'Use filterl',
            segmentation: {
              'therapeutic_class': mockMaterialFilter,
            },
          ),
        ).thenAnswer((invocation) async {
          return;
        });
      }

      final result = await materialListRepository.getMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        orderDocumentType: OrderDocumentType.empty(),
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
        ),
        isForFoc: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('get materialList successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialListLocalDataSource.getMaterialList())
          .thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialListRepository.getMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        orderDocumentType: OrderDocumentType.empty(),
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser,
        isForFoc: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialList fail locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialListLocalDataSource.getMaterialListSalesRep())
          .thenThrow((invocation) async => MockException());

      final result = await materialListRepository.getMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        orderDocumentType: OrderDocumentType.empty(),
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
        ),
        isForFoc: false,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get materialList fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialListLocalDataSource.getMaterialList())
          .thenThrow((invocation) async => MockException());

      final result = await materialListRepository.getMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        orderDocumentType: OrderDocumentType.empty(),
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser,
        isForFoc: false,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get materialList successfully remote for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() =>
          materialListRemoteDataSource.getMaterialListSalesRep(
              userName: 'mock_user',
              salesOrgCode: '2601',
              customerCode: '100000345',
              shipToCode: '1234567',
              excludePrincipal: ['123', '234', '345'],
              pageSize: 10,
              offset: 0,
              orderBy: 'materialDescription_asc',
              searchKey: '1673',
              language: 'EN',
              gimmickMaterial: true,
              pickAndPack: 'include',
              principalNameList: ['GSK Consumer Healthcare'],
              therapeuticClassList: ['Other multivitamins with minerals'],
              itemBrandList: ['Ribena RTD Blueberry'],
              isSample: mockOrderDocumentType.documentType.contains('ZPFB'),
              isForFOC: false)).thenAnswer((invocation) async => <MaterialInfo>[
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('123456'),
            )
          ]);

      when(
        () => countlyService.addCountlyEvent(
          'select_principal',
          segmentation: {
            'principalName': mockMaterialFilter.uniquePrincipalName.join(','),
            'numSelected': mockMaterialFilter.uniquePrincipalName.length,
          },
        ),
      ).thenAnswer((invocation) async {
        return;
      });
      when(
        () => countlyService.addCountlyEvent(
          'Use filter',
          segmentation: {
            'principal_name': mockMaterialFilter.uniquePrincipalName.join(','),
          },
        ),
      ).thenAnswer((invocation) async {
        return;
      });
      when(
        () => countlyService.addCountlyEvent(
          'select_thera_class',
          segmentation: {
            'theraClassName':
                mockMaterialFilter.uniqueTherapeuticClass.join(','),
            'numSelected': mockMaterialFilter.uniqueTherapeuticClass.length
          },
        ),
      ).thenAnswer((invocation) async {
        return;
      });
      when(
        () => countlyService.addCountlyEvent(
          'Use filter',
          segmentation: {
            'therapeutic_class':
                mockMaterialFilter.uniqueTherapeuticClass.join(','),
          },
        ),
      ).thenAnswer((invocation) async {
        return;
      });
      when(
        () => countlyService.addCountlyEvent(
          'Use filter',
          segmentation: {
            'item_brand': mockMaterialFilter.uniqueItemBrand.join(','),
          },
        ),
      ).thenAnswer((invocation) async {
        return;
      });

      final result = await materialListRepository.getMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'materialDescription_asc',
        orderDocumentType: mockOrderDocumentType,
        pageSize: 10,
        pickAndPack: 'include',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '1673',
        selectedMaterialFilter: mockMaterialFilter,
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
            id: '1',
            username: Username('mock_user'),
            email: EmailAddress('user@gmail.com'),
            customerCode: CustomerCode('100000345')),
        isForFoc: false,
      );

      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialList successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialListRemoteDataSource.getMaterialList(
          salesOrgCode: '2601',
          customerCode: '100000345',
          shipToCode: '1234567',
          excludePrincipal: ['123', '234', '345'],
          pageSize: 10,
          offset: 0,
          orderBy: 'materialDescription_asc',
          searchKey: '1673',
          language: 'EN',
          principalNameList: ['GSK Consumer Healthcare'],
          therapeuticClassList: ['Other multivitamins with minerals'],
          itemBrandList: ['Ribena RTD Blueberry'],
          isForFOC: false)).thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialListRepository.getMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'materialDescription_asc',
        orderDocumentType: mockOrderDocumentType,
        pageSize: 10,
        pickAndPack: 'include',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '1673',
        selectedMaterialFilter: mockMaterialFilter,
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
            id: '1',
            username: Username('mock_user'),
            email: EmailAddress('user@gmail.com'),
            customerCode: CustomerCode('100000345')),
        isForFoc: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get materialList fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialListRemoteDataSource.getMaterialList(
              salesOrgCode: '2601',
              customerCode: '100000345',
              shipToCode: '1234567',
              excludePrincipal: ['123', '234', '345'],
              pageSize: 10,
              offset: 0,
              orderBy: 'orderDate',
              searchKey: '',
              language: 'EN',
              principalNameList: [
                'GSK Consumer Healthcare',
                'Pfizer PFE Private Limited test'
              ],
              therapeuticClassList: [
                'Other multivitamins with minerals',
                'Plain vitamin C (including vit. C salts)',
                'Throat preparations',
                'Growth hormones',
                'Specific antirheumatic agents',
                'Emollients, protectives',
                'All other stomatologicals',
              ],
              itemBrandList: [
                'Ribena RTD Blueberry',
                'Ribena Glucose 1L bw',
                'Ribena Conc Apple 1L',
                'Sensodyne Repair N P',
                'Sensodyne Freshmint',
              ],
              isForFOC: mockOrderDocumentType.documentType.contains('ZPFC')))
          .thenThrow((invocation) async => MockException());

      final result = await materialListRepository.getMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        orderDocumentType: mockOrderDocumentType,
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '',
        selectedMaterialFilter: mockMaterialFilter,
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
            id: '1',
            username: Username('user'),
            email: EmailAddress('user@gmail.com'),
            customerCode: CustomerCode('100007654')),
        isForFoc: mockOrderDocumentType.documentType.contains('ZPFC'),
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get materialList fail remote for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialListRemoteDataSource.getMaterialListSalesRep(
          userName: 'user',
          salesOrgCode: '2601',
          customerCode: '100000345',
          shipToCode: '1234567',
          excludePrincipal: ['123', '234', '345'],
          pageSize: 10,
          offset: 0,
          orderBy: 'orderDate',
          searchKey: '',
          language: 'EN',
          gimmickMaterial: true,
          pickAndPack: '',
          principalNameList: [
            'GSK Consumer Healthcare',
            'Pfizer PFE Private Limited test'
          ],
          therapeuticClassList: [
            'Other multivitamins with minerals',
            'Plain vitamin C (including vit. C salts)',
            'Throat preparations',
            'Growth hormones',
            'Specific antirheumatic agents',
            'Emollients, protectives',
            'All other stomatologicals',
          ],
          itemBrandList: [
            'Ribena RTD Blueberry',
            'Ribena Glucose 1L bw',
            'Ribena Conc Apple 1L',
            'Sensodyne Repair N P',
            'Sensodyne Freshmint',
          ],
          isSample: mockOrderDocumentType.documentType.contains('ZPFB'),
          isForFOC: true)).thenThrow((invocation) async => MockException());

      final result = await materialListRepository.getMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        orderDocumentType: mockOrderDocumentType,
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
            id: '1',
            username: Username('user'),
            email: EmailAddress('user@gmail.com'),
            customerCode: CustomerCode('100007654')),
        isForFoc: true,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get searchMaterialList successfully locally for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialListLocalDataSource.searchMaterialListSalesRep())
          .thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialListRepository.searchMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
        ),
        isForFoc: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get searchMaterialList successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialListLocalDataSource.searchMaterialList())
          .thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialListRepository.searchMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser,
        isForFoc: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get searchMaterialList successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => materialListLocalDataSource.searchMaterialList())
          .thenThrow((invocation) async => MockException());

      final result = await materialListRepository.searchMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser,
        isForFoc: false,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get searchMaterialList successfully remote for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialListRemoteDataSource.searchMaterialListSalesRep(
          selectedMaterialFilter: mockMaterialFilter,
          userName: 'user',
          salesOrgCode: '2601',
          customerCode: '100000345',
          shipToCode: '1234567',
          excludePrincipal: ['123', '234', '345'],
          pageSize: 10,
          offset: 0,
          orderBy: 'materialDescription_asc',
          searchKey: '1763',
          language: 'EN',
          gimmickMaterial: true,
          pickAndPack: 'include',
          isForFOC: false)).thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialListRepository.searchMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'materialDescription_asc',
        pageSize: 10,
        pickAndPack: 'include',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '1763',
        selectedMaterialFilter: mockMaterialFilter, //MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
            id: '1',
            username: Username('user'),
            email: EmailAddress('user@gmail.com'),
            customerCode: CustomerCode('100000345')),
        isForFoc: false,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get searchMaterialList successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialListRemoteDataSource.searchMaterialList(
              offset: 0,
              orderBy: 'OrderDate',
              pageSize: 10,
              searchKey: '1763',
              selectedMaterialFilter: MaterialFilter.empty(),
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              excludePrincipal: [],
              isForFOC: false,
              itemBrandList: [],
              language: 'EN',
              principalNameList: [],
              salesOrgCode: '2601',
              shipToCode: '1234567',
              therapeuticClassList: []))
          .thenAnswer((invocation) async => <MaterialInfo>[]);

      final result = await materialListRepository.searchMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '1763',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
            id: '1',
            username: Username('user'),
            email: EmailAddress('user@gmail.com'),
            customerCode: CustomerCode('100007654')),
        isForFoc: false,
      );
      expect(
        result.isRight(),
        false,
      );
    });
    test('get searchMaterialList fail remote for salesrep', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialListRemoteDataSource.searchMaterialListSalesRep(
          selectedMaterialFilter: MaterialFilter.empty(),
          userName: 'user',
          salesOrgCode: '2601',
          customerCode: '100000345',
          shipToCode: '1234567',
          excludePrincipal: ['1763', '234', '345'],
          pageSize: 10,
          offset: 0,
          orderBy: 'materialDescription_asc',
          searchKey: '173',
          language: 'EN',
          gimmickMaterial: true,
          pickAndPack: 'include',
          isForFOC: true)).thenThrow((invocation) async => MockException());

      final result = await materialListRepository.searchMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'materialDescription_asc',
        pageSize: 10,
        pickAndPack: 'include',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '1763',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
            id: '1',
            username: Username('user'),
            email: EmailAddress('user@gmail.com'),
            customerCode: CustomerCode('100007654')),
        isForFoc: false,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get searchMaterialList fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => materialListRemoteDataSource.searchMaterialList(
              offset: 0,
              orderBy: '',
              pageSize: 10,
              searchKey: '',
              selectedMaterialFilter: MaterialFilter.empty(),
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              excludePrincipal: [],
              isForFOC: true,
              itemBrandList: [],
              language: '',
              principalNameList: [],
              salesOrgCode: '',
              shipToCode: '',
              therapeuticClassList: []))
          .thenThrow((invocation) async => MockException());

      final result = await materialListRepository.searchMaterialList(
        customerCodeInfo: fakeCustomerCodeInfo,
        offset: 0,
        orderBy: 'OrderDate',
        pageSize: 10,
        pickAndPack: '',
        salesOrgConfig: mockSalesOrganisationConfigs,
        salesOrganisation: fakeSaleOrg,
        searchKey: '',
        selectedMaterialFilter: MaterialFilter.empty(),
        shipToInfo: fakeShipToInfo,
        user: mockUser.copyWith(
            id: '1',
            username: Username('user'),
            email: EmailAddress('user@gmail.com'),
            customerCode: CustomerCode('100007654')),
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
