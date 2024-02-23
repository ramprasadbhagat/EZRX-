import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_local.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_home/payment_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AccountSummaryBlocMock
    extends MockBloc<AccountSummaryEvent, AccountSummaryState>
    implements AccountSummaryBloc {}

class AvailableCreditsBlocMock
    extends MockBloc<AvailableCreditsEvent, AvailableCreditsState>
    implements AvailableCreditsBloc {}

class AvailableCreditFilterBlocMock
    extends MockBloc<AvailableCreditFilterEvent, AvailableCreditFilterState>
    implements AvailableCreditFilterBloc {}

class PaymentInProgressBlocMock
    extends MockBloc<PaymentInProgressEvent, PaymentInProgressState>
    implements PaymentInProgressBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class DownloadPaymentAttachmentsBlocMock extends MockBloc<
        DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState>
    implements DownloadPaymentAttachmentsBloc {}

class OutstandingInvoicesBlocMock
    extends MockBloc<OutstandingInvoicesEvent, OutstandingInvoicesState>
    implements OutstandingInvoicesBloc {}

class NewPaymentBlocMock extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}

class SoaBlocMock extends MockBloc<SoaEvent, SoaState> implements SoaBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

class SoaFilterBlocMock extends MockBloc<SoaFilterEvent, SoaFilterState>
    implements SoaFilterBloc {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

void main() {
  late SoaBloc soaBloc;
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late SalesOrgBloc salesOrgBlocMock;
  late NewPaymentBloc newPaymentBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late AccountSummaryBloc accountSummaryBlocMock;
  late AccountSummaryState accountSummaryState;
  late PaymentInProgressBloc paymentInProgressBloc;
  late PaymentInProgressState paymentInProgressState;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late AvailableCreditFilterBloc availableCreditFilterBloc;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBloc;
  late SoaFilterBloc soaFilterBlocMock;
  const fakeError = ApiFailure.other('fake-error');
  late List<Soa> soaList;

  //////////////////////Finder/////////////////////////////

  final statementOfAccountsMenu =
      find.byKey(WidgetKeys.statementOfAccountsMenu);
  final paymentHomeInProgressCard =
      find.byKey(WidgetKeys.paymentHomeInProgressCard);
  final paymentHomeObscuredAmount =
      find.byKey(WidgetKeys.paymentHomeObscuredAmount);
  final claimsMenu = find.byKey(WidgetKeys.claimsMenu);
  final paymentHome = find.byKey(WidgetKeys.scrollList);
  final appBar = find.byKey(WidgetKeys.paymentHomeAppBar);
  final totalOverdue = find.byKey(WidgetKeys.totalOverdue);
  final paymentHomeSoa = find.byKey(WidgetKeys.paymentHomeSoa);
  final totalCreditLimit = find.byKey(WidgetKeys.totalCreditLimit);
  final inProgressAmount = find.byKey(WidgetKeys.inProgressAmount);
  final totalOutstanding = find.byKey(WidgetKeys.totalOutstanding);
  final accountSummaryMenu = find.byKey(WidgetKeys.accountSummaryMenu);
  final paymentSummaryMenu = find.byKey(WidgetKeys.paymentSummaryMenu);
  final creditLimitUtilized = find.byKey(WidgetKeys.creditLimitUtilized);
  final creditLimitRemaining = find.byKey(WidgetKeys.creditLimitRemaining);
  final paymentHomeOptionMenu = find.byKey(WidgetKeys.paymentHomeOptionMenu);
  final paymentHomeCreditCard = find.byKey(WidgetKeys.paymentHomeCreditCard);
  final paymentHomeInvoiceCard = find.byKey(WidgetKeys.paymentHomeInvoiceCard);

  ////////////////////////////////////////////////////////

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => MockAppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());

    autoRouterMock = locator<MockAppRouter>();

    accountSummaryState = AccountSummaryState.initial().copyWith(
      creditLimit: CreditLimit.empty().copyWith(
        creditLimit: StringValue('101'),
        creditExposure: StringValue('102'),
        creditBalance: StringValue('103'),
      ),
      outstandingBalance: OutstandingBalance.empty().copyWith(
        amount: StringValue('104'),
        overdue: StringValue('105'),
      ),
    );
    paymentInProgressState = PaymentInProgressState.initial().copyWith(
      amount: StringValue('100'),
    );
    soaList = await SoaLocalDataSource().getSoa();
  });

  setUp(() async {
    soaBloc = SoaBlocMock();
    eligibilityBlocMock = EligibilityBlockMock();
    authBlocMock = AuthBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    accountSummaryBlocMock = AccountSummaryBlocMock();
    paymentInProgressBloc = PaymentInProgressBlocMock();
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    availableCreditFilterBloc = AvailableCreditFilterBlocMock();
    outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
    downloadPaymentAttachmentsBloc = DownloadPaymentAttachmentsBlocMock();
    soaFilterBlocMock = SoaFilterBlocMock();
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => paymentInProgressBloc.state)
        .thenReturn(PaymentInProgressState.initial());
    when(() => accountSummaryBlocMock.state)
        .thenReturn(AccountSummaryState.initial());
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => availableCreditFilterBloc.state)
        .thenReturn(AvailableCreditFilterState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => downloadPaymentAttachmentsBloc.state)
        .thenReturn(DownloadPaymentAttachmentsState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => soaBloc.state).thenReturn(SoaState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => autoRouterMock.currentPath).thenReturn(PaymentPageRoute.name);
    when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
    when(() => autoRouterMock.pop()).thenAnswer((invocation) async => true);
  });

  //////////////////////////////Finder//////////////////////////////////////
  final downloadStatementAccountIcon =
      find.byKey(WidgetKeys.downloadStatementAccountIcon);
  final itemStatementAccounts = find.byKey(WidgetKeys.itemStatementAccounts);
  final confirmBottomSheet = find.byKey(WidgetKeys.confirmBottomSheet);

  ///////////////////////////////////////////////////////////////////////

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<SoaBloc>(
          create: (context) => soaBloc,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<PaymentInProgressBloc>(
          create: (context) => paymentInProgressBloc,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AccountSummaryBloc>(
          create: (context) => accountSummaryBlocMock,
        ),
        BlocProvider<AvailableCreditsBloc>(
          create: (context) => availableCreditsBlocMock,
        ),
        BlocProvider<AvailableCreditFilterBloc>(
          create: (context) => availableCreditFilterBloc,
        ),
        BlocProvider<OutstandingInvoicesBloc>(
          create: (context) => outstandingInvoicesBlocMock,
        ),
        BlocProvider<DownloadPaymentAttachmentsBloc>(
          create: (context) => downloadPaymentAttachmentsBloc,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<SoaFilterBloc>(create: (context) => soaFilterBlocMock),
      ],
      child: const PaymentPage(),
    );
  }

  group('Payment Home Option menu check', () {
    testWidgets('Check payment option menu noClaim',
        (WidgetTester tester) async {
      when(() => autoRouterMock.pushNamed('payments/invoice_credit'))
          .thenAnswer(
        (_) => Future.value(),
      );
      when(() => autoRouterMock.pushNamed('payments/statement_accounts'))
          .thenAnswer(
        (_) => Future.value(),
      );
      when(() => autoRouterMock.pushNamed('payments/payment_summary'))
          .thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeOptionMenu, findsOneWidget);
      expect(accountSummaryMenu, findsOneWidget);
      expect(paymentSummaryMenu, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(claimsMenu, findsNothing);
      await tester.tap(accountSummaryMenu);
      await tester.pumpAndSettle();
      verify(
        () => autoRouterMock.pushNamed('payments/invoice_credit'),
      ).called(1);
      await tester.tap(statementOfAccountsMenu);
      await tester.pumpAndSettle();
      verify(
        () => soaFilterBlocMock.add(const SoaFilterEvent.initialized()),
      ).called(1);
      verify(
        () => autoRouterMock.pushNamed('payments/statement_accounts'),
      ).called(1);
      await tester.tap(paymentSummaryMenu);
      verify(
        () => autoRouterMock.pushNamed('payments/payment_summary'),
      ).called(1);
    });

    testWidgets('Check payment option menu With Claim',
        (WidgetTester tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2501')),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2501')),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeOptionMenu, findsOneWidget);
      expect(accountSummaryMenu, findsOneWidget);
      expect(paymentSummaryMenu, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(claimsMenu, findsOneWidget);
    });
  });

  testWidgets('Updating Principle cut off', (WidgetTester tester) async {
    whenListen(
      newPaymentBlocMock,
      Stream.fromIterable([
        NewPaymentState.initial().copyWith(
          isFetchingPrincipalCutoffs: true,
        ),
        NewPaymentState.initial().copyWith(),
      ]),
    );
    when(
      () => autoRouterMock.push(const NewPaymentPageRoute()),
    ).thenAnswer((invocation) => Future.value());
    await tester.pumpWidget(getWidget());
    await tester.pumpAndSettle();

    verify(
      () => outstandingInvoicesBlocMock.add(
        OutstandingInvoicesEvent.fetch(
          appliedFilter: OutstandingInvoiceFilter.init(),
          searchKey: SearchKey.search(''),
        ),
      ),
    ).called(1);
    verify(
      () => availableCreditsBlocMock.add(
        AvailableCreditsEvent.fetch(
          appliedFilter: AvailableCreditFilter.init(),
          searchKey: SearchKey.searchFilter(''),
        ),
      ),
    ).called(1);
    verify(
      () => availableCreditFilterBloc.add(
        const AvailableCreditFilterEvent.initialize(),
      ),
    ).called(1);
  });

  testWidgets('Updating Principle cut off to 0', (WidgetTester tester) async {
    whenListen(
      newPaymentBlocMock,
      Stream.fromIterable([
        NewPaymentState.initial().copyWith(
          isFetchingPrincipalCutoffs: true,
        ),
        NewPaymentState.initial().copyWith(
          principalCutoffs: const PrincipalCutoffs(total: 0),
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      ]),
    );
    when(
      () => autoRouterMock.push(const NewPaymentPageRoute()),
    ).thenAnswer((invocation) => Future.value());
    await tester.pumpWidget(getWidget());
    await tester.pumpAndSettle();
    verify(
      () => outstandingInvoicesBlocMock.add(
        OutstandingInvoicesEvent.fetch(
          appliedFilter: OutstandingInvoiceFilter.init(),
          searchKey: SearchKey.search(''),
        ),
      ),
    ).called(1);
    verify(
      () => availableCreditsBlocMock.add(
        AvailableCreditsEvent.fetch(
          appliedFilter: AvailableCreditFilter.init(),
          searchKey: SearchKey.searchFilter(''),
        ),
      ),
    ).called(1);
  });

  testWidgets('Updating Principle cut off for Id and closed for payment',
      (WidgetTester tester) async {
    whenListen(
      newPaymentBlocMock,
      Stream.fromIterable([
        NewPaymentState.initial().copyWith(
          isFetchingPrincipalCutoffs: true,
        ),
        NewPaymentState.initial().copyWith(
          principalCutoffs: const PrincipalCutoffs(total: 100),
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      ]),
    );
    await tester.pumpWidget(getWidget());
    await tester.pumpAndSettle();
    expect(
      confirmBottomSheet,
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: confirmBottomSheet,
        matching: find.text('We are closed for payment'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: confirmBottomSheet,
        matching: find.text(
          "We are unable to proceed with the payment during the month's end. Please try again the following month. Thank you",
        ),
      ),
      findsOneWidget,
    );
  });

  testWidgets('Updating Principle cut off error', (WidgetTester tester) async {
    whenListen(
      newPaymentBlocMock,
      Stream.fromIterable([
        NewPaymentState.initial().copyWith(
          isFetchingPrincipalCutoffs: true,
        ),
        NewPaymentState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ]),
    );
    await tester.pumpWidget(getWidget());
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: find.byType(CustomSnackBar),
        matching: find.text(fakeError.failureMessage.message),
      ),
      findsOneWidget,
    );
  });
  group('Payment Home Credit', () {
    testWidgets('Check Credit Widgets', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(appBar, findsOneWidget);
      expect(paymentHome, findsOneWidget);
      expect(paymentHomeCreditCard, findsOneWidget);
      expect(creditLimitUtilized, findsOneWidget);
      expect(creditLimitRemaining, findsOneWidget);
      expect(totalCreditLimit, findsOneWidget);
    });

    testWidgets('Credit section is not visible when hideCredit is true',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith.salesOrgConfigs(hideCredit: true),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();

      expect(paymentHomeCreditCard, findsNothing);
      expect(creditLimitUtilized, findsNothing);
      expect(creditLimitRemaining, findsNothing);
      expect(totalCreditLimit, findsNothing);
    });

    testWidgets('Check refresh', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(inProgressAmount, findsOneWidget);
      await tester.fling(paymentHome, const Offset(0.0, 300.0), 800.0);
      expect(
        find.byType(RefreshProgressIndicator),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      verify(
        () => accountSummaryBlocMock.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: '',
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);
    });
  });

  group('Payment Home Invoice', () {
    testWidgets('Check Invoice widgets', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInvoiceCard, findsOneWidget);
      expect(totalOutstanding, findsOneWidget);
      expect(totalCreditLimit, findsOneWidget);
      expect(totalOverdue, findsOneWidget);
    });

    testWidgets('Check refresh', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(inProgressAmount, findsOneWidget);
      await tester.fling(paymentHome, const Offset(0.0, 300.0), 800.0);
      expect(
        find.byType(RefreshProgressIndicator),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      verify(
        () => accountSummaryBlocMock.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: '',
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);
    });
    testWidgets('check loading', (WidgetTester tester) async {
      whenListen(
        accountSummaryBlocMock,
        Stream.fromIterable([
          accountSummaryState.copyWith(isFetchingOutstandingBalance: true),
        ]),
      );

      await tester.pumpFrames(
        getWidget(),
        const Duration(seconds: 1),
      );
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInvoiceCard, findsOneWidget);
      expect(
        find.descendant(
          of: paymentHomeInvoiceCard,
          matching: find.byType(LoadingShimmer),
        ),
        findsWidgets,
      );
    });
  });

  group('Payment Home In progress', () {
    testWidgets('Check progress widgets', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(inProgressAmount, findsOneWidget);
    });

    testWidgets('Check in progress Amount empty', (WidgetTester tester) async {
      when(() => accountSummaryBlocMock.state).thenReturn(
        accountSummaryState,
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(inProgressAmount, findsOneWidget);
      expect(
        find.text(
          'NA',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('Check check obscured', (WidgetTester tester) async {
      when(() => paymentInProgressBloc.state).thenReturn(
        paymentInProgressState,
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInProgressCard, findsOneWidget);

      expect(inProgressAmount, findsOneWidget);
      expect(
        find.text(
          '100',
          findRichText: true,
        ),
        findsNothing,
      );
      expect(paymentHomeObscuredAmount, findsNWidgets(3));
      await tester.ensureVisible(paymentHomeObscuredAmount.last);
      await tester.pump();
      await tester.tap(paymentHomeObscuredAmount.last);
      await tester.pump();
      expect(
        find.textContaining(
          '100',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('Check refresh', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(inProgressAmount, findsOneWidget);
      await tester.fling(paymentHome, const Offset(0.0, 300.0), 800.0);
      await tester.pump();
      expect(
        find.byType(RefreshProgressIndicator),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      verify(
        () => paymentInProgressBloc.add(
          PaymentInProgressEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: SalesOrganisation.empty(),
          ),
        ),
      ).called(1);
    });
    testWidgets('check loading', (WidgetTester tester) async {
      whenListen(
        paymentInProgressBloc,
        Stream.fromIterable([
          paymentInProgressState.copyWith(isFetching: true),
        ]),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(inProgressAmount, findsOneWidget);
    });

    testWidgets('payment summary fetch failure', (WidgetTester tester) async {
      whenListen(
        paymentInProgressBloc,
        Stream.fromIterable([
          paymentInProgressState.copyWith(
            failureOrSuccessOption: optionOf(
              const Left(fakeError),
            ),
          ),
        ]),
      );
      when(() => autoRouterMock.pushNamed('payments/payment_summary'))
          .thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text(fakeError.failureMessage.message),
        ),
        findsOneWidget,
      );
      final paymentSummarySection = find.descendant(
        of: find.byType(SectionTitle),
        matching: find.text('Payment summary'),
      );
      expect(
        paymentSummarySection,
        findsWidgets,
      );
      await tester.tap(
        find.byKey(WidgetKeys.sectionTileIcon('Payment summary')),
      );
      await tester.pumpAndSettle();
      verify(
        () => autoRouterMock.pushNamed('payments/payment_summary'),
      ).called(1);
    });
  });
  group('Payment Home Statement of account', () {
    testWidgets('Check statement of account', (WidgetTester tester) async {
      whenListen(
        downloadPaymentAttachmentsBloc,
        Stream.fromIterable([
          DownloadPaymentAttachmentsState.initial().copyWith(
            isDownloadInProgress: true,
          ),
          DownloadPaymentAttachmentsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(fakeError),
            ),
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      await tester.fling(paymentHome, const Offset(0.0, -300.0), 800.0);
      await tester.pumpAndSettle();
      expect(paymentHomeSoa, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text(fakeError.failureMessage.message.tr()),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Check statement of account downloaded fuke',
        (WidgetTester tester) async {
      whenListen(
        downloadPaymentAttachmentsBloc,
        Stream.fromIterable([
          DownloadPaymentAttachmentsState.initial().copyWith(
            isDownloadInProgress: true,
          ),
          DownloadPaymentAttachmentsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Right(unit),
            ),
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      await tester.fling(paymentHome, const Offset(0.0, -300.0), 800.0);
      await tester.pumpAndSettle();
      expect(paymentHomeSoa, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text('File downloaded successfully'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Check refresh', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(inProgressAmount, findsOneWidget);
      await tester.fling(paymentHome, const Offset(0.0, 300.0), 800.0);
      await tester.pump();
      expect(
        find.byType(RefreshProgressIndicator),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      verify(
        () => soaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('No Statement of Accounts payment option for ID',
        (WidgetTester tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('1900')),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(paymentHomeOptionMenu, findsOneWidget);
      expect(accountSummaryMenu, findsOneWidget);
      expect(paymentSummaryMenu, findsOneWidget);
      expect(statementOfAccountsMenu, findsNothing);
      expect(claimsMenu, findsNothing);
    });
    testWidgets('account summary navigation', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => autoRouterMock.pushNamed('payments/statement_accounts'))
          .thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(SectionTitle),
          matching: find.text('Statement of accounts'),
        ),
        findsOneWidget,
      );
      await tester.tap(
        find.byKey(WidgetKeys.sectionTileIcon('Statement of accounts')),
      );
      await tester.pumpAndSettle();
      verify(
        () => autoRouterMock.pushNamed('payments/statement_accounts'),
      ).called(1);
    });

    testWidgets('account summary soa List', (WidgetTester tester) async {
      whenListen(
        soaBloc,
        Stream.fromIterable([
          SoaState.initial().copyWith(
            soaList: soaList,
          ),
        ]),
      );
      whenListen(
        downloadPaymentAttachmentsBloc,
        Stream.fromIterable([
          DownloadPaymentAttachmentsState.initial().copyWith(
            isDownloadInProgress: true,
          ),
          DownloadPaymentAttachmentsState.initial(),
        ]),
      );
      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => autoRouterMock.pushNamed('payments/statement_accounts'))
          .thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(SectionTitle),
          matching: find.text('Statement of accounts'),
        ),
        findsOneWidget,
      );
      expect(itemStatementAccounts, findsWidgets);
      expect(downloadStatementAccountIcon, findsWidgets);
      await tester.tap(downloadStatementAccountIcon.first);
      await tester.pumpAndSettle();
      verify(
        () => downloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.downloadSOA(
            soaData: soaList.first.soaData,
          ),
        ),
      ).called(1);
    });

    testWidgets('account summary soa downloading', (WidgetTester tester) async {
      whenListen(
        soaBloc,
        Stream.fromIterable([
          SoaState.initial().copyWith(
            soaList: soaList,
          ),
        ]),
      );

      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => autoRouterMock.pushNamed('payments/statement_accounts'))
          .thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      whenListen(
        downloadPaymentAttachmentsBloc,
        Stream.fromIterable([
          DownloadPaymentAttachmentsState.initial().copyWith(
            isDownloadInProgress: true,
            fileUrl: DownloadPaymentAttachment(
              url: soaList.elementAt(1).soaData.getOrDefaultValue(''),
            ),
          ),
        ]),
      );
      await tester.pump();
    });
  });
}
