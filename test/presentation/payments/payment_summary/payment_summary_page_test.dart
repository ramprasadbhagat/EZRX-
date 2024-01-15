import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

final locator = GetIt.instance;

void main() {
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  late AnnouncementBloc announcementBlocMock;
  late PaymentSummaryBloc paymentSummaryBloc;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBloc;
  late PaymentSummaryFilterBloc paymentSummaryFilterBloc;
  late PaymentInProgressBloc paymentInProgressBlocMock;
  late EligibilityBloc eligibilityBloc;
  late List<PaymentSummaryDetails> paymentSummaryList;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late PaymentSummaryDetailsBlocMock paymentSummaryDetailBlocMock;
  late AvailableCreditsBlocMock availableCreditsBlocMock;
  late NewPaymentBlocMock newPaymentBlocMock;
  late PaymentSummaryDetails paymentSummaryDetails;

  final fakeDate = DateTimeStringValue('fake-date');
  final fakeAdviceExpiry = AdviceExpiryValue('fake-advice-expiry');
  final fakeToDate = DateTime.parse(
    DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    ),
  );

  final filterStatusVariant = ValueVariant<FilterStatus>(
    {
      FilterStatus('Successful'),
      FilterStatus('Processed'),
      FilterStatus('Payment Received'),
      FilterStatus('In progress'),
    },
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    paymentSummaryDetails =
        await PaymentItemLocalDataSource().getPaymentSummaryDetailsPHPayment();
    paymentSummaryList = [
      PaymentSummaryDetails.empty().copyWith(
        paymentAmount: 200,
        status: FilterStatus('In Progress'),
      )
    ];
  });
  setUp(() async {
    authBlocMock = AuthBlocMock();
    autoRouterMock = locator<AppRouter>();
    announcementBlocMock = AnnouncementBlocMock();
    paymentSummaryBloc = PaymentSummaryBlocMock();
    downloadPaymentAttachmentsBloc = DownloadPaymentAttachmentsBlocMock();
    paymentInProgressBlocMock = PaymentInProgressBlocMock();
    paymentSummaryFilterBloc = PaymentSummaryFilterBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
    paymentSummaryDetailBlocMock = PaymentSummaryDetailsBlocMock();
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
  });
  ////////////////////////Finder///////////////////////////////////////////////
  final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
  final paymentSummaryFilter = find.byKey(WidgetKeys.paymentSummaryFilter);
  final paymentSummaryPage = find.byKey(WidgetKeys.paymentSummaryPage);
  final paymentSummaryFilterIcon =
      find.byKey(WidgetKeys.paymentSummaryFilterIcon);
  final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
  final amountValueTo = find.byKey(WidgetKeys.amountValueTo);
  final fromDocumentDateField = find.byKey(WidgetKeys.fromDocumentDateField);
  /////////////////////////////////////////////////////////////////////////////
  group('Payment Summary', () {
    setUp(() {
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => paymentSummaryBloc.state)
          .thenReturn(PaymentSummaryState.initial());
      when(() => downloadPaymentAttachmentsBloc.state)
          .thenReturn(DownloadPaymentAttachmentsState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => paymentSummaryFilterBloc.state)
          .thenReturn(PaymentSummaryFilterState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => paymentInProgressBlocMock.state)
          .thenReturn(PaymentInProgressState.initial());
      when(() => paymentSummaryDetailBlocMock.state)
          .thenReturn(PaymentSummaryDetailsState.initial());
      when(() => outstandingInvoicesBlocMock.state)
          .thenReturn(OutstandingInvoicesState.initial());
      when(() => availableCreditsBlocMock.state)
          .thenReturn(AvailableCreditsState.initial());
      when(() => newPaymentBlocMock.state)
          .thenReturn(NewPaymentState.initial());
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<PaymentSummaryBloc>(
            create: (context) => paymentSummaryBloc,
          ),
          BlocProvider<DownloadPaymentAttachmentsBloc>(
            create: (context) => downloadPaymentAttachmentsBloc,
          ),
          BlocProvider<PaymentSummaryFilterBloc>(
            create: (context) => paymentSummaryFilterBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBloc,
          ),
          BlocProvider<PaymentInProgressBloc>(
            create: (context) => paymentInProgressBlocMock,
          ),
          BlocProvider<PaymentSummaryDetailsBloc>(
            create: (context) => paymentSummaryDetailBlocMock,
          ),
          BlocProvider<OutstandingInvoicesBloc>(
            create: (context) => outstandingInvoicesBlocMock,
          ),
          BlocProvider<AvailableCreditsBloc>(
            create: (context) => availableCreditsBlocMock,
          ),
          BlocProvider<NewPaymentBloc>(
            create: (context) => newPaymentBlocMock,
          ),
        ],
        child: const Scaffold(
          body: PaymentSummaryPage(),
        ),
      );
    }

    testWidgets('Payment Summary floatingActionButton Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        paymentSummaryPage,
        findsOneWidget,
      );
      expect(
        find.byType(ScaleButton),
        findsOneWidget,
      );
    });

    testWidgets('Payment summary in progress amount test', (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          details: paymentSummaryList,
        ),
      );
      whenListen(
        paymentInProgressBlocMock,
        Stream.fromIterable(
          [
            PaymentInProgressState.initial().copyWith(
              isFetching: true,
            ),
            PaymentInProgressState.initial().copyWith(
              amount: StringValue('200'),
            ),
          ],
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final paymentInProgress =
          find.text('In-progress: MYR 200.00', findRichText: true);
      expect(paymentInProgress, findsOneWidget);
    });
    testWidgets('Payment Summary tap download icon Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.cloud_download_outlined),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.cloud_download_outlined));
      await tester.pumpAndSettle();

      verify(
        () => downloadPaymentAttachmentsBloc.add(
          const DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(),
        ),
      ).called(1);
    });
    testWidgets('Payment Summary download icon failed Test', (tester) async {
      whenListen(
        downloadPaymentAttachmentsBloc,
        Stream.fromIterable([
          DownloadPaymentAttachmentsState.initial(),
          DownloadPaymentAttachmentsState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
          ),
        ]),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.cloud_download_outlined),
        findsOneWidget,
      );

      await tester.tap(
        find.byIcon(Icons.cloud_download_outlined),
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();

      expect(
        find.widgetWithText(CustomSnackBar, 'Fake-error'),
        findsOneWidget,
      );
    });

    testWidgets('Payment Summary download icon success Test', (tester) async {
      whenListen(
        downloadPaymentAttachmentsBloc,
        Stream.fromIterable([
          DownloadPaymentAttachmentsState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(true)),
          ),
        ]),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.tap(
        find.byIcon(Icons.cloud_download_outlined),
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();

      expect(
        find.byType(CustomSnackBar),
        findsOneWidget,
      );
    });

    testWidgets('Payment Summary tap newPayment icon Test', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          user: fakeClientUser,
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byType(ScaleButton),
        findsOneWidget,
      );

      await tester.tap(find.byType(ScaleButton));

      verifyNever(
        () => outstandingInvoicesBlocMock.add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: OutstandingInvoiceFilter.init(),
            searchKey: SearchKey.search(''),
          ),
        ),
      );
      verifyNever(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
          ),
        ),
      );

      verify(
        () => newPaymentBlocMock.add(
          NewPaymentEvent.initialized(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
            user: fakeClientUser,
          ),
        ),
      ).called(1);
      verify(
        () => newPaymentBlocMock.add(
          const NewPaymentEvent.getPrincipalCutoffs(),
        ),
      ).called(1);
    });

    testWidgets('Payment Summary searchField and Filter Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.widgetWithText(
          TextFormField,
          'Search by payment advice / voucher no.',
        ),
        findsOneWidget,
      );
      expect(
        paymentSummaryPage,
        findsOneWidget,
      );
      await tester.tap(paymentSummaryFilterIcon);
      await tester.pumpAndSettle();
      expect(paymentSummaryFilter, findsOneWidget);

      verify(
        () => paymentSummaryFilterBloc.add(
          PaymentSummaryFilterEvent.openFilterBottomSheet(
            appliedFilter: PaymentSummaryFilter.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('Payment Summary list not empty Test', (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          salesOrganization: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          details: [
            PaymentSummaryDetails.empty().copyWith(
              status: FilterStatus('In Progress'),
            )
          ],
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('Payment Summary list show status In Progress', (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          salesOrganization: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          details: [
            paymentSummaryDetails,
          ],
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(find.text('In Progress'), findsOneWidget);
    });

    testWidgets('Payment Summary user filter success Test', (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          appliedFilter: PaymentSummaryFilter.empty().copyWith(
            amountValueFrom: RangeValue('100'),
            amountValueTo: RangeValue('300'),
            filterStatuses: [FilterStatus('In Progress')],
          ),
          details: [
            PaymentSummaryDetails.empty().copyWith(
              paymentAmount: 250,
              status: FilterStatus('In Progress'),
            )
          ],
        ),
      );

      whenListen(
        paymentSummaryBloc,
        Stream.fromIterable([
          PaymentSummaryState.initial(),
          PaymentSummaryState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
          ),
        ]),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(find.widgetWithText(CustomBadge, '2'), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('Payment Summary list empty Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('Payment Summary tap PaymentSummaryGroupItem Test',
        (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          details: [
            PaymentSummaryDetails.empty().copyWith(
              paymentAmount: 250,
              status: FilterStatus('In Progress'),
            )
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byType(ListTile),
        findsOneWidget,
      );

      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      verify(
        () => paymentSummaryDetailBlocMock.add(
          PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
            details: PaymentSummaryDetails.empty().copyWith(
              paymentAmount: 250,
              status: FilterStatus('In Progress'),
            ),
          ),
        ),
      ).called(1);

      expect(
        find.byType(Divider),
        findsNothing,
      );
    });
    testWidgets('Payment Summary search Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(
          WidgetKeys.genericKey(
            key: paymentSummaryBloc.state.searchKey.searchValueOrEmpty,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.byType(TextFormField),
        findsOneWidget,
      );

      await tester.enterText(find.byType(TextFormField), 'fake-keyword');
      await tester.pump(const Duration(seconds: 2));

      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter('fake-keyword'),
          ),
        ),
      ).called(1);
    });
    testWidgets('Payment Summary search submitted Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(
          WidgetKeys.genericKey(
            key: paymentSummaryBloc.state.searchKey.searchValueOrEmpty,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.byType(TextFormField),
        findsOneWidget,
      );

      await tester.enterText(find.byType(TextFormField), 'fake-keyword');
      await tester.pump(const Duration(seconds: 2));
      await tester.testTextInput.receiveAction(TextInputAction.done);

      expect(SearchKey.searchFilter('fake-keyword').isValid(), true);

      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter('fake-keyword'),
          ),
        ),
      ).called(2);
    });
    testWidgets('Payment Summary search onClear Test', (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          searchKey: SearchKey.searchFilter('fake-keyword'),
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byType(TextFormField),
        findsOneWidget,
      );

      expect(
        find.byIcon(Icons.clear),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.clear));
      await tester.pump(const Duration(seconds: 2));

      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('Payment Summary filter bottom sheet Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.tune_outlined),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(paymentSummaryFilter, findsOneWidget);
    });

    testWidgets('Payment Summary filter status Test', (tester) async {
      whenListen(
        paymentSummaryFilterBloc,
        Stream.fromIterable([
          PaymentSummaryFilterState.initial().copyWith(
            filter: PaymentSummaryFilter.empty().copyWith(filterStatuses: []),
          )
        ]),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.tune_outlined),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(paymentSummaryFilter, findsOneWidget);

      final inProgressRadio = find.text('In Progress');

      expect(inProgressRadio, findsOneWidget);

      await tester.tap(inProgressRadio);

      verify(
        () => paymentSummaryFilterBloc.add(
          PaymentSummaryFilterEvent.statusChanged(
            FilterStatus('In Progress'),
          ),
        ),
      ).called(1);
    });
    testWidgets('Payment Summary filter resetButton Test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.tune_outlined),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(paymentSummaryFilter, findsOneWidget);

      expect(filterResetButton, findsOneWidget);

      await tester.tap(filterResetButton);
      await tester.pumpAndSettle();
    });
    testWidgets('Payment Summary filter applyButton Test', (tester) async {
      whenListen(
        paymentSummaryFilterBloc,
        Stream.fromIterable([
          PaymentSummaryFilterState.initial().copyWith(
            filter: PaymentSummaryFilter.empty()
                .copyWith(filterStatuses: [FilterStatus('In Progress')]),
          )
        ]),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byIcon(Icons.tune_outlined),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(paymentSummaryFilter, findsOneWidget);

      expect(filterApplyButton, findsOneWidget);
      await tester.tap(
        filterApplyButton,
        warnIfMissed: false,
      );
      await tester.pump();

      verify(
        () => paymentSummaryFilterBloc.add(
          const PaymentSummaryFilterEvent.validateFilters(),
        ),
      ).called(1);
    });

    testWidgets('Test find payment summary toDocumentDateField',
        (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.toDocumentDateField), findsOneWidget);

      await tester.tap(find.byKey(WidgetKeys.toDocumentDateField));
      await tester.pumpAndSettle();

      await tester.tap(find.text('SAVE'.tr()));
      await tester.pumpAndSettle();

      verify(
        () => paymentSummaryFilterBloc.add(
          PaymentSummaryFilterEvent.setCreatedDate(
            DateTimeRange(start: fakeFromDate, end: fakeToDate),
          ),
        ),
      ).called(1);
    });

    testWidgets('Test find payment summary fromDocumentDateField',
        (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(fromDocumentDateField, findsOneWidget);

      await tester.tap(fromDocumentDateField);
      await tester.pumpAndSettle();

      await tester.tap(find.text('SAVE'.tr()));
      await tester.pumpAndSettle();

      verify(
        () => paymentSummaryFilterBloc.add(
          PaymentSummaryFilterEvent.setCreatedDate(
            DateTimeRange(start: fakeFromDate, end: fakeToDate),
          ),
        ),
      ).called(1);
    });

    testWidgets('Test find payment summary amountValueFrom', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.amountValueFrom), findsOneWidget);

      await tester.enterText(find.byKey(WidgetKeys.amountValueFrom), '100');
      await tester.pump();

      verify(
        () => paymentSummaryFilterBloc.add(
          const PaymentSummaryFilterEvent.amountValueFromChanged(
            '100',
          ),
        ),
      ).called(1);
    });

    testWidgets('Test find payment summary amountValueTo', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(amountValueTo, findsOneWidget);
      await tester.enterText(amountValueTo, '100');
      await tester.pump();

      verify(
        () => paymentSummaryFilterBloc.add(
          const PaymentSummaryFilterEvent.amountValueToChanged(
            '100',
          ),
        ),
      ).called(1);
    });

    testWidgets('Test onRefresh', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.dragFrom(const Offset(100, 300), const Offset(100, 1000));
      await tester.pumpAndSettle();

      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            searchKey: SearchKey.searchFilter(''),
            appliedFilter: PaymentSummaryFilter.empty(),
          ),
        ),
      ).called(1);
    });
    testWidgets(
        '=> AmountValueError Test when amountValueTo greater than amountValueFrom',
        (tester) async {
      when(() => paymentSummaryFilterBloc.state).thenReturn(
        PaymentSummaryFilterState.initial().copyWith(
          showErrorMessages: true,
          filter: PaymentSummaryFilter.empty().copyWith(
            amountValueFrom: RangeValue('15'),
            amountValueTo: RangeValue('12'),
          ),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.tune_outlined));
      await tester.pumpAndSettle();

      expect(paymentSummaryFilter, findsOneWidget);

      await tester.tap(
        paymentSummaryFilter,
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();

      final findInvalidText = find.text('Invalid Amount range!'.tr());
      expect(findInvalidText, findsOneWidget);
      await tester.pump();
    });

    testWidgets(
      'Show date text for ID market',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => paymentSummaryBloc.state).thenReturn(
          PaymentSummaryState.initial().copyWith(
            details: [
              PaymentSummaryDetails.empty().copyWith(
                createdDate: fakeDate,
                status: filterStatusVariant.currentValue ?? FilterStatus(''),
                adviceExpiry: fakeAdviceExpiry,
              )
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        final dateTextFinder = find
            .byKey(WidgetKeys.paymentSummaryDateOrExpiry)
            .evaluate()
            .single
            .widget as Text;

        if (filterStatusVariant.currentValue?.getIsSuccessfulOrProcessed ??
            false) {
          expect(
            dateTextFinder.data,
            '${'Payment date'.tr()}: ${fakeDate.dateString}',
          );
        }
      },
      variant: filterStatusVariant,
    );

    testWidgets(
      'Show date text (Except ID market)',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        when(() => paymentSummaryBloc.state).thenReturn(
          PaymentSummaryState.initial().copyWith(
            details: [
              PaymentSummaryDetails.empty().copyWith(
                createdDate: fakeDate,
                status: filterStatusVariant.currentValue ?? FilterStatus(''),
                adviceExpiry: fakeAdviceExpiry,
              )
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        final dateTextFinder = find
            .byKey(WidgetKeys.paymentSummaryDateOrExpiry)
            .evaluate()
            .single
            .widget as Text;
        if (filterStatusVariant.currentValue?.getIsSuccessfulOrProcessed ??
            false) {
          expect(
            dateTextFinder.data,
            '${'Payment date'.tr()}: ${fakeDate.dateString}',
          );
        } else {
          expect(
            dateTextFinder.data,
            '${'Expires in'.tr()} ${fakeAdviceExpiry.displayDashIfEmpty}',
          );
        }
      },
      variant: filterStatusVariant,
    );

    testWidgets(
        'Test payment summary from date and to date not passed while search ',
        (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          appliedFilter: PaymentSummaryFilter.empty().copyWith(
            createdDateFrom: DateTimeStringValue('20231206'),
            createdDateTo: DateTimeStringValue('20231207'),
          ),
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(
          WidgetKeys.genericKey(
            key: paymentSummaryBloc.state.searchKey.searchValueOrEmpty,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.byType(TextFormField),
        findsOneWidget,
      );

      await tester.enterText(find.byType(TextFormField), 'fake-keyword');
      await tester.pump(const Duration(seconds: 2));

      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.empty().copyWith(
              createdDateFrom: DateTimeStringValue(''),
              createdDateTo: DateTimeStringValue(''),
            ),
            searchKey: SearchKey.searchFilter('fake-keyword'),
          ),
        ),
      ).called(1);
    });

    testWidgets(
      'Payment Summary Filter Status',
      (tester) async {
        final currentSalesOrgVariant =
            salesOrgVariant.currentValue ?? fakeSGSalesOrg;
        when(() => paymentSummaryFilterBloc.state).thenReturn(
          PaymentSummaryFilterState.initial().copyWith(
            salesOrg: currentSalesOrgVariant,
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(
          paymentSummaryPage,
          findsOneWidget,
        );
        await tester.tap(paymentSummaryFilterIcon);
        await tester.pumpAndSettle();
        expect(paymentSummaryFilter, findsOneWidget);
        expect(
          find.byKey(WidgetKeys.paymentSummaryFilterStatus('Pending')),
          currentSalesOrgVariant.isSg || currentSalesOrgVariant.isPH
              ? findsOneWidget
              : findsNothing,
        );
        expect(
          find.byKey(WidgetKeys.paymentSummaryFilterStatus('Processed')),
          currentSalesOrgVariant.isID ? findsNothing : findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.paymentSummaryFilterStatus('In Progress')),
          currentSalesOrgVariant.isSg || currentSalesOrgVariant.isID
              ? findsNothing
              : findsOneWidget,
        );

        expect(
          find.byKey(WidgetKeys.paymentSummaryFilterStatus('Successful')),
          currentSalesOrgVariant.isSg ? findsNothing : findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.paymentSummaryFilterStatus('In progress')),
          currentSalesOrgVariant.isID ? findsOneWidget : findsNothing,
        );
        expect(
          find.byKey(WidgetKeys.paymentSummaryFilterStatus('Expired')),
          currentSalesOrgVariant.isID ? findsOneWidget : findsNothing,
        );
        expect(
          find.byKey(WidgetKeys.paymentSummaryFilterStatus('Cancelled')),
          currentSalesOrgVariant.isID ? findsOneWidget : findsNothing,
        );
        expect(
          find.byKey(WidgetKeys.paymentSummaryFilterStatus('Failed')),
          currentSalesOrgVariant.isSg || currentSalesOrgVariant.isID
              ? findsNothing
              : findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.paymentSummaryFilterStatus('Payment Received')),
          currentSalesOrgVariant.isTH ? findsOneWidget : findsNothing,
        );
        await tester.tap(
          currentSalesOrgVariant.isSg
              ? find.byKey(WidgetKeys.paymentSummaryFilterStatus('Processed'))
              : find.byKey(WidgetKeys.paymentSummaryFilterStatus('Successful')),
        );
        verify(
          () => paymentSummaryFilterBloc.add(
            PaymentSummaryFilterEvent.statusChanged(
              currentSalesOrgVariant.isSg
                  ? FilterStatus('Processed')
                  : FilterStatus('Successful'),
            ),
          ),
        ).called(1);
      },
      variant: salesOrgVariant,
    );

    testWidgets(
      'Payment Summary Filter amount filter check',
      (tester) async {
        final filter = PaymentSummaryFilter.empty().copyWith(
          amountValueFrom: RangeValue('12'),
          amountValueTo: RangeValue('15'),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(
          paymentSummaryPage,
          findsOneWidget,
        );
        whenListen(
          paymentSummaryFilterBloc,
          Stream.fromIterable(
            [
              PaymentSummaryFilterState.initial(),
              PaymentSummaryFilterState.initial().copyWith(filter: filter),
            ],
          ),
        );
        await tester.tap(paymentSummaryFilterIcon);
        await tester.pumpAndSettle();
        expect(paymentSummaryFilter, findsOneWidget);
        expect(filterApplyButton, findsOneWidget);
        await tester.tap(
          filterApplyButton,
          warnIfMissed: false,
        );
        await tester.pump();

        verify(
          () => paymentSummaryFilterBloc.add(
            const PaymentSummaryFilterEvent.validateFilters(),
          ),
        ).called(1);

        verify(
          () => paymentSummaryBloc.add(
            PaymentSummaryEvent.fetch(
              appliedFilter: filter,
              searchKey: SearchKey(''),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Payment Summary Filter document date filter check',
      (tester) async {
        final filter = PaymentSummaryFilter.empty().copyWith(
          createdDateTo: DateTimeStringValue(fakeToDate.toString()),
          createdDateFrom: DateTimeStringValue(fakeFromDate.toString()),
        );
        when(() => paymentSummaryFilterBloc.state).thenReturn(
          PaymentSummaryFilterState.initial().copyWith(filter: filter),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(
          paymentSummaryPage,
          findsOneWidget,
        );
        await tester.tap(paymentSummaryFilterIcon);
        await tester.pumpAndSettle();
        expect(paymentSummaryFilter, findsOneWidget);
        expect(filterApplyButton, findsOneWidget);
        await tester.tap(filterApplyButton);
        await tester.pumpAndSettle();
        verify(
          () => paymentSummaryFilterBloc.add(
            const PaymentSummaryFilterEvent.validateFilters(),
          ),
        ).called(1);

        verify(
          () => paymentSummaryBloc.add(
            PaymentSummaryEvent.fetch(
              appliedFilter: filter,
              searchKey: SearchKey(''),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Payment Summary Filter reset',
      (tester) async {
        when(() => paymentSummaryBloc.state).thenReturn(
          PaymentSummaryState.initial().copyWith(
            appliedFilter: PaymentSummaryFilter.empty().copyWith(
              amountValueFrom: RangeValue('12'),
              amountValueTo: RangeValue('15'),
            ),
          ),
        );
        when(() => paymentSummaryFilterBloc.state).thenReturn(
          PaymentSummaryFilterState.initial().copyWith(
            filter: PaymentSummaryFilter.empty().copyWith(
              createdDateTo: DateTimeStringValue(fakeToDate.toString()),
              createdDateFrom: DateTimeStringValue(fakeFromDate.toString()),
            ),
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(
          paymentSummaryPage,
          findsOneWidget,
        );
        await tester.tap(paymentSummaryFilterIcon);
        await tester.pumpAndSettle();
        expect(paymentSummaryFilter, findsOneWidget);
        expect(filterResetButton, findsOneWidget);
        await tester.tap(filterResetButton);
        verify(
          () => paymentSummaryBloc.add(
            PaymentSummaryEvent.fetch(
              appliedFilter: PaymentSummaryFilter.empty(),
              searchKey: SearchKey(''),
            ),
          ),
        ).called(1);
      },
    );
  });
}
