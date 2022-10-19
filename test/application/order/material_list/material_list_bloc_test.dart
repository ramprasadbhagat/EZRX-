import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
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
  final materialState = MaterialListState.initial();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    materialListMock = await MaterialListLocalDataSource().getMaterialList();
  });

  group('Material List Bloc', () {
    blocTest('Material List Intial',
        build: () => MaterialListBloc(
            materialListRepository: materialListMockRepository),
        act: (MaterialListBloc bloc) async {
          bloc.add(const MaterialListEvent.initialized());
        },
        expect: () => [MaterialListState.initial()]);

    blocTest(
      'Material List Fetch fail',
      build: () =>
          MaterialListBloc(materialListRepository: materialListMockRepository),
      setUp: () {
        when(() => materialListMockRepository.getMaterialList(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0,
            orderBy: 'materialDescription_asc',
            searchKey: '')).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (MaterialListBloc bloc) {
        bloc.add(MaterialListEvent.fetch(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo));
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        materialState.copyWith(
          isFetching: false,
          materialList: [],
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Fetch material list success',
      build: () =>
          MaterialListBloc(materialListRepository: materialListMockRepository),
      setUp: () {
        when(() => materialListMockRepository.getMaterialList(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0,
            orderBy: 'materialDescription_asc',
            searchKey: '')).thenAnswer(
          (invocation) async => Right(materialListMock),
        );
      },
      act: (MaterialListBloc bloc) {
        bloc.add(MaterialListEvent.fetch(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo));
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        materialState.copyWith(
          isFetching: false,
          materialList: materialListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: materialListMock.length >= _defaultPageSize,
          nextPageIndex: 1,
        ),
      ],
    );

    blocTest(
      'Fetch material list success and load more success',
      build: () =>
          MaterialListBloc(materialListRepository: materialListMockRepository),
      act: (MaterialListBloc bloc) {
        bloc.add(MaterialListEvent.fetch(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo));
        bloc.add(MaterialListEvent.loadMore(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo));
      },
      setUp: () {
        when(() => materialListMockRepository.getMaterialList(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0,
            orderBy: 'materialDescription_asc',
            searchKey: '')).thenAnswer(
          (invocation) async => Right(materialListMock),
        );
        when(() => materialListMockRepository.getMaterialList(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: materialListMock.length,
            orderBy: 'materialDescription_asc',
            searchKey: '')).thenAnswer(
          (invocation) async => Right(materialListMock),
        );
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        materialState.copyWith(
          isFetching: false,
          materialList: materialListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        materialState.copyWith(
          isFetching: true,
          materialList: materialListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        materialState.copyWith(
          isFetching: false,
          materialList: [...materialListMock, ...materialListMock],
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 2,
        ),
      ],
    );

    blocTest(
      'Fetch material list success and load more fail',
      build: () =>
          MaterialListBloc(materialListRepository: materialListMockRepository),
      act: (MaterialListBloc bloc) {
        bloc.add(MaterialListEvent.fetch(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo));
        bloc.add(MaterialListEvent.loadMore(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo));
      },
      setUp: () {
        when(() => materialListMockRepository.getMaterialList(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0,
            orderBy: 'materialDescription_asc',
            searchKey: '')).thenAnswer(
          (invocation) async => Right(materialListMock),
        );
        when(() => materialListMockRepository.getMaterialList(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: materialListMock.length,
            orderBy: 'materialDescription_asc',
            searchKey: '')).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        materialState.copyWith(
          isFetching: false,
          materialList: materialListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        materialState.copyWith(
          isFetching: true,
          materialList: materialListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        materialState.copyWith(
          isFetching: false,
          materialList: materialListMock,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
      ],
    );

    blocTest(
      'Fetch material again after ShipToCode changed',
      build: () =>
          MaterialListBloc(materialListRepository: materialListMockRepository),
      act: (MaterialListBloc bloc) {
        bloc.add(MaterialListEvent.fetch(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo));
        bloc.add(MaterialListEvent.loadMore(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo));
      },
      setUp: () {
        when(() => materialListMockRepository.getMaterialList(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0,
            orderBy: 'materialDescription_asc',
            searchKey: '')).thenAnswer(
          (invocation) async => Right(materialListMock),
        );
        when(() => materialListMockRepository.getMaterialList(
            user: mockUser,
            salesOrganisation: mockSalesOrg,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: materialListMock.length,
            orderBy: 'materialDescription_asc',
            searchKey: '')).thenAnswer(
          (invocation) async => Right(materialListMock),
        );
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        materialState.copyWith(
          isFetching: false,
          materialList: materialListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        materialState.copyWith(
          isFetching: true,
          materialList: materialListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        materialState.copyWith(
          isFetching: false,
          materialList: [...materialListMock, ...materialListMock],
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 2,
        ),
      ],
    );
  });
}
