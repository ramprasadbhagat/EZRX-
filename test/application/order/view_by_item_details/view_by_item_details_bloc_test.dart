import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_status_tracker_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ViewByItemRepositoryMock extends Mock implements ViewByItemRepository {}

class OrderStatusTrackerRepositoryMock extends Mock
    implements OrderStatusTrackerRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late OrderHistory orderHistory;
  late OrderStatusTrackerRepository orderStatusTrackerRepositoryMock;
  late List<OrderStatusTracker> fakeOrderStatusTracker;
  late List<OrderHistoryItem> orderHistoryDetailItems;

  group(
    'ViewByItemDetailsBloc Test => ',
    () {
      setUpAll(() async {
        orderHistory = await ViewByItemLocalDataSource().getViewByItems();
        fakeOrderStatusTracker =
            await OrderStatusTrackerLocalDataSource().getOrderStatusTracker();
        orderHistoryDetailItems = orderHistory.orderHistoryItems
            .where(
              (element) =>
                  element.hashCode !=
                      orderHistory.orderHistoryItems.first.hashCode &&
                  element.orderNumber ==
                      orderHistory.orderHistoryItems.first.orderNumber,
            )
            .toList();
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
        'For "setItemOrderDetails" Event',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            disableDeliveryDateForZyllemStatus: false,
            orderHistoryItem: orderHistory.orderHistoryItems.first,
            viewByItems: orderHistory,
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem: orderHistory.orderHistoryItems.first,
            viewByItemDetails: orderHistory.copyWith(
              orderHistoryItems: orderHistoryDetailItems,
            ),
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchZyllemStatus" Event  success',
        build: () => ViewByItemDetailsBloc(
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
        ),
        setUp: () {
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(),
          ).thenAnswer((invocation) async => Right(fakeOrderStatusTracker));
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            orderHistoryItem: orderHistory.orderHistoryItems.first.copyWith(
              status: StatusType('Out for delivery'),
            ),
            viewByItems: orderHistory,
            disableDeliveryDateForZyllemStatus: false,
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem: orderHistory.orderHistoryItems.first.copyWith(
              status: StatusType('Out for delivery'),
            ),
            viewByItemDetails: orderHistory.copyWith(
              orderHistoryItems: [
                orderHistory.orderHistoryItems.first,
              ],
            ),
          ),
          ViewByItemDetailsState.initial().copyWith(
            orderHistoryItem: orderHistory.orderHistoryItems.first.copyWith(
              status: StatusType('Out for delivery'),
            ),
            viewByItemDetails: orderHistory.copyWith(
              orderHistoryItems: [
                orderHistory.orderHistoryItems.first.copyWith(
                  orderStatusTracker: fakeOrderStatusTracker,
                ),
              ],
            ),
            failureOrSuccessOption: none(),
          ),
        ],
      );
    },
  );
}
