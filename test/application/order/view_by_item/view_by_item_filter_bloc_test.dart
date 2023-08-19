import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final fakeStartDate = DateTime.parse(
    DateFormat(DateTimeFormatString.apiDateFormat).format(
      DateTime.now().subtract(
        const Duration(days: 9),
      ),
    ),
  );
  final fakeEndDate = DateTime.parse(
    DateFormat(DateTimeFormatString.apiDateFormat).format(DateTime.now()),
  );

  final statusList = <StatusType>[
    StatusType('Order created'),
    StatusType('Pending release'),
    StatusType('Picking in progress'),
    StatusType('Out of delivery'),
    StatusType('Delivered'),
    StatusType('Cancelled'),
    StatusType('Failed'),
  ];
  group(
    'Order View By Item Filter Bloc',
    () {
      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Initialized Or Reset',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) => bloc.add(
          const ViewByItemFilterEvent.initializeOrReset(),
        ),
        expect: () => [
          ViewByItemFilterState.initial(),
        ],
      );

      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Set Order Date',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) => bloc.add(
          ViewByItemFilterEvent.setOrderDate(
            dateRange: DateTimeRange(
              start: fakeStartDate,
              end: fakeEndDate,
            ),
          ),
        ),
        expect: () => [
          ViewByItemFilterState.initial().copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              dateRange: DateTimeRange(
                start: fakeStartDate,
                end: fakeEndDate,
              ),
            ),
          ),
        ],
      );

      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Set Order Status Selections',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) {
          bloc.add(
            ViewByItemFilterEvent.setOrderStatus(
              status: StatusType('Order created'),
              value: true,
            ),
          );
          bloc.add(
            ViewByItemFilterEvent.setOrderStatus(
              status: StatusType('Picking in progress'),
              value: true,
            ),
          );
        },
        expect: () => [
          ViewByItemFilterState.initial().copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderStatusList: <StatusType>[
                StatusType('Order created'),
              ],
            ),
            statusList: statusList,
          ),
          ViewByItemFilterState.initial().copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderStatusList: <StatusType>[
                StatusType('Order created'),
                StatusType('Picking in progress'),
              ],
            ),
            statusList: statusList,
          ),
        ],
      );

      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Set Order Status De-Selections',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) {
          bloc.add(
            ViewByItemFilterEvent.setOrderStatus(
              status: StatusType('Picking in progress'),
              value: false,
            ),
          );
        },
        seed: () => ViewByItemFilterState.initial().copyWith(
          filter: ViewByItemFilter.empty().copyWith(
            orderStatusList: <StatusType>[
              StatusType('Order created'),
              StatusType('Picking in progress'),
            ],
          ),
          statusList: statusList,
        ),
        expect: () => [
          ViewByItemFilterState.initial().copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderStatusList: <StatusType>[
                StatusType('Order created'),
              ],
            ),
            statusList: statusList,
          ),
        ],
      );

      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Reset Filter To Last Applied',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) {
          bloc.add(
            ViewByItemFilterEvent.resetFiltersToLastApplied(
              lastAppliedFilter: ViewByItemFilter.empty().copyWith(
                orderStatusList: <StatusType>[
                  StatusType('Order created'),
                  StatusType('Picking in progress'),
                ],
                dateRange: DateTimeRange(
                  start: fakeStartDate,
                  end: fakeEndDate,
                ),
              ),
            ),
          );
        },
        expect: () => [
          ViewByItemFilterState.initial().copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderStatusList: <StatusType>[
                StatusType('Order created'),
                StatusType('Picking in progress'),
              ],
              dateRange: DateTimeRange(
                start: fakeStartDate,
                end: fakeEndDate,
              ),
            ),
          ),
        ],
      );

      test(
        'Test emptyViewByItemFilter',
        () {
          final viewByItemFilterState = ViewByItemFilterState.initial();

          final getemptyViewByItemFilter =
              viewByItemFilterState.emptyViewByItemFilter;
          expect(
            getemptyViewByItemFilter,
            ViewByItemFilter.empty(),
          );
        },
      );
    },
  );
}
