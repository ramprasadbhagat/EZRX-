import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
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
        act: (bloc) => bloc.add(const ViewByItemDetailsEvent.initialized()),
        expect: () => [ViewByItemDetailsState.initial()],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchZyllemStatus" Event failure',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          viewByItemRepository: viewByItemRepositoryMock,
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
            isLoading: true,
          ),
          ViewByItemDetailsState.initial().copyWith(
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
        act: (bloc) => bloc.add(
          const ViewByItemDetailsEvent.updateIsExpanded(isExpanded: true),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
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
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(
              invoiceNumber: fakeOrderHistoryItem.invoiceData.invoiceNumber,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeOrderStatusTracker),
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
          return [
            ViewByItemDetailsState.initial().copyWith(
              orderHistory: orderHistory,
              orderHistoryItem: fakeOrderHistoryItem,
            ),
            ViewByItemDetailsState.initial().copyWith(
              orderHistory: orderHistory,
              orderHistoryItem: fakeOrderHistoryItem,
              isLoading: true,
            ),
            ViewByItemDetailsState.initial().copyWith(
              orderHistoryStatuses: fakeOrderStatusTracker,
              orderHistory: orderHistory,
              orderHistoryItem: fakeOrderHistoryItem,
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
