import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
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
  late List<InvoiceData> invoiceDataForOrders;
  final fakeStatus = OrderStepValue('Out for delivery');
  late ViewByItemDetailsState seedState;
  const fakeError = ApiFailure.other('fake-error');
  group(
    'ViewByItemDetailsBloc Test => ',
    () {
      setUpAll(() async {
        fakeOrderStatusTracker =
            await OrderStatusTrackerLocalDataSource().getOrderStatusTracker();
        orderHistory = await ViewByItemLocalDataSource().getViewByItems();
        invoiceDataForOrders =
            await ViewByItemLocalDataSource().getInvoiceDataForOrders();

        fakeOrderHistoryItem = orderHistory.orderHistoryItems.first.copyWith(
          status: fakeStatus,
        );
        seedState = ViewByItemDetailsState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
          orderHistory: orderHistory,
          orderHistoryItem: orderHistory.orderHistoryItems.first,
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
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfig: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
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
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeRootAdminUser,
        ),
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(
              invoiceNumber: fakeOrderHistoryItem.invoiceData.invoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
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
        'For "setItemOrderDetails" Event',
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
              invoiceNumber: fakeOrderHistoryItem.invoiceData.invoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeOrderStatusTracker),
          );
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
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            orderHistory: orderHistory.copyWith(
              orderHistoryItems: [
                ...orderHistory.orderHistoryItems,
                orderHistory.orderHistoryItems.first
                    .copyWith(orderNumber: OrderNumber('fake'))
              ],
            ),
            orderHistoryItem: fakeOrderHistoryItem,
            disableDeliveryDateForZyllemStatus: false,
          ),
        ),
        expect: () {
          return [
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistoryItem: fakeOrderHistoryItem,
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistoryItem: fakeOrderHistoryItem,
              isDetailsLoading: true,
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistoryItem: fakeOrderHistoryItem,
              failureOrSuccessOption: optionOf(Right(orderHistory)),
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: orderHistory,
              orderHistoryItem: fakeOrderHistoryItem,
              isLoading: true,
              failureOrSuccessOption: optionOf(Right(orderHistory)),
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistoryStatuses: fakeOrderStatusTracker,
              orderHistory: orderHistory,
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
          salesOrgConfig: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
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
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: newViewByItemDetails,
              orderHistoryItem: fakeOrderHistoryItem,
              isDetailsLoading: true,
            ),
            ViewByItemDetailsState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              salesOrganisation: fakeMYSalesOrganisation,
              user: fakeRootAdminUser,
              orderHistory: newViewByItemDetails,
              orderHistoryItem: fakeOrderHistoryItem,
              failureOrSuccessOption: optionOf(Right(orderHistory)),
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
            searchKey: SearchKey(
              fakeOrderHistoryItem.orderNumber.getOrDefaultValue(''),
            ),
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

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'SearchOrderHistory with empty keyword',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        setUp: () {},
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.searchOrderHistory(
            searchKey: SearchKey(''),
          ),
        ),
        expect: () => [],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'SearchOrderHistory with keyword failure',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => seedState,
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.searchOrderHistory(
              soldTo: seedState.customerCodeInfo,
              salesOrganisation: seedState.salesOrganisation,
              user: seedState.user,
              searchKey: SearchKey('fake-search-keyword'),
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.searchOrderHistory(
            searchKey: SearchKey('fake-search-keyword'),
          ),
        ),
        expect: () => [
          seedState.copyWith(
            isLoading: true,
            orderHistory: OrderHistory.empty(),
            orderHistoryItem: OrderHistoryItem.empty(),
          ),
          seedState.copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeError)),
            orderHistory: OrderHistory.empty(),
            orderHistoryItem: OrderHistoryItem.empty(),
          )
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'SearchOrderHistory with keyword success with order number fetch failure',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => seedState,
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.searchOrderHistory(
              soldTo: seedState.customerCodeInfo,
              salesOrganisation: seedState.salesOrganisation,
              user: seedState.user,
              searchKey: SearchKey('fake-search-keyword'),
            )),
          ).thenAnswer(
            (invocation) async => Right(seedState.orderHistory),
          );
          when(
            () => (viewByItemRepositoryMock.getOrdersInvoiceData(
              orderNumbers: seedState.orderHistory.orderHistoryItems
                  .map((e) => e.orderNumber)
                  .toList(),
            )),
          ).thenAnswer(
            (invocation) async => const Left(fakeError),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.searchOrderHistory(
            searchKey: SearchKey('fake-search-keyword'),
          ),
        ),
        expect: () => [
          seedState.copyWith(
            isLoading: true,
            orderHistory: OrderHistory.empty(),
            orderHistoryItem: OrderHistoryItem.empty(),
          ),
          seedState.copyWith(
            failureOrSuccessOption: optionOf(
              Right(seedState.orderHistory),
            ),
          ),
          seedState.copyWith(
            isLoading: true,
          ),
          seedState.copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          )
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'SearchOrderHistory with keyword success with order number fetch Success',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => seedState,
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.searchOrderHistory(
              soldTo: seedState.customerCodeInfo,
              salesOrganisation: seedState.salesOrganisation,
              user: seedState.user,
              searchKey: SearchKey('fake-search-keyword'),
            )),
          ).thenAnswer(
            (invocation) async => Right(seedState.orderHistory),
          );
          when(
            () => (viewByItemRepositoryMock.getOrdersInvoiceData(
              orderNumbers: seedState.orderHistory.orderHistoryItems
                  .map((e) => e.orderNumber)
                  .toList(),
            )),
          ).thenAnswer(
            (invocation) async => Right(
              {for (final item in invoiceDataForOrders) item.hashId: item},
            ),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.searchOrderHistory(
            searchKey: SearchKey('fake-search-keyword'),
          ),
        ),
        expect: () => [
          seedState.copyWith(
            isLoading: true,
            orderHistory: OrderHistory.empty(),
            orderHistoryItem: OrderHistoryItem.empty(),
          ),
          seedState.copyWith(
            failureOrSuccessOption: optionOf(
              Right(seedState.orderHistory),
            ),
          ),
          seedState.copyWith(
            isLoading: true,
          ),
          seedState.copyWith(
            orderHistory: seedState.orderHistory.copyWith(
              orderHistoryItems: seedState.orderHistory.orderHistoryItems
                  .map(
                    (order) => order.copyWith(
                      invoiceData: invoiceDataForOrders.firstWhere(
                        (e) => e.hashId == order.hashId,
                        orElse: () => order.invoiceData,
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      );
      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'SearchOrderHistory with keyword success with no order item',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => seedState,
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.searchOrderHistory(
              soldTo: seedState.customerCodeInfo,
              salesOrganisation: seedState.salesOrganisation,
              user: seedState.user,
              searchKey: SearchKey('fake-search-keyword'),
            )),
          ).thenAnswer(
            (invocation) async => Right(
              seedState.orderHistory.copyWith(
                orderHistoryItems: <OrderHistoryItem>[],
              ),
            ),
          );
          when(
            () => (viewByItemRepositoryMock.getOrdersInvoiceData(
              orderNumbers: seedState.orderHistory.orderHistoryItems
                  .map((e) => e.orderNumber)
                  .toList(),
            )),
          ).thenAnswer(
            (invocation) async => const Right(<StringValue, InvoiceData>{}),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.searchOrderHistory(
            searchKey: SearchKey('fake-search-keyword'),
          ),
        ),
        expect: () => [
          seedState.copyWith(
            isLoading: true,
            orderHistory: OrderHistory.empty(),
            orderHistoryItem: OrderHistoryItem.empty(),
          ),
          seedState.copyWith(
            failureOrSuccessOption: optionOf(
              Right(
                seedState.orderHistory.copyWith(
                  orderHistoryItems: <OrderHistoryItem>[],
                ),
              ),
            ),
            orderHistory: seedState.orderHistory.copyWith(
              orderHistoryItems: <OrderHistoryItem>[],
            ),
            orderHistoryItem: OrderHistoryItem.empty(),
          ),
        ],
      );
      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'SearchOrderHistory with keyword success with order number fetch Success with no order Id',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
        ),
        seed: () => seedState,
        setUp: () {
          when(
            () => (viewByItemRepositoryMock.searchOrderHistory(
              soldTo: seedState.customerCodeInfo,
              salesOrganisation: seedState.salesOrganisation,
              user: seedState.user,
              searchKey: SearchKey('fake-search-keyword'),
            )),
          ).thenAnswer(
            (invocation) async => Right(seedState.orderHistory),
          );
          when(
            () => (viewByItemRepositoryMock.getOrdersInvoiceData(
              orderNumbers: seedState.orderHistory.orderHistoryItems
                  .map((e) => e.orderNumber)
                  .toList(),
            )),
          ).thenAnswer(
            (invocation) async => const Right(<StringValue, InvoiceData>{}),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.searchOrderHistory(
            searchKey: SearchKey('fake-search-keyword'),
          ),
        ),
        expect: () => [
          seedState.copyWith(
            isLoading: true,
            orderHistory: OrderHistory.empty(),
            orderHistoryItem: OrderHistoryItem.empty(),
          ),
          seedState.copyWith(
            failureOrSuccessOption: optionOf(
              Right(seedState.orderHistory),
            ),
          ),
          seedState.copyWith(
            isLoading: true,
          ),
          seedState
        ],
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
