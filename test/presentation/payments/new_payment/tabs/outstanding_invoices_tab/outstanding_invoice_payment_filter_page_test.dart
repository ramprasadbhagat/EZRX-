import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/outstanding_invoices_tab/outstanding_invoice_payment_filter_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/widget_utils.dart';
import '../../new_payment_page_test.dart';

void main() {
  late AccountSummaryBloc accountSummaryBlocMock;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late OutstandingInvoiceFilterBloc outstandingInvoiceFilterBlocMock;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late AvailableCreditFilterBloc availableCreditFilterBlocMock;
  late NewPaymentBloc newPaymentBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBloc eligibilityBlocMock;

  final salesOrg = SalesOrganisationConfigs.empty().copyWith(
    currency: Currency('myr'),
  );

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
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    accountSummaryBlocMock = AccountSummaryBlocMock();
    outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
    outstandingInvoiceFilterBlocMock = OutstandingInvoiceFilterBlocMock();
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    availableCreditFilterBlocMock = AvailableCreditFilterBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlockMock();

    when(() => accountSummaryBlocMock.state)
        .thenReturn(AccountSummaryState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => outstandingInvoiceFilterBlocMock.state)
        .thenReturn(OutstandingInvoiceFilterState.initial());
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => availableCreditFilterBlocMock.state)
        .thenReturn(AvailableCreditFilterState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<AccountSummaryBloc>(
          create: (context) => accountSummaryBlocMock,
        ),
        BlocProvider<OutstandingInvoicesBloc>(
          create: (context) => outstandingInvoicesBlocMock,
        ),
        BlocProvider<OutstandingInvoiceFilterBloc>(
          create: (context) => outstandingInvoiceFilterBlocMock,
        ),
        BlocProvider<AvailableCreditsBloc>(
          create: (context) => availableCreditsBlocMock,
        ),
        BlocProvider<AvailableCreditFilterBloc>(
          create: (context) => availableCreditFilterBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: const Scaffold(
        body: OutstandingInvoicePaymentFilterPage(),
      ),
    );
  }

  group('Outstanding invoice filter test', () {
    testWidgets('Filter title show', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final filterTitle = find.text('Filter');
      expect(filterTitle, findsOneWidget);
    });

    testWidgets('Close button show', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final closeButton = find.byKey(WidgetKeys.closeButton);
      expect(closeButton, findsOneWidget);
    });

    testWidgets('Invoice filter', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: salesOrg,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final textDocumentDate = find.text('Document date');
      expect(textDocumentDate, findsOneWidget);

      final fromDateFilter = find.byKey(WidgetKeys.fromDocumentDateField);
      expect(fromDateFilter, findsOneWidget);

      final toDateFilter = find.byKey(WidgetKeys.toDocumentDateField);
      expect(toDateFilter, findsOneWidget);

      final amountRangeText = find.text('Amount range (MYR)');
      expect(amountRangeText, findsOneWidget);

      final amountValueFrom = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountValueFrom, findsOneWidget);

      final amountValueTo = find.byKey(WidgetKeys.amountValueTo);
      expect(amountValueTo, findsOneWidget);

      final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
      expect(filterResetButton, findsOneWidget);

      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      expect(filterApplyButton, findsOneWidget);

      await tester.tap(filterApplyButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      tester.printToConsole('apply button click');
    });

    testWidgets(
      'FromDocumentDateFilter test',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: salesOrg,
          ),
        );
        final expectedStates = [
          OutstandingInvoiceFilterState.initial().copyWith(
            filter: OutstandingInvoiceFilter.empty().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
            ),
          ),
        ];
        whenListen(
          outstandingInvoiceFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final filterFromDateField = find.byKey(
          WidgetKeys.fromDocumentDateField,
        );
        expect(filterFromDateField, findsOneWidget);
        await tester.tap(filterFromDateField);
        await tester.pumpAndSettle();
        final saveButton = find.text('SAVE');
        expect(saveButton, findsOneWidget);
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(saveButton, findsNothing);

        verify(
          () => outstandingInvoiceFilterBlocMock.add(
            OutstandingInvoiceFilterEvent.setDocumentDate(
              documentDateRange:
                  DateTimeRange(start: fakeFromDate, end: fakeToDate),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'ToDocumentDateFilter test',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: salesOrg,
          ),
        );
        final expectedStates = [
          OutstandingInvoiceFilterState.initial().copyWith(
            filter: OutstandingInvoiceFilter.empty().copyWith(
              documentDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              documentDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
            ),
          ),
        ];
        whenListen(
          outstandingInvoiceFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final dateField = find.byKey(
          WidgetKeys.toDocumentDateField,
        );
        expect(dateField, findsOneWidget);
        await tester.tap(dateField);
        await tester.pumpAndSettle();
        final saveButton = find.text('SAVE');
        expect(saveButton, findsOneWidget);
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(saveButton, findsNothing);

        verify(
          () => outstandingInvoiceFilterBlocMock.add(
            OutstandingInvoiceFilterEvent.setDocumentDate(
              documentDateRange:
                  DateTimeRange(start: fakeFromDate, end: fakeToDate),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'FromDueDateFilter test',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: salesOrg,
          ),
        );
        final expectedStates = [
          OutstandingInvoiceFilterState.initial().copyWith(
            filter: OutstandingInvoiceFilter.empty().copyWith(
              dueDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              dueDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
            ),
          ),
        ];
        whenListen(
          outstandingInvoiceFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final dateField = find.byKey(
          WidgetKeys.fromDueDateField,
        );
        expect(dateField, findsOneWidget);
        await tester.tap(dateField);
        await tester.pumpAndSettle();
        final saveButton = find.text('SAVE');
        expect(saveButton, findsOneWidget);
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(saveButton, findsNothing);

        verify(
          () => outstandingInvoiceFilterBlocMock.add(
            OutstandingInvoiceFilterEvent.setDueDate(
              dueDateRange: DateTimeRange(start: fakeFromDate, end: fakeToDate),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'ToDueDateFilter test',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: salesOrg,
          ),
        );
        final expectedStates = [
          OutstandingInvoiceFilterState.initial().copyWith(
            filter: OutstandingInvoiceFilter.empty().copyWith(
              dueDateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              dueDateTo:
                  DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
            ),
          ),
        ];
        whenListen(
          outstandingInvoiceFilterBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final dateField = find.byKey(
          WidgetKeys.toDueDateField,
        );
        expect(dateField, findsOneWidget);
        await tester.tap(dateField);
        await tester.pumpAndSettle();
        final saveButton = find.text('SAVE');
        expect(saveButton, findsOneWidget);
        await tester.tap(saveButton);
        await tester.pumpAndSettle();
        expect(saveButton, findsNothing);

        verify(
          () => outstandingInvoiceFilterBlocMock.add(
            OutstandingInvoiceFilterEvent.setDueDate(
              dueDateRange: DateTimeRange(start: fakeFromDate, end: fakeToDate),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets('Edit amount filter test', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: salesOrg,
        ),
      );

      when(() => outstandingInvoiceFilterBlocMock.state).thenReturn(
        OutstandingInvoiceFilterState.initial(),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final amountValueFrom = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountValueFrom, findsOneWidget);

      await tester.enterText(amountValueFrom, '26');
      await tester.pump();

      verify(
        () => outstandingInvoiceFilterBlocMock.add(
          const OutstandingInvoiceFilterEvent.setAmountFrom(
            amountFrom: '26',
          ),
        ),
      );

      final amountValueTo = find.byKey(WidgetKeys.amountValueTo);
      expect(amountValueTo, findsOneWidget);

      await tester.enterText(amountValueTo, '100');
      await tester.pump();

      verify(
        () => outstandingInvoiceFilterBlocMock.add(
          const OutstandingInvoiceFilterEvent.setAmountTo(
            amountTo: '100',
          ),
        ),
      );
    });

    testWidgets('Status filter test', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: salesOrg,
        ),
      );

      when(() => outstandingInvoiceFilterBlocMock.state).thenReturn(
        OutstandingInvoiceFilterState.initial(),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final checkBoxOpen = find.byType(CheckboxListTile).first;

      await tester.tap(checkBoxOpen);
      await tester.pumpAndSettle();

      verify(
        () => outstandingInvoiceFilterBlocMock.add(
          OutstandingInvoiceFilterEvent.setOutstandingInvoiceStatus(
            status: outstandingInvoiceFilterBlocMock.state.statusList.first,
            value: true,
          ),
        ),
      );
    });
  });
}
