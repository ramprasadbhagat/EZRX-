import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_history_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ViewByOrderHistoryFilter viewByOrderHistoryFilter;
  late DateTime fakeStartDate;
  late DateTime fakeEndDate;
  late DateTimeRange dateTimeRange;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    viewByOrderHistoryFilter = ViewByOrderHistoryFilter.empty();
    fakeEndDate = DateTime.parse(
      DateFormat('yyyyMMdd').format(
        DateTime.now(),
      ),
    );
    fakeStartDate = DateTime.parse(
      DateFormat('yyyyMMdd').format(
        DateTime.now().subtract(
          const Duration(days: 60),
        ),
      ),
    );
    dateTimeRange = DateTimeRange(
      start: fakeStartDate,
      end: fakeEndDate,
    );
  });
  group('View By Order Filter Bloc', () {
    blocTest(
      'initialized',
      build: () => ViewByOrderFilterBloc(),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          const ViewByOrderFilterEvent.initialized(),
        );
      },
      expect: () => [
        isA<ViewByOrderFilterState>(),
      ],
    );
    blocTest(
      'Set Date Range',
      build: () => ViewByOrderFilterBloc(),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.setDateRange(
            viewByOrderHistoryFilter.copyWith(
              dateRange: dateTimeRange,
            ),
          ),
        );
      },
      expect: () => [
        ViewByOrderFilterState.initial().copyWith(
          filter: viewByOrderHistoryFilter.copyWith(
            dateRange: dateTimeRange,
          ),
        ),
      ],
    );
  });
}
