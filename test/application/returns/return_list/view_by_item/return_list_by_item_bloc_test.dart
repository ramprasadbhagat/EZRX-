import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class ReturnListRepositoryMock extends Mock implements ReturnListRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ReturnListRepository returnListRepositoryMock;
  late Config config;
  final mockSalesOrg = SalesOrg('2001');
  final mockShipInfo =
      ShipToInfo.empty().copyWith(shipToCustomerCode: 'mock-customer-code-1');
  final mockUser = User.empty().copyWith(username: Username('mock-user-name'));
  final mockCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'mockCustomerCode');

  group('Return List BLOC Testing=>', () {
    setUp(() {
      returnListRepositoryMock = ReturnListRepositoryMock();
      config = Config()..appFlavor = Flavor.mock;
    });

    blocTest<ReturnListByItemBloc, ReturnListByItemState>(
      'For "initialized" Event',
      build: () => ReturnListByItemBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      act: (bloc) => bloc.add(
        ReturnListByItemEvent.initialized(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
        ),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
        ),
      ],
    );

    blocTest<ReturnListByItemBloc, ReturnListByItemState>(
      'For "fetch" Event with failure',
      build: () => ReturnListByItemBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      seed: () => ReturnListByItemState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByItem(
            appliedFilter: ReturnFilter.empty(),
            salesOrg: mockSalesOrg,
            shipToInfo: mockShipInfo,
            customerCode: mockCustomerCodeInfo,
            user: mockUser,
            searchKey: SearchKey(''),
            offset: 0,
            pageSize: 24,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (bloc) => bloc.add(
        ReturnListByItemEvent.fetch(
          appliedFilter: ReturnFilter.empty(),
          searchKey: SearchKey(''),
        ),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isFetching: true,
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isFetching: false,
          canLoadMore: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        )
      ],
    );

    blocTest<ReturnListByItemBloc, ReturnListByItemState>(
      'For "loadMore" Event with failure',
      build: () => ReturnListByItemBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      seed: () => ReturnListByItemState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByItem(
            appliedFilter: ReturnFilter.empty(),
            salesOrg: mockSalesOrg,
            shipToInfo: mockShipInfo,
            customerCode: mockCustomerCodeInfo,
            user: mockUser,
            searchKey: SearchKey(''),
            offset: 0,
            pageSize: 24,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (bloc) => bloc.add(
        const ReturnListByItemEvent.loadMore(),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isFetching: true,
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isFetching: false,
          canLoadMore: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        )
      ],
    );
  });
}
