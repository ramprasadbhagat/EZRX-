import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/filter_drawer.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class ReturnApproverBlocMock
    extends MockBloc<ReturnApproverEvent, ReturnApproverState>
    implements ReturnApproverBloc {}

class ReturnApproverFilterBlocMock
    extends MockBloc<ReturnApproverFilterEvent, ReturnApproverFilterState>
    implements ReturnApproverFilterBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late AppRouter autoRouterMock;
  late ReturnApproverBloc returnApproverBlocMock;
  late ReturnApproverFilterBloc returnApproverFilterBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  final mockReturnApproverFilter = ReturnApproverFilter.empty();

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

  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
      locator.registerLazySingleton(() => AppRouter());
    },
  );

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ReturnApproverBloc>(
          create: (context) => returnApproverBlocMock,
        ),
        BlocProvider<ReturnApproverFilterBloc>(
          create: (context) => returnApproverFilterBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: const ApproverReturnFilterDrawer(),
    );
  }

  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      returnApproverBlocMock = ReturnApproverBlocMock();
      returnApproverFilterBlocMock = ReturnApproverFilterBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      eligibilityBlocMock = EligibilityBlockMock();
      autoRouterMock = locator<AppRouter>();
      when(() => returnApproverBlocMock.state)
          .thenReturn(ReturnApproverState.initial());
      when(() => returnApproverFilterBlocMock.state)
          .thenReturn(ReturnApproverFilterState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    },
  );
  group('Test Action Approver Page', () {
    testWidgets(
      'Approver Return Filter Drawer',
      (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(find.byKey(const Key('approverReturnFilter')), findsOneWidget);
        expect(find.text('Apply Filters'.tr()), findsOneWidget);
        expect(find.byKey(const Key('filterCrossButton')), findsOneWidget);
        expect(find.byKey(const Key('filterReturnIdField')), findsOneWidget);
        expect(find.byKey(const Key('filterCreatedBy')), findsOneWidget);
        expect(find.byKey(const Key('shipToSearchField')), findsOneWidget);
        expect(find.byKey(const Key('soldToSearchField')), findsOneWidget);
        expect(
          find.byKey(
            Key(
              'filterInvoiceDateField+${mockReturnApproverFilter.getFilteredInvoiceDate}',
            ),
          ),
          findsOneWidget,
        );
        expect(find.byKey(const Key('filterApplyButton')), findsOneWidget);
        expect(find.byKey(const Key('filterClearButton')), findsOneWidget);
      },
    );

    testWidgets(
      'Approver Return Filter Drawer Clear Button Test',
      (tester) async {
        final expectedStates = [
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty(),
          ),
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              returnId: SearchKey.search('1'),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(find.byKey(const Key('approverReturnFilter')), findsOneWidget);
        final clearButton = find.byKey(const Key('filterClearButton'));
        expect(clearButton, findsOneWidget);
        await tester.tap(clearButton);
        verify(
          () => returnApproverFilterBlocMock.add(
            const ReturnApproverFilterEvent.initialized(),
          ),
        ).called(1);
      },
    );
  });

  group('Test Action Approver Page returnId field', () {
    testWidgets(
      'Approver Return Filter Drawer ReturnId 1 character',
      (tester) async {
        final expectedStates = [
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty(),
          ),
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              returnId: SearchKey.search('1'),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(find.byKey(const Key('approverReturnFilter')), findsOneWidget);
        expect(find.text('Apply Filters'.tr()), findsOneWidget);
        expect(find.byKey(const Key('filterClearButton')), findsOneWidget);

        final filterReturnIdField =
            find.byKey(const Key('filterReturnIdField'));
        expect(filterReturnIdField, findsOneWidget);
        await tester.enterText(filterReturnIdField, '2');
        await tester.pump();

        expect(
          find.text('Please enter at least 2 characters.'.tr()),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Approver Return Filter Drawer ReturnId Empty',
      (tester) async {
        when(() => returnApproverFilterBlocMock.state).thenReturn(
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final filterReturnIdField =
            find.byKey(const Key('filterReturnIdField'));
        expect(filterReturnIdField, findsOneWidget);
        await tester.enterText(filterReturnIdField, '1');
        await tester.pump();

        expect(
          find.text('Please enter at least 2 characters.'.tr()),
          findsNothing,
        );
      },
    );
  });

  group('Test Action Approver Page CreatedByFilter field', () {
    testWidgets(
      'Approver Return Filter Drawer CreatedByFilter 1 character',
      (tester) async {
        final expectedStates = [
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty(),
          ),
          ReturnApproverFilterState.initial().copyWith(
            isSubmitting: true,
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              createdBy: SearchKey.search('1'),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final filterCreatedBy = find.byKey(const Key('filterCreatedBy'));
        expect(filterCreatedBy, findsOneWidget);
        await tester.enterText(filterCreatedBy, '2');
        await tester.pump();

        expect(
          find.text('Please enter at least 2 characters.'.tr()),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Approver Return Filter Drawer CreatedByFilter Empty',
      (tester) async {
        when(() => returnApproverFilterBlocMock.state).thenReturn(
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final filterCreatedBy = find.byKey(const Key('filterCreatedBy'));
        expect(filterCreatedBy, findsOneWidget);
        await tester.enterText(filterCreatedBy, '1');
        await tester.pump();

        expect(
          find.text('Please enter at least 2 characters.'.tr()),
          findsNothing,
        );
      },
    );
  });

  group('Test Action Approver Page ShipToFilter field', () {
    testWidgets(
      'Approver Return Filter Drawer ShipToFilter 1 character',
      (tester) async {
        final expectedStates = [
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty(),
          ),
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              shipTo: SearchKey.search('1'),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final shipToSearchField = find.byKey(const Key('shipToSearchField'));
        expect(shipToSearchField, findsOneWidget);
        await tester.enterText(shipToSearchField, '2');
        await tester.pump();

        expect(
          find.text('Please enter at least 2 characters.'.tr()),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Approver Return Filter Drawer ShipToFilter Empty',
      (tester) async {
        when(() => returnApproverFilterBlocMock.state).thenReturn(
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final shipToSearchField = find.byKey(const Key('shipToSearchField'));
        expect(shipToSearchField, findsOneWidget);
        await tester.enterText(shipToSearchField, '1');
        await tester.pump();

        expect(
          find.text('Please enter at least 2 characters.'.tr()),
          findsNothing,
        );
      },
    );
  });

  group('Test Action Approver Page SoldToFilter field', () {
    testWidgets(
      'Approver Return Filter Drawer soldToSearchField 1 character',
      (tester) async {
        final expectedStates = [
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty(),
          ),
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              soldTo: SearchKey.search('1'),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final soldToSearchField = find.byKey(const Key('soldToSearchField'));
        expect(soldToSearchField, findsOneWidget);
        await tester.enterText(soldToSearchField, '2');
        await tester.pump();

        expect(
          find.text('Please enter at least 2 characters.'.tr()),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Approver Return Filter Drawer soldToSearchField Empty',
      (tester) async {
        when(() => returnApproverFilterBlocMock.state).thenReturn(
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final soldToSearchField = find.byKey(const Key('soldToSearchField'));
        expect(soldToSearchField, findsOneWidget);
        await tester.enterText(soldToSearchField, '1');
        await tester.pump();

        expect(
          find.text('Please enter at least 2 characters.'.tr()),
          findsNothing,
        );
      },
    );
  });

  group('Test Action Approver Page InvoiceDateFilter field', () {
    testWidgets(
      'Approver Return Filter Drawer InvoiceDateFilter test',
      (tester) async {
        final expectedStates = [
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
          ),
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              fromInvoiceDate:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              toInvoiceDate:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final filterFromDateField = find.byKey(
          Key(
            'filterInvoiceDateField+${mockReturnApproverFilter.getFilteredInvoiceDate}',
          ),
        );
        expect(filterFromDateField, findsOneWidget);
        await tester.tap(filterFromDateField);
        await tester.pumpAndSettle();
        final saveButton = find.text('Save');
        expect(saveButton, findsOneWidget);
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(saveButton, findsNothing);

        verify(
          () => returnApproverFilterBlocMock.add(
            ReturnApproverFilterEvent.setInvoiceDate(
              DateTimeRange(start: fakeFromDate, end: fakeToDate),
            ),
          ),
        ).called(1);
      },
    );
  });
}
