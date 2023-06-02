import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_drawer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class AllInvoicesFilterBlocMock
    extends MockBloc<AllInvoicesFilterEvent, AllInvoicesFilterState>
    implements AllInvoicesFilterBloc {}

void main() {
  late AllInvoicesFilterBloc allInvoicesFilterBlocMock;
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
    allInvoicesFilterBlocMock = AllInvoicesFilterBlocMock();
    when(() => allInvoicesFilterBlocMock.state)
        .thenReturn(AllInvoicesFilterState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AllInvoicesFilterBloc>(
            create: (context) => allInvoicesFilterBlocMock,
          ),
        ],
        child: const AllInvoicesFilterDrawer(),
      ),
    );
  }

  group('All Invoices Filter Drawer Test', () {
    testWidgets('=> Listen When condition', (tester) async {
      final expectedState = [
        AllInvoicesFilterState.initial().copyWith(
          changed: true,
        ),
      ];
      whenListen(allInvoicesFilterBlocMock, Stream.fromIterable(expectedState));
      await getWidget(tester);
      await tester.pumpAndSettle();
    });

    testWidgets('=> _FilterHeader Test', (tester) async {
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findFilterAllInvoicesText = find.text('Apply Filters'.tr());
      expect(findFilterAllInvoicesText, findsOneWidget);

      final findIconKey = find.byKey(const Key('filterCrossButton'));
      expect(findIconKey, findsOneWidget);
      await tester.tap(findIconKey);
      await tester.pump();
    });

    testWidgets('=> _DueDateFilterState Test', (tester) async {
      when(() => allInvoicesFilterBlocMock.state)
          .thenReturn(AllInvoicesFilterState.initial().copyWith(
        allInvoicesFilter: AllInvoicesFilter.empty().copyWith(
          dueDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          dueDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
        ),
      ));

      final expectedState = [
        AllInvoicesFilterState.initial().copyWith(
          allInvoicesFilter: AllInvoicesFilter.empty().copyWith(
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
          ),
        ),
      ];
      whenListen(allInvoicesFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Due Date'.tr());
      expect(findText, findsOneWidget);
      final findTextField =
          find.ancestor(of: findText, matching: find.byType(TextFormField));
      await tester.tap(findTextField);
      await tester.pumpAndSettle();

      await tester.tap(find.text('SAVE'));
      await tester.pumpAndSettle();

      verify(
        () => allInvoicesFilterBlocMock.add(
          AllInvoicesFilterEvent.setDueDate(
              DateTimeRange(start: fakeFromDate, end: fakeToDate)),
        ),
      ).called(1);
    });

    testWidgets('_DocumentNumberByFilter test', (tester) async {
      when(() => allInvoicesFilterBlocMock.state)
          .thenReturn(AllInvoicesFilterState.initial().copyWith(
        allInvoicesFilter: AllInvoicesFilter.empty(),
      ));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Document Number'.tr());
      expect(findText, findsOneWidget);
      await tester.enterText(
          find.byKey(const Key('filterDocumentNumberField')), '1234567890');
      await tester.pump();
      expect(find.text('1234567899'), findsNothing);
      expect(find.text('1234567890'), findsOneWidget);
    });

    testWidgets('=> _DocumentDateFilterState Test', (tester) async {
      when(() => allInvoicesFilterBlocMock.state)
          .thenReturn(AllInvoicesFilterState.initial().copyWith(
        allInvoicesFilter: AllInvoicesFilter.empty().copyWith(
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
        ),
      ));

      final expectedState = [
        AllInvoicesFilterState.initial().copyWith(
          allInvoicesFilter: AllInvoicesFilter.empty().copyWith(
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
          ),
        ),
      ];
      whenListen(allInvoicesFilterBlocMock, Stream.fromIterable(expectedState));

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
        () => allInvoicesFilterBlocMock.add(
          AllInvoicesFilterEvent.setDocumentDate(
              DateTimeRange(start: fakeFromDate, end: fakeToDate)),
        ),
      ).called(1);
    });

    testWidgets('=> _DebitValueToFilter Test', (tester) async {
      when(() => allInvoicesFilterBlocMock.state)
          .thenReturn(AllInvoicesFilterState.initial().copyWith(
        showErrorMessages: true,
        allInvoicesFilter: AllInvoicesFilter.empty().copyWith(
          debitValueTo: RangeValue('12'),
        ),
      ));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Debit Value To'.tr());
      expect(findText, findsOneWidget);
      final findTextField =
          find.ancestor(of: findText, matching: find.byType(TextFormField));
      await tester.enterText(findTextField, '123456');
      await tester.pump();
      verify(
        () => allInvoicesFilterBlocMock.add(
          AllInvoicesFilterEvent.debitValueToChanged(
              StringUtils.formatter.format(double.parse('123456'))),
        ),
      ).called(1);
    });

    testWidgets('=> _DebitValueFromFilter Test', (tester) async {
      when(() => allInvoicesFilterBlocMock.state)
          .thenReturn(AllInvoicesFilterState.initial().copyWith(
        showErrorMessages: true,
        allInvoicesFilter: AllInvoicesFilter.empty().copyWith(
          debitValueFrom: RangeValue('12'),
        ),
      ));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Debit Value From'.tr());
      expect(findText, findsOneWidget);
      final findTextField =
          find.ancestor(of: findText, matching: find.byType(TextFormField));
      await tester.enterText(findTextField, '12');
      await tester.pump();
      verify(
        () => allInvoicesFilterBlocMock.add(
          AllInvoicesFilterEvent.debitValueFromChanged(
              StringUtils.formatter.format(double.parse('12'))),
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
        () => allInvoicesFilterBlocMock.add(
          const AllInvoicesFilterEvent.applyFilters(),
        ),
      ).called(1);
    });

    testWidgets('=> _ClearButton Test', (tester) async {
      when(() => allInvoicesFilterBlocMock.state)
          .thenReturn(AllInvoicesFilterState.initial().copyWith(
        showErrorMessages: false,
        allInvoicesFilter: AllInvoicesFilter.empty().copyWith(
          debitValueFrom: RangeValue('12'),
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
        () => allInvoicesFilterBlocMock.add(
          const AllInvoicesFilterEvent.clearFilters(),
        ),
      ).called(1);
    });

    testWidgets(
        '=> DebitValueError Test when debitValueTo greater than debitValueFrom',
        (tester) async {
      when(() => allInvoicesFilterBlocMock.state)
          .thenReturn(AllInvoicesFilterState.initial().copyWith(
        showErrorMessages: true,
        allInvoicesFilter: AllInvoicesFilter.empty().copyWith(
          debitValueFrom: RangeValue('15'),
          debitValueTo: RangeValue('12'),
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

      final findInvalidText = find.text('Invalid Debit Value Range!'.tr());
      expect(findInvalidText, findsOneWidget);
      await tester.pump();
    });
  });
}
