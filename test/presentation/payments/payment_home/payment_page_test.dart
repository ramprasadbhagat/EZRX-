import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_home/payment_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';


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

void main() {
  late SoaBloc soaBloc;
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late SalesOrgBloc salesOrgBlocMock;
  late NewPaymentBloc newPaymentBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late AccountSummaryBloc accountSummaryBlocMock;
  late AccountSummaryState accountSummaryState;
  late PaymentInProgressBloc paymentInProgressBloc;
  late PaymentInProgressState paymentInProgressState;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBloc;

  //////////////////////Finder/////////////////////////////
  
  final statementOfAccountsMenu =
      find.byKey(WidgetKeys.statementOfAccountsMenu);
  final paymentHomeInProgressCard =
      find.byKey(WidgetKeys.paymentHomeInProgressCard);
  final paymentHomeObscuredAmount =
      find.byKey(WidgetKeys.paymentHomeObscuredAmount);
  final claimsMenu = find.byKey(WidgetKeys.claimsMenu);
  final paymentHome = find.byKey(WidgetKeys.paymentHome);
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
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelService());
    autoRouterMock = locator<AppRouter>();
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
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
  });

  setUp(() async {
    soaBloc = SoaBlocMock();
    authBlocMock = AuthBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    accountSummaryBlocMock = AccountSummaryBlocMock();
    paymentInProgressBloc = PaymentInProgressBlocMock();
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
    downloadPaymentAttachmentsBloc = DownloadPaymentAttachmentsBlocMock();
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
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => downloadPaymentAttachmentsBloc.state)
        .thenReturn(DownloadPaymentAttachmentsState.initial());
    when(() => soaBloc.state).thenReturn(SoaState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
  });

  Widget getWidget() {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'assets/langs/langs.csv',
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      useOnlyLangCode: true,
      assetLoader: CsvAssetLoader(),
      child: WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
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
          BlocProvider<AccountSummaryBloc>(
            create: (context) => accountSummaryBlocMock,
          ),
          BlocProvider<AvailableCreditsBloc>(
            create: (context) => availableCreditsBlocMock,
          ),
          BlocProvider<OutstandingInvoicesBloc>(
            create: (context) => outstandingInvoicesBlocMock,
          ),
          BlocProvider<DownloadPaymentAttachmentsBloc>(
            create: (context) => downloadPaymentAttachmentsBloc,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          
        ],
        child: const PaymentPage(),
      ),
    );
  }

  group('Payment Home Option menu check', () {
    testWidgets('Check payment option menu noClaim',
        (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeOptionMenu, findsOneWidget);
      expect(accountSummaryMenu, findsOneWidget);
      expect(paymentSummaryMenu, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(claimsMenu, findsNothing);
    });

    testWidgets('Check payment option menu With Claim',
        (WidgetTester tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
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
  group('Payment Home Credit', () {
    testWidgets('Check Credit Widgets', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(appBar, findsOneWidget);
      expect(paymentHome, findsOneWidget);
      expect(paymentHomeCreditCard, findsOneWidget);
      expect(creditLimitUtilized, findsOneWidget);
      expect(creditLimitRemaining, findsOneWidget);
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
    
  });
  group('Payment Home Statement of account', () {
    testWidgets('Check statement of account',
          (WidgetTester tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      await tester.fling(paymentHome, const Offset(0.0, -300.0), 800.0);
        await tester.pumpAndSettle();
      expect(paymentHomeSoa, findsOneWidget);
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
          ),
        ),
      ).called(1);
    });
  });
}
