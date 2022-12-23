import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  var mockOrderHistoryFilter = OrderHistoryFilter.empty();
  var orderHistoryFilterState = OrderHistoryFilterState.initial();
  final fakeFromDate = DateTime.parse(DateFormat('yyyyMMdd')
      .format((DateTime.now().subtract(const Duration(days: 7)))));

  final fakeToDate =
      DateTime.parse(DateFormat('yyyyMMdd').format(DateTime.now()));

  const fakeOrderId = '0200190077';
  const fakePoNumber = '1000';
  const fakeMaterialSearch = '1990';
  const fakePrincipleSearch = '1880';
  mockOrderHistoryFilter = mockOrderHistoryFilter.copyWith(
      fromDate: fakeFromDate, toDate: fakeToDate);
  orderHistoryFilterState = orderHistoryFilterState.copyWith(
      orderHistoryFilterList: mockOrderHistoryFilter);

  group(' Order History Filter Bloc', () {
    blocTest('setFromDate',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
                orderHistoryFilterList: OrderHistoryFilter.empty().copyWith(
              toDate: fakeToDate,
            )),
        act: (OrderHistoryFilterBloc bloc) {
          bloc.add(OrderHistoryFilterEvent.setfromDate(
            fromDate: fakeFromDate,
          ));
        },
        expect: () => [
              OrderHistoryFilterState.initial().copyWith(
                  orderHistoryFilterList:
                      mockOrderHistoryFilter.copyWith(fromDate: fakeFromDate)),
            ]);

    blocTest(
      'initialized',
      build: (() => OrderHistoryFilterBloc()),
      act: (OrderHistoryFilterBloc bloc) {
        bloc.add(
          const OrderHistoryFilterEvent.initialized(),
        );
      },
      expect: () => [
        isA<OrderHistoryFilterState>(),
      ],
    );

    blocTest('setToDate',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
                orderHistoryFilterList: OrderHistoryFilter.empty().copyWith(
              fromDate: fakeFromDate,
            )),
        act: (OrderHistoryFilterBloc bloc) =>
            bloc.add(OrderHistoryFilterEvent.setToDate(toDate: fakeToDate)),
        expect: () => [
              orderHistoryFilterState.copyWith(
                  orderHistoryFilterList:
                      mockOrderHistoryFilter.copyWith(toDate: fakeToDate))
            ]);

    blocTest('orderIdChanged',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
            orderHistoryFilterList: OrderHistoryFilter.empty()
                .copyWith(fromDate: fakeFromDate, toDate: fakeToDate)),
        act: (OrderHistoryFilterBloc bloc) => bloc.add(
            OrderHistoryFilterEvent.orderIdChanged(
                SearchKey.orderHistoryFilter(fakeOrderId)
                    .getOrDefaultValue(''))),
        expect: () => [
              OrderHistoryFilterState.initial().copyWith(
                  orderHistoryFilterList: OrderHistoryFilter.empty().copyWith(
                      fromDate: fakeFromDate,
                      toDate: fakeToDate,
                      orderId: SearchKey.orderHistoryFilter(fakeOrderId)))
            ]);
    blocTest('poNumberChanged',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
            orderHistoryFilterList: OrderHistoryFilter.empty()
                .copyWith(fromDate: fakeFromDate, toDate: fakeToDate)),
        act: (OrderHistoryFilterBloc bloc) => bloc.add(
            OrderHistoryFilterEvent.poNumberChanged(
                SearchKey.orderHistoryFilter(fakePoNumber)
                    .getOrDefaultValue(''))),
        expect: () => [
              OrderHistoryFilterState.initial().copyWith(
                  orderHistoryFilterList: OrderHistoryFilter.empty().copyWith(
                      fromDate: fakeFromDate,
                      toDate: fakeToDate,
                      poNumber: SearchKey.orderHistoryFilter(fakePoNumber)))
            ]);
    blocTest('principalSearchChanged',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
            orderHistoryFilterList: OrderHistoryFilter.empty()
                .copyWith(fromDate: fakeFromDate, toDate: fakeToDate)),
        act: (OrderHistoryFilterBloc bloc) => bloc.add(
            OrderHistoryFilterEvent.principalSearchChanged(
                SearchKey.orderHistoryFilter(fakePrincipleSearch)
                    .getOrCrash())),
        expect: () => [
              OrderHistoryFilterState.initial().copyWith(
                  orderHistoryFilterList: OrderHistoryFilter.empty().copyWith(
                      fromDate: fakeFromDate,
                      toDate: fakeToDate,
                      principalSearch:
                          SearchKey.orderHistoryFilter(fakePrincipleSearch)))
            ]);
    blocTest('materialSearchChanged',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
            orderHistoryFilterList: OrderHistoryFilter.empty()
                .copyWith(fromDate: fakeFromDate, toDate: fakeToDate)),
        act: (OrderHistoryFilterBloc bloc) => bloc.add(
            OrderHistoryFilterEvent.materialSearchChanged(
                SearchKey.orderHistoryFilter(fakeMaterialSearch)
                    .getOrDefaultValue(''))),
        expect: () => [
              OrderHistoryFilterState.initial().copyWith(
                  orderHistoryFilterList: OrderHistoryFilter.empty().copyWith(
                      fromDate: fakeFromDate,
                      toDate: fakeToDate,
                      materialSearch:
                          SearchKey.orderHistoryFilter(fakeMaterialSearch)))
            ]);
    blocTest(
      'filterOrderHistory',
      build: (() => OrderHistoryFilterBloc()),
      seed: () => OrderHistoryFilterState.initial().copyWith(
          orderHistoryFilterList: OrderHistoryFilter.empty()
              .copyWith(fromDate: fakeFromDate, toDate: fakeToDate)),
      act: (OrderHistoryFilterBloc bloc) =>
          bloc.add(const OrderHistoryFilterEvent.filterOrderHistory()),
      expect: () => [
        orderHistoryFilterState.copyWith(
          isSubmitting: true,
          isAppliedFilter: true,
        )
      ],
    );

    blocTest(
      'filterOrderHistory with inValid',
      build: (() => OrderHistoryFilterBloc()),
      seed: () => OrderHistoryFilterState.initial().copyWith(
        orderHistoryFilterList: OrderHistoryFilter.empty().copyWith(
          orderId: SearchKey(''),
          fromDate: fakeFromDate,
          toDate: fakeToDate,
        ),
      ),
      act: (OrderHistoryFilterBloc bloc) =>
          bloc.add(const OrderHistoryFilterEvent.filterOrderHistory()),
      expect: () => [
        orderHistoryFilterState.copyWith(
          orderHistoryFilterList: OrderHistoryFilter.empty().copyWith(
            orderId: SearchKey(
              const Left(
                ValueFailure<String>.empty(failedValue: ''),
              ).fold((l) => l.failedValue, (r) => r),
            ),
            toDate: fakeToDate,
            fromDate: fakeFromDate,
          ),
          showErrorMessages: true,
          isSubmitting: false,
          isAppliedFilter: false,
        )
      ],
    );

    blocTest(
      'sortByDate',
      build: (() => OrderHistoryFilterBloc()),
      act: (OrderHistoryFilterBloc bloc) => bloc
        ..add(const OrderHistoryFilterEvent.initialized())
        ..add(const OrderHistoryFilterEvent.sortByDate('desc')),
      expect: () => [isA<OrderHistoryFilterState>()],
    );
  });
}
