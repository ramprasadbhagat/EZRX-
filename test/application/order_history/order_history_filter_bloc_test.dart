import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  var mockOrderHistoryFilter = OrderHistoryFilter.empty();
  var orderHistoryFilterState = OrderHistoryFilterState.initial();
  final fakeFromDate = DateTime.now().subtract(const Duration(days: 7));

  final fakeToDate = DateTime.now();

  const fakeOrderId = '0200190077';
  const fakePoNumber = '1000';
  const fakeMaterialSearch = '1990';
  const fakePrincipalSearch = '1880';
  mockOrderHistoryFilter = mockOrderHistoryFilter.copyWith(
    fromDate: DateTimeStringValue(
      getDateStringByDateTime(fakeFromDate),
    ),
    toDate: DateTimeStringValue(
      getDateStringByDateTime(fakeToDate),
    ),
  );
  orderHistoryFilterState = orderHistoryFilterState.copyWith(
      orderHistoryFilter: mockOrderHistoryFilter);

  group(' Order History Filter Bloc', () {
    blocTest('setFromDate',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
                orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
              toDate: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
            )),
        act: (OrderHistoryFilterBloc bloc) {
          bloc.add(OrderHistoryFilterEvent.setfromDate(
            fromDate: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ));
        },
        expect: () => [
              // OrderHistoryFilterState.initial().copyWith(
              //     orderHistoryFilterList: mockOrderHistoryFilter.copyWith(
              //   fromDate: DateTimeStringValue(
              //     getDateStringByDateTime(fakeFromDate),
              //   ),
              // )),
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
                orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
              fromDate: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
            )),
        act: (OrderHistoryFilterBloc bloc) =>
            bloc.add(OrderHistoryFilterEvent.setToDate(
              toDate: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
            )),
        expect: () => [
              // orderHistoryFilterState.copyWith(
              //     orderHistoryFilterList: mockOrderHistoryFilter.copyWith(
              //   toDate: DateTimeStringValue(
              //     getDateStringByDateTime(fakeToDate),
              //   ),
              // ))
            ]);

    blocTest('orderIdChanged',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
                orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
              fromDate: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              toDate: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
            )),
        act: (OrderHistoryFilterBloc bloc) => bloc.add(
            OrderHistoryFilterEvent.orderIdChanged(
                SearchKey.searchFilter(fakeOrderId).getOrDefaultValue(''))),
        expect: () => [
              OrderHistoryFilterState.initial().copyWith(
                  orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
                      fromDate: DateTimeStringValue(
                        getDateStringByDateTime(fakeFromDate),
                      ),
                      toDate: DateTimeStringValue(
                        getDateStringByDateTime(fakeToDate),
                      ),
                      orderId: SearchKey.searchFilter(fakeOrderId)))
            ]);
    blocTest('poNumberChanged',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
                orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
              fromDate: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              toDate: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
            )),
        act: (OrderHistoryFilterBloc bloc) => bloc.add(
            OrderHistoryFilterEvent.poNumberChanged(
                SearchKey.searchFilter(fakePoNumber).getOrDefaultValue(''))),
        expect: () => [
              OrderHistoryFilterState.initial().copyWith(
                  orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
                      fromDate: DateTimeStringValue(
                        getDateStringByDateTime(fakeFromDate),
                      ),
                      toDate: DateTimeStringValue(
                        getDateStringByDateTime(fakeToDate),
                      ),
                      poNumber: SearchKey.searchFilter(fakePoNumber)))
            ]);
    blocTest('principalSearchChanged',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
                orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
              fromDate: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              toDate: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
            )),
        act: (OrderHistoryFilterBloc bloc) => bloc.add(
            OrderHistoryFilterEvent.principalSearchChanged(
                SearchKey.searchFilter(fakePrincipalSearch).getOrCrash())),
        expect: () => [
              OrderHistoryFilterState.initial().copyWith(
                  orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
                      fromDate: DateTimeStringValue(
                        getDateStringByDateTime(fakeFromDate),
                      ),
                      toDate: DateTimeStringValue(
                        getDateStringByDateTime(fakeToDate),
                      ),
                      principalSearch:
                          SearchKey.searchFilter(fakePrincipalSearch)))
            ]);
    blocTest('materialSearchChanged',
        build: (() => OrderHistoryFilterBloc()),
        seed: () => OrderHistoryFilterState.initial().copyWith(
                orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
              fromDate: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              toDate: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
            )),
        act: (OrderHistoryFilterBloc bloc) => bloc.add(
            OrderHistoryFilterEvent.materialSearchChanged(
                SearchKey.searchFilter(fakeMaterialSearch)
                    .getOrDefaultValue(''))),
        expect: () => [
              OrderHistoryFilterState.initial().copyWith(
                  orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
                      fromDate: DateTimeStringValue(
                        getDateStringByDateTime(fakeFromDate),
                      ),
                      toDate: DateTimeStringValue(
                        getDateStringByDateTime(fakeToDate),
                      ),
                      materialSearch:
                          SearchKey.searchFilter(fakeMaterialSearch)))
            ]);
    blocTest(
      'filterOrderHistory',
      build: (() => OrderHistoryFilterBloc()),
      seed: () => OrderHistoryFilterState.initial().copyWith(
          orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
        fromDate: DateTimeStringValue(
          getDateStringByDateTime(fakeFromDate),
        ),
        toDate: DateTimeStringValue(
          getDateStringByDateTime(fakeToDate),
        ),
      )),
      act: (OrderHistoryFilterBloc bloc) =>
          bloc.add(const OrderHistoryFilterEvent.applyFilters()),
      expect: () => [
        orderHistoryFilterState.copyWith(
          isSubmitting: true,
        )
      ],
    );

    blocTest(
      'filterOrderHistory with inValid',
      build: (() => OrderHistoryFilterBloc()),
      seed: () => OrderHistoryFilterState.initial().copyWith(
        orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
          orderId: SearchKey(''),
          fromDate: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          toDate: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
        ),
      ),
      act: (OrderHistoryFilterBloc bloc) =>
          bloc.add(const OrderHistoryFilterEvent.applyFilters()),
      expect: () => [
        orderHistoryFilterState.copyWith(
          orderHistoryFilter: OrderHistoryFilter.empty().copyWith(
            orderId: SearchKey(
              const Left(
                ValueFailure<String>.empty(failedValue: ''),
              ).fold((l) => l.failedValue, (r) => r),
            ),
            toDate: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            fromDate: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
          showErrorMessages: true,
          isSubmitting: false,
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
