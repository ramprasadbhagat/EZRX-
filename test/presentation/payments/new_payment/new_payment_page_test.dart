import 'package:bloc_test/bloc_test.dart';
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
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/new_payment_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class AccountSummaryBlocMock
    extends MockBloc<AccountSummaryEvent, AccountSummaryState>
    implements AccountSummaryBloc {}

class OutstandingInvoicesBlocMock
    extends MockBloc<OutstandingInvoicesEvent, OutstandingInvoicesState>
    implements OutstandingInvoicesBloc {}

class OutstandingInvoiceFilterBlocMock extends MockBloc<
    OutstandingInvoiceFilterEvent,
    OutstandingInvoiceFilterState> implements OutstandingInvoiceFilterBloc {}

class AvailableCreditsBlocMock
    extends MockBloc<AvailableCreditsEvent, AvailableCreditsState>
    implements AvailableCreditsBloc {}

class AvailableCreditFilterBlocMock
    extends MockBloc<AvailableCreditFilterEvent, AvailableCreditFilterState>
    implements AvailableCreditFilterBloc {}

class NewPaymentBlocMock extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

void main() {
  late AccountSummaryBloc accountSummaryBlocMock;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late OutstandingInvoiceFilterBloc outstandingInvoiceFilterBlocMock;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late AvailableCreditFilterBloc availableCreditFilterBlocMock;
  late NewPaymentBloc newPaymentBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

  final fakeInvoices = [
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: 'fake-DRI',
      postingKeyName: 'fake-PN',
      transactionCurrency: Currency('fake-TC'),
      companyCode: 'fake-CC',
      paymentAmountInDisplayCrcy: 50,
      partialPaymentHistoryDesc: 'fake-PPHD',
      accountingDocumentItemRef: 'fake-ADIR',
      accountingDocumentItem: 'fake-ADI',
      isDisputed: 'fake-ID',
      fiscalYear: '2020',
      openAmountInDisplayCrcy: 50,
      displayCurrency: Currency('fake-DC'),
      totalAmountInDisplayCrcy: 100,
      cashDiscountDueDate: DateTimeStringValue('2023-04-11'),
      cashDiscountAmountInDspCrcy: 0,
      debitCreditCode: 'S',
      bpCustomerNumber: 'fake-BPN',
      accountingDocExternalReference: 'fake-ADER',
      openAmountInTransCrcy: 50,
    ),
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: 'fake-DRI',
      postingKeyName: 'fake-PN',
      transactionCurrency: Currency('fake-TC'),
      companyCode: 'fake-CC',
      paymentAmountInDisplayCrcy: 50,
      partialPaymentHistoryDesc: 'fake-PPHD',
      accountingDocumentItemRef: 'fake-ADIR',
      accountingDocumentItem: 'fake-ADI',
      isDisputed: 'fake-ID',
      fiscalYear: '2020',
      openAmountInDisplayCrcy: 50,
      displayCurrency: Currency('fake-DC'),
      totalAmountInDisplayCrcy: 100,
      cashDiscountDueDate: DateTimeStringValue('2023-04-11'),
      cashDiscountAmountInDspCrcy: 0,
      debitCreditCode: 'S',
      bpCustomerNumber: 'fake-BPN',
      accountingDocExternalReference: 'fake-ADER',
      openAmountInTransCrcy: 50,
    ),
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: 'fake-DRI',
      postingKeyName: 'fake-PN',
      transactionCurrency: Currency('fake-TC'),
      companyCode: 'fake-CC',
      paymentAmountInDisplayCrcy: 50,
      partialPaymentHistoryDesc: 'fake-PPHD',
      accountingDocumentItemRef: 'fake-ADIR',
      accountingDocumentItem: 'fake-ADI',
      isDisputed: 'fake-ID',
      fiscalYear: '2020',
      openAmountInDisplayCrcy: 50,
      displayCurrency: Currency('fake-DC'),
      totalAmountInDisplayCrcy: 100,
      cashDiscountDueDate: DateTimeStringValue('2023-04-11'),
      cashDiscountAmountInDspCrcy: 0,
      debitCreditCode: 'S',
      bpCustomerNumber: 'fake-BPN',
      accountingDocExternalReference: 'fake-ADER',
      openAmountInTransCrcy: 50,
    ),
  ];

  final fakeCredits = [
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: 'fake-DRI',
      postingKeyName: 'fake-PN',
      transactionCurrency: Currency('fake-TC'),
      companyCode: 'fake-CC',
      paymentAmountInDisplayCrcy: 50,
      partialPaymentHistoryDesc: 'fake-PPHD',
      accountingDocumentItemRef: 'fake-ADIR',
      accountingDocumentItem: 'fake-ADI',
      isDisputed: 'fake-ID',
      fiscalYear: '2020',
      openAmountInDisplayCrcy: 50,
      displayCurrency: Currency('fake-DC'),
      totalAmountInDisplayCrcy: 100,
      cashDiscountDueDate: DateTimeStringValue('2023-04-11'),
      cashDiscountAmountInDspCrcy: 0,
      debitCreditCode: 'S',
      bpCustomerNumber: 'fake-BPN',
      accountingDocExternalReference: 'fake-ADER',
      openAmountInTransCrcy: 50,
    ),
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: 'fake-DRI',
      postingKeyName: 'fake-PN',
      transactionCurrency: Currency('fake-TC'),
      companyCode: 'fake-CC',
      paymentAmountInDisplayCrcy: 50,
      partialPaymentHistoryDesc: 'fake-PPHD',
      accountingDocumentItemRef: 'fake-ADIR',
      accountingDocumentItem: 'fake-ADI',
      isDisputed: 'fake-ID',
      fiscalYear: '2020',
      openAmountInDisplayCrcy: 50,
      displayCurrency: Currency('fake-DC'),
      totalAmountInDisplayCrcy: 100,
      cashDiscountDueDate: DateTimeStringValue('2023-04-11'),
      cashDiscountAmountInDspCrcy: 0,
      debitCreditCode: 'S',
      bpCustomerNumber: 'fake-BPN',
      accountingDocExternalReference: 'fake-ADER',
      openAmountInTransCrcy: 50,
    ),
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: 'fake-DRI',
      postingKeyName: 'fake-PN',
      transactionCurrency: Currency('fake-TC'),
      companyCode: 'fake-CC',
      paymentAmountInDisplayCrcy: 50,
      partialPaymentHistoryDesc: 'fake-PPHD',
      accountingDocumentItemRef: 'fake-ADIR',
      accountingDocumentItem: 'fake-ADI',
      isDisputed: 'fake-ID',
      fiscalYear: '2020',
      openAmountInDisplayCrcy: 50,
      displayCurrency: Currency('fake-DC'),
      totalAmountInDisplayCrcy: 100,
      cashDiscountDueDate: DateTimeStringValue('2023-04-11'),
      cashDiscountAmountInDspCrcy: 0,
      debitCreditCode: 'S',
      bpCustomerNumber: 'fake-BPN',
      accountingDocExternalReference: 'fake-ADER',
      openAmountInTransCrcy: 50,
    ),
  ];

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    accountSummaryBlocMock = AccountSummaryBlocMock();
    eligibilityBlocMock = EligibilityBlockMock();
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
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
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
      ],
      child: const NewPaymentPage(),
    );
  }

  group('New payment page test', () {
    group('=> Display correct steps', () {
      testWidgets('=> For ID market', (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial(),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final correctStepsTxt = find.textContaining('Step 1 of 2:');
        expect(correctStepsTxt, findsOneWidget);
      });
      testWidgets('=> For other markets', (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial(),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final correctStepsTxt = find.textContaining('Step 1 of 3:');
        expect(correctStepsTxt, findsOneWidget);
      });
    });

    group('=> Step 1: Select invoices', () {
      testWidgets('=> AllCheckbox is unchecked as default',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial(),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([NewPaymentState.initial()]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final checkAllInvoices = find.byType(CheckboxListTile);
        expect(checkAllInvoices, findsOneWidget);
        final value =
            (tester.firstWidget(checkAllInvoices) as CheckboxListTile).value;
        expect(value, false);
      });
      testWidgets('=> AllCheckbox is checked as all invoices are selected',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(selectedInvoices: fakeInvoices),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(selectedInvoices: fakeInvoices)
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final checkAllInvoices = find.byType(CheckboxListTile);
        expect(checkAllInvoices, findsOneWidget);
        final value =
            (tester.firstWidget(checkAllInvoices) as CheckboxListTile).value;
        expect(value, true);
      });
      testWidgets('=> Next button is disabled as default',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state)
            .thenReturn(NewPaymentState.initial());
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([NewPaymentState.initial()]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        final value =
            (tester.firstWidget(nextButton1) as ElevatedButton).enabled;
        expect(value, false);
      });
      testWidgets('=> Next button is enabled as at least 1 invoice is selected',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [fakeInvoices.first],
          ),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              selectedInvoices: [fakeInvoices.first],
            )
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        final value =
            (tester.firstWidget(nextButton1) as ElevatedButton).enabled;
        expect(value, true);
      });

      testWidgets('=> Invoice Ph tax deducted price',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [
              fakeInvoices.first.copyWith(
                displayCurrency: Currency('php'),
                g2Tax: 5,
                g4Tax: 1,
              )
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        final value =
            (tester.firstWidget(nextButton1) as ElevatedButton).enabled;
        expect(value, true);
        expect(find.text('44.00'), findsWidgets);
      });
    });

    group('=> Step 2: Select credits', () {
      testWidgets('=> AllCheckbox is unchecked as default',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial(),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([NewPaymentState.initial()]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        await tester.tap(nextButton1);
        await tester.pumpAndSettle();

        final checkAllInvoices = find.byType(CheckboxListTile);
        expect(checkAllInvoices, findsOneWidget);
        final value =
            (tester.firstWidget(checkAllInvoices) as CheckboxListTile).value;
        expect(value, false);
      });
      testWidgets('=> AllCheckbox is checked as all credits are selected',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
          ),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              selectedInvoices: fakeInvoices,
              selectedCredits: fakeCredits,
            )
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton = find.byKey(WidgetKeys.nextButton);
        expect(nextButton, findsOneWidget);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();

        final checkAllInvoices = find.byType(CheckboxListTile);
        expect(checkAllInvoices, findsOneWidget);
        final value =
            (tester.firstWidget(checkAllInvoices) as CheckboxListTile).value;
        expect(value, true);
      });
      testWidgets('=> Next button is disabled as default',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state)
            .thenReturn(NewPaymentState.initial());
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([NewPaymentState.initial()]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        await tester.tap(nextButton1);
        await tester.pumpAndSettle();

        final nextButton2 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton2, findsOneWidget);
        final value =
            (tester.firstWidget(nextButton2) as ElevatedButton).enabled;
        expect(value, false);
      });
      testWidgets('=> Next button is enabled as at least 1 credit is selected',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [fakeInvoices.first],
            selectedCredits: [fakeCredits.first],
          ),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              selectedInvoices: [fakeInvoices.first],
              selectedCredits: [fakeCredits.first],
            )
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        await tester.tap(nextButton1);
        await tester.pumpAndSettle();

        final nextButton2 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton2, findsOneWidget);
        final value =
            (tester.firstWidget(nextButton2) as ElevatedButton).enabled;
        expect(value, true);
      });
    });

    group('=> Step 3: Pay now', () {
      testWidgets('=> Tap Pay now button', (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [fakeInvoices.first],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        await tester.tap(nextButton1);
        await tester.pumpAndSettle();

        final nextButton2 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton2, findsOneWidget);
        await tester.tap(nextButton2);
        await tester.pumpAndSettle();

        final generatePaymentAdviceButton =
            find.byKey(WidgetKeys.generatePaymentAdvice);
        expect(generatePaymentAdviceButton, findsOneWidget);
        await tester.tap(generatePaymentAdviceButton);
        verify(
          () => newPaymentBlocMock.add(const NewPaymentEvent.pay()),
        ).called(1);
      });
      testWidgets('=> Tap Pay now button successful',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [fakeInvoices.first],
          ),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              isLoading: true,
            ),
            NewPaymentState.initial().copyWith(
              isLoading: false,
            ),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(autoRouterMock.currentPath, 'payments/payment_advice_created');
      });

      //TODO: Update widget test later
      // testWidgets('=> Tap Pay now button fails', (WidgetTester tester) async {
      //   when(() => outstandingInvoicesBlocMock.state).thenReturn(
      //     OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
      //   );
      //   when(() => availableCreditsBlocMock.state).thenReturn(
      //     AvailableCreditsState.initial().copyWith(items: fakeCredits),
      //   );
      //   when(() => newPaymentBlocMock.state).thenReturn(
      //     NewPaymentState.initial().copyWith(
      //       selectedInvoices: [fakeInvoices.first],
      //     ),
      //   );
      //   whenListen(
      //     newPaymentBlocMock,
      //     Stream.fromIterable([
      //       NewPaymentState.initial().copyWith(
      //         isLoading: true,
      //       ),
      //       NewPaymentState.initial().copyWith(
      //         isLoading: false,
      //         failureOrSuccessOption: optionOf(
      //           const Left(
      //             ApiFailure.other('Fake-error'),
      //           ),
      //         ),
      //       ),
      //     ]),
      //   );
      //   await tester.pumpWidget(getWidget());
      //   await tester.pumpAndSettle();
      //   expect(find.byKey(WidgetKeys.confirmBottomSheet), findsOneWidget);
      // });
    });
  });
}
