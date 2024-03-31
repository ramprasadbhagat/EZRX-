import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/filter/full_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/payments/full_summary/widgets/filter_bottom_sheet.dart';
import 'package:file/file.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../utils/widget_utils.dart';

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AllCreditsFilterBlocMock
    extends MockBloc<AllCreditsFilterEvent, AllCreditsFilterState>
    implements AllCreditsFilterBloc {}

class MockDownloadPaymentAttachmentsBloc extends MockBloc<
        DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState>
    implements DownloadPaymentAttachmentsBloc {}

class AllCreditsBlocMock extends MockBloc<AllCreditsEvent, AllCreditsState>
    implements AllCreditsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AllInvoicesBlocMock extends MockBloc<AllInvoicesEvent, AllInvoicesState>
    implements AllInvoicesBloc {}

class AllInvoicesFilterBlocMock
    extends MockBloc<AllInvoicesFilterEvent, AllInvoicesFilterState>
    implements AllInvoicesFilterBloc {}

class FullSummaryFilterBlocMock
    extends MockBloc<FullSummaryFilterEvent, FullSummaryFilterState>
    implements FullSummaryFilterBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class NewPaymentBlocMock extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}

class FullSummaryBlocMock extends MockBloc<FullSummaryEvent, FullSummaryState>
    implements FullSummaryBloc {}

