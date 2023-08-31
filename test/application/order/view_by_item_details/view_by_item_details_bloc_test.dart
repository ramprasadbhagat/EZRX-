import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_status_tracker_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ViewByItemDetailsRepositoryMock extends Mock
    implements ViewByItemDetailsRepository {}

class OrderStatusTrackerRepositoryMock extends Mock
    implements OrderStatusTrackerRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ViewByItemDetailsRepository viewByItemDetailsRepositoryMock;
  late OrderHistory orderHistory;
  late OrderStatusTrackerRepository orderStatusTrackerRepositoryMock;
  late List<OrderStatusTracker> orderStatusTracker;
  late List<OrderStatusTracker> fakeOrderStatusTracker;

  group(
    'ViewByItemDetailsBloc Test => ',
    () {
      setUpAll(() async {
        orderHistory =
            await ViewByItemDetailsLocalDataSource().getViewByItemDetails();
        orderStatusTracker =
            orderHistory.orderHistoryItems.first.orderStatusTracker;
        fakeOrderStatusTracker =
            await OrderStatusTrackerLocalDataSource().getOrderStatusTracker();
      });

      setUp(() {
        viewByItemDetailsRepositoryMock = ViewByItemDetailsRepositoryMock();
        orderStatusTrackerRepositoryMock = OrderStatusTrackerRepositoryMock();
      });

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "initialized" Event',
        build: () => ViewByItemDetailsBloc(
          viewByItemDetailsRepository: viewByItemDetailsRepositoryMock,
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
        ),
        act: (bloc) => bloc.add(const ViewByItemDetailsEvent.initialized()),
        expect: () => [ViewByItemDetailsState.initial()],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetch" Event success',
        build: () => ViewByItemDetailsBloc(
          viewByItemDetailsRepository: viewByItemDetailsRepositoryMock,
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
        ),
        setUp: () {
          when(
            () => viewByItemDetailsRepositoryMock.getViewByItemDetails(
              soldTo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('2100')),
              orderNumber: OrderNumber(''),
              user: User.empty(),
            ),
          ).thenAnswer((invocation) async => Right(orderHistory));
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(),
          ).thenAnswer((invocation) async => Right(orderStatusTracker));
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetch(
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2100')),
            orderNumber: OrderNumber(''),
            materialNumber: MaterialNumber('000000000013021342'),
            soldTo: CustomerCodeInfo.empty(),
            user: User.empty(),
            disableDeliveryDateForZyllemStatus: true,
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            isLoading: true,
          ),
          ViewByItemDetailsState.initial().copyWith(
            isLoading: false,
             viewByItemDetails: orderHistory.copyWith(
              orderHistoryItems: [],
            ),
            orderHistoryItem: orderHistory.orderHistoryItems.first,
            failureOrSuccessOption: optionOf(Right(orderHistory)),
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetch" Event failure',
        build: () => ViewByItemDetailsBloc(
          viewByItemDetailsRepository: viewByItemDetailsRepositoryMock,
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
        ),
        setUp: () {
          when(
            () => viewByItemDetailsRepositoryMock.getViewByItemDetails(
              soldTo: CustomerCodeInfo.empty(),
              orderNumber: OrderNumber(''),
              salesOrganisation: SalesOrganisation.empty(),
              user: User.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetch(
            orderNumber: OrderNumber(''),
            salesOrganisation: SalesOrganisation.empty(),
            materialNumber: MaterialNumber(''),
            soldTo: CustomerCodeInfo.empty(),
            user: User.empty(),
            disableDeliveryDateForZyllemStatus: true,
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            isLoading: true,
          ),
          ViewByItemDetailsState.initial().copyWith(
            isLoading: false,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        'For "fetchZyllemStatus" Event  success',
        build: () => ViewByItemDetailsBloc(
          viewByItemDetailsRepository: viewByItemDetailsRepositoryMock,
          orderStatusTrackerRepository: orderStatusTrackerRepositoryMock,
        ),
        setUp: () {
          when(
            () => viewByItemDetailsRepositoryMock.getViewByItemDetails(
              soldTo: CustomerCodeInfo.empty(),
              orderNumber: OrderNumber(''),
              salesOrganisation: SalesOrganisation.empty(),
              user: User.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              orderHistory.copyWith(
                orderHistoryItems: [
                  OrderHistoryItem.empty().copyWith(
                    materialNumber: MaterialNumber('000000000013021342'),
                    status: StatusType('Out for delivery'),
                  )
                ],
              ),
            ),
          );

          when(
            () => orderStatusTrackerRepositoryMock.getOrderStatusTracker(),
          ).thenAnswer((invocation) async => Right(fakeOrderStatusTracker));
        },
        act: (bloc) => bloc.add(
          ViewByItemDetailsEvent.fetch(
            orderNumber: OrderNumber(''),
            salesOrganisation: SalesOrganisation.empty(),
            materialNumber: MaterialNumber('000000000013021342'),
            soldTo: CustomerCodeInfo.empty(),
            user: User.empty(),
            disableDeliveryDateForZyllemStatus: false,
          ),
        ),
        expect: () => [
          ViewByItemDetailsState.initial().copyWith(
            isLoading: true,
          ),
          ViewByItemDetailsState.initial().copyWith(
            isLoading: false,
            viewByItemDetails: orderHistory.copyWith(
              orderHistoryItems: [],
            ),
            orderHistoryItem: OrderHistoryItem.empty().copyWith(
              materialNumber: MaterialNumber('000000000013021342'),
              orderStatusTracker: [],
              status: StatusType('Out for delivery'),
            ),
            failureOrSuccessOption: optionOf(
              Right(
                orderHistory.copyWith(
                  orderHistoryItems: [
                    OrderHistoryItem.empty().copyWith(
                      materialNumber: MaterialNumber('000000000013021342'),
                      orderStatusTracker: [],
                      status: StatusType('Out for delivery'),
                    )
                  ],
                ),
              ),
            ),
          ),
          ViewByItemDetailsState.initial().copyWith(
            isLoading: false,
            viewByItemDetails: orderHistory.copyWith(
              orderHistoryItems: [],
            ),
            orderHistoryItem: OrderHistoryItem.empty().copyWith(
              materialNumber: MaterialNumber('000000000013021342'),
              orderStatusTracker: [],
              status: StatusType('Out for delivery'),
            ),
            failureOrSuccessOption: none(),
          ),
        ],
      );
    },
  );
}
