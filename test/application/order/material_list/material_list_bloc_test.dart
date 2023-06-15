import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMaterialListRepository extends Mock
    implements MaterialListRepository {}

// const _defaultPageSize = 20;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialListRepository materialListMockRepository;
  // final mockUser = User.empty();
  // final salesOrg2601 = SalesOrg('2601');
  // final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  // final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  // final mockShipToInfo = ShipToInfo.empty();
  // final mockSelectedOrderDocumentType = OrderDocumentType.empty();
  // final mockSelectedMaterialFilter = MaterialFilter.empty();
  // final mockSalesOrganisation = SalesOrganisation(
  //     salesOrg: salesOrg2601, customerInfos: <SalesOrgCustomerInfo>[]);
  // late final List<MaterialInfo> materialListMock;
  final materialState = MaterialListState.initial();
  setUpAll(() async {
    materialListMockRepository = MockMaterialListRepository();
    // final loadedMaterialListMock =
    //     await MaterialListLocalDataSource().getMaterialList();
    // materialListMock = [
    //   ...loadedMaterialListMock,
    //   ...loadedMaterialListMock,
    // ];
  });

  group('Material List Bloc', () {
    blocTest<MaterialListBloc, MaterialListState>(
      'Material List Initialize',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
      ),
      act: (MaterialListBloc bloc) =>
          bloc.add(const MaterialListEvent.initialized()),
      expect: () => [
        MaterialListState.initial(),
      ],
    );

    // blocTest(
    //   'Fetch material list success',
    //   build: () =>
    //       MaterialListBloc(materialListRepository: materialListMockRepository),
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
    //           selectedMaterialFilter: mockSelectedMaterialFilter,
    //           orderDocumentType: mockSelectedOrderDocumentType,
    //           pickAndPack: 'include',
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //   },
    //   act: (MaterialListBloc bloc) {
    //     bloc.add(MaterialListEvent.fetch(
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));
    //   },
    //   expect: () => [
    //     materialState.copyWith(
    //       isFetching: true,
    //       apiFailureOrSuccessOption: none(),
    //     ),
    //     materialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: materialListMock.length >= _defaultPageSize,
    //       nextPageIndex: 1,
    //     ),
    //   ],
    // );

    // blocTest(
    //   'Fetch material list fail',
    //   build: () =>
    //       MaterialListBloc(materialListRepository: materialListMockRepository),
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         salesOrgConfig: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         pageSize: _defaultPageSize,
    //         offset: 0,
    //         orderBy: 'materialDescription_asc',
    //         searchKey: '',
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         orderDocumentType: mockSelectedOrderDocumentType,
    //         pickAndPack: 'include')).thenAnswer(
    //       (invocation) async => const Left(
    //         ApiFailure.other('fake-error'),
    //       ),
    //     );
    //   },
    //   act: (MaterialListBloc bloc) {
    //     bloc.add(MaterialListEvent.fetch(
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));
    //   },
    //   expect: () => [
    //     materialState.copyWith(
    //       isFetching: true,
    //       apiFailureOrSuccessOption: none(),
    //     ),
    //     materialState.copyWith(
    //       isFetching: false,
    //       materialList: [],
    //       apiFailureOrSuccessOption:
    //           optionOf(const Left(ApiFailure.other('fake-error'))),
    //     ),
    //   ],
    // );

    blocTest(
      'Material List search update',
      build: () =>
          MaterialListBloc(materialListRepository: materialListMockRepository),
      act: (MaterialListBloc bloc) {
        bloc.add(const MaterialListEvent.updateSearchKey(searchKey: '1234'));
      },
      expect: () => [
        materialState.copyWith(
          isFetching: false,
          materialList: [],
          searchKey: SearchKey('1234'),
        ),
      ],
    );

    // Need to modify this
    //
    // blocTest(
    //   'Material List search success',
    //   build: () =>
    //       MaterialListBloc(materialListRepository: materialListMockRepository),
    //   setUp: () {
    //     when(() => materialListMockRepository.searchMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         salesOrgConfig: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         pageSize: _defaultPageSize,
    //         offset: 0,
    //         orderBy: 'materialDescription_asc',
    //         searchKey: '1763',
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         pickAndPack: 'include')).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //   },
    //   act: (MaterialListBloc bloc) {
    //     bloc.add(
    //       const MaterialListEvent.updateSearchKey(
    //         searchKey: '1763',
    //       ),
    //     );
    //     bloc.add(
    //       MaterialListEvent.searchMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         configs: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         pickAndPack: 'include',
    //         searchKey: SearchKey('1763'),
    //       ),
    //     );
    //   },
    //   expect: () => [
    //     materialState.copyWith(
    //       searchKey: SearchKey('1763'),
    //     ),
    //     materialState.copyWith(
    //       isFetching: true,
    //       materialList: [],
    //       searchKey: SearchKey('1763'),
    //     ),
    //     materialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: materialListMock.length >= _defaultPageSize,
    //       nextPageIndex: 1,
    //       searchKey: SearchKey('1763'),
    //     ),
    //   ],
    // );

    // blocTest(
    //   'Material List auto-search success',
    //   build: () =>
    //       MaterialListBloc(materialListRepository: materialListMockRepository),
    //   setUp: () {
    //     when(
    //       () => materialListMockRepository.searchMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         salesOrgConfig: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         pageSize: _defaultPageSize,
    //         offset: 0,
    //         orderBy: 'materialDescription_asc',
    //         searchKey: '1763',
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         pickAndPack: 'include',
    //       ),
    //     ).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //   },
    //   act: (MaterialListBloc bloc) {
    //     bloc.add(
    //       MaterialListEvent.autoSearchMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         configs: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         pickAndPack: 'include',
    //         searchKey: SearchKey('1763'),
    //       ),
    //     );
    //   },
    //   wait: const Duration(milliseconds: 3000),
    //   expect: () => [
    //     materialState.copyWith(
    //       isFetching: true,
    //       materialList: [],
    //       searchKey: SearchKey('1763'),
    //     ),
    //     materialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: materialListMock.length >= _defaultPageSize,
    //       nextPageIndex: 1,
    //       searchKey: SearchKey('1763'),
    //     ),
    //   ],
    // );

    blocTest(
      'Clear Material List search key',
      build: () =>
          MaterialListBloc(materialListRepository: materialListMockRepository),
      act: (MaterialListBloc bloc) {
        bloc.add(const MaterialListEvent.updateSearchKey(searchKey: ''));
      },
      expect: () => [
        materialState.copyWith(
          isFetching: false,
          materialList: [],
          searchKey: SearchKey.search(''),
        )
      ],
    );
    // blocTest(
    //   'Material List search fails',
    //   build: () =>
    //       MaterialListBloc(materialListRepository: materialListMockRepository),
    //   setUp: () {
    //     when(() => materialListMockRepository.searchMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         salesOrgConfig: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         pageSize: _defaultPageSize,
    //         offset: 0,
    //         orderBy: 'materialDescription_asc',
    //         searchKey: '1978',
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         pickAndPack: 'include')).thenAnswer(
    //       (invocation) async => const Left(ApiFailure.other('fake-error')),
    //     );
    //   },
    //   act: (MaterialListBloc bloc) {
    //     bloc.add(
    //       const MaterialListEvent.updateSearchKey(
    //         searchKey: '1978',
    //       ),
    //     );
    //     bloc.add(
    //       MaterialListEvent.searchMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         configs: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         pickAndPack: 'include',
    //         searchKey: SearchKey('1978'),
    //       ),
    //     );
    //   },
    //   expect: () => [
    //     materialState.copyWith(
    //       searchKey: SearchKey('1978'),
    //     ),
    //     materialState.copyWith(
    //       isFetching: true,
    //       materialList: [],
    //       searchKey: SearchKey('1978'),
    //     ),
    //     materialState.copyWith(
    //       apiFailureOrSuccessOption:
    //           optionOf(const Left(ApiFailure.other('fake-error'))),
    //       isFetching: false,
    //       searchKey: SearchKey('1978'),
    //     ),
    //   ],
    // );

    // blocTest(
    //   'Material List auto-search fails',
    //   build: () =>
    //       MaterialListBloc(materialListRepository: materialListMockRepository),
    //   setUp: () {
    //     when(() => materialListMockRepository.searchMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         salesOrgConfig: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         pageSize: _defaultPageSize,
    //         offset: 0,
    //         orderBy: 'materialDescription_asc',
    //         searchKey: '1978',
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         pickAndPack: 'include')).thenAnswer(
    //       (invocation) async => const Left(ApiFailure.other('fake-error')),
    //     );
    //   },
    //   act: (MaterialListBloc bloc) {
    //     bloc.add(
    //       MaterialListEvent.searchMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         configs: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         pickAndPack: 'include',
    //         searchKey: SearchKey('1978'),
    //       ),
    //     );
    //   },
    //   wait: const Duration(milliseconds: 3000),
    //   expect: () => [
    //     materialState.copyWith(
    //       isFetching: true,
    //       materialList: [],
    //       searchKey: SearchKey('1978'),
    //     ),
    //     materialState.copyWith(
    //       apiFailureOrSuccessOption:
    //           optionOf(const Left(ApiFailure.other('fake-error'))),
    //       isFetching: false,
    //       searchKey: SearchKey('1978'),
    //     ),
    //   ],
    // );

    // Need to modify this
    //
    // blocTest(
    //   'Fetch material list success and load more success',
    //   build: () =>
    //       MaterialListBloc(materialListRepository: materialListMockRepository),
    //   act: (MaterialListBloc bloc) {
    //     bloc.add(
    //       MaterialListEvent.fetch(
    //         salesOrganisation: mockSalesOrganisation,
    //         configs: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //       ),
    //     );
    //     bloc.add(MaterialListEvent.loadMore(
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));
    //   },
    //   setUp: () {
    //     when(() => materialListMockRepository.getMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         salesOrgConfig: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         pageSize: _defaultPageSize,
    //         offset: 0,
    //         orderBy: 'materialDescription_asc',
    //         searchKey: '',
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         orderDocumentType: mockSelectedOrderDocumentType,
    //         pickAndPack: 'include')).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //     when(() => materialListMockRepository.getMaterialList(
    //         user: mockUser,
    //         salesOrganisation: mockSalesOrganisation,
    //         salesOrgConfig: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //         pageSize: _defaultPageSize,
    //         offset: materialListMock.length,
    //         orderBy: 'materialDescription_asc',
    //         searchKey: '',
    //         selectedMaterialFilter: mockSelectedMaterialFilter,
    //         orderDocumentType: mockSelectedOrderDocumentType,
    //         pickAndPack: 'include')).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //   },
    //   expect: () => [
    //     materialState.copyWith(
    //       isFetching: true,
    //       apiFailureOrSuccessOption: none(),
    //     ),
    //     materialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //     materialState.copyWith(
    //       isFetching: true,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //     materialState.copyWith(
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
    //   build: () =>
    //       MaterialListBloc(materialListRepository: materialListMockRepository),
    //   act: (MaterialListBloc bloc) {
    //     bloc.add(MaterialListEvent.fetch(
    //         salesOrganisation: mockSalesOrganisation,
    //         configs: mockSalesOrganisationConfigs,
    //         customerCodeInfo: mockCustomerCodeInfo,
    //         shipToInfo: mockShipToInfo,
    //     ));
    //     bloc.add(MaterialListEvent.loadMore(
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
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
    //           selectedMaterialFilter: mockSelectedMaterialFilter,
    //           orderDocumentType: mockSelectedOrderDocumentType,
    //           pickAndPack: 'include',
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
    //           selectedMaterialFilter: mockSelectedMaterialFilter,
    //           orderDocumentType: mockSelectedOrderDocumentType,
    //           pickAndPack: 'include',
    //         )).thenAnswer(
    //       (invocation) async => const Left(
    //         ApiFailure.other('fake-error'),
    //       ),
    //     );
    //   },
    //   expect: () => [
    //     materialState.copyWith(
    //       isFetching: true,
    //       apiFailureOrSuccessOption: none(),
    //     ),
    //     materialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //     materialState.copyWith(
    //       isFetching: true,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //     materialState.copyWith(
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
    //   'Fetch material again after ShipToCode changed',
    //   build: () =>
    //       MaterialListBloc(materialListRepository: materialListMockRepository),
    //   act: (MaterialListBloc bloc) {
    //     bloc.add(MaterialListEvent.fetch(
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
    //     ));
    //     bloc.add(MaterialListEvent.loadMore(
    //       salesOrganisation: mockSalesOrganisation,
    //       configs: mockSalesOrganisationConfigs,
    //       customerCodeInfo: mockCustomerCodeInfo,
    //       shipToInfo: mockShipToInfo,
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
    //           selectedMaterialFilter: mockSelectedMaterialFilter,
    //           orderDocumentType: mockSelectedOrderDocumentType,
    //           pickAndPack: 'include',
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
    //           selectedMaterialFilter: mockSelectedMaterialFilter,
    //           orderDocumentType: mockSelectedOrderDocumentType,
    //           pickAndPack: 'include',
    //         )).thenAnswer(
    //       (invocation) async => Right(materialListMock),
    //     );
    //   },
    //   expect: () => [
    //     materialState.copyWith(
    //       isFetching: true,
    //       apiFailureOrSuccessOption: none(),
    //     ),
    //     materialState.copyWith(
    //       isFetching: false,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //     materialState.copyWith(
    //       isFetching: true,
    //       materialList: materialListMock,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 1,
    //     ),
    //     materialState.copyWith(
    //       isFetching: false,
    //       materialList: [...materialListMock, ...materialListMock],
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       nextPageIndex: 2,
    //     ),
    //   ],
    // );
  });

  // blocTest(
  //   'Fetch material again after ShipToCode changed',
  //   build: () =>
  //       MaterialListBloc(materialListRepository: materialListMockRepository),
  //   act: (MaterialListBloc bloc) {
  //     bloc.add(MaterialListEvent.fetch(
  //       salesOrganisation: mockSalesOrganisation,
  //       configs: mockSalesOrganisationConfigs,
  //       customerCodeInfo: mockCustomerCodeInfo,
  //       shipToInfo: mockShipToInfo,
  //     ));
  //     bloc.add(MaterialListEvent.loadMore(
  //       salesOrganisation: mockSalesOrganisation,
  //       configs: mockSalesOrganisationConfigs,
  //       customerCodeInfo: mockCustomerCodeInfo,
  //       shipToInfo: mockShipToInfo,
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
  //           selectedMaterialFilter: mockSelectedMaterialFilter,
  //           orderDocumentType: mockSelectedOrderDocumentType,
  //           pickAndPack: 'include',
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
  //           selectedMaterialFilter: mockSelectedMaterialFilter,
  //           orderDocumentType: mockSelectedOrderDocumentType,
  //           pickAndPack: 'include',
  //         )).thenAnswer(
  //       (invocation) async => Right(materialListMock),
  //     );
  //   },
  //   expect: () => [
  //     materialState.copyWith(
  //       isFetching: true,
  //       apiFailureOrSuccessOption: none(),
  //     ),
  //     materialState.copyWith(
  //       isFetching: false,
  //       materialList: materialListMock,
  //       apiFailureOrSuccessOption: none(),
  //       canLoadMore: true,
  //       nextPageIndex: 1,
  //     ),
  //     materialState.copyWith(
  //       isFetching: true,
  //       materialList: materialListMock,
  //       apiFailureOrSuccessOption: none(),
  //       canLoadMore: true,
  //       nextPageIndex: 1,
  //     ),
  //     materialState.copyWith(
  //       isFetching: false,
  //       materialList: [...materialListMock, ...materialListMock],
  //       apiFailureOrSuccessOption: none(),
  //       canLoadMore: true,
  //       nextPageIndex: 2,
  //     ),
  //   ],
  // );
}
