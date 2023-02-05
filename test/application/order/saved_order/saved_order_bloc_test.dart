import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';

import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
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
  late List<CartItem> fakeCartItemList;
  final mockSavedOrder = SavedOrder.empty();

  late final List<SavedOrder> savedOrderListMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    savedOrderListMock = await OrderLocalDataSource().getSavedOrders();
  });

  List<MaterialItem> getItemList(List<CartItem> cartItemList) {
    final saveOrderItems = cartItemList
        .map((cartItem) => cartItem.toSavedOrderMaterial())
        .toList()
        .expand((element) => element)
        .toList();

    return saveOrderItems;
  }

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

    blocTest<SavedOrderListBloc, SavedOrderListState>(
      '==> Create Draft Order with Success',
      build: () => SavedOrderListBloc(repository: repository),
      setUp: () {
        fakeCartItemList = [
          CartItem(
            materials: [
              PriceAggregate.empty().copyWith(
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(10.34),
                ),
                materialInfo: MaterialInfo.empty().copyWith(
                  materialDescription: 'Fake Description',
                ),
                quantity: 1,
              ),
            ],
            itemType: CartItemType.material,
          ),
        ];
        when(() => repository.createDraftOrder(
              shipToInfo: ShipToInfo.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              grandTotal: 0.0,
              salesOrganisation: SalesOrganisation.empty(),
              user: User.empty(),
              cartItems: fakeCartItemList,
              data: AdditionalDetailsData.empty(),
            )).thenAnswer(
          (invocation) async => Right(
            SavedOrder.empty().copyWith(
              draftorder: true,
              items: getItemList(fakeCartItemList),
            ),
          ),
        );
      },
      act: (bloc) => bloc.add(
        SavedOrderListEvent.createDraft(
          shipToInfo: ShipToInfo.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          grandTotal: 0.0,
          salesOrganisation: SalesOrganisation.empty(),
          user: User.empty(),
          cartItems: fakeCartItemList,
          data: AdditionalDetailsData.empty(),
          existingSavedOrderList: <SavedOrder>[],
        ),
      ),
      expect: () => [
        SavedOrderListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isDraftOrderCreated: false,
          isCreating: true,
        ),
        SavedOrderListState.initial().copyWith(
          isDraftOrderCreated: true,
          savedOrders: <SavedOrder>[
            SavedOrder.empty().copyWith(
              draftorder: true,
              items: getItemList(fakeCartItemList),
            )
          ],
          apiFailureOrSuccessOption: none(),
          isCreating: false,
        ),
      ],
    );
    blocTest<SavedOrderListBloc, SavedOrderListState>(
      '==> Create Draft Order with Failure',
      build: () => SavedOrderListBloc(repository: repository),
      setUp: () {
        when(() => repository.createDraftOrder(
              shipToInfo: ShipToInfo.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              grandTotal: 0.0,
              salesOrganisation: SalesOrganisation.empty(),
              user: User.empty(),
              cartItems: <CartItem>[],
              data: AdditionalDetailsData.empty(),
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake-Error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        SavedOrderListEvent.createDraft(
          shipToInfo: ShipToInfo.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          grandTotal: 0.0,
          salesOrganisation: SalesOrganisation.empty(),
          user: User.empty(),
          cartItems: <CartItem>[],
          data: AdditionalDetailsData.empty(),
          existingSavedOrderList: <SavedOrder>[],
        ),
      ),
      expect: () => [
        SavedOrderListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isDraftOrderCreated: false,
          isCreating: true,
        ),
        SavedOrderListState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
          isCreating: false,
        ),
      ],
    );

    blocTest(
      'Delete saved order failure',
      build: () => SavedOrderListBloc(repository: repository),
      setUp: () {
        when(
          () => repository.deleteSavedOrder(
            orderItem: mockSavedOrder,
            ordersList: [],
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (SavedOrderListBloc bloc) => bloc.add(
        SavedOrderListEvent.delete(
          user: mockUser,
          order: mockSavedOrder,
        ),
      ),
      expect: () => [
        SavedOrderListState.initial().copyWith(
          isDeleting: true,
          isDraftOrderCreated: false,
          isCreating: false,
          apiFailureOrSuccessOption: none(),
        ),
        SavedOrderListState.initial().copyWith(
          isDeleting: false,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Delete saved order success',
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

        when(
          () => repository.deleteSavedOrder(
            orderItem: savedOrderListMock[0],
            ordersList: savedOrderListMock,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            savedOrderListMock.sublist(1),
          ),
        );
      },
      act: (SavedOrderListBloc bloc) {
        bloc.add(
          SavedOrderListEvent.fetch(
            userInfo: mockUser,
            selectedSalesOrganisation: mockSalesOrg,
            selectedCustomerCode: mockCustomerCodeInfo,
            selectedShipTo: mockShipToInfo,
          ),
        );
        bloc.add(
          SavedOrderListEvent.delete(
            user: mockUser,
            order: savedOrderListMock[0],
          ),
        );
      },
      expect: () => [
        SavedOrderListState.initial().copyWith(
          isFetching: true,
        ),
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          savedOrders: savedOrderListMock,
          canLoadMore: savedOrderListMock.length >= _defaultPageSize,
          nextPageIndex: 1,
        ),
        SavedOrderListState.initial().copyWith(
          isDeleting: true,
          savedOrders: savedOrderListMock,
          canLoadMore: savedOrderListMock.length >= _defaultPageSize,
          nextPageIndex: 1,
        ),
        SavedOrderListState.initial().copyWith(
          isDeleting: false,
          savedOrders: savedOrderListMock.sublist(1),
          canLoadMore: savedOrderListMock.length >= _defaultPageSize,
          nextPageIndex: 1,
        ),
      ],
    );
  });
}
