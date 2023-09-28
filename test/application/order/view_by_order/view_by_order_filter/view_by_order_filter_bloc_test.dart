import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ViewByOrdersFilter viewByOrdersFilter;
  late DateTime fakeStartDate;
  late DateTime fakeEndDate;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    viewByOrdersFilter = ViewByOrdersFilter.empty();
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
            viewByOrdersFilter.copyWith(
              orderDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeStartDate),
              ),
              orderDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeEndDate),
              ),
            ),
          ),
        );
      },
      expect: () => [
        ViewByOrderFilterState.initial().copyWith(
          filter: viewByOrdersFilter.copyWith(
            orderDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeStartDate),
            ),
            orderDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeEndDate),
            ),
          ),
        ),
      ],
    );
  });
}
