import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../common_mock_data/sales_organsiation_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final currentDate = DateTime.now();
  final fakeStartDate = currentDate.subtract(const Duration(days: 60));
  final fakeEndDate = currentDate;
  final fakeStatus = StatusType('fakeStatus');

  DateTimeStringValue parsedDateTime(DateTime date) => DateTimeStringValue(
        getDateStringByDateTime(date),
      );

  group('View By Order Filter Bloc', () {
    blocTest(
      'initialized',
      build: () => ViewByOrderFilterBloc(),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
      },
      expect: () => [
        ViewByOrderFilterState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
        )
      ],
    );
    blocTest(
      'Set Date Range',
      build: () => ViewByOrderFilterBloc(),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.setDateRange(
            DateTimeRange(start: fakeStartDate, end: fakeEndDate),
          ),
        );
      },
      expect: () => [
        ViewByOrderFilterState.initial().copyWith.filter(
              orderDateFrom: parsedDateTime(fakeStartDate),
              orderDateTo: parsedDateTime(fakeEndDate),
            )
      ],
    );

    blocTest(
      'Update current filter',
      build: () => ViewByOrderFilterBloc(),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.updateCurrentFilter(
            currentFilter: ViewByOrdersFilter.empty()
                .copyWith(orderDateFrom: parsedDateTime(fakeStartDate)),
          ),
        );
      },
      expect: () => [
        ViewByOrderFilterState.initial().copyWith.filter(
              orderDateFrom: parsedDateTime(fakeStartDate),
            )
      ],
    );

    blocTest(
      'Add order status',
      build: () => ViewByOrderFilterBloc(),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.setOrderStatus(
            status: fakeStatus,
            value: true,
          ),
        );
      },
      expect: () => [
        ViewByOrderFilterState.initial().copyWith.filter(
          orderStatusList: [fakeStatus],
        )
      ],
    );

    blocTest(
      'Remove order status',
      build: () => ViewByOrderFilterBloc(),
      seed: () => ViewByOrderFilterState.initial().copyWith.filter(
        orderStatusList: [fakeStatus],
      ),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.setOrderStatus(
            status: fakeStatus,
            value: false,
          ),
        );
      },
      expect: () => [ViewByOrderFilterState.initial()],
    );

    test('Get order status list in ID market', () {
      final viewByOrderFilterState = ViewByOrderFilterState.initial().copyWith(
        salesOrganisation: fakeIDSalesOrganisation,
      );
      final idMarketStatusList = [
        StatusType('Order received'),
        StatusType('Order Created'),
        StatusType('Picking in progress'),
        StatusType('Out for delivery'),
        StatusType('Delivered'),
        StatusType('Cancelled'),
      ];

      expect(viewByOrderFilterState.statusList, idMarketStatusList);
    });

    test('Get order status list in other market', () {
      final viewByOrderFilterState = ViewByOrderFilterState.initial().copyWith(
        salesOrganisation: fakeSalesOrganisation,
      );

      expect(viewByOrderFilterState.statusList, <StatusType>[]);
    });
  });
}
