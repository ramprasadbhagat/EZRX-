import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_status_tracker_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class OrderStatusTrackerRepositoryMock extends Mock
    implements OrderStatusTrackerRepository {}

class ViewByItemRepositoryMock extends Mock implements ViewByItemRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late OrderHistory orderHistory;
  late OrderStatusTrackerRepository orderStatusTrackerRepositoryMock;
  late ViewByItemRepository viewByItemRepositoryMock;
  late List<OrderStatusTracker> fakeOrderStatusTracker;
  late OrderHistoryItem fakeOrderHistoryItem;
  final fakeStatus = OrderStepValue('Out for delivery');

  group(
    'ViewByItemDetailsBloc Test => ',
    () {
      setUpAll(() async {
        fakeOrderStatusTracker =
            await OrderStatusTrackerLocalDataSource().getOrderStatusTracker();
        orderHistory = await ViewByItemLocalDataSource().getViewByItems();
        fakeOrderHistoryItem = orderHistory.orderHistoryItems.first.copyWith(
          status: fakeStatus,
        );
      });

      setUp(() {
        orderStatusTrackerRepositoryMock = OrderStatusTrackerRepositoryMock();
        viewByItemRepositoryMock = ViewByItemRepositoryMock();
      });

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "initialized" Event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeSalesOrganisationConfigs,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeRootAdminUser,
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeSalesOrganisationConfigs,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeRootAdminUser,
          )
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchZyllemStatus" Event failure',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => ViewByItemDetailsState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeSalesOrganisationConfigs,
          salesOrganisation: fakeSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(
              invoiceNumber: fakeOrderHistoryItem.invoiceData.invoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-Error'),
            ),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchZyllemStatus(
            invoiceNumber: fakeOrderHistoryItem.invoiceData.invoiceNumber,
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeSalesOrganisationConfigs,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeRootAdminUser,
            isLoading: true,
          ),
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeSalesOrganisationConfigs,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeRootAdminUser,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "updateIsExpanded" Event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => ViewByItemDetailsState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeSalesOrganisationConfigs,
          salesOrganisation: fakeSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        act: (bloc) => bloc.add(
          const ViewByItemDetailsEvent.updateIsExpanded(isExpanded: true),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeSalesOrganisationConfigs,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeRootAdminUser,
            isExpanded: true,
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "setItemOrderDetails" Event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => ViewByItemDetailsState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeSalesOrganisationConfigs,
          salesOrganisation: fakeSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(
              invoiceNumber: fakeOrderHistoryItem.invoiceData.invoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeOrderStatusTracker),
          );
          when(
            () => (viewByItemRepositoryMock.getViewByItemDetails(
              soldTo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeSalesOrganisationConfigs,
              salesOrganisation: fakeSalesOrganisation,
              user: fakeRootAdminUser,
              searchKey: SearchKey(
                fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
              ),
            )),
          ).thenAnswer(
            (invocation) async => Right(orderHistory),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            orderHistory: orderHistory,
            orderHistoryItem: fakeOrderHistoryItem,
            disableDeliveryDateForZyllemStatus: false,
          ),
        ),
        expect: () {
          final modifiedList = orderHistory.orderHistoryItems
              .where(
                (element) =>
                    element.hashCode != fakeOrderHistoryItem.hashCode &&
                    element.orderNumber == fakeOrderHistoryItem.orderNumber,
              )
              .toList();
          final newViewByItemDetails = orderHistory.copyWith(
            orderHistoryItems: modifiedList,
          );
          return [
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeSalesOrganisationConfigs,
              salesOrganisation: fakeSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: newViewByItemDetails,
              orderHistoryItem: fakeOrderHistoryItem,
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeSalesOrganisationConfigs,
              salesOrganisation: fakeSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: newViewByItemDetails,
              orderHistoryItem: fakeOrderHistoryItem,
              isDetailsLoading: true,
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeSalesOrganisationConfigs,
              salesOrganisation: fakeSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: newViewByItemDetails,
              orderHistoryItem: fakeOrderHistoryItem,
              failureOrSuccessOption: optionOf(Right(orderHistory)),
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeSalesOrganisationConfigs,
              salesOrganisation: fakeSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: newViewByItemDetails,
              orderHistoryItem: fakeOrderHistoryItem,
              isLoading: true,
              failureOrSuccessOption: optionOf(Right(orderHistory)),
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeSalesOrganisationConfigs,
              salesOrganisation: fakeSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistoryStatuses: fakeOrderStatusTracker,
              orderHistory: newViewByItemDetails,
              orderHistoryItem: fakeOrderHistoryItem,
            ),
          ];
        },
      );
      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchOrderHistoryDetails" Event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => ViewByItemDetailsState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeSalesOrganisationConfigs,
          salesOrganisation: fakeSalesOrganisation,
          user: fakeRootAdminUser,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: orderHistory.orderHistoryItems
                .where(
                  (element) =>
                      element.hashCode != fakeOrderHistoryItem.hashCode &&
                      element.orderNumber == fakeOrderHistoryItem.orderNumber,
                )
                .toList(),
          ),
          orderHistoryItem: fakeOrderHistoryItem,
        ),
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.getViewByItemDetails(
              soldTo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeSalesOrganisationConfigs,
              salesOrganisation: fakeSalesOrganisation,
              user: fakeRootAdminUser,
              searchKey: SearchKey(
                fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
              ),
            )),
          ).thenAnswer(
            (invocation) async => Right(orderHistory),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            searchKey: SearchKey(
              fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
            ),
          ),
        ),
        expect: () {
          final modifiedList = orderHistory.orderHistoryItems
              .where(
                (element) =>
                    element.hashCode != fakeOrderHistoryItem.hashCode &&
                    element.orderNumber == fakeOrderHistoryItem.orderNumber,
              )
              .toList();
          final newViewByItemDetails = orderHistory.copyWith(
            orderHistoryItems: modifiedList,
          );
          return [
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeSalesOrganisationConfigs,
              salesOrganisation: fakeSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: newViewByItemDetails,
              orderHistoryItem: fakeOrderHistoryItem,
              isDetailsLoading: true,
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeSalesOrganisationConfigs,
              salesOrganisation: fakeSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: newViewByItemDetails,
              orderHistoryItem: fakeOrderHistoryItem,
              failureOrSuccessOption: optionOf(Right(orderHistory)),
            ),
          ];
        },
      );

      test(
        'Get "poDocumentsList" when isExpanded = true',
        () {
          final orderHistoryBloc = ViewByItemDetailsBloc(
            orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
            viewByItemRepository: viewByItemRepositoryMock,
          );
          orderHistoryBloc.emit(
            ViewByItemDetailsState.initial().copyWith(
              orderHistoryItem: OrderHistoryItem.empty().copyWith(
                orderHistoryItemPoAttachments: <PoDocuments>[],
              ),
              isExpanded: true,
            ),
          );
          expect(
            orderHistoryBloc.state.poDocumentsList,
            orderHistoryBloc
                .state.orderHistoryItem.orderHistoryItemPoAttachments,
          );
        },
      );

      test(
        'Get "poDocumentsList" when isExpanded = false',
        () {
          final orderHistoryBloc = ViewByItemDetailsBloc(
            orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
            viewByItemRepository: viewByItemRepositoryMock,
          );
          orderHistoryBloc.emit(
            ViewByItemDetailsState.initial().copyWith(
              orderHistoryItem: OrderHistoryItem.empty().copyWith(
                orderHistoryItemPoAttachments: [
                  PoDocuments.empty(),
                ],
              ),
              isExpanded: false,
            ),
          );
          expect(
            orderHistoryBloc.state.poDocumentsList,
            [
              orderHistoryBloc
                  .state.orderHistoryItem.orderHistoryItemPoAttachments.first
            ],
          );
        },
      );

      test(
        'Get "displayShowMoreOrLess"',
        () {
          final orderHistoryBloc = ViewByItemDetailsBloc(
            orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
            viewByItemRepository: viewByItemRepositoryMock,
          );
          orderHistoryBloc.emit(
            ViewByItemDetailsState.initial().copyWith(
              orderHistoryItem: OrderHistoryItem.empty().copyWith(
                orderHistoryItemPoAttachments: <PoDocuments>[],
              ),
            ),
          );
          expect(
            orderHistoryBloc.state.displayShowMoreOrLess,
            false,
          );
        },
      );
    },
  );
}
