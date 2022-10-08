import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:ezrxmobile/application/material/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/material/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/material/repository/material_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialListMockRepo extends Mock implements MaterialListRepository {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class SearchMockBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class SearchStateMock extends Mock implements SearchState {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

const _defaultPageSize = 10;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final MaterialListRepository materialListMockRepository =
      MaterialListMockRepo();
  final UserBloc userMockBloc = UserMockBloc();
  final SalesOrgBloc salesOrgMockBloc = SalesOrgMockBloc();
  final SearchBloc searchMockBloc = SearchMockBloc();
  final CustomerCodeBloc customerCodeMockBloc = CustomerCodeMockBloc();
  final ShipToCodeBloc shipToCodeMockBloc = ShipToCodeMockBloc();

  final mockUser = User.empty();
  final mockSalesOrg = SalesOrganisation.empty();
  final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();

  late final List<MaterialInfo> materialListMock;
  var materialState = MaterialListState.initial();
  var fakeRole = 'fake-role';
  // var fakeUser = 'fake-user';
  // var shipTo = const ShipToInfo(
  //     defaultShipToAddress: false,
  //     shipToCustomerCode: 'fake-ship-to-code',
  //     shipToName: ShipToName(name1: '', name2: '', name3: '', name4: ''),
  //     shipToAddress: ShipToAddress(
  //         street: '', street2: '', street3: '', street4: '', street5: ''),
  //     status: '',
  //     building: '',
  //     city1: '',
  //     city2: '',
  //     postalCode: '',
  //     houseNumber1: '',
  //     telephoneNumber: '',
  //     region: '',
  //     floor: '',
  //     plant: '');
  // var salesOrgCustomerInfos = [
  //   SalesOrgCustomerInfo(
  //       customerCodeSoldTo: CustomerCode('fake-customer-code'), shipToInfos: [])
  // ];
  // var fakeSaleOrg = SalesOrganisation(
  //   salesOrg: SalesOrg('fake-1234'),
  //   customerInfos: salesOrgCustomerInfos,
  // );

  // var fakeUserVal = User(
  //     id: 'fake-id',
  //     username: Username(fakeUser),
  //     email: EmailAddress(''),
  //     fullName: const FullName(firstName: '', lastName: ''),
  //     role: Role(id: '', name: '', type: RoleType(fakeRole), description: ''),
  //     customerCode: CustomerCode(''),
  //     userSalesOrganisations: [fakeSaleOrg],
  //     settings: const Settings(
  //         emailNotifications: false,
  //         mobileNotifications: false,
  //         languagePreference: ''),
  //     settingTc: const SettingTc(acceptTC: false, acceptTCTimestamp: ''),
  //     settingAup: const SettingAup(acceptAUP: false, acceptAUPTC: ''),
  //     enableOrderType: false);

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    materialListMock = await MaterialListLocalDataSource().getMaterialList();
    when(() => salesOrgMockBloc.state)
        .thenAnswer((invocation) => SalesOrgState.initial());
    when(() => userMockBloc.state)
        .thenAnswer((invocation) => UserState.initial());
    when(() => customerCodeMockBloc.state)
        .thenAnswer((invocation) => CustomerCodeState.initial());
    when(() => shipToCodeMockBloc.state)
        .thenAnswer((invocation) => ShipToCodeState.initial());
  });

  group('Material List Bloc', () {
    blocTest('Material List Intial',
        build: () => MaterialListBloc(
            salesOrgBloc: salesOrgMockBloc,
            userBloc: userMockBloc,
            searchBloc: searchMockBloc,
            customerCodeBloc: customerCodeMockBloc,
            shipToCodeBloc: shipToCodeMockBloc,
            materialListRepository: materialListMockRepository),
        act: (MaterialListBloc bloc) async {
          bloc.add(const MaterialListEvent.initialized());
        },
        expect: () => [MaterialListState.initial()]);

    blocTest(
      'Material List Fetch fail',
      build: () => MaterialListBloc(
          salesOrgBloc: salesOrgMockBloc,
          userBloc: userMockBloc,
          searchBloc: searchMockBloc,
          customerCodeBloc: customerCodeMockBloc,
          shipToCodeBloc: shipToCodeMockBloc,
          materialListRepository: materialListMockRepository),
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
        bloc.add(const MaterialListEvent.fetch());
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
      build: () => MaterialListBloc(
          userBloc: userMockBloc,
          salesOrgBloc: salesOrgMockBloc,
          customerCodeBloc: customerCodeMockBloc,
          shipToCodeBloc: shipToCodeMockBloc,
          searchBloc: searchMockBloc,
          materialListRepository: materialListMockRepository),
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
        bloc.add(const MaterialListEvent.fetch());
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
      build: () => MaterialListBloc(
          userBloc: userMockBloc,
          salesOrgBloc: salesOrgMockBloc,
          customerCodeBloc: customerCodeMockBloc,
          shipToCodeBloc: shipToCodeMockBloc,
          searchBloc: searchMockBloc,
          materialListRepository: materialListMockRepository),
      act: (MaterialListBloc bloc) {
        bloc.add(const MaterialListEvent.fetch());
        bloc.add(const MaterialListEvent.loadMore());
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
      build: () => MaterialListBloc(
          userBloc: userMockBloc,
          salesOrgBloc: salesOrgMockBloc,
          customerCodeBloc: customerCodeMockBloc,
          shipToCodeBloc: shipToCodeMockBloc,
          searchBloc: searchMockBloc,
          materialListRepository: materialListMockRepository),
      act: (MaterialListBloc bloc) {
        bloc.add(const MaterialListEvent.fetch());
        bloc.add(const MaterialListEvent.loadMore());
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
      build: () => MaterialListBloc(
          userBloc: userMockBloc,
          salesOrgBloc: salesOrgMockBloc,
          customerCodeBloc: customerCodeMockBloc,
          shipToCodeBloc: shipToCodeMockBloc,
          searchBloc: searchMockBloc,
          materialListRepository: materialListMockRepository),
      act: (MaterialListBloc bloc) {
        bloc.add(const MaterialListEvent.fetch());
        bloc.add(const MaterialListEvent.loadMore());
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
