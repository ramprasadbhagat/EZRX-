import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/filter_drawer.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';
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

class CountlyServiceMock extends Mock implements CountlyService {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

void main() {
  late AppRouter autoRouterMock;
  late ReturnApproverBloc returnApproverBlocMock;
  late ReturnApproverFilterBloc returnApproverFilterBlocMock;
  late CountlyService countlyService;
  late ShipToCodeBloc shipToCodeBlocMock;
  late SalesOrgBloc salesOrgBlocMock;

  final fakeToDate = DateTime.parse(DateFormat('yyyyMMdd')
      .format(DateTime.now().add(const Duration(days: 1))));

  final fakeFormDate =
      DateTime.parse(DateFormat('yyyyMMdd').format(DateTime.now()));

  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
      countlyService = CountlyServiceMock();
      locator.registerLazySingleton(() => countlyService);
    },
  );

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      providers: [
        BlocProvider<ReturnApproverBloc>(
            create: (context) => returnApproverBlocMock),
        BlocProvider<ReturnApproverFilterBloc>(
          create: (context) => returnApproverFilterBlocMock,
        ),
        BlocProvider<ShipToCodeBloc>(
          create: (context) => shipToCodeBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
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
      shipToCodeBlocMock = ShipToCodeBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => returnApproverBlocMock.state)
          .thenReturn(ReturnApproverState.initial());
      when(() => returnApproverFilterBlocMock.state)
          .thenReturn(ReturnApproverFilterState.initial());
      when(
        () => countlyService.recordCountlyView('approver_actions'),
      ).thenAnswer((invocation) async => Future.value());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
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
        expect(find.byKey(const Key('filterFromDateField')), findsOneWidget);
        expect(find.byKey(const Key('filterToDateField')), findsOneWidget);
        expect(find.byKey(const Key('filterApplyButton')), findsOneWidget);
        expect(find.byKey(const Key('filterClearButton')), findsOneWidget);
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
              returnId: SearchKey.searchFilter('1'),
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
            find.text('Search input must be greater than 2 characters.'.tr()),
            findsOneWidget);
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
            find.text('Search input must be greater than 2 characters.'.tr()),
            findsNothing);
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
              createdBy: SearchKey.searchFilter('1'),
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
            find.text('Search input must be greater than 2 characters.'.tr()),
            findsOneWidget);
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
            find.text('Search input must be greater than 2 characters.'.tr()),
            findsNothing);
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
              shipTo: SearchKey.searchFilter('1'),
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
            find.text('Search input must be greater than 2 characters.'.tr()),
            findsOneWidget);
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
            find.text('Search input must be greater than 2 characters.'.tr()),
            findsNothing);
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
              soldTo: SearchKey.searchFilter('1'),
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
            find.text('Search input must be greater than 2 characters.'.tr()),
            findsOneWidget);
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
            find.text('Search input must be greater than 2 characters.'.tr()),
            findsNothing);
      },
    );
  });

  group('Test Action Approver Page FromInvoiceDateFilter field', () {
    testWidgets(
      'Approver Return Filter Drawer FromInvoiceDateFilter valid toInvoiceDateFilter notvalid',
      (tester) async {
        final expectedStates = [
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
          ),
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              fromInvoiceDate: InvoiceDate(fakeFormDate.toIso8601String()),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final filterFromDateField =
            find.byKey(const Key('filterFromDateField'));
        expect(filterFromDateField, findsOneWidget);
        expect(
            (tester.firstWidget(filterFromDateField) as TextFormField)
                .controller
                ?.text,
            DateFormat('dd/MM/yyyy').format(fakeFormDate));
        expect(find.text('Invalid Date'.tr()), findsOneWidget);
      },
    );

    testWidgets(
      'Approver Return Filter Drawer FromInvoiceDateFilter valid toInvoiceDateFilter valid',
      (tester) async {
        when(() => returnApproverFilterBlocMock.state).thenReturn(
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              fromInvoiceDate: InvoiceDate(fakeFormDate.toIso8601String()),
              toInvoiceDate: InvoiceDate(fakeToDate.toIso8601String()),
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final filterFromDateField =
            find.byKey(const Key('filterFromDateField'));
        expect(filterFromDateField, findsOneWidget);

        expect(find.text('Invalid Date'.tr()), findsNothing);
        expect(
            ReturnApproverFilterState.initial()
                .copyWith(
                  approverReturnFilter: ReturnApproverFilter.empty().copyWith(
                    fromInvoiceDate: InvoiceDate(
                      fakeFormDate.toIso8601String(),
                    ),
                    toInvoiceDate: InvoiceDate(
                      fakeToDate.toIso8601String(),
                    ),
                  ),
                )
                .anyFilterApplied,
            true);
      },
    );

    testWidgets(
      'Approver Return Filter Drawer fromInvoiceDateFilter Date Enter',
      (tester) async {
        final expectedStates = [
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
          ),
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              fromInvoiceDate: InvoiceDate(fakeFormDate.toIso8601String()),
              toInvoiceDate: InvoiceDate(fakeToDate.toIso8601String()),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final filterFromDateField =
            find.byKey(const Key('filterFromDateField'));
        expect(filterFromDateField, findsOneWidget);
        await tester.tap(filterFromDateField);
        await tester.pumpAndSettle();

        expect(find.text('OK'.tr()), findsOneWidget);
        await tester.tap(find.text('OK'.tr()));
        verify(
          () => returnApproverFilterBlocMock.add(
            ReturnApproverFilterEvent.setfromInvoiceDate(
                fromDate: fakeFormDate),
          ),
        ).called(1);
      },
    );
  });

  group('Test Action Approver Page ToInvoiceDateFilter field', () {
    testWidgets(
      'Approver Return Filter Drawer ToInvoiceDateFilter valid FromInvoiceDateFilter notvalid ',
      (tester) async {
        final expectedStates = [
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
          ),
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              toInvoiceDate: InvoiceDate(fakeToDate.toIso8601String()),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final filterToDateField = find.byKey(const Key('filterToDateField'));
        expect(filterToDateField, findsOneWidget);
        expect(
          (tester.firstWidget(filterToDateField) as TextFormField)
              .controller
              ?.text,
          DateFormat('dd/MM/yyyy').format(fakeToDate),
        );
        expect(find.text('Invalid Date'.tr()), findsOneWidget);
      },
    );

    testWidgets(
      'Approver Return Filter Drawer ToInvoiceDateFilter valid FromInvoiceDateFilter valid ',
      (tester) async {
        when(() => returnApproverFilterBlocMock.state).thenReturn(
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              fromInvoiceDate: InvoiceDate(fakeFormDate.toIso8601String()),
              toInvoiceDate: InvoiceDate(fakeToDate.toIso8601String()),
            ),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final filterToDateField = find.byKey(const Key('filterToDateField'));
        expect(filterToDateField, findsOneWidget);
        expect(
          (tester.firstWidget(filterToDateField) as TextFormField)
              .controller
              ?.text,
          DateFormat('dd/MM/yyyy').format(fakeToDate),
        );
        expect(find.text('Invalid Date'.tr()), findsNothing);
        expect(find.byKey(const Key('filterClearButton')), findsOneWidget);
        await tester.tap(find.byKey(const Key('filterClearButton')));
        await tester.pump();
        verify(
          () => returnApproverFilterBlocMock.add(
            const ReturnApproverFilterEvent.initialized(),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Approver Return Filter Drawer toInvoiceDateFilter Date Enter',
      (tester) async {
        final expectedStates = [
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
          ),
          ReturnApproverFilterState.initial().copyWith(
            showErrorMessages: true,
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              fromInvoiceDate: InvoiceDate(fakeFormDate
                  .subtract(const Duration(days: 3))
                  .toIso8601String()),
              toInvoiceDate: InvoiceDate(fakeToDate
                  .subtract(const Duration(days: 2))
                  .toIso8601String()),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final filterToDateField = find.byKey(const Key('filterToDateField'));
        expect(filterToDateField, findsOneWidget);
        await tester.tap(filterToDateField);
        await tester.pumpAndSettle();

        expect(find.text('OK'.tr()), findsOneWidget);
        await tester.tap(find.text('OK'.tr()));
        verify(
          () => returnApproverFilterBlocMock.add(
            ReturnApproverFilterEvent.setToInvoiceDate(
                toDate: fakeToDate.subtract(const Duration(days: 2))),
          ),
        ).called(1);
      },
    );
  });
}
