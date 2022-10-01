import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';

import 'package:ezrxmobile/application/order/saved_order/saved_order_list/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderRepositoryMock extends Mock implements OrderRepository {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

const _defaultPageSize = 10;

void main() {
  final repository = OrderRepositoryMock();
  final userMockBloc = UserMockBloc();
  final salesOrgMockBloc = SalesOrgMockBloc();
  final customerCodeMockBloc = CustomerCodeMockBloc();
  final shipToCodeMockBloc = ShipToCodeMockBloc();

  final mockUser = User.empty();
  final mockSalesOrg = SalesOrganisation.empty();
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();

  late final List<SavedOrder> savedOrderListMock;
  var savedOrderState = SavedOrderListState.initial();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    savedOrderListMock = await OrderLocalDataSource().getSavedOrders();

    when(() => userMockBloc.state).thenReturn(UserState.initial());
    when(() => salesOrgMockBloc.state).thenReturn(SalesOrgState.initial());
    when(() => customerCodeMockBloc.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeMockBloc.state).thenReturn(ShipToCodeState.initial());
  });

  group('Saved Order Bloc', () {
    blocTest(
      'Get saved orders failure',
      build: () => SavedOrderListBloc(
          userBloc: userMockBloc,
          salesOrgBloc: salesOrgMockBloc,
          customerCodeBloc: customerCodeMockBloc,
          shipToCodeBloc: shipToCodeMockBloc,
          repository: repository),
      setUp: () {
        when(() => repository.getSavedOrder(
            user: mockUser,
            salesOrg: mockSalesOrg,
            customerCode: mockCustomerCodeInfo,
            shipToCode: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0)).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      expect: () => [
        savedOrderState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        savedOrderState.copyWith(
          isFetching: false,
          savedOrders: [],
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Get saved orders success',
      build: () => SavedOrderListBloc(
          userBloc: userMockBloc,
          salesOrgBloc: salesOrgMockBloc,
          customerCodeBloc: customerCodeMockBloc,
          shipToCodeBloc: shipToCodeMockBloc,
          repository: repository),
      setUp: () {
        when(() => repository.getSavedOrder(
            user: mockUser,
            salesOrg: mockSalesOrg,
            customerCode: mockCustomerCodeInfo,
            shipToCode: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0)).thenAnswer(
          (invocation) async => Right(savedOrderListMock),
        );
      },
      expect: () => [
        savedOrderState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        savedOrderState.copyWith(
          isFetching: false,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: savedOrderListMock.length >= _defaultPageSize,
          nextPageIndex: 1,
        ),
      ],
    );

    blocTest(
      'Get saved orders success and load more success',
      build: () => SavedOrderListBloc(
          userBloc: userMockBloc,
          salesOrgBloc: salesOrgMockBloc,
          customerCodeBloc: customerCodeMockBloc,
          shipToCodeBloc: shipToCodeMockBloc,
          repository: repository),
      act: (SavedOrderListBloc bloc) =>
          bloc..add(const SavedOrderListEvent.loadMore()),
      setUp: () {
        when(() => repository.getSavedOrder(
            user: mockUser,
            salesOrg: mockSalesOrg,
            customerCode: mockCustomerCodeInfo,
            shipToCode: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0)).thenAnswer(
          (invocation) async => Right(savedOrderListMock),
        );
        when(() => repository.getSavedOrder(
            user: mockUser,
            salesOrg: mockSalesOrg,
            customerCode: mockCustomerCodeInfo,
            shipToCode: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: savedOrderListMock.length)).thenAnswer(
          (invocation) async => Right(savedOrderListMock),
        );
      },
      expect: () => [
        savedOrderState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        savedOrderState.copyWith(
          isFetching: false,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        savedOrderState.copyWith(
          isFetching: true,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        savedOrderState.copyWith(
          isFetching: false,
          savedOrders: [...savedOrderListMock, ...savedOrderListMock],
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 2,
        ),
      ],
    );

    blocTest(
      'Get saved orders success and load more fail',
      build: () => SavedOrderListBloc(
          userBloc: userMockBloc,
          salesOrgBloc: salesOrgMockBloc,
          customerCodeBloc: customerCodeMockBloc,
          shipToCodeBloc: shipToCodeMockBloc,
          repository: repository),
      act: (SavedOrderListBloc bloc) =>
          bloc..add(const SavedOrderListEvent.loadMore()),
      setUp: () {
        when(() => repository.getSavedOrder(
            user: mockUser,
            salesOrg: mockSalesOrg,
            customerCode: mockCustomerCodeInfo,
            shipToCode: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0)).thenAnswer(
          (invocation) async => Right(savedOrderListMock),
        );
        when(() => repository.getSavedOrder(
            user: mockUser,
            salesOrg: mockSalesOrg,
            customerCode: mockCustomerCodeInfo,
            shipToCode: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: savedOrderListMock.length)).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      expect: () => [
        savedOrderState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        savedOrderState.copyWith(
          isFetching: false,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        savedOrderState.copyWith(
          isFetching: true,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        savedOrderState.copyWith(
          isFetching: false,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
      ],
    );

    blocTest(
      'Get Saved Order again after ShipToCode changed',
      build: () => SavedOrderListBloc(
          userBloc: userMockBloc,
          salesOrgBloc: salesOrgMockBloc,
          customerCodeBloc: customerCodeMockBloc,
          shipToCodeBloc: shipToCodeMockBloc,
          repository: repository),
      act: (SavedOrderListBloc bloc) =>
          bloc..add(const SavedOrderListEvent.loadMore()),
      setUp: () {
        when(() => repository.getSavedOrder(
            user: mockUser,
            salesOrg: mockSalesOrg,
            customerCode: mockCustomerCodeInfo,
            shipToCode: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: 0)).thenAnswer(
          (invocation) async => Right(savedOrderListMock),
        );
        when(() => repository.getSavedOrder(
            user: mockUser,
            salesOrg: mockSalesOrg,
            customerCode: mockCustomerCodeInfo,
            shipToCode: mockShipToInfo,
            pageSize: _defaultPageSize,
            offset: savedOrderListMock.length)).thenAnswer(
          (invocation) async => Right(savedOrderListMock),
        );
      },
      expect: () => [
        savedOrderState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        savedOrderState.copyWith(
          isFetching: false,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        savedOrderState.copyWith(
          isFetching: true,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        savedOrderState.copyWith(
          isFetching: false,
          savedOrders: [...savedOrderListMock, ...savedOrderListMock],
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 2,
        ),
      ],
    );
  });
}
