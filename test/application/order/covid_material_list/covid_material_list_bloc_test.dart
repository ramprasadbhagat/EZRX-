import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialListMockRepo extends Mock implements MaterialListRepository {}

const _defaultPageSize = 20;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialListRepository materialListMockRepository;
  final mockUser = User.empty();
  final salesOrg2601 = SalesOrg('2601');
  final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();
  final mockSelectedMaterialFilter = MaterialFilter.empty();
  final mockSalesOrganisation = SalesOrganisation(
      salesOrg: salesOrg2601, customerInfos: [SalesOrgCustomerInfo.empty()]);

  late final List<MaterialInfo> materialListMock;
  final covidMaterialState = CovidMaterialListState.initial();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    materialListMockRepository = MaterialListMockRepo();
    final loadedMaterialListMock =
        await MaterialListLocalDataSource().getMaterialList();
    materialListMock = [...loadedMaterialListMock, ...loadedMaterialListMock];
  });

  group('Covid Material List Bloc', () {
    blocTest(
      'Covid Material List Intial',
      build: () => CovidMaterialListBloc(
          materialListRepository: materialListMockRepository),
      act: (CovidMaterialListBloc bloc) async {
        bloc.add(const CovidMaterialListEvent.initialized());
      },
      expect: () => [covidMaterialState],
    );

    blocTest(
      'Material List search fetch',
      build: () => CovidMaterialListBloc(
          materialListRepository: materialListMockRepository),
      setUp: () {
        when(() => materialListMockRepository.searchMaterialList(
              user: mockUser,
              salesOrganisation: mockSalesOrganisation,
              salesOrgConfig: mockSalesOrganisationConfigs,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              pageSize: _defaultPageSize,
              offset: 0,
              orderBy: 'materialDescription_asc',
              searchKey: '1763',
              selectedMaterialFilter: MaterialFilter.empty(),
              pickAndPack: 'incldue',
              isForFoc: mockUser.role.type.isSalesRepRole ? false : true,
            )).thenAnswer(
          (invocation) async => Right(materialListMock),
        );
      },
      act: (CovidMaterialListBloc bloc) {
        bloc.add(
          CovidMaterialListEvent.searchMaterialList(
            user: mockUser,
            salesOrganisation: mockSalesOrganisation,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            selectedMaterialFilter: MaterialFilter.empty(),
            pickAndPack: 'incldue',
            searchKey: '1763',
          ),
        );
      },
      expect: () => [
        CovidMaterialListState.initial().copyWith(
          isFetching: true,
          searchKey: SearchKey('1763'),
        ),
        covidMaterialState.copyWith(
          isFetching: false,
          materialList: materialListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: materialListMock.length >= _defaultPageSize,
          nextPageIndex: 1,
          searchKey: SearchKey('1763'),
        ),
      ],
    );

    blocTest(
      'covid material list search fails',
      build: () => CovidMaterialListBloc(
          materialListRepository: materialListMockRepository),
      setUp: () {
        when(() => materialListMockRepository.searchMaterialList(
              user: mockUser,
              salesOrganisation: mockSalesOrganisation,
              salesOrgConfig: mockSalesOrganisationConfigs,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              pageSize: _defaultPageSize,
              offset: 0,
              orderBy: 'materialDescription_asc',
              searchKey: '1234',
              selectedMaterialFilter: MaterialFilter.empty(),
              pickAndPack: 'only',
              isForFoc: mockUser.role.type.isSalesRepRole ? false : true,
            )).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      seed: () => covidMaterialState.copyWith(
        materialList: materialListMock,
      ),
      act: (CovidMaterialListBloc bloc) {
        bloc.add(
          CovidMaterialListEvent.searchMaterialList(
            configs: mockSalesOrganisationConfigs,
            user: mockUser,
            customerCodeInfo: mockCustomerCodeInfo,
            pickAndPack: 'only',
            salesOrganisation: mockSalesOrganisation,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            shipToInfo: mockShipToInfo,
            searchKey: '1234',
          ),
        );
      },
      expect: () => [
        covidMaterialState.copyWith(
          isFetching: true,
          searchKey: SearchKey('1234'),
        ),
        covidMaterialState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          isFetching: false,
          searchKey: SearchKey('1234'),
        ),
      ],
    );

    blocTest(
      'Material List auto-search fetch',
      build: () => CovidMaterialListBloc(
          materialListRepository: materialListMockRepository),
      setUp: () {
        when(() => materialListMockRepository.searchMaterialList(
              user: mockUser,
              salesOrganisation: mockSalesOrganisation,
              salesOrgConfig: mockSalesOrganisationConfigs,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              pageSize: _defaultPageSize,
              offset: 0,
              orderBy: 'materialDescription_asc',
              searchKey: '1763',
              selectedMaterialFilter: MaterialFilter.empty(),
              pickAndPack: 'incldue',
              isForFoc: mockUser.role.type.isSalesRepRole ? false : true,
            )).thenAnswer(
          (invocation) async => Right(materialListMock),
        );
      },
      act: (CovidMaterialListBloc bloc) {
        bloc.add(
          CovidMaterialListEvent.autoSearchMaterialList(
            user: mockUser,
            salesOrganisation: mockSalesOrganisation,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            selectedMaterialFilter: MaterialFilter.empty(),
            pickAndPack: 'incldue',
            searchKey: '1763',
          ),
        );
      },
      wait: const Duration(milliseconds: 3000),
      expect: () => [
        covidMaterialState.copyWith(
          isFetching: true,
          materialList: [],
          searchKey: SearchKey('1763'),
        ),
        covidMaterialState.copyWith(
          isFetching: false,
          materialList: materialListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: materialListMock.length >= _defaultPageSize,
          nextPageIndex: 1,
          searchKey: SearchKey('1763'),
        ),
      ],
    );

    blocTest(
      'covid material list auto-search success',
      build: () => CovidMaterialListBloc(
          materialListRepository: materialListMockRepository),
      setUp: () {
        when(() => materialListMockRepository.searchMaterialList(
              user: mockUser,
              salesOrganisation: mockSalesOrganisation,
              salesOrgConfig: mockSalesOrganisationConfigs,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              pageSize: _defaultPageSize,
              offset: 0,
              orderBy: 'materialDescription_asc',
              searchKey: '1234',
              selectedMaterialFilter: MaterialFilter.empty(),
              pickAndPack: 'only',
              isForFoc: mockUser.role.type.isSalesRepRole ? false : true,
            )).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      seed: () => covidMaterialState.copyWith(
        materialList: materialListMock,
      ),
      act: (CovidMaterialListBloc bloc) {
        bloc.add(
          CovidMaterialListEvent.autoSearchMaterialList(
            configs: mockSalesOrganisationConfigs,
            user: mockUser,
            customerCodeInfo: mockCustomerCodeInfo,
            pickAndPack: 'only',
            salesOrganisation: mockSalesOrganisation,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            shipToInfo: mockShipToInfo,
            searchKey: '1234',
          ),
        );
      },
      wait: const Duration(milliseconds: 3000),
      expect: () => [
        covidMaterialState.copyWith(
          isFetching: true,
          searchKey: SearchKey('1234'),
        ),
        covidMaterialState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          isFetching: false,
          searchKey: SearchKey('1234'),
        ),
      ],
    );

    // blocTest(
    //   'Covid Material Initail List Fetch fail',
    //   build: () => CovidMaterialListBloc(
    //       materialListRepository: materialListMockRepository),
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrganisation,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: 0,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           pickAndPack: 'exclude',
    //           isForFoc: mockUser.role.type.isSalesRepRole ? false : true,
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //           orderDocumentType: OrderDocumentType.empty(),
    //         )).thenAnswer(
    //       (invocation) async => const Left(
    //         ApiFailure.other('fake-error'),
    //       ),
    //     );
    //   },
    //   act: (CovidMaterialListBloc bloc) {
    //     bloc.add(CovidMaterialListEvent.fetch(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //       pickAndPack: 'exclude',
    //       searchKey: '',
    //     ));
    //   },
    //   expect: () => [
    //     covidMaterialState.copyWith(
    //       isFetching: true,
    //       materialList: <MaterialInfo>[],
    //       nextPageIndex: 0,
    //       apiFailureOrSuccessOption: none(),
    //     ),
    //     covidMaterialState.copyWith(
    //       isFetching: false,
    //       materialList: [],
    //       apiFailureOrSuccessOption:
    //           optionOf(const Left(ApiFailure.other('fake-error'))),
    //     ),
    //   ],
    // );
    // blocTest(
    //   'covid Fetch material list success',
    //   build: () => CovidMaterialListBloc(
    //       materialListRepository: materialListMockRepository),
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrganisation,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: 0,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //           orderDocumentType: OrderDocumentType.empty(),
    //           pickAndPack:
    //               mockUser.role.type.isSalesRepRole ? 'incldue' : 'exclude',
    //           isForFoc: mockUser.role.type.isSalesRepRole ? false : true,
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //   },
    //   act: (CovidMaterialListBloc bloc) {
    //     bloc.add(
    //       CovidMaterialListEvent.fetch(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         configs: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         pickAndPack: 'exclude',
    //         searchKey: '',
    //       ),
    //     );
    //   },
    //   expect: () => [
    //     covidMaterialState.copyWith(
    //       isFetching: true,
    //       apiFailureOrSuccessOption: none(),
    //     ),
    //     covidMaterialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: materialListMock.length >= _defaultPageSize,
    //       nextPageIndex: 1,
    //     ),
    //   ],
    // );

    // blocTest(
    //   'Fetch covid material list success and load more success',
    //   build: () => CovidMaterialListBloc(
    //       materialListRepository: materialListMockRepository),
    //   act: (CovidMaterialListBloc bloc) {
    //     bloc.add(CovidMaterialListEvent.fetch(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //       pickAndPack: 'only',
    //       searchKey: '',
    //     ));
    //     bloc.add(CovidMaterialListEvent.loadMore(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //       pickAndPack: 'only',
    //     ));
    //   },
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrganisation,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: 0,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           pickAndPack: 'only',
    //           isForFoc: mockUser.role.type.isSalesRepRole ? false : true,
    //           orderDocumentType: OrderDocumentType.empty(),
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrganisation,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: materialListMock.length,
    //           pickAndPack: 'only',
    //           isForFoc: mockUser.role.type.isSalesRepRole ? false : true,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //           orderDocumentType: OrderDocumentType.empty(),
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //   },
    //   expect: () => [
    //     covidMaterialState.copyWith(
    //       isFetching: true,
    //       apiFailureOrSuccessOption: none(),
    //     ),
    //     covidMaterialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //     covidMaterialState.copyWith(
    //       isFetching: true,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //     covidMaterialState.copyWith(
    //       isFetching: false,
    //       materialList: [...materialListMock, ...materialListMock],
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 2,
    //     ),
    //   ],
    // );
    // blocTest(
    //   'Fetch covid material list success and load more fail',
    //   build: () => CovidMaterialListBloc(
    //       materialListRepository: materialListMockRepository),
    //   act: (CovidMaterialListBloc bloc) {
    //     bloc.add(CovidMaterialListEvent.fetch(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //       pickAndPack: 'only',
    //       searchKey: '',
    //     ));
    //     bloc.add(CovidMaterialListEvent.loadMore(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //       pickAndPack: 'only',
    //     ));
    //   },
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrganisation,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: 0,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           pickAndPack: 'only',
    //           isForFoc: mockUser.role.type.isSalesRepRole ? false : true,
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //           orderDocumentType: OrderDocumentType.empty(),
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrganisation,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: materialListMock.length,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           pickAndPack: 'only',
    //           isForFoc: mockUser.role.type.isSalesRepRole ? false : true,
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //           orderDocumentType: OrderDocumentType.empty(),
    //         )).thenAnswer(
    //       (invocation) async => const Left(
    //         ApiFailure.other('fake-error'),
    //       ),
    //     );
    //   },
    //   expect: () => [
    //     covidMaterialState.copyWith(
    //       isFetching: true,
    //       apiFailureOrSuccessOption: none(),
    //     ),
    //     covidMaterialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //     covidMaterialState.copyWith(
    //       isFetching: true,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //     covidMaterialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption:
    //           optionOf(const Left(ApiFailure.other('fake-error'))),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //   ],
    // );

    // blocTest(
    //   'covid Fetch material again after ShipToCode changed',
    //   build: () => CovidMaterialListBloc(
    //       materialListRepository: materialListMockRepository),
    //   act: (CovidMaterialListBloc bloc) {
    //     bloc.add(CovidMaterialListEvent.fetch(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo:  ShipToInfo.empty(),
    //       pickAndPack: 'only',
    //     ));

    //   },
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrganisation,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: 0,
    //           pickAndPack: 'only',
    //           isForFoc: mockUser.role.type.isSalesRep ? false : true,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //           orderDocumentType: OrderDocumentType.empty(),
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrganisation,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: materialListMock.length,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           pickAndPack: 'only',
    //           isForFoc: mockUser.role.type.isSalesRep ? false : true,
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //           orderDocumentType: OrderDocumentType.empty(),
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //   },
    //   expect: () => [
    //     covidMaterialState.copyWith(
    //       isFetching: true,
    //       apiFailureOrSuccessOption: none(),
    //     ),
    //     covidMaterialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: materialListMock.length >= _defaultPageSize,
    //       nextPageIndex: 1,
    //     ),
    //   ],
    // );
  });
}
