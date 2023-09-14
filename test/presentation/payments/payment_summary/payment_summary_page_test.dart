import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
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

final locator = GetIt.instance;

void main() {
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  late AnnouncementBloc announcementBlocMock;
  late PaymentSummaryBloc paymentSummaryBloc;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBloc;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
  });
  setUp(() async {
    authBlocMock = AuthBlocMock();
    autoRouterMock = locator<AppRouter>();
    announcementBlocMock = AnnouncementBlocMock();
    paymentSummaryBloc = PaymentSummaryBlocMock();
    downloadPaymentAttachmentsBloc = DownloadPaymentAttachmentsBlocMock();
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
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
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
  });
}
