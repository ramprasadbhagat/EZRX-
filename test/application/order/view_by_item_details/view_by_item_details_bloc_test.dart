import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_status_tracker_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderStatusTrackerRepositoryMock extends Mock
    implements OrderStatusTrackerRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late OrderHistory orderHistory;
  late OrderStatusTrackerRepository orderStatusTrackerRepositoryMock;
  late List<OrderStatusTracker> fakeOrderStatusTracker;
  late OrderHistoryItem fakeOrderHistoryItem;
  final fakeStatus = StatusType('Out for delivery');

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
      });

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "initialized" Event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
        ),
        act: (bloc) => bloc.add(const ViewByItemDetailsEvent.initialized()),
        expect: () => [ViewByItemDetailsState.initial()],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchZyllemStatus" Event failure',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
        ),
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-Error'),
            ),
          );
        },
        act: (bloc) => bloc.add(
          const ViewByItemDetailsEvent.fetchZyllemStatus(),
        ),
        expect: () => [
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
        ),
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(),
          ).thenAnswer(
            (invocation) async => Right(fakeOrderStatusTracker),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            viewByItems: orderHistory,
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
              viewByItemDetails: newViewByItemDetails,
              orderHistoryItem: fakeOrderHistoryItem,
            ),
            ViewByItemDetailsState.initial().copyWith(
              viewByItemDetails: newViewByItemDetails.copyWith(
                orderHistoryItems: newViewByItemDetails.orderHistoryItems
                    .map(
                      (e) => e.copyWith(
                        orderStatusTracker: fakeOrderStatusTracker,
                      ),
                    )
                    .toList(),
              ),
              orderHistoryItem: fakeOrderHistoryItem,
              failureOrSuccessOption: none(),
            ),
          ];
        },
      );

      test(
        'Get "poDocumentsList" when isExpanded = true',
        () {
          final viewByItemDetailsBloc = ViewByItemDetailsBloc(
            orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          );
          viewByItemDetailsBloc.emit(
            ViewByItemDetailsState.initial().copyWith(
              orderHistoryItem: OrderHistoryItem.empty().copyWith(
                orderHistoryItemPoAttachments: <PoDocuments>[],
              ),
              isExpanded: true,
            ),
          );
          expect(
            viewByItemDetailsBloc.state.poDocumentsList,
            viewByItemDetailsBloc
                .state.orderHistoryItem.orderHistoryItemPoAttachments,
          );
        },
      );

      test(
        'Get "poDocumentsList" when isExpanded = false',
        () {
          final viewByItemDetailsBloc = ViewByItemDetailsBloc(
            orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          );
          viewByItemDetailsBloc.emit(
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
            viewByItemDetailsBloc.state.poDocumentsList,
            [
              viewByItemDetailsBloc
                  .state.orderHistoryItem.orderHistoryItemPoAttachments.first
            ],
          );
        },
      );

      test(
        'Get "displayShowMoreOrLess"',
        () {
          final viewByItemDetailsBloc = ViewByItemDetailsBloc(
            orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
          );
          viewByItemDetailsBloc.emit(
            ViewByItemDetailsState.initial().copyWith(
              orderHistoryItem: OrderHistoryItem.empty().copyWith(
                orderHistoryItemPoAttachments: <PoDocuments>[],
              ),
            ),
          );
          expect(
            viewByItemDetailsBloc.state.displayShowMoreOrLess,
            false,
          );
        },
      );
    },
  );
}
