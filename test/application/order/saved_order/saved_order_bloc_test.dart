import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
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

const _defaultPageSize = 10;

void main() {
  final repository = OrderRepositoryMock();

  final mockUser = User.empty();
  final mockSalesOrg = SalesOrganisation.empty();
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();

  late final List<SavedOrder> savedOrderListMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    savedOrderListMock = await OrderLocalDataSource().getSavedOrders();
  });

  group('Saved Order Bloc', () {
    blocTest('Initialize',
        build: () => SavedOrderListBloc(repository: repository),
        act: (SavedOrderListBloc bloc) =>
            bloc.add(const SavedOrderListEvent.initialized()),
        expect: () => [SavedOrderListState.initial()]);

    blocTest(
      'Get saved orders failure',
      build: () => SavedOrderListBloc(repository: repository),
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
      act: (SavedOrderListBloc bloc) => bloc.add(SavedOrderListEvent.fetch(
          userInfo: mockUser,
          selectedSalesOrganisation: mockSalesOrg,
          selectedCustomerCode: mockCustomerCodeInfo,
          selectedShipTo: mockShipToInfo)),
      expect: () => [
        SavedOrderListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          savedOrders: [],
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Get saved orders success',
      build: () => SavedOrderListBloc(repository: repository),
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
      act: (SavedOrderListBloc bloc) => bloc.add(SavedOrderListEvent.fetch(
          userInfo: mockUser,
          selectedSalesOrganisation: mockSalesOrg,
          selectedCustomerCode: mockCustomerCodeInfo,
          selectedShipTo: mockShipToInfo)),
      expect: () => [
        SavedOrderListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        SavedOrderListState.initial().copyWith(
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
      build: () => SavedOrderListBloc(repository: repository),
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
      act: (SavedOrderListBloc bloc) => bloc
        ..add(SavedOrderListEvent.fetch(
            userInfo: mockUser,
            selectedSalesOrganisation: mockSalesOrg,
            selectedCustomerCode: mockCustomerCodeInfo,
            selectedShipTo: mockShipToInfo))
        ..add(SavedOrderListEvent.loadMore(
            userInfo: mockUser,
            selectedSalesOrganisation: mockSalesOrg,
            selectedCustomerCode: mockCustomerCodeInfo,
            selectedShipTo: mockShipToInfo)),
      expect: () => [
        SavedOrderListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        SavedOrderListState.initial().copyWith(
          isFetching: true,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        SavedOrderListState.initial().copyWith(
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
      build: () => SavedOrderListBloc(repository: repository),
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
      act: (SavedOrderListBloc bloc) => bloc
        ..add(SavedOrderListEvent.fetch(
            userInfo: mockUser,
            selectedSalesOrganisation: mockSalesOrg,
            selectedCustomerCode: mockCustomerCodeInfo,
            selectedShipTo: mockShipToInfo))
        ..add(SavedOrderListEvent.loadMore(
            userInfo: mockUser,
            selectedSalesOrganisation: mockSalesOrg,
            selectedCustomerCode: mockCustomerCodeInfo,
            selectedShipTo: mockShipToInfo)),
      expect: () => [
        SavedOrderListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        SavedOrderListState.initial().copyWith(
          isFetching: true,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          savedOrders: savedOrderListMock,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          canLoadMore: true,
          nextPageIndex: 1,
        ),
      ],
    );
  });
}
