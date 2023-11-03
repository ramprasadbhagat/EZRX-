import 'package:dartz/dartz.dart';
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
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab/available_credits_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/widget_utils.dart';
import '../../new_payment_test.dart';

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
  late List<CustomerOpenItem> fakeCredits;

  final creditFilter = AvailableCreditFilter.empty().copyWith(
    amountValueFrom: RangeValue('100'),
    amountValueTo: RangeValue('10'),
    documentDateFrom: DateTimeStringValue('-'),
    documentDateTo: DateTimeStringValue('-'),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
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

    fakeCredits = await NewPaymentLocalDataSource().getCustomerOpenItems();
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
        body: AvailableCreditsTab(),
      ),
    );
  }

  group('Available credit tab test', () {
    testWidgets('Search bar show', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final searchBar = find.byKey(WidgetKeys.availableCreditTabSearchBarKey);
      expect(searchBar, findsOneWidget);
    });

    testWidgets('Search test', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();

      final textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);

      await tester.enterText(textFormField, '26');
      await tester.pumpAndSettle();

      final searchIcon = find.byKey(WidgetKeys.searchIconKey);
      expect(searchIcon, findsOneWidget);

      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: availableCreditsBlocMock.state.appliedFilter,
            searchKey: SearchKey.search('26'),
          ),
        ),
      );
    });

    testWidgets('Clear search test', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(
          searchKey: SearchKey.search('26'),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final clearIcon = find.byKey(WidgetKeys.clearIconKey);
      expect(clearIcon, findsOneWidget);

      await tester.tap(clearIcon);
      await tester.pumpAndSettle();

      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: availableCreditsBlocMock.state.appliedFilter,
            searchKey: SearchKey.search(''),
          ),
        ),
      );
    });

    testWidgets('Loading view', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(isLoading: true, items: []),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final availableText = find.byKey(WidgetKeys.loaderImage);
      expect(availableText, findsOneWidget);
    });

    testWidgets('No record', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(isLoading: false, items: []),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final noRecordTitleText = find.text('No available credits');
      final noRecordSubTitleText =
          find.textContaining('Available credit notes will be shown here');
      expect(noRecordTitleText, findsOneWidget);
      expect(noRecordSubTitleText, findsOneWidget);
    });

    testWidgets('First item credit show', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial()
            .copyWith(isLoading: false, items: fakeCredits),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final availableText = find.text('Invoice #1100001163');
      expect(availableText, findsAtLeastNWidgets(1));

      final dateText = find.text('31 Jul 2023');
      expect(dateText, findsAtLeastNWidgets(1));

      final documentReferenceID = find.text('0800072883');
      expect(documentReferenceID, findsAtLeastNWidgets(1));

      final priceText = find.byKey(WidgetKeys.priceComponent);
      expect(priceText, findsAtLeastNWidgets(1));
    });

    testWidgets('Select credit test', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial()
            .copyWith(isLoading: false, items: fakeCredits),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final creditBox = find.byType(EdgeCheckbox);
      expect(creditBox, findsAtLeastNWidgets(1));

      await tester.tap(creditBox.first);
      await tester.pumpAndSettle();

      verify(
        () => newPaymentBlocMock.add(
          NewPaymentEvent.toggleCredit(selected: true, item: fakeCredits.first),
        ),
      );
    });

    testWidgets('Refresh test', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial()
            .copyWith(isLoading: false, items: fakeCredits),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      await tester.drag(
        find.byType(
          RefreshIndicator,
        ),
        const Offset(0.0, 100.0),
      );
      await tester.pump(const Duration(seconds: 2));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump();

      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.empty(),
            searchKey: availableCreditsBlocMock.state.searchKey,
          ),
        ),
      );
    });

    testWidgets('Load more test', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(
          canLoadMore: true,
          failureOrSuccessOption: optionOf(
            Right(fakeCredits),
          ),
          items: [
            ...fakeCredits,
            ...fakeCredits,
            ...fakeCredits,
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      await tester.drag(
        find.byType(CustomScrollView),
        const Offset(0.0, -2000),
      );

      await tester.pumpAndSettle(const Duration(microseconds: 500));

      verify(
        () => availableCreditsBlocMock.add(
          const AvailableCreditsEvent.loadMore(),
        ),
      );
    });

    testWidgets('Filter show', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(
          isLoading: false,
          items: fakeCredits,
          appliedFilter: creditFilter,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final availableText = find.text('Invoice #1100001163');
      expect(availableText, findsAtLeastNWidgets(1));

      final filterBadge = find.byType(CustomBadge);
      expect(filterBadge, findsOneWidget);

      final badgeText = find.text('1');
      expect(badgeText, findsOneWidget);

      await tester.tap(filterBadge);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      verify(
        () => availableCreditFilterBlocMock.add(
          AvailableCreditFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter: availableCreditsBlocMock.state.appliedFilter,
          ),
        ),
      );

      final filterPage = find.byKey(WidgetKeys.creditPaymentFilterPage);
      expect(filterPage, findsOneWidget);

      final filterTitle = find.text('Filter');
      expect(filterTitle, findsOneWidget);

      final closeButton = find.byKey(WidgetKeys.closeButton);
      expect(closeButton, findsOneWidget);

      await tester.tap(closeButton);
      await tester.pumpAndSettle(const Duration(seconds: 3));
    });

    testWidgets('Apply filter test', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial()
            .copyWith(isLoading: false, items: fakeCredits),
      );
      when(() => availableCreditFilterBlocMock.state).thenReturn(
        AvailableCreditFilterState.initial().copyWith(
          filter: creditFilter,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final filterBadge = find.byType(CustomBadge);
      expect(filterBadge, findsOneWidget);

      await tester.tap(filterBadge);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      expect(filterApplyButton, findsOneWidget);

      await tester.tap(filterApplyButton);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: creditFilter,
            searchKey: availableCreditsBlocMock.state.searchKey,
          ),
        ),
      );
    });
  });
}
