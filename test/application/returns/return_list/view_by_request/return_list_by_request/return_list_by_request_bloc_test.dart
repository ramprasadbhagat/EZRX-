import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class ReturnListRepositoryMock extends Mock implements ReturnListRepository {}

void main() {
  late ReturnListRepository returnListRepositoryMock;
  late Config config;
  final mockSalesOrg = SalesOrg('2001');
  final mockShipInfo =
      ShipToInfo.empty().copyWith(shipToCustomerCode: 'mock-customer-code-1');
  final mockUser = User.empty().copyWith(username: Username('mock-user-name'));
  final mockCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'mockCustomerCode');
  final mockAppliedFilter = ReturnFilter.empty()
      .copyWith(returnDateFrom: DateTimeStringValue('20233108'));
  final mockSearchKey = SearchKey('searchKey');
  const pageSize = 24;
  final mockReturnItemList = <ReturnItem>[
    ReturnItem.empty().copyWith(
      requestId: '01',
    ),
    ReturnItem.empty().copyWith(
      requestId: '02',
    ),
  ];

  setUpAll(() async {
    returnListRepositoryMock = ReturnListRepositoryMock();
    config = Config()..appFlavor = Flavor.mock;
  });

  group('Return List By Request Bloc', () {
    blocTest(
      'Initialize',
      build: () => ReturnListByRequestBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      act: (ReturnListByRequestBloc bloc) => bloc.add(
        ReturnListByRequestEvent.initialized(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
        ),
      ),
      expect: () => [
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
        ),
      ],
    );

    blocTest(
      'Fetch Success',
      build: () => ReturnListByRequestBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      seed: () => ReturnListByRequestState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByRequest(
            appliedFilter: mockAppliedFilter,
            customerCode: mockCustomerCodeInfo,
            offset: 0,
            pageSize: pageSize,
            salesOrg: mockSalesOrg,
            searchKey: mockSearchKey,
            shipToInfo: mockShipInfo,
            user: mockUser,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockReturnItemList,
          ),
        );
      },
      act: (ReturnListByRequestBloc bloc) => bloc.add(
        ReturnListByRequestEvent.fetch(
          appliedFilter: mockAppliedFilter,
          searchKey: mockSearchKey,
        ),
      ),
      expect: () => [
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: none(),
          isFetching: true,
          appliedFilter: mockAppliedFilter,
          searchKey: mockSearchKey,
        ),
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: none(),
          isFetching: false,
          returnItemList: mockReturnItemList,
          canLoadMore: false,
          appliedFilter: mockAppliedFilter,
          searchKey: mockSearchKey,
        ),
      ],
      verify: (ReturnListByRequestBloc bloc) => [
        expect(bloc.state.returnItemList.length, 2),
      ],
    );

    blocTest(
      'Fetch Failure',
      build: () => ReturnListByRequestBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      seed: () => ReturnListByRequestState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByRequest(
            appliedFilter: mockAppliedFilter,
            customerCode: mockCustomerCodeInfo,
            offset: 0,
            pageSize: pageSize,
            salesOrg: mockSalesOrg,
            searchKey: mockSearchKey,
            shipToInfo: mockShipInfo,
            user: mockUser,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('api-failure'),
          ),
        );
      },
      act: (ReturnListByRequestBloc bloc) => bloc.add(
        ReturnListByRequestEvent.fetch(
          appliedFilter: mockAppliedFilter,
          searchKey: mockSearchKey,
        ),
      ),
      expect: () => [
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: none(),
          isFetching: true,
          appliedFilter: mockAppliedFilter,
          searchKey: mockSearchKey,
        ),
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('api-failure'),
            ),
          ),
          isFetching: false,
          appliedFilter: mockAppliedFilter,
          searchKey: mockSearchKey,
        ),
      ],
      verify: (ReturnListByRequestBloc bloc) => [
        expect(bloc.state.returnItemList.length, 0),
      ],
    );

    blocTest(
      'Load More Success First Time',
      build: () => ReturnListByRequestBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      seed: () => ReturnListByRequestState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByRequest(
            appliedFilter: ReturnFilter.empty(),
            customerCode: mockCustomerCodeInfo,
            offset: 0,
            pageSize: pageSize,
            salesOrg: mockSalesOrg,
            searchKey: SearchKey(''),
            shipToInfo: mockShipInfo,
            user: mockUser,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockReturnItemList,
          ),
        );
      },
      act: (ReturnListByRequestBloc bloc) => bloc.add(
        const ReturnListByRequestEvent.loadMore(),
      ),
      expect: () => [
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: none(),
          isFetching: true,
        ),
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: none(),
          isFetching: false,
          returnItemList: mockReturnItemList,
          canLoadMore: false,
        ),
      ],
      verify: (ReturnListByRequestBloc bloc) => [
        expect(bloc.state.returnItemList.length, 2),
      ],
    );

    blocTest(
      'Load More Fail First Time',
      build: () => ReturnListByRequestBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      seed: () => ReturnListByRequestState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByRequest(
            appliedFilter: ReturnFilter.empty(),
            customerCode: mockCustomerCodeInfo,
            offset: 0,
            pageSize: pageSize,
            salesOrg: mockSalesOrg,
            searchKey: SearchKey(''),
            shipToInfo: mockShipInfo,
            user: mockUser,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('api-failure'),
          ),
        );
      },
      act: (ReturnListByRequestBloc bloc) => bloc.add(
        const ReturnListByRequestEvent.loadMore(),
      ),
      expect: () => [
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: none(),
          isFetching: true,
        ),
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('api-failure'),
            ),
          ),
          isFetching: false,
        ),
      ],
      verify: (ReturnListByRequestBloc bloc) => [
        expect(bloc.state.returnItemList.length, 0),
      ],
    );

    blocTest(
      'Load More Success Second Time',
      build: () => ReturnListByRequestBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByRequest(
            appliedFilter: mockAppliedFilter,
            customerCode: mockCustomerCodeInfo,
            offset: 24,
            pageSize: pageSize,
            salesOrg: mockSalesOrg,
            searchKey: mockSearchKey,
            shipToInfo: mockShipInfo,
            user: mockUser,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            List.generate(24, (index) => mockReturnItemList.first),
          ),
        );
      },
      seed: () => ReturnListByRequestState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
        appliedFilter: mockAppliedFilter,
        searchKey: mockSearchKey,
        returnItemList: List.generate(24, (index) => mockReturnItemList.first),
      ),
      act: (ReturnListByRequestBloc bloc) => bloc.add(
        const ReturnListByRequestEvent.loadMore(),
      ),
      expect: () => [
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: none(),
          returnItemList:
              List.generate(24, (index) => mockReturnItemList.first),
          isFetching: true,
          appliedFilter: mockAppliedFilter,
          searchKey: mockSearchKey,
        ),
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: none(),
          isFetching: false,
          returnItemList:
              List.generate(48, (index) => mockReturnItemList.first),
          canLoadMore: true,
          appliedFilter: mockAppliedFilter,
          searchKey: mockSearchKey,
        ),
      ],
      verify: (ReturnListByRequestBloc bloc) => [
        expect(bloc.state.returnItemList.length, 48),
      ],
    );

    blocTest(
      'Load More Fail Second Time',
      build: () => ReturnListByRequestBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByRequest(
            appliedFilter: mockAppliedFilter,
            customerCode: mockCustomerCodeInfo,
            offset: 24,
            pageSize: pageSize,
            salesOrg: mockSalesOrg,
            searchKey: mockSearchKey,
            shipToInfo: mockShipInfo,
            user: mockUser,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('api-failure'),
          ),
        );
      },
      seed: () => ReturnListByRequestState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
        appliedFilter: mockAppliedFilter,
        searchKey: mockSearchKey,
        returnItemList: List.generate(24, (index) => mockReturnItemList.first),
      ),
      act: (ReturnListByRequestBloc bloc) => bloc.add(
        const ReturnListByRequestEvent.loadMore(),
      ),
      expect: () => [
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          returnItemList:
              List.generate(24, (index) => mockReturnItemList.first),
          failureOrSuccessOption: none(),
          appliedFilter: mockAppliedFilter,
          searchKey: mockSearchKey,
          isFetching: true,
        ),
        ReturnListByRequestState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('api-failure'),
            ),
          ),
          returnItemList:
              List.generate(24, (index) => mockReturnItemList.first),
          appliedFilter: mockAppliedFilter,
          searchKey: mockSearchKey,
          isFetching: false,
        ),
      ],
      verify: (ReturnListByRequestBloc bloc) => [
        expect(bloc.state.returnItemList.length, 24),
      ],
    );

    group('Fetch event do nothing', () {
      blocTest<ReturnListByRequestBloc, ReturnListByRequestState>(
        'When search key is invalid',
        build: () => ReturnListByRequestBloc(
          returnListRepository: returnListRepositoryMock,
          config: config,
        ),
        act: (bloc) => bloc.add(
          ReturnListByRequestEvent.fetch(
            appliedFilter: mockAppliedFilter,
            searchKey: SearchKey.searchFilter('1'),
          ),
        ),
        expect: () => [],
      );

      blocTest<ReturnListByRequestBloc, ReturnListByRequestState>(
        'When apply the same filter + search key',
        build: () => ReturnListByRequestBloc(
          returnListRepository: returnListRepositoryMock,
          config: config,
        ),
        seed: () => ReturnListByRequestState.initial().copyWith(
          searchKey: mockSearchKey,
          appliedFilter: mockAppliedFilter,
        ),
        act: (bloc) => bloc.add(
          ReturnListByRequestEvent.fetch(
            appliedFilter: mockAppliedFilter,
            searchKey: mockSearchKey,
          ),
        ),
        expect: () => [],
      );
    });
  });
}
