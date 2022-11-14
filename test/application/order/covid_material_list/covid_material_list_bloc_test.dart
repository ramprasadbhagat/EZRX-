import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialListMockRepo extends Mock implements MaterialListRepository {}

const _defaultPageSize = 10;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final MaterialListRepository materialListMockRepository =
      MaterialListMockRepo();

  final mockUser = User.empty();
  final mockSalesOrg = SalesOrganisation.empty();
  final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();

  late final List<MaterialInfo> materialListMock;
  final covidMaterialState = CovidMaterialListState.initial();
  // final mockSelectedMaterialFilter =
  //     MaterialFilterState.initial().selectedMaterialFilter;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    materialListMock = await MaterialListLocalDataSource().getMaterialList();
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
      'Covid Material List search update on empty',
      build: () => CovidMaterialListBloc(
          materialListRepository: materialListMockRepository),
      act: (CovidMaterialListBloc bloc) {
        bloc.add(
            const CovidMaterialListEvent.updateSearchKey(searchKey: '1234'));
      },
      expect: () => [
        covidMaterialState.copyWith(
          isFetching: true,
          materialList: [],
          searchKey: SearchKey('1234'),
        ),
      ],
    );

    // Need to modify this
    // 
    // blocTest(
    //   'Material List search fetch',
    //   build: () => CovidMaterialListBloc(
    //       materialListRepository: materialListMockRepository),
    //   setUp: () {
    //     when(() => materialListMockRepository.searchMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrg,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: 0,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '1763',
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //           ispickandpackenabled:
    //               mockUser.role.type.isSalesRep ? true : false,
    //           isForFoc: mockUser.role.type.isSalesRep ? false : true,
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //   },
    //   act: (CovidMaterialListBloc bloc) {
    //     bloc.add(
    //       const CovidMaterialListEvent.updateSearchKey(
    //         searchKey: '1763',
    //       ),
    //     );
    //     bloc.add(
    //       CovidMaterialListEvent.searchMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrg,
    //         configs: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         selectedMaterialFilter: MaterialFilter.empty(),
    //       ),
    //     );
    //   },
    //   expect: () => [
    //     covidMaterialState.copyWith(
    //       isFetching: true,
    //       materialList: [],
    //       searchKey: SearchKey('1763'),
    //     ),
    //     covidMaterialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: materialListMock.length >= _defaultPageSize,
    //       nextPageIndex: 1,
    //       searchKey: SearchKey('1763'),
    //     ),
    //   ],
    // );

    // uncomment till this


    blocTest(
      'Clear Covid Material List search key',
      build: () => CovidMaterialListBloc(
          materialListRepository: materialListMockRepository),
      act: (CovidMaterialListBloc bloc) {
        bloc.add(const CovidMaterialListEvent.updateSearchKey(searchKey: ''));
      },
      expect: () => [
        covidMaterialState.copyWith(
          isFetching: true,
          materialList: [],
          searchKey: SearchKey.search(''),
        )
      ],
    );
    blocTest(
      'Covid Material List search fails',
      build: () => CovidMaterialListBloc(
          materialListRepository: materialListMockRepository),
      act: (CovidMaterialListBloc bloc) {
        bloc.add(
            const CovidMaterialListEvent.updateSearchKey(searchKey: '999'));
      },
      expect: () => [
        covidMaterialState.copyWith(
          isFetching: true,
          materialList: [],
          searchKey: SearchKey.search('999'),
        )
      ],
    );

    // Need to modify this
    // 
    // blocTest(
    //   'Covid Material Initail List Fetch fail',
    //   build: () => CovidMaterialListBloc(
    //       materialListRepository: materialListMockRepository),
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrg,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: 0,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           ispickandpackenabled:
    //               mockUser.role.type.isSalesRep ? true : false,
    //           isForFoc: mockUser.role.type.isSalesRep ? false : true,
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
    //       salesOrganisation: mockSalesOrg,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
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
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrg,
    //         salesOrgConfig: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         pageSize: _defaultPageSize,
    //         offset: 0,
    //         orderBy: 'materialDescription_asc',
    //         searchKey: '',
    //         selectedMaterialFilter: MaterialFilter.empty(),
    //         orderDocumentType: OrderDocumentType.empty(),
    //         ispickandpackenabled:
    //         mockUser.role.type.isSalesRep ? true : false,
    //         isForFoc: mockUser.role.type.isSalesRep ? false : true,)).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //   },
    //   act: (CovidMaterialListBloc bloc) {
    //     bloc.add(CovidMaterialListEvent.fetch(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrg,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));
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
    //   'Fetch material list success and load more success',
    //   build: () => CovidMaterialListBloc(
    //       materialListRepository: materialListMockRepository),
    //   act: (CovidMaterialListBloc bloc) {
    //     bloc.add(CovidMaterialListEvent.fetch(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrg,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));
    //     bloc.add(CovidMaterialListEvent.loadMore(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrg,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));
    //   },
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrg,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: 0,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           ispickandpackenabled:
    //               mockUser.role.type.isSalesRep ? true : false,
    //           isForFoc: mockUser.role.type.isSalesRep ? false : true,
    //           orderDocumentType: OrderDocumentType.empty(),
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrg,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: materialListMock.length,
    //           ispickandpackenabled:
    //               mockUser.role.type.isSalesRep ? true : false,
    //           isForFoc: mockUser.role.type.isSalesRep ? false : true,
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
    //   'Fetch material list success and load more fail',
    //   build: () => CovidMaterialListBloc(
    //       materialListRepository: materialListMockRepository),
    //   act: (CovidMaterialListBloc bloc) {
    //     bloc.add(CovidMaterialListEvent.fetch(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrg,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));
    //     bloc.add(CovidMaterialListEvent.loadMore(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrg,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));
    //   },
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrg,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: 0,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           ispickandpackenabled:
    //               mockUser.role.type.isSalesRep ? true : false,
    //           isForFoc: mockUser.role.type.isSalesRep ? false : true,
    //           selectedMaterialFilter: MaterialFilter.empty(),
    //           orderDocumentType: OrderDocumentType.empty(),
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrg,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: materialListMock.length,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           ispickandpackenabled:
    //               mockUser.role.type.isSalesRep ? true : false,
    //           isForFoc: mockUser.role.type.isSalesRep ? false : true,
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
    //       salesOrganisation: mockSalesOrg,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));

    //     bloc.add(CovidMaterialListEvent.loadMore(
    //       user: mockUser,
    //       salesOrganisation: mockSalesOrg,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));
    //   },
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //           user: mockUser,
    //           salesOrganisation: mockSalesOrg,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: 0,
    //           ispickandpackenabled:
    //               mockUser.role.type.isSalesRep ? true : false,
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
    //           salesOrganisation: mockSalesOrg,
    //           salesOrgConfig: mockSalesOrganisationConfigs,
    //           customerCodeInfo: mockCustomerCodeInfo,
    //           shipToInfo: mockShipToInfo,
    //           pageSize: _defaultPageSize,
    //           offset: materialListMock.length,
    //           orderBy: 'materialDescription_asc',
    //           searchKey: '',
    //           ispickandpackenabled:
    //               mockUser.role.type.isSalesRep ? true : false,
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

    // uncomment till this
  });
}
