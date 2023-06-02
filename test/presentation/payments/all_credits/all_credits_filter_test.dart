import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/all_credits_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class AllCreditsFilterBlocMock
    extends MockBloc<AllCreditsFilterEvent, AllCreditsFilterState>
    implements AllCreditsFilterBloc {}

void main() {
  late AllCreditsFilterBloc allCreditsFilterBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  final fakeToDate = DateTime.parse(
    DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyy-MM-dd').format(
      DateTime.now().subtract(
        const Duration(days: 28),
      ),
    ),
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    allCreditsFilterBlocMock = AllCreditsFilterBlocMock();
    when(() => allCreditsFilterBlocMock.state)
        .thenReturn(AllCreditsFilterState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AllCreditsFilterBloc>(
            create: (context) => allCreditsFilterBlocMock,
          ),
        ],
        child: const AllCreditsFilterDrawer(),
      ),
    );
  }

  group('All Credits Filter Drawer Test', () {
    testWidgets('=> Listen When condition', (tester) async {
      final expectedState = [
        AllCreditsFilterState.initial().copyWith(
          isSubmitting: true,
        ),
      ];
      whenListen(allCreditsFilterBlocMock, Stream.fromIterable(expectedState));
      await getWidget(tester);
      await tester.pumpAndSettle();
    });

    testWidgets('=> _FilterHeader Test', (tester) async {
      await getWidget(tester);
      await tester.pumpAndSettle();

      final allCreditsFilterBlocMock = find.text('Apply Filters'.tr());
      expect(allCreditsFilterBlocMock, findsOneWidget);

      final findIconKey = find.byKey(const Key('filterCrossButton'));
      expect(findIconKey, findsOneWidget);
      await tester.tap(findIconKey);
      await tester.pump();
    });

    testWidgets('_DocumentNumberByFilter test', (tester) async {
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial().copyWith(
        allCreditsFilter: AllCreditsFilter.empty(),
      ));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Document Number'.tr());
      expect(findText, findsOneWidget);
      await tester.enterText(
          find.byKey(const Key('filterDocumentNumberField')), '0180000153');
      await tester.pump();
      expect(find.text('0180000152'), findsNothing);
      expect(find.text('0180000153'), findsOneWidget);
    });

    testWidgets('=> _DocumentDateFilterState Test', (tester) async {
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial().copyWith(
        allCreditsFilter: AllCreditsFilter.empty().copyWith(
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
        ),
      ));

      final expectedState = [
        AllCreditsFilterState.initial().copyWith(
          allCreditsFilter: AllCreditsFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
          ),
        ),
      ];
      whenListen(allCreditsFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Document Date'.tr());
      expect(findText, findsOneWidget);
      final findTextField =
          find.ancestor(of: findText, matching: find.byType(TextFormField));
      await tester.tap(findTextField);
      await tester.pumpAndSettle();

      await tester.tap(find.text('SAVE'));
      await tester.pumpAndSettle();

      verify(
        () => allCreditsFilterBlocMock.add(
          AllCreditsFilterEvent.setDocumentDate(
              DateTimeRange(start: fakeFromDate, end: fakeToDate)),
        ),
      ).called(1);
    });

    testWidgets('=> _CreditAmountToFilter Test', (tester) async {
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial().copyWith(
        showErrorMessages: true,
        allCreditsFilter: AllCreditsFilter.empty().copyWith(
          creditAmountTo: RangeValue('10'),
        ),
      ));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Credit Amount To'.tr());
      expect(findText, findsOneWidget);
      final findTextField =
          find.ancestor(of: findText, matching: find.byType(TextFormField));
      await tester.enterText(findTextField, '100');
      await tester.pump();
      verify(
        () => allCreditsFilterBlocMock.add(
          const AllCreditsFilterEvent.creditAmountToChanged('100'),
        ),
      ).called(1);
    });

    testWidgets('=> _CreditAmountFromFilter Test', (tester) async {
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial().copyWith(
        showErrorMessages: true,
        allCreditsFilter: AllCreditsFilter.empty().copyWith(
          creditAmountFrom: RangeValue('1000'),
        ),
      ));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Credit Amount From'.tr());
      expect(findText, findsOneWidget);
      final findTextField =
          find.ancestor(of: findText, matching: find.byType(TextFormField));
      await tester.enterText(findTextField, '1000');
      await tester.pump();
      verify(
        () => allCreditsFilterBlocMock.add(
          const AllCreditsFilterEvent.creditAmountFromChanged('1000'),
        ),
      ).called(1);
    });

    testWidgets('=> _ApplyButton Button Click Test', (tester) async {
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Apply'.tr());
      expect(findText, findsOneWidget);
      final findElevatedButton =
          find.ancestor(of: findText, matching: find.byType(ElevatedButton));
      await tester.tap(findElevatedButton);
      await tester.pump();
      verify(
        () => allCreditsFilterBlocMock.add(
          const AllCreditsFilterEvent.applyFilters(),
        ),
      ).called(1);
    });

    testWidgets('=> _ClearButton Test', (tester) async {
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial().copyWith(
        showErrorMessages: false,
        allCreditsFilter: AllCreditsFilter.empty().copyWith(
          creditAmountFrom: RangeValue('10'),
        ),
      ));
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Clear'.tr());
      expect(findText, findsOneWidget);
      final findOutlineButton = find.byKey(const Key('filterClearButton'));
      await tester.tap(findOutlineButton);
      await tester.pump();
      verify(
        () => allCreditsFilterBlocMock.add(
          const AllCreditsFilterEvent.clearFilters(),
        ),
      ).called(1);
    });

    testWidgets(
        '=> CreditAmountError Test when creditAmountTo greater than creditAmountFrom',
        (tester) async {
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial().copyWith(
        showErrorMessages: true,
        allCreditsFilter: AllCreditsFilter.empty().copyWith(
          creditAmountFrom: RangeValue('25'),
          creditAmountTo: RangeValue('10'),
        ),
      ));
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Apply'.tr());
      expect(findText, findsOneWidget);
      final findElevatedButton =
          find.ancestor(of: findText, matching: find.byType(ElevatedButton));
      await tester.tap(findElevatedButton);
      await tester.pumpAndSettle();

      final findInvalidText = find.text('Invalid Credit Amount Range!'.tr());
      expect(findInvalidText, findsOneWidget);
      await tester.pump();
    });
  });
}
