import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/returns/return_summary/return_summary_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class ReturnSummaryFilterBlocMock
    extends MockBloc<ReturnSummaryFilterEvent, ReturnSummaryFilterState>
    implements ReturnSummaryFilterBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

void main() {
  late ReturnSummaryFilterBloc returnSummaryFilterBlocMock;
  late AppRouter autoRouterMock;
  late SalesOrgBloc salesOrgBlocMock;
  final locator = GetIt.instance;
  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().subtract(
        const Duration(days: 28),
      ),
    ),
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    salesOrgBlocMock = SalesOrgBlocMock();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    returnSummaryFilterBlocMock = ReturnSummaryFilterBlocMock();
    when(() => returnSummaryFilterBlocMock.state)
        .thenReturn(ReturnSummaryFilterState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<ReturnSummaryFilterBloc>(
            create: (context) => returnSummaryFilterBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
        ],
        child: const ReturnSummaryFilterDrawer(),
      ),
    );
  }

  group('Return Summary Filter Drawer Test', () {
    testWidgets('=> Listen When condition', (tester) async {
      final expectedState = [
        ReturnSummaryFilterState.initial().copyWith(
          isSubmitting: true,
        ),
      ];
      whenListen(
          returnSummaryFilterBlocMock, Stream.fromIterable(expectedState));
      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));
    });

    testWidgets('=> _FilterHeader Test', (tester) async {
      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final findFilterReturnSummaryText = find.text('Apply Filters'.tr());
      expect(findFilterReturnSummaryText, findsOneWidget);

      final findIconKey = find.byKey(const Key('filterCrossButton'));
      expect(findIconKey, findsOneWidget);
      await tester.tap(findIconKey);
      await tester.pump();
    });

    testWidgets('=> _ReturnIdByFilter Test', (tester) async {
      when(() => returnSummaryFilterBlocMock.state)
          .thenReturn(ReturnSummaryFilterState.initial().copyWith(
        showErrorMessages: true,
        returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
          requestId: SearchKey.searchFilter('2'),
        ),
      ));

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final findText = find.text('Return ID'.tr());
      expect(findText, findsOneWidget);
      final findTextField =
          find.ancestor(of: findText, matching: find.byType(TextFormField));
      await tester.enterText(findTextField, '2');
      await tester.pump(const Duration(
        seconds: 1,
      ));
      expect(find.text('Please enter at least 2 characters.'.tr()),
          findsOneWidget);
      await tester.pump();
      verify(
        () => returnSummaryFilterBlocMock.add(
          const ReturnSummaryFilterEvent.returnIdChanged('2'),
        ),
      ).called(1);
    });

    testWidgets('=> _TotalPriceToFilter Test', (tester) async {
      when(() => returnSummaryFilterBlocMock.state)
          .thenReturn(ReturnSummaryFilterState.initial().copyWith(
        showErrorMessages: true,
        returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
          refundTotalTo: RangeValue('12'),
        ),
      ));

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final findText = find.text('Total Price To'.tr());
      expect(findText, findsOneWidget);
      final findTextField =
          find.ancestor(of: findText, matching: find.byType(TextFormField));
      await tester.enterText(findTextField, '123456');
      await tester.pump();
      verify(
        () => returnSummaryFilterBlocMock.add(
          ReturnSummaryFilterEvent.refundTotalToChanged(
              StringUtils.formatter.format(double.parse('123456'))),
        ),
      ).called(1);
    });

    testWidgets('=> _TotalPriceFromFilter Test', (tester) async {
      when(() => returnSummaryFilterBlocMock.state)
          .thenReturn(ReturnSummaryFilterState.initial().copyWith(
        showErrorMessages: true,
        returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
          refundTotalFrom: RangeValue('12'),
        ),
      ));

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final findText = find.text('Total Price From'.tr());
      expect(findText, findsOneWidget);
      final findTextField =
          find.ancestor(of: findText, matching: find.byType(TextFormField));
      await tester.enterText(findTextField, '12');
      await tester.pump();
      verify(
        () => returnSummaryFilterBlocMock.add(
          ReturnSummaryFilterEvent.refundTotalFromChanged(
              StringUtils.formatter.format(double.parse('12'))),
        ),
      ).called(1);
    });

    testWidgets('=> _SubmittedDateFilterState Test', (tester) async {
      when(() => returnSummaryFilterBlocMock.state)
          .thenReturn(ReturnSummaryFilterState.initial().copyWith(
        returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
          dateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          dateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
        ),
      ));

      final expectedState = [
        ReturnSummaryFilterState.initial().copyWith(
          returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
            dateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            dateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
          ),
        ),
      ];
      whenListen(
          returnSummaryFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final findText = find.text('Submitted Date'.tr());
      expect(findText, findsOneWidget);
      final findTextField =
          find.ancestor(of: findText, matching: find.byType(TextFormField));
      await tester.tap(findTextField);
      await tester.pumpAndSettle();

      await tester.tap(find.text('SAVE'));
      await tester.pumpAndSettle();

      await tester.pump();
      verify(
        () => returnSummaryFilterBlocMock.add(
          ReturnSummaryFilterEvent.setSubmittedDate(
              submittedDateRange:
                  DateTimeRange(start: fakeFromDate, end: fakeToDate)),
        ),
      ).called(1);
    });

    testWidgets('=> _ApplyButton Button Click Test', (tester) async {
      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final findText = find.text('Apply'.tr());
      expect(findText, findsOneWidget);
      final findElevatedButton =
          find.ancestor(of: findText, matching: find.byType(ElevatedButton));
      await tester.tap(findElevatedButton);
      await tester.pump(const Duration(milliseconds: 1));
      await tester.pump();
      verify(
        () => returnSummaryFilterBlocMock.add(
          const ReturnSummaryFilterEvent.applyFilters(),
        ),
      ).called(1);
    });

    testWidgets('=> _ClearButton Test', (tester) async {
      when(() => returnSummaryFilterBlocMock.state)
          .thenReturn(ReturnSummaryFilterState.initial().copyWith(
        showErrorMessages: false,
        returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
          refundTotalFrom: RangeValue('12'),
        ),
      ));
      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final findText = find.text('Clear'.tr());
      expect(findText, findsOneWidget);
      final findOutlineButton = find.byKey(const Key('filterClearButton'));
      await tester.tap(findOutlineButton);
      await tester.pump(const Duration(milliseconds: 1));
      await tester.pump();
      verify(
        () => returnSummaryFilterBlocMock.add(
          const ReturnSummaryFilterEvent.initialized(),
        ),
      ).called(1);
    });

    testWidgets(
        '=> PriceRange Test when refundTotalTo greater than refundTotalFrom',
        (tester) async {
      when(() => returnSummaryFilterBlocMock.state)
          .thenReturn(ReturnSummaryFilterState.initial().copyWith(
        showErrorMessages: true,
        returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
          refundTotalFrom: RangeValue('15'),
          refundTotalTo: RangeValue('12'),
        ),
      ));
      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final findText = find.text('Apply'.tr());
      expect(findText, findsOneWidget);
      final findElevatedButton =
          find.ancestor(of: findText, matching: find.byType(ElevatedButton));
      await tester.tap(findElevatedButton);
      await tester.pumpAndSettle();

      final findInvalidText = find.text('Invalid Refund Total Range!'.tr());
      expect(findInvalidText, findsOneWidget);
      await tester.pump();
    });
  });
}
