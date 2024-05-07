import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_status_tracker_repository.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

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
  final fakeOutForDeliveryStatus = OrderStepValue('Out for delivery');

  late ViewByItemDetailsState seedState;
  const fakeError = ApiFailure.other('fake-error');
  group(
    'ViewByItemDetailsBloc Test => ',
    () {
      setUpAll(() async {
        fakeOrderStatusTracker =
            await OrderStatusTrackerLocalDataSource().getOrderStatusTracker();
        orderHistory = await ViewByItemLocalDataSource().getViewByItems();

        fakeOrderHistoryItem = orderHistory.orderHistoryItems.first.copyWith(
          status: fakeOutForDeliveryStatus,
        );
        seedState = ViewByItemDetailsState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
          orderHistory: orderHistory,
          orderHistoryItem: orderHistory.orderHistoryItems.first,
          shipToInfo: fakeShipToInfo,
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
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeRootAdminUser,
            shipToInfo: fakeShipToInfo,
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeRootAdminUser,
            shipToInfo: fakeShipToInfo,
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchZyllemStatus" Event success',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => ViewByItemDetailsState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(
              invoiceNumber: fakeOrderHistoryItem.invoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeOrderStatusTracker),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchZyllemStatus(
            invoiceNumber: fakeOrderHistoryItem.invoiceNumber,
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeRootAdminUser,
            isLoading: true,
          ),
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeSalesOrganisation,
            user: fakeRootAdminUser,
            orderHistoryStatuses: fakeOrderStatusTracker,
          ),
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
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(
              invoiceNumber: fakeOrderHistoryItem.invoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchZyllemStatus(
            invoiceNumber: fakeOrderHistoryItem.invoiceNumber,
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeRootAdminUser,
            isLoading: true,
          ),
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeRootAdminUser,
            failureOrSuccessOption: optionOf(
              const Left(fakeError),
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
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        act: (bloc) => bloc.add(
          const ViewByItemDetailsEvent.updateIsExpanded(isExpanded: true),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeRootAdminUser,
            isExpanded: true,
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchOrderHistoryDetails" Event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => ViewByItemDetailsState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.getViewByItemDetails(
              soldTo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              searchKey: SearchKey(
                fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
              ),
            )),
          ).thenAnswer(
            (invocation) async => Right(orderHistory),
          );

          when(
            () => (viewByItemRepositoryMock.getOrdersInvoiceData(
              orderNumbers: orderHistory.orderHistoryItems
                  .map((e) => e.orderNumber)
                  .toList(),
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: fakeOrderHistoryItem.orderNumber,
            lineNumber: fakeOrderHistoryItem.lineNumber,
          ),
        ),
        expect: () {
          return [
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              isDetailsLoading: true,
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistoryItem: orderHistory.orderHistoryItems.first,
              failureOrSuccessOption: optionOf(Right(orderHistory)),
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistoryItem: orderHistory.orderHistoryItems.first,
              isLoading: true,
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistoryItem: orderHistory.orderHistoryItems.first,
              failureOrSuccessOption: optionOf(const Left(fakeError)),
            ),
          ];
        },
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchOrderHistoryDetails" Event failure',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => seedState,
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.getViewByItemDetails(
              soldTo: seedState.customerCodeInfo,
              salesOrgConfig: seedState.salesOrgConfig,
              salesOrganisation: seedState.salesOrganisation,
              user: seedState.user,
              searchKey: SearchKey(
                fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
              ),
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: fakeOrderHistoryItem.orderNumber,
            lineNumber: fakeOrderHistoryItem.lineNumber,
          ),
        ),
        expect: () => [
          seedState.copyWith(
            isDetailsLoading: true,
          ),
          seedState.copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
        ],
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
                  .state.orderHistoryItem.orderHistoryItemPoAttachments.first,
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

      test('Get other items will filter out current item based on lineNumber',
          () {
        expect(
          seedState.otherItems,
          orderHistory.orderHistoryItems
              .where((e) => e.lineNumber != fakeOrderHistoryItem.lineNumber)
              .toList(),
        );
      });
    },
  );
}
