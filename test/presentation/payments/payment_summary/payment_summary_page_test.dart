import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class PaymentInProgressBlocMock
    extends MockBloc<PaymentInProgressEvent, PaymentInProgressState>
    implements PaymentInProgressBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class PaymentSummaryBlocMock
    extends MockBloc<PaymentSummaryEvent, PaymentSummaryState>
    implements PaymentSummaryBloc {}

class DownloadPaymentAttachmentsBlocMock extends MockBloc<
        DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState>
    implements DownloadPaymentAttachmentsBloc {}

class PaymentSummaryFilterBlocMock
    extends MockBloc<PaymentSummaryFilterEvent, PaymentSummaryFilterState>
    implements PaymentSummaryFilterBloc {}

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

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    paymentSummaryList = [
      PaymentSummaryDetails.empty().copyWith(
        paymentAmount: 200,
        status: StatusType('In Progress'),
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
  });

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
        find.byKey(WidgetKeys.paymentSummaryPage),
        findsOneWidget,
      );
      expect(
        find.byType(ScaleButton),
        findsOneWidget,
      );
    });

    testWidgets('Payment Summary Filter Status Initial - For SG Market',
        (tester) async {
      when(() => paymentSummaryFilterBloc.state).thenReturn(
        PaymentSummaryFilterState.initial().copyWith(
          salesOrg: SalesOrg('2601'),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.paymentSummaryPage),
        findsOneWidget,
      );
      await tester.tap(find.byKey(WidgetKeys.paymentSummaryFilterIcon));
      await tester.pump();
      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Pending', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Processed', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('In Progress', false)),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Failed', false)),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Successful', false)),
        findsNothing,
      );
    });

    testWidgets(
        'Payment Summary Filter Status Initial - For Other Market (Except SG)',
        (tester) async {
      when(() => paymentSummaryFilterBloc.state).thenReturn(
        PaymentSummaryFilterState.initial().copyWith(
          salesOrg: SalesOrg('2001'),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.paymentSummaryPage),
        findsOneWidget,
      );
      await tester.tap(find.byKey(WidgetKeys.paymentSummaryFilterIcon));
      await tester.pump();
      expect(find.byKey(WidgetKeys.paymentSummaryFilter), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('In Progress', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Failed', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Processed', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Successful', false)),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentSummaryFilterStatus('Pending', false)),
        findsNothing,
      );
    });

    testWidgets('Payment summary in progress amount test', (tester) async {
      when(() => paymentSummaryBloc.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          details: paymentSummaryList,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            currency: Currency('MYR'),
          ),
        ),
      );
      when(() => paymentInProgressBlocMock.state).thenReturn(
        PaymentInProgressState.initial().copyWith(
          amount: StringValue('200'),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final paymentInProgress =
          find.text('In-progress: MYR 200.00', findRichText: true);
      expect(paymentInProgress, findsOneWidget);
    });
  });
}
