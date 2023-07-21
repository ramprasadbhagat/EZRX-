import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class AllCreditsBlocMock extends MockBloc<AllCreditsEvent, AllCreditsState>
    implements AllCreditsBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AllCreditsFilterBlocMock
    extends MockBloc<AllCreditsFilterEvent, AllCreditsFilterState>
    implements AllCreditsFilterBloc {}

void main() {
  late CustomerCodeBloc customerCodeBlocMock;
  late AllCreditsBloc allCreditsBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
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
    salesOrgBlocMock = SalesOrgBlocMock();
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    customerCodeBlocMock = CustomerCodeBlocMock();
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    allCreditsBlocMock = AllCreditsBlocMock();
    when(() => allCreditsBlocMock.state).thenReturn(AllCreditsState.initial());
    allCreditsFilterBlocMock = AllCreditsFilterBlocMock();
    when(() => allCreditsFilterBlocMock.state)
        .thenReturn(AllCreditsFilterState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<AllCreditsFilterBloc>(
            create: (context) => allCreditsFilterBlocMock,
          ),
          BlocProvider<AllCreditsBloc>(
            create: (context) => allCreditsBlocMock,
          ),
          BlocProvider<AllCreditsFilterBloc>(
            create: (context) => allCreditsFilterBlocMock,
          ),
        ],
        child: const Scaffold(
          body: SingleChildScrollView(
            child: AllCreditsFilterBottomSheet(),
          ),
        ),
      ),
    );
  }

  group('All Credits Filter Bottom Sheet Test', () {
    testWidgets('=> Listen When condition', (tester) async {
      final expectedState = [
        AllCreditsFilterState.initial(),
      ];
      whenListen(allCreditsFilterBlocMock, Stream.fromIterable(expectedState));
      await getWidget(tester);
      await tester.pumpAndSettle();
    });

    testWidgets('=> _FilterHeader Test', (tester) async {
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findFilterAllCreditsText = find.text('Filter'.tr());
      expect(findFilterAllCreditsText, findsOneWidget);

      final findIconKey = find.byKey(WidgetKeys.closeButton);
      expect(findIconKey, findsOneWidget);
      await tester.tap(findIconKey);
      await tester.pump();
    });

    testWidgets('=> _DocumentDateFilterState Test', (tester) async {
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial().copyWith(
        filter: AllCreditsFilter.empty().copyWith(
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
          filter: AllCreditsFilter.empty().copyWith(
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

      final toDocumentDateField = find.byKey(WidgetKeys.toDocumentDateField);
      expect(toDocumentDateField, findsOneWidget);
      await tester.tap(toDocumentDateField);
      await tester.pumpAndSettle();

      await tester.tap(find.text('SAVE'));
      await tester.pumpAndSettle();

      verify(
        () => allCreditsFilterBlocMock.add(
          AllCreditsFilterEvent.setDocumentDate(
              DateTimeRange(start: fakeFromDate, end: fakeToDate)),
        ),
      ).called(1);

      final fromDocumentDateField =
          find.byKey(WidgetKeys.fromDocumentDateField);
      expect(fromDocumentDateField, findsOneWidget);
      await tester.tap(fromDocumentDateField);
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
    testWidgets('=> _AmountValueToFilter Test', (tester) async {
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial().copyWith(
        showErrorMessages: true,
        filter: AllCreditsFilter.empty().copyWith(
          amountValueTo: RangeValue('12'),
        ),
      ));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final amountValueTo = find.byKey(WidgetKeys.amountValueTo);
      expect(amountValueTo, findsOneWidget);
      await tester.tap(amountValueTo);
      await tester.pumpAndSettle();
      await tester.enterText(amountValueTo, '123456');
      await tester.pump();
      verify(
        () => allCreditsFilterBlocMock.add(
          AllCreditsFilterEvent.amountValueToChanged(
              StringUtils.formatter.format(double.parse('123456'))),
        ),
      ).called(1);
    });

    testWidgets('=> _AmountValueFromFilter Test', (tester) async {
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial().copyWith(
        showErrorMessages: true,
        filter: AllCreditsFilter.empty().copyWith(
          amountValueFrom: RangeValue('12'),
        ),
      ));

      await getWidget(tester);
      await tester.pumpAndSettle();

      final amountValueFrom = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountValueFrom, findsOneWidget);
      await tester.tap(amountValueFrom);
      await tester.pumpAndSettle();
      await tester.enterText(amountValueFrom, '12');
      await tester.pump();
      verify(
        () => allCreditsFilterBlocMock.add(
          AllCreditsFilterEvent.amountValueFromChanged(
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
        () => allCreditsFilterBlocMock.add(
          const AllCreditsFilterEvent.validateFilters(),
        ),
      ).called(1);
    });

    testWidgets('=> _ResetButton Test', (tester) async {
      when(() => allCreditsFilterBlocMock.state).thenReturn(
        AllCreditsFilterState.initial().copyWith(
          filter:
              AllCreditsFilter.empty().copyWith(filterStatuses: ['Cleared']),
        ),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();

      final findText = find.text('Reset'.tr());
      expect(findText, findsOneWidget);
      final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
      await tester.tap(filterResetButton);
      await tester.pump();
      verify(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets(
        '=> AmountValueError Test when amountValueTo greater than amountValueFrom',
        (tester) async {
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial().copyWith(
        showErrorMessages: true,
        filter: AllCreditsFilter.empty().copyWith(
          amountValueFrom: RangeValue('15'),
          amountValueTo: RangeValue('12'),
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

      final findInvalidText = find.text('Invalid Amount range!'.tr());
      expect(findInvalidText, findsOneWidget);
      await tester.pump();
    });
  });
}