void main() {
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AllCreditsBloc allCreditsBlocMock;
  late AllInvoicesBloc allInvoicesBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AllCreditsFilterBloc allCreditsFilterBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AllInvoicesFilterBloc allInvoicesFilterBlocMock;
  late FullSummaryBloc fullSummaryBlocMock;
  late FullSummaryFilterBloc fullSummaryFilterBlocMock;
  late DownloadPaymentAttachmentsBloc mockDownloadPaymentAttachmentsBloc;
  final allCreditsFilter = AllCreditsFilter(
    amountValueFrom: RangeValue('0'),
    amountValueTo: RangeValue('100'),
    documentDateFrom: DateTimeStringValue('20221011'),
    documentDateTo: DateTimeStringValue('20231011'),
    filterStatuses: ['Pending'],
    searchKey: SearchKey('fake-search-key'),
  );
  final allInvoicesFilter = AllInvoicesFilter(
    amountValueFrom: RangeValue('0'),
    amountValueTo: RangeValue('100'),
    documentDateFrom: DateTimeStringValue('20221011'),
    documentDateTo: DateTimeStringValue('20231011'),
    dueDateFrom: DateTimeStringValue('20221011'),
    dueDateTo: DateTimeStringValue('20231011'),
    filterStatuses: ['Pending'],
    searchKey: SearchKey('fake-search-key'),
  );
  late NewPaymentBlocMock newPaymentBlocMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    authBlocMock = AuthBlocMock();
    autoRouterMock = locator<AppRouter>();
    allCreditsBlocMock = AllCreditsBlocMock();
    allInvoicesBlocMock = AllInvoicesBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    allCreditsFilterBlocMock = AllCreditsFilterBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    allInvoicesFilterBlocMock = AllInvoicesFilterBlocMock();
    mockDownloadPaymentAttachmentsBloc = MockDownloadPaymentAttachmentsBloc();
    newPaymentBlocMock = NewPaymentBlocMock();
    fullSummaryBlocMock = FullSummaryBlocMock();
    fullSummaryFilterBlocMock = FullSummaryFilterBlocMock();
  });

  setUp(() async {
    when(() => allInvoicesBlocMock.state)
        .thenReturn(AllInvoicesState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => allCreditsFilterBlocMock.state)
        .thenReturn(AllCreditsFilterState.initial());
    when(() => mockDownloadPaymentAttachmentsBloc.state)
        .thenReturn(DownloadPaymentAttachmentsState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => allCreditsBlocMock.state).thenReturn(AllCreditsState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => allInvoicesFilterBlocMock.state)
        .thenReturn(AllInvoicesFilterState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => fullSummaryBlocMock.state)
        .thenReturn(FullSummaryState.initial());
    when(() => fullSummaryFilterBlocMock.state)
        .thenReturn(FullSummaryFilterState.initial());
  });

  ///////////////////////////Finder//////////////////////////////////////////////
  final accountSummaryDownloadButton =
      find.byKey(WidgetKeys.accountSummaryDownloadButton);
  final accountSummaryFilterButton =
      find.byKey(WidgetKeys.accountSummaryFilterButton);
  final accountSummarySearchBar =
      find.byKey(WidgetKeys.accountSummarySearchBar);
  final paymentSummaryFilterIcon =
      find.byKey(WidgetKeys.paymentSummaryFilterIcon);
  final creditsTab = find.byKey(WidgetKeys.creditsTab);
  final fullSummaryTab = find.byKey(WidgetKeys.summaryTab);
  //////////////////////////////////////////////////////////////////////////////

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: AccountSummaryRoute.name,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AllCreditsBloc>(
          create: (context) => allCreditsBlocMock,
        ),
        BlocProvider<AllCreditsFilterBloc>(
          create: (context) => allCreditsFilterBlocMock,
        ),
        BlocProvider<AllInvoicesBloc>(
          create: (context) => allInvoicesBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<DownloadPaymentAttachmentsBloc>(
          create: (context) => mockDownloadPaymentAttachmentsBloc,
        ),
        BlocProvider<AllInvoicesFilterBloc>(
          create: (context) => allInvoicesFilterBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<FullSummaryBloc>(
          create: (context) => fullSummaryBlocMock,
        ),
        BlocProvider<FullSummaryFilterBloc>(
          create: (context) => fullSummaryFilterBlocMock,
        ),
      ],
      child: const AccountSummary(),
    );
  }

  group('Account Summary Screen', () {
    testWidgets('=> Test download Account summary invoice', (tester) async {
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          appliedFilter: allInvoicesFilter,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(accountSummaryDownloadButton, findsOneWidget);
      await tester.tap(accountSummaryDownloadButton);
      await tester.pump();

      verify(
        () => mockDownloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
            queryObject: allInvoicesFilter,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test download Account summary credit', (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummaryDownloadButton, findsOneWidget);
      await tester.tap(accountSummaryDownloadButton);
      await tester.pump();

      verify(
        () => mockDownloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
            queryObject: allCreditsFilter,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test filter Account summary invoice', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          appliedFilter: allInvoicesFilter,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(accountSummaryFilterButton, findsOneWidget);
      expect(paymentSummaryFilterIcon, findsOneWidget);
      await tester.tap(paymentSummaryFilterIcon);
      await tester.pump();
      expect(find.byType(AllInvoicesFilterBottomSheet), findsOneWidget);
      verify(
        () => allInvoicesFilterBlocMock.add(
          AllInvoicesFilterEvent.openFilterBottomSheet(
            appliedFilter: allInvoicesFilter,
          ),
        ),
      ).called(1);
    });
    testWidgets('=> Test filter build when Account summary invoice',
        (tester) async {
      final expectedState = [
        AllInvoicesState.initial().copyWith(
          isLoading: true,
        ),
        AllInvoicesState.initial().copyWith(
          appliedFilter: allInvoicesFilter,
        ),
      ];
      whenListen(
        allInvoicesBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(accountSummaryFilterButton, findsOneWidget);
      expect(paymentSummaryFilterIcon, findsOneWidget);
      await tester.tap(paymentSummaryFilterIcon);
      await tester.pump();
      expect(find.byType(AllInvoicesFilterBottomSheet), findsOneWidget);
    });

    testWidgets('=> Test filter Account summary credit', (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummaryFilterButton, findsOneWidget);
      expect(paymentSummaryFilterIcon, findsOneWidget);
      await tester.tap(paymentSummaryFilterIcon);
      await tester.pump();
      expect(find.byType(AllCreditsFilterBottomSheet), findsOneWidget);
      verify(
        () => allCreditsFilterBlocMock.add(
          AllCreditsFilterEvent.openFilterBottomSheet(
            appliedFilter: allCreditsFilter,
          ),
        ),
      ).called(1);
    });
    testWidgets('=> Test filter build when Account summary credit',
        (tester) async {
      final expectedState = [
        AllCreditsState.initial().copyWith(
          isLoading: true,
        ),
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      ];
      whenListen(
        allCreditsBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummaryFilterButton, findsOneWidget);
      expect(paymentSummaryFilterIcon, findsOneWidget);
      await tester.tap(paymentSummaryFilterIcon);
      await tester.pump();
      expect(find.byType(AllCreditsFilterBottomSheet), findsOneWidget);
    });

    testWidgets('=> Test download Account summary Listner success',
        (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      );
      final expectedState = [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: optionOf(
            const Right(File),
          ),
        ),
      ];
      whenListen(
        mockDownloadPaymentAttachmentsBloc,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      expect(accountSummaryDownloadButton, findsOneWidget);
      final successText = find.text('File downloaded successfully');
      expect(successText, findsWidgets);
    });
    testWidgets('=> Test download Account summary Listner failure',
        (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      );
      final expectedState = [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake_error')),
          ),
        ),
      ];
      whenListen(
        mockDownloadPaymentAttachmentsBloc,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      expect(accountSummaryDownloadButton, findsOneWidget);
      final successText = find.text('File downloaded successfully');
      expect(successText, findsNothing);
    });

    testWidgets('=> Test search Account summary invoice', (tester) async {
      final allInvoicesFilter = AllInvoicesFilter.defaultFilter().copyWith(
        searchKey: SearchKey('12345'),
      );
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          appliedFilter: allInvoicesFilter,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(accountSummarySearchBar, findsOneWidget);
      await tester.enterText(find.byType(TextFormField), '1');
      await tester.pumpAndSettle(
        Duration(milliseconds: locator<Config>().autoSearchTimeout),
      );

      final appliedFilterWithSearch =
          AllInvoicesFilter.defaultFilter().copyWith(
        documentDateFrom: DateTimeStringValue(''),
        documentDateTo: DateTimeStringValue(''),
      );

      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: appliedFilterWithSearch.copyWith(
              searchKey: SearchKey.searchFilter('1'),
            ),
          ),
        ),
      ).called(1);
      await tester.enterText(find.byType(TextFormField), '123');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: appliedFilterWithSearch.copyWith(
              searchKey: SearchKey.searchFilter('123'),
            ),
          ),
        ),
      ).called(1);
      await tester.tap(find.byKey(WidgetKeys.clearIconKey));
      await tester.pumpAndSettle();
      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: allInvoicesFilter.copyWith(
              searchKey: SearchKey.searchFilter(''),
            ),
          ),
        ),
      ).called(1);
    });
    testWidgets('=> Test search build when Account summary invoice',
        (tester) async {
      final allInvoicesFilter = AllInvoicesFilter.defaultFilter().copyWith(
        searchKey: SearchKey('12345'),
      );
      final expectedState = [
        AllInvoicesState.initial().copyWith(
          isLoading: true,
        ),
        AllInvoicesState.initial().copyWith(
          appliedFilter: allInvoicesFilter,
        ),
      ];
      whenListen(
        allInvoicesBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(accountSummarySearchBar, findsOneWidget);
    });
    testWidgets('=> Test search Account summary credit', (tester) async {
      final allCreditsFilter = AllCreditsFilter.defaultFilter().copyWith(
        searchKey: SearchKey('12345'),
      );
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummarySearchBar, findsOneWidget);
      await tester.enterText(find.byType(TextFormField), '1');
      await tester.pumpAndSettle(
        Duration(milliseconds: locator<Config>().autoSearchTimeout),
      );

      final appliedFilterWithSearch = AllCreditsFilter.defaultFilter().copyWith(
        documentDateFrom: DateTimeStringValue(''),
        documentDateTo: DateTimeStringValue(''),
      );

      verify(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: appliedFilterWithSearch.copyWith(
              searchKey: SearchKey.searchFilter('1'),
            ),
          ),
        ),
      ).called(1);
      await tester.enterText(find.byType(TextFormField), '123');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      verify(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: appliedFilterWithSearch.copyWith(
              searchKey: SearchKey.searchFilter('123'),
            ),
          ),
        ),
      ).called(1);
      await tester.tap(find.byKey(WidgetKeys.clearIconKey));
      await tester.pumpAndSettle();
      verify(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: allCreditsFilter.copyWith(
              searchKey: SearchKey.searchFilter(''),
            ),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test search build when Account summary credit',
        (tester) async {
      final allCreditsFilter = AllCreditsFilter.defaultFilter().copyWith(
        searchKey: SearchKey('12345'),
      );
      final expectedState = [
        AllCreditsState.initial().copyWith(
          isLoading: true,
        ),
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      ];
      whenListen(
        allCreditsBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummarySearchBar, findsOneWidget);
    });

    testWidgets('=> Test Full Summary Search Bar', (tester) async {
      final expectedState = [
        FullSummaryState.initial().copyWith(
          isLoading: true,
        ),
        FullSummaryState.initial(),
      ];
      whenListen(
        fullSummaryBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(fullSummaryTab, findsOneWidget);
      await tester.tap(fullSummaryTab);
      await tester.pumpAndSettle();
      expect(accountSummarySearchBar, findsOneWidget);
      await tester.enterText(accountSummarySearchBar, '123');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final appliedFilterWithSearch =
          FullSummaryFilter.defaultFilter().copyWith(
        documentDateFrom: DateTimeStringValue(''),
        documentDateTo: DateTimeStringValue(''),
      );
      verify(
        () => fullSummaryBlocMock.add(
          FullSummaryEvent.fetch(
            appliedFilter: appliedFilterWithSearch.copyWith(
              searchKey: SearchKey.searchFilter('123'),
            ),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test Full Summary Export Button', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(fullSummaryTab, findsOneWidget);
      await tester.tap(fullSummaryTab);
      await tester.pumpAndSettle();
      expect(accountSummaryDownloadButton, findsOneWidget);
      await tester.tap(accountSummaryDownloadButton);
      await tester.pump();
      verify(
        () => mockDownloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.fetchFullSummaryUrl(
            queryObject: FullSummaryFilter.defaultFilter(),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test Full Summary Filter Button', (tester) async {
      final expectedState = [
        FullSummaryState.initial().copyWith(
          isLoading: true,
        ),
        FullSummaryState.initial().copyWith(
          appliedFilter: FullSummaryFilter.defaultFilter().copyWith(
            filterStatuses: ['fake-status'],
          ),
        ),
      ];
      whenListen(
        fullSummaryBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(fullSummaryTab, findsOneWidget);
      await tester.tap(fullSummaryTab);
      await tester.pumpAndSettle();
      expect(accountSummaryFilterButton, findsOneWidget);
      await tester.tap(accountSummaryFilterButton);
      await tester.pumpAndSettle();
      verify(
        () => fullSummaryFilterBlocMock.add(
          FullSummaryFilterEvent.openFilterBottomSheet(
            appliedFilter: FullSummaryFilter.defaultFilter().copyWith(
              filterStatuses: ['fake-status'],
            ),
          ),
        ),
      ).called(1);
      expect(find.byType(FullSummaryFilterBottomSheet), findsOneWidget);
    });

    testWidgets(
      ' -> Find Account Suspended Banner when Customer Code is blocked',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeBlockedCustomerCodeInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find Account Suspended Banner when ship to Code is blocked',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            shipToInfo: fakeBlockedShipToInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );
  });
}
