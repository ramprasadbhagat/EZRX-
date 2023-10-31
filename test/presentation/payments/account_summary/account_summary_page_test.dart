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

class AllInvoicesBlocMock extends MockBloc<AllInvoicesEvent, AllInvoicesState>
    implements AllInvoicesBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AllCreditsBloc allCreditsBlocMock;
  late AllInvoicesBloc allInvoicesBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AllCreditsFilterBloc allCreditsFilterBlocMock;
  late DownloadPaymentAttachmentsBloc mockDownloadPaymentAttachmentsBloc;

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
    mockDownloadPaymentAttachmentsBloc = MockDownloadPaymentAttachmentsBloc();
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
  });

  ///////////////////////////Finder//////////////////////////////////////////////
  final accountSummaryDownloadButton =
      find.byKey(WidgetKeys.accountSummaryDownloadButton);
  final creditsTab = find.byKey(WidgetKeys.creditsTab);
  //////////////////////////////////////////////////////////////////////////////

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: AccountSummaryRoute.name,
      providers: [
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
      ],
      child: const AccountSummary(),
    );
  }

  group('Account Summary Screen', () {
    testWidgets('=> Test download Account summary invoice', (tester) async {
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
      final allCreditsFilter = AllCreditsFilter(
        amountValueFrom: RangeValue('0'),
        amountValueTo: RangeValue('100'),
        documentDateFrom: DateTimeStringValue('20221011'),
        documentDateTo: DateTimeStringValue('20231011'),
        filterStatuses: ['Pending'],
        searchKey: SearchKey('fake-search-key'),
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
  });
}
