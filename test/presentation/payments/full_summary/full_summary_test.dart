import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/filter/full_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/full_summary/full_summary.dart';
import 'package:ezrxmobile/presentation/payments/widgets/new_payment_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class FullSummaryBlocMock extends MockBloc<FullSummaryEvent, FullSummaryState>
    implements FullSummaryBloc {}

class FullSummaryFilterBlocMock
    extends MockBloc<FullSummaryFilterEvent, FullSummaryFilterState>
    implements FullSummaryFilterBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CreditAndInvoiceDetailsBlocMock
    extends MockBloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState>
    implements CreditAndInvoiceDetailsBloc {}

class NewPaymentBlocMock extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

void main() {
  late AppRouter autoRouterMock;
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBlocMock;
  late NewPaymentBloc newPaymentBlocMock;
  late FullSummaryBloc fullSummaryBlocMock;
  late FullSummaryFilterBloc fullSummaryFilterBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AuthBloc authBlocMock;
  late List<CreditAndInvoiceItem> fullSummaryList;
  late MixpanelService mixpanelServiceMock;

  final fakeSearchKey = SearchKey('fake-search-key');

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MockMixpanelService());
    autoRouterMock = locator<AppRouter>();
    creditAndInvoiceDetailsBlocMock = CreditAndInvoiceDetailsBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    fullSummaryBlocMock = FullSummaryBlocMock();
    fullSummaryFilterBlocMock = FullSummaryFilterBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    authBlocMock = AuthBlocMock();
    mixpanelServiceMock = locator<MixpanelService>();

    when(() => creditAndInvoiceDetailsBlocMock.state)
        .thenReturn(CreditAndInvoiceDetailsState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => fullSummaryBlocMock.state)
        .thenReturn(FullSummaryState.initial());
    when(() => fullSummaryFilterBlocMock.state)
        .thenReturn(FullSummaryFilterState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    fullSummaryList =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<CreditAndInvoiceDetailsBloc>(
          create: (context) => creditAndInvoiceDetailsBlocMock,
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
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
      ],
      child: const FullSummaryPage(),
    );
  }

  group('Full Summary Page Test', () {
    testWidgets('Search Not Found', (tester) async {
      when(() => fullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(
          appliedFilter: FullSummaryFilter.defaultFilter().copyWith(
            searchKey: fakeSearchKey,
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.byType(NoRecordFound), findsOneWidget);
      expect(find.byType(NewPaymentButton), findsOneWidget);
      expect(find.text("That didn't match anything".tr()), findsOneWidget);
      expect(
        find.textContaining(
          'Try adjusting your search or filter selection to find what you’re looking for'
              .tr(),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Show Snackbar When Fetch Api Failure', (tester) async {
      final expectStates = [
        FullSummaryState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ];

      whenListen(
        fullSummaryBlocMock,
        Stream.fromIterable(expectStates),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
      expect(find.text('fake-error'), findsOneWidget);
    });

    testWidgets('Load More Data', (tester) async {
      when(() => fullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(
          items: fullSummaryList,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final scrollList = find.byKey(WidgetKeys.scrollList);
      await tester.fling(
        scrollList,
        const Offset(0.0, -1500.0),
        800.0,
      );
      await tester.pumpAndSettle();
      verify(
        () => fullSummaryBlocMock.add(
          const FullSummaryEvent.loadMore(),
        ),
      );
    });

    testWidgets('Pull To Refresh', (tester) async {
      when(() => fullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(
          items: fullSummaryList,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final scrollList = find.byKey(WidgetKeys.scrollList);

      await tester.fling(
        scrollList,
        const Offset(0.0, 300.0),
        800.0,
      );
      await tester.pumpAndSettle();
      verify(
        () => fullSummaryBlocMock.add(
          FullSummaryEvent.fetch(
            appliedFilter: FullSummaryFilter.defaultFilter(),
          ),
        ),
      );
    });

    testWidgets('Debit Item Display', (tester) async {
      when(() => fullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(
          items: fullSummaryList,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final itemCard = find.byKey(WidgetKeys.invoiceCreditItem).first;
      expect(
        find.descendant(
          of: itemCard,
          matching: find.text(
            'Debit #${fullSummaryList.first.searchKey.displayNAIfEmpty}',
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: itemCard,
          matching: find.byKey(WidgetKeys.invoiceItemStatus),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: itemCard,
          matching: find.text(
            fullSummaryList.first.postingKeyName,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: itemCard,
          matching: find.text(fullSummaryList.first.documentDate.dateString),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: itemCard,
          matching: find.text(fullSummaryList.first.documentDate.dateString),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: itemCard,
          matching: find.textContaining('9,540.00', findRichText: true),
        ),
        findsOneWidget,
      );

      final expandButton = find.descendant(
        of: itemCard,
        matching: find.byKey(WidgetKeys.summaryExpandableSection),
      );
      final referenceList = find.descendant(
        of: itemCard,
        matching:
            find.text(fullSummaryList.first.referenceId.referenceListString),
      );
      expect(expandButton, findsOneWidget);
      expect(
        referenceList,
        findsNothing,
      );
      await tester.tap(expandButton);
      await tester.pumpAndSettle();
      expect(
        referenceList,
        findsOneWidget,
      );
      await tester.tap(expandButton);
      await tester.pumpAndSettle();
      expect(
        referenceList,
        findsNothing,
      );
    });

    testWidgets('Debit Item On Tap', (tester) async {
      when(() => fullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(
          items: fullSummaryList,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final itemCard = find.byKey(WidgetKeys.invoiceCreditItem).first;

      await tester.tap(itemCard);
      await tester.pumpAndSettle();

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.paymentDocumentViewed,
          properties: null,
        ),
      ).called(1);

      verify(
        () => creditAndInvoiceDetailsBlocMock.add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: fullSummaryList.first,
          ),
        ),
      ).called(1);
      expect(autoRouterMock.currentPath, 'payments/invoice_details');
    });

    testWidgets('Credit Item Display', (tester) async {
      when(() => fullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(
          items: [
            fullSummaryList.first.copyWith(
              debitCreditCode: DebitCreditCode('H'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final itemCard = find.byKey(WidgetKeys.invoiceCreditItem).first;
      expect(
        find.descendant(
          of: itemCard,
          matching: find.text(
            'Credit #${fullSummaryList.first.searchKey.displayNAIfEmpty}',
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: itemCard,
          matching: find.byKey(WidgetKeys.invoiceItemStatus),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: itemCard,
          matching: find.text(
            fullSummaryList.first.postingKeyName,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: itemCard,
          matching: find.text(fullSummaryList.first.documentDate.dateString),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: itemCard,
          matching: find.text(fullSummaryList.first.documentDate.dateString),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: itemCard,
          matching: find.textContaining('(9,540.00)', findRichText: true),
        ),
        findsOneWidget,
      );

      final expandButton = find.descendant(
        of: itemCard,
        matching: find.byKey(WidgetKeys.summaryExpandableSection),
      );
      final referenceList = find.descendant(
        of: itemCard,
        matching:
            find.text(fullSummaryList.first.referenceId.referenceListString),
      );
      expect(expandButton, findsOneWidget);
      expect(
        referenceList,
        findsNothing,
      );
      await tester.tap(expandButton);
      await tester.pumpAndSettle();
      expect(
        referenceList,
        findsOneWidget,
      );
      await tester.tap(expandButton);
      await tester.pumpAndSettle();
      expect(
        referenceList,
        findsNothing,
      );
    });

    testWidgets('Credit Item On Tap', (tester) async {
      when(() => fullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(
          items: [
            fullSummaryList.first.copyWith(
              debitCreditCode: DebitCreditCode('H'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final itemCard = find.byKey(WidgetKeys.invoiceCreditItem).first;

      await tester.tap(itemCard);
      await tester.pumpAndSettle();

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.paymentDocumentViewed,
          properties: null,
        ),
      ).called(1);

      verify(
        () => creditAndInvoiceDetailsBlocMock.add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: fullSummaryList.first.copyWith(
              debitCreditCode: DebitCreditCode('H'),
            ),
          ),
        ),
      ).called(1);
      expect(autoRouterMock.currentPath, 'payments/credit_details');
    });

    testWidgets('Find Gov.No in full Summary', (tester) async {
      when(() => fullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(items: fullSummaryList),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final documentReferenceID = find.text('Gov. no 0810234244');
      expect(documentReferenceID, findsOneWidget);
    });

    testWidgets('Show correct empty text when filter return empty data',
        (tester) async {
      when(() => fullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(
          appliedFilter: FullSummaryFilter.defaultFilter()
              .copyWith(filterStatuses: ['fake-status']),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.text("That didn't match anything".tr()), findsOneWidget);
      expect(
        find.text(
          'Try adjusting your search or filter selection to find what you’re looking for.'
              .tr(),
        ),
        findsOneWidget,
      );
    });
  });
}
