import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return_filter/request_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:ezrxmobile/presentation/returns/request_return_filter_drawer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class RequestReturnFilterMockBloc
    extends MockBloc<RequestReturnFilterEvent, RequestReturnFilterState>
    implements RequestReturnFilterBloc {}

class RequestReturnBlocMock
    extends MockBloc<RequestReturnEvent, RequestReturnState>
    implements RequestReturnBloc {}

class MockAppRouter extends Mock implements AppRouter {}

void main() {
  late GetIt locator;
  final mockRequestReturnFilterBloc = RequestReturnFilterMockBloc();
  final mockRequestReturnFilter = RequestReturnFilter.empty();
  late MockAppRouter autoRouterMock;

  setUpAll(() {
    locator = GetIt.instance;
    locator.registerLazySingleton(() => MockAppRouter());
    locator.registerLazySingleton(() => mockRequestReturnFilterBloc);
  });

  group(
    'Test Request Return Filter => ',
    () {
      setUp(() {
        autoRouterMock = locator<MockAppRouter>();

        when(() => mockRequestReturnFilterBloc.state)
            .thenReturn(RequestReturnFilterState.initial());
        autoRouterMock = locator<MockAppRouter>();
        when(() => autoRouterMock.popForced())
            .thenAnswer((invocation) async => true);
      });

      Widget getWUT() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<RequestReturnFilterBloc>(
                create: (context) => mockRequestReturnFilterBloc),
          ],
          child: const RequestReturnFilterDrawer(),
        );
      }

      testWidgets('Request Return Filter test ', (tester) async {
        final expectedStates = [
          RequestReturnFilterState.initial().copyWith(
            isSubmitting: false,
          ),
        ];
        whenListen(
            mockRequestReturnFilterBloc, Stream.fromIterable(expectedStates));

        when(() => mockRequestReturnFilterBloc.state).thenReturn(
          RequestReturnFilterState.initial().copyWith(
            isSubmitting: true,
            showErrorMessages: true,
            requestReturnFilter: mockRequestReturnFilter,
          ),
        );

        await tester.pumpWidget(getWUT());
        final requestReturnFilter =
            find.byKey(const Key('requestReturnFilter'));
        final filterInvoiceNumberField =
            find.byKey(const Key('filterInvoiceNumberField'));
        final filterBatchNumberField =
            find.byKey(const Key('filterBatchNumberField'));
        final filterMaterialNumberSearchField =
            find.byKey(const Key('filterMaterialNumberSearchField'));
        final filterMaterialDescriptionField =
            find.byKey(const Key('filterMaterialDescriptionField'));
        final filterPrincipalSearchField =
            find.byKey(const Key('filterPrincipalSearchField'));
        final filteInvoiceFromdateField =
            find.byKey(const Key('filteInvoiceFromdateField'));
        final filterInvoiceTodateField =
            find.byKey(const Key('filterInvoiceTodateField'));
        final filterclearButton = find.byKey(const Key('filterClearButton'));
        final filterapplyButton = find.byKey(const Key('filterApplyButton'));
        final filtercrossButton = find.byKey(const Key('filterCrossButton'));
        expect(requestReturnFilter, findsOneWidget);
        expect(filterInvoiceNumberField, findsOneWidget);
        expect(filterBatchNumberField, findsOneWidget);
        expect(filterMaterialNumberSearchField, findsOneWidget);
        expect(filterMaterialDescriptionField, findsOneWidget);
        expect(filterPrincipalSearchField, findsOneWidget);
        expect(filteInvoiceFromdateField, findsOneWidget);
        expect(filterInvoiceTodateField, findsOneWidget);
        expect(filterclearButton, findsOneWidget);
        expect(filterapplyButton, findsOneWidget);
        expect(filtercrossButton, findsOneWidget);

        await tester.enterText(filterInvoiceNumberField, '12');
        await tester.pump();

        final invoiceIdTextFieldText = find.text('12');
        expect(invoiceIdTextFieldText, findsOneWidget);

        final minLengthErrorMessage =
            find.text('Search input must be greater than 2 characters.');
        await tester.pump();

        expect(minLengthErrorMessage, findsNothing);
      });

      testWidgets('Reuqest Return Filter Loading test ', (tester) async {
        final expectedStates = [
          RequestReturnFilterState.initial().copyWith(
            isSubmitting: false,
          ),
          RequestReturnFilterState.initial().copyWith(
            isSubmitting: true,
          ),
        ];
        whenListen(
            mockRequestReturnFilterBloc, Stream.fromIterable(expectedStates));

        when(() => mockRequestReturnFilterBloc.state).thenReturn(
          RequestReturnFilterState.initial().copyWith(
              isSubmitting: true, requestReturnFilter: mockRequestReturnFilter),
        );
        when(() => autoRouterMock.pop()).thenAnswer((invocation) async => true);

        await tester.pumpWidget(getWUT());

        final requestReturnFilterLoader = find.text('loader');
        expect(requestReturnFilterLoader, findsNothing);
      });

      testWidgets('Filter with assignment number', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(getWUT());
        });

        await tester.pump();
        await tester.enterText(
            find.byKey(const Key('filterInvoiceNumberField')), '020');
        await tester.pump();
        expect(find.text('123'), findsNothing);
        expect(find.text('020'), findsOneWidget);
      });

      /*testWidgets('Filter validation with assignment number', (tester) async {
        await tester.pumpWidget(getWUT());
        await tester.pump();
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        final expectedStates = [
          RequestReturnFilterState.initial().copyWith(
            isSubmitting: false,
            showErrorMessages: false,
            requestReturnFilter: RequestReturnFilter.empty()
                .copyWith(assignmentNumber: SearchKey.searchFilter('20')),
          ),
          RequestReturnFilterState.initial().copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            requestReturnFilter: RequestReturnFilter.empty()
                .copyWith(assignmentNumber: SearchKey.searchFilter('20')),
          ),
        ];
        whenListen(
            mockRequestReturnFilterBloc, Stream.fromIterable(expectedStates));
        final invoiceKey = find.byKey(const Key('filterInvoiceNumberField'));
        expect(invoiceKey, findsOneWidget);
        await tester.enterText(invoiceKey, '20');
        await tester.pump(const Duration(seconds: 4));
        final test = find.text('20');
        expect(test, findsOneWidget);
        final filterapplyButton = find.byKey(const Key('filterApplyButton'));
        expect(filterapplyButton, findsOneWidget);

        await tester.tap(filterapplyButton);
        await tester.pump(const Duration(seconds: 4));
        final minLengthErrorMessage = find.text('Enter at least 3 characters.');
        await tester.pump();

        // expect(minLengthErrorMessage, findsOneWidget);
      });*/

      testWidgets('Filter with batch number', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(getWUT());
        });

        await tester.pump();
        await tester.enterText(
            find.byKey(const Key('filterBatchNumberField')), '100');
        await tester.pump();
        expect(find.text('123'), findsNothing);
        expect(find.text('100'), findsOneWidget);
      });

      testWidgets('Filter with filterMaterialDescriptionField', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(getWUT());
        });

        await tester.pump();
        await tester.enterText(
            find.byKey(const Key('filterMaterialDescriptionField')), '188');
        await tester.pump();
        expect(find.text('123'), findsNothing);
        expect(find.text('188'), findsOneWidget);
      });

      testWidgets('Filter with filterMaterialNumberSearchField',
          (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(getWUT());
        });

        await tester.pump();
        await tester.enterText(
            find.byKey(const Key('filterMaterialNumberSearchField')), '199');
        await tester.pump();
        expect(find.text('123'), findsNothing);
        expect(find.text('199'), findsOneWidget);
      });

      testWidgets('Filter with filterPrincipalSearchField', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(getWUT());
        });

        await tester.pump();
        await tester.enterText(
            find.byKey(const Key('filterPrincipalSearchField')), '199');
        await tester.pump();
        expect(find.text('123'), findsNothing);
        expect(find.text('199'), findsOneWidget);
      });

      testWidgets('Apply Filter', (tester) async {
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final filterapplyButton = find.byKey(const Key('filterApplyButton'));
        expect(filterapplyButton, findsOneWidget);
        when(() => mockRequestReturnFilterBloc.state).thenReturn(
          RequestReturnFilterState.initial()
              .copyWith(isSubmitting: true, showErrorMessages: true),
        );
        await tester.tap(filterapplyButton);
        await tester.pumpAndSettle(const Duration(seconds: 2));
      });

      testWidgets('Clear Filter', (tester) async {
        when(() => mockRequestReturnFilterBloc.state).thenReturn(
          RequestReturnFilterState.initial()
              .copyWith(requestReturnFilter: mockRequestReturnFilter),
        );

        await tester.pumpWidget(getWUT());

        final filterclearButton = find.byKey(const Key('filterClearButton'));
        expect(filterclearButton, findsOneWidget);
        await tester.tap(filterclearButton);
        await tester.pumpAndSettle(const Duration(seconds: 2));
        verify(() => autoRouterMock.popForced()).called(2);
      });

      testWidgets('fill invoiceFromDate', (tester) async {
        when(() => mockRequestReturnFilterBloc.state).thenReturn(
          RequestReturnFilterState.initial()
              .copyWith(requestReturnFilter: mockRequestReturnFilter),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final fromdateField =
            find.byKey(const Key('filteInvoiceFromdateField'));
        expect(fromdateField, findsOneWidget);
        await tester.tap(fromdateField);
        await tester.pumpAndSettle(const Duration(seconds: 2));
        expect(find.byType(DatePickerDialog), findsOneWidget);

        final okButton = find.text('OK');
        await tester.tap(okButton);
        await tester.pump();
      });

      testWidgets('fill invoiceToDate', (tester) async {
        when(() => mockRequestReturnFilterBloc.state).thenReturn(
          RequestReturnFilterState.initial()
              .copyWith(requestReturnFilter: mockRequestReturnFilter),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final fromdateField = find.byKey(const Key('filterInvoiceTodateField'));
        expect(fromdateField, findsOneWidget);
        await tester.tap(fromdateField);
        await tester.pump();
        expect(find.byType(DatePickerDialog), findsOneWidget);

        final okButton = find.text('OK');
        expect(okButton, findsOneWidget);
        // await tester.tap(okButton);
        // await tester.pump();
      });

      testWidgets('Click on close button', (tester) async {
        when(() => mockRequestReturnFilterBloc.state)
            .thenReturn(RequestReturnFilterState.initial());
        when(() => mockRequestReturnFilterBloc.state).thenReturn(
          RequestReturnFilterState.initial().copyWith(isSubmitting: true),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();
        final filtercrossButton = find.byKey(const Key('filterCrossButton'));
        await tester.tap(filtercrossButton);
        await tester.pumpAndSettle(const Duration(seconds: 3));
        verify(() => autoRouterMock.popForced()).called(1);
      });
    },
  );
}
