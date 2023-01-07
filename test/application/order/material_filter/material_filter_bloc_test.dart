import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_filter_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialFilterRepositoryMock extends Mock
    implements MaterialFilterRepository {}

class MaterialFilterMockBloc
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialFilterRepository materialFilterRepositoryMock;
  late MaterialFilter materialFilterMockData;

  final fakeCustomerCode = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-1234',
  );

  final fakeSaleOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-1234'),
  );

  final fakeShipToInfo = ShipToInfo.empty().copyWith(
    shipToCustomerCode: 'fake-1234',
  );

  final fakeUser = User.empty().copyWith(
      username: Username('fakeUser'),
      role:
          Role(type: RoleType('fakeRole'), description: '', id: '', name: ''));

  final fakeSaleOrgConfig = SalesOrganisationConfigs(
    salesOrg: SalesOrg(''),
    enableIRN: false,
    enableDefaultMD: false,
    disableProcessingStatus: false,
    currency: Currency(''),
    hideCustomer: false,
    disableOrderType: false,
    disablePrincipals: false,
    enableGimmickMaterial: false,
    languageFilter: false,
    languageValue: LanguageValue(''),
    disableBundles: false,
    principalList: [],
    enableBatchNumber: false,
    enableTaxClassification: false,
    enableVat: false,
    enableTaxAtTotalLevelOnly: false,
    enableZDP5: false,
    vatValue: 0,
    materialWithoutPrice: false,
    enableCollectiveNumber: false,
    enableFutureDeliveryDay: false,
    enableMobileNumber: false,
    enablePaymentTerms: false,
    enableReferenceNote: false,
    enableSpecialInstructions: false,
    futureDeliveryDay: '',
    enableGMC: false,
    enableListPrice: false,
    priceOverride: false,
    disablePaymentTermsDisplay: false,
    disableDeliveryDate: false,
    enableBillTo: false,
    showPOAttachment: false,
    addOosMaterials: true,
    expiryDateDisplay: true,
    hideStockDisplay: true,
    oosValue: OosValue(1),
    enableRemarks: false,
    enableOHPrice: true,
    ponRequired: false,
    enableTaxDisplay: false,
    netPriceOverride: false,
    batchNumDisplay: false,
    displayOrderDiscount: false,
    minOrderAmount: '0',
    enableZDP8Override: false,
    disableReturnsAccessSR: false,
    disableReturnsAccess: false,
  );

  const fakeSelectedPrincipalFilterCategory = MaterialFilterType.principal;

  const fakeSelectedTheraputicFilterCategory = MaterialFilterType.therapeutic;

  const fakeSelectedBrandFilterCategory = MaterialFilterType.brand;

  group('Material Filter Bloc', () {
    setUp(() async {
      materialFilterRepositoryMock = MaterialFilterRepositoryMock();
      materialFilterMockData =
          await MaterialFilterLocalDataSource().getFilters();
      WidgetsFlutterBinding.ensureInitialized();
    });

    blocTest(
      'Initialize',
      build: () => MaterialFilterBloc(
          materialFilterRepository: materialFilterRepositoryMock),
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.initialized(),
      ),
      expect: () => [MaterialFilterState.initial()],
    );

    blocTest<MaterialFilterBloc, MaterialFilterState>(
      'Material Filter Fetch success',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      setUp: () {
        when(() => materialFilterRepositoryMock.getMaterialFilterList(
              customerCodeInfo: fakeCustomerCode,
              salesOrgConfig: fakeSaleOrgConfig,
              salesOrganisation: fakeSaleOrganisation,
              shipToInfo: fakeShipToInfo,
              user: fakeUser,
              pickAndPack: '',
            )).thenAnswer(
          (invocation) async => Right(
            materialFilterMockData,
          ),
        );
      },
      act: (bloc) => bloc.add(MaterialFilterEvent.fetch(
          customerCodeInfo: fakeCustomerCode,
          salesOrgConfig: fakeSaleOrgConfig,
          salesOrganisation: fakeSaleOrganisation,
          shipToInfo: fakeShipToInfo,
          user: fakeUser,
          pickAndPack: '')),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        MaterialFilterState.initial().copyWith(
          materialFilter: materialFilterMockData,
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        )
      ],
    );

    blocTest<MaterialFilterBloc, MaterialFilterState>(
      'Material Filter Fetch fail',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      setUp: () {
        when(() => materialFilterRepositoryMock.getMaterialFilterList(
              customerCodeInfo: fakeCustomerCode,
              salesOrgConfig: fakeSaleOrgConfig,
              salesOrganisation: fakeSaleOrganisation,
              shipToInfo: fakeShipToInfo,
              user: fakeUser,
              pickAndPack: '',
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(MaterialFilterEvent.fetch(
          customerCodeInfo: fakeCustomerCode,
          salesOrgConfig: fakeSaleOrgConfig,
          salesOrganisation: fakeSaleOrganisation,
          shipToInfo: fakeShipToInfo,
          user: fakeUser,
          pickAndPack: '')),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          isFetching: true,
        ),
        MaterialFilterState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        )
      ],
    );

    blocTest<MaterialFilterBloc, MaterialFilterState>(
        'Update material selected success when filter type is principal',
        build: () => MaterialFilterBloc(
              materialFilterRepository: materialFilterRepositoryMock,
            ),
        setUp: () {
          when(() => materialFilterRepositoryMock.updateSelectedList(
              selectedList: MaterialFilterState.initial()
                  .selectedMaterialFilter
                  .uniquePrincipalName,
              name: 'Pfizer PFE Private Limited test')).thenAnswer(
            (invocation) => ['GSK Consumer Healthcare'],
          );
        },
        act: (bloc) => bloc.add(
            const MaterialFilterEvent.updateMaterialSelected(
                fakeSelectedPrincipalFilterCategory,
                'Pfizer PFE Private Limited test')),
        expect: () => [
              MaterialFilterState.initial().copyWith(
                  selectedMaterialFilter: MaterialFilterState.initial()
                      .selectedMaterialFilter
                      .copyWith(
                    uniquePrincipalName: ['GSK Consumer Healthcare'],
                  ),
                  apiFailureOrSuccessOption: none()),
            ]);

    blocTest<MaterialFilterBloc, MaterialFilterState>(
        'Update material selected success when filter type is therapeutic',
        build: () => MaterialFilterBloc(
              materialFilterRepository: materialFilterRepositoryMock,
            ),
        setUp: () {
          when(() => materialFilterRepositoryMock.updateSelectedList(
              selectedList: MaterialFilterState.initial()
                  .selectedMaterialFilter
                  .uniqueTherapeuticClass,
              name: 'Other multivitamins with minerals')).thenAnswer(
            (invocation) => ['GSK Consumer Healthcare'],
          );
        },
        act: (bloc) => bloc.add(
            const MaterialFilterEvent.updateMaterialSelected(
                fakeSelectedTheraputicFilterCategory,
                'Other multivitamins with minerals')),
        expect: () => [
              MaterialFilterState.initial().copyWith(
                  selectedMaterialFilter: MaterialFilterState.initial()
                      .selectedMaterialFilter
                      .copyWith(
                    uniqueTherapeuticClass: ['GSK Consumer Healthcare'],
                  ),
                  apiFailureOrSuccessOption: none()),
            ]);

    blocTest<MaterialFilterBloc, MaterialFilterState>(
        'Update material selected success when filter type is brand',
        build: () => MaterialFilterBloc(
              materialFilterRepository: materialFilterRepositoryMock,
            ),
        setUp: () {
          when(() => materialFilterRepositoryMock.updateSelectedList(
              selectedList: MaterialFilterState.initial()
                  .selectedMaterialFilter
                  .uniqueItemBrand,
              name: 'Ribena RTD Blueberry')).thenAnswer(
            (invocation) => ['GSK Consumer Healthcare'],
          );
        },
        act: (bloc) => bloc.add(
            const MaterialFilterEvent.updateMaterialSelected(
                fakeSelectedBrandFilterCategory, 'Ribena RTD Blueberry')),
        expect: () => [
              MaterialFilterState.initial().copyWith(
                  selectedMaterialFilter: MaterialFilterState.initial()
                      .selectedMaterialFilter
                      .copyWith(
                    uniqueItemBrand: ['GSK Consumer Healthcare'],
                  ),
                  apiFailureOrSuccessOption: none()),
            ]);
    blocTest<MaterialFilterBloc, MaterialFilterState>('update searchkey',
        build: () => MaterialFilterBloc(
              materialFilterRepository: materialFilterRepositoryMock,
            ),
        act: (bloc) =>
            bloc.add(const MaterialFilterEvent.updateSearchKey('fake-name')),
        expect: () => [
              MaterialFilterState.initial().copyWith(
                searchKey: 'fake-name',
              )
            ]);

    blocTest<MaterialFilterBloc, MaterialFilterState>('Clear selected',
        build: () => MaterialFilterBloc(
              materialFilterRepository: materialFilterRepositoryMock,
            ),
        act: (bloc) => bloc.add(const MaterialFilterEvent.clearSelected()),
        expect: () => [
              MaterialFilterState.initial().copyWith(
                selectedMaterialFilter: MaterialFilterState.initial()
                    .selectedMaterialFilter
                    .copyWith(
                  uniqueItemBrand: [],
                  uniquePrincipalName: [],
                  uniqueTherapeuticClass: [],
                ),
              )
            ]);

    blocTest<MaterialFilterBloc, MaterialFilterState>(
      'Reset Filter',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      setUp: () {
        when(() => materialFilterRepositoryMock.updateSelectedList(
            selectedList: MaterialFilterState.initial()
                .selectedMaterialFilter
                .uniqueTherapeuticClass,
            name: 'Other multivitamins with minerals')).thenAnswer(
          (invocation) => ['GSK Consumer Healthcare'],
        );
      },
      act: (bloc) {
        bloc.add(
          const MaterialFilterEvent.updateMaterialSelected(
            fakeSelectedTheraputicFilterCategory,
            'Other multivitamins with minerals',
          ),
        );
        bloc.add(const MaterialFilterEvent.resetFilter());
      },
      expect: () => [
        MaterialFilterState.initial().copyWith(
          selectedMaterialFilter:
              MaterialFilterState.initial().selectedMaterialFilter.copyWith(
            uniqueTherapeuticClass: ['GSK Consumer Healthcare'],
          ),
          apiFailureOrSuccessOption: none(),
        ),
        MaterialFilterState.initial(),
      ],
    );

    test(
      '=> Test getSearchedFilterList getter',
      () {
        final filterList = MaterialFilterState.initial()
            .copyWith(
                materialFilter: MaterialFilter.empty().copyWith(
                  uniquePrincipalName: [
                    'principal-1',
                    'principal-2',
                  ],
                ),
                searchKey: 'principal-2')
            .getSearchedFilterList(MaterialFilterType.principal);
        expect(filterList, ['principal-2']);
      },
    );
  });
}
