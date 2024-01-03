import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/bank_in_accounts/bank_in_accounts_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/new_payment_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';
import '../../../common_mock_data/mock_bloc.dart';

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
  const error = Left(ApiFailure.other('fake-error'));
  late BankInAccountBlocMock bankInAccountsBlocMock;
  final fakeInvoices = [
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      billingDocument: 'fake-BD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: StringValue('fake-DRI'),
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
      orderId: StringValue(''),
    ),
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      billingDocument: 'fake-BD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: StringValue('fake-DRI'),
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
      orderId: StringValue(''),
    ),
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      billingDocument: 'fake-BD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: StringValue('fake-DRI'),
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
      orderId: StringValue(''),
    ),
  ];

  final fakeCredits = [
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      billingDocument: 'fake-BD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: StringValue('fake-DRI'),
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
      orderId: StringValue(''),
    ),
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      billingDocument: 'fake-BD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: StringValue('fake-DRI'),
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
      orderId: StringValue(''),
    ),
    CustomerOpenItem(
      status: StatusType('Overdue'),
      accountingDocument: 'fake-AD',
      billingDocument: 'fake-BD',
      netDueDate: DateTimeStringValue('2023041107'),
      documentDate: DateTimeStringValue('2013-04-11'),
      amountInTransactionCurrency: 100,
      documentReferenceID: StringValue('fake-DRI'),
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
      orderId: StringValue(''),
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
    eligibilityBlocMock = EligibilityBlocMock();
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
    bankInAccountsBlocMock = BankInAccountBlocMock();

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
    when(() => bankInAccountsBlocMock.state)
        .thenReturn(BankInAccountsState.initial());
  });

  //////////////////////////////Finder//////////////////////////////////////
  final confirmBottomSheetConfirmButton =
      find.byKey(WidgetKeys.confirmBottomSheetConfirmButton);
  final closeButton = find.byKey(WidgetKeys.closeButton);
  final nextButton = find.byKey(WidgetKeys.nextButton);
  final checkAllWidget = find.byKey(WidgetKeys.checkAllWidget);
  final confirmBottomSheet = find.byKey(WidgetKeys.confirmBottomSheet);

  ///////////////////////////////////////////////////////////////////////

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
        BlocProvider<BankInAccountsBloc>(
          create: (context) => bankInAccountsBlocMock,
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
      testWidgets('=> Test Invoice/credit already in use dialog',
          (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              isLoading: true,
            ),
            NewPaymentState.initial().copyWith(
              failureOrSuccessOption: optionOf(error),
            ),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: find.text('Invoice/credit already in use'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: confirmBottomSheetConfirmButton,
          ),
          findsOneWidget,
        );
        await tester.tap(confirmBottomSheetConfirmButton);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: confirmBottomSheetConfirmButton,
          ),
          findsNothing,
        );
      });

      testWidgets('=> Test Previous button', (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              failureOrSuccessOption: optionOf(error),
            ),
            NewPaymentState.initial(),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(closeButton, findsOneWidget);
        await tester.tap(closeButton);
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: closeButton,
          ),
          findsNothing,
        );
      });

      testWidgets('=> Test new payment amount is negative',
          (WidgetTester tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices
                .map(
                  (e) => e.copyWith(
                    openAmountInTransCrcy: -100,
                  ),
                )
                .toList(),
            selectedCredits: fakeCredits,
            selectedPaymentMethod: NewPaymentMethod(
              paymentMethod: PaymentMethodValue('Bank-In'),
              options: [
                PaymentMethodOption.empty(),
              ],
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byType(InfoLabel),
            matching:
                find.text('Total credit amount cannot exceed invoice amount.'),
          ),
          findsOneWidget,
        );
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byType(InfoLabel),
            matching:
                find.text('Please select your virtual bank account to proceed'),
          ),
          findsOneWidget,
        );
      });

      testWidgets('=> Payment step 3 rebuild', (WidgetTester tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(nextButton, findsOneWidget);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
        expect(nextButton, findsOneWidget);
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              selectedInvoices: fakeInvoices,
              selectedCredits: fakeCredits,
              isLoading: true,
            ),
            NewPaymentState.initial().copyWith(
              selectedInvoices: fakeInvoices,
              selectedCredits: fakeCredits,
            ),
          ]),
        );
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
      });

      testWidgets('=> Payment check invoice all selection',
          (WidgetTester tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
          ),
        );
        whenListen(
          outstandingInvoicesBlocMock,
          Stream.fromIterable([
            OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(checkAllWidget, findsOneWidget);
        await tester.tap(checkAllWidget);
        await tester.pumpAndSettle();
        verify(
          () => newPaymentBlocMock
              .add(const NewPaymentEvent.updateAllInvoices(items: [])),
        ).called(1);
      });

      testWidgets('=> Payment check Credit all selection',
          (WidgetTester tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
          ),
        );
        whenListen(
          outstandingInvoicesBlocMock,
          Stream.fromIterable([
            OutstandingInvoicesState.initial(),
            OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(nextButton, findsOneWidget);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
        expect(checkAllWidget, findsOneWidget);
        await tester.tap(checkAllWidget);
        await tester.pumpAndSettle();
        verify(
          () => newPaymentBlocMock
              .add(const NewPaymentEvent.updateAllCredits(items: [])),
        ).called(1);
      });

      testWidgets('=> Payment check total for ID', (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));

        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
            paymentMethods: [
              NewPaymentMethod(
                paymentMethod: PaymentMethodValue('Bank-In'),
                options: [
                  PaymentMethodOption.empty().copyWith(
                    bankOptionId: BankOptionId('permata'),
                  ),
                ],
              )
            ],
            selectedPaymentMethod: NewPaymentMethod(
              paymentMethod: PaymentMethodValue('Bank-In'),
              options: [
                PaymentMethodOption.empty().copyWith(
                  bankOptionId: BankOptionId('permata'),
                ),
              ],
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        whenListen(
          availableCreditsBlocMock,
          Stream.fromIterable([
            AvailableCreditsState.initial(),
            AvailableCreditsState.initial().copyWith(items: fakeCredits),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(nextButton, findsOneWidget);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
        expect(
          confirmBottomSheet,
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: confirmBottomSheet,
            matching: find.text('Confirm payment settings?'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: confirmBottomSheetConfirmButton,
          ),
          findsOneWidget,
        );
        await tester.tap(confirmBottomSheetConfirmButton);
        await tester.pumpAndSettle();
        verify(
          () => newPaymentBlocMock.add(
            const NewPaymentEvent.createVirtualAccount(),
          ),
        ).called(1);
      });
    });
  });
}
