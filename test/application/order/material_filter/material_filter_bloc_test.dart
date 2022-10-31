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
    currency: Currency(''),
    hideCustomer: false,
    disableOrderType: false,
    disablePrincipals: false,
    enableGimmickMaterial: false,
    languageFilter: false,
    languageValue: '',
    disableBundles: false,
    principalList: [],
    enableBatchNumber: false,
    enableTaxClassification: false,
    enableVat: false,
    enableZDP5: false,
    vatValue: 0,
  );

  const fakeSelectedFilterCategory = MaterialFilterType.principal;

  group('Material Filter Bloc', () {
    setUp(() async {
      materialFilterRepositoryMock = MaterialFilterRepositoryMock();
      materialFilterMockData =
          await MaterialFilterLocalDataSource().getFilters();
      WidgetsFlutterBinding.ensureInitialized();
    });
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
          user: fakeUser)),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        )
      ],
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
          user: fakeUser)),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          materialFilter: materialFilterMockData,
          apiFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest<MaterialFilterBloc, MaterialFilterState>(
        'update material selected success',
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
                fakeSelectedFilterCategory, 'Pfizer PFE Private Limited test')),
        expect: () => [
              MaterialFilterState.initial().copyWith(
                  selectedMaterialFilter: MaterialFilterState.initial()
                      .selectedMaterialFilter
                      .copyWith(
                    uniquePrincipalName: ['GSK Consumer Healthcare'],
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
  });
}
