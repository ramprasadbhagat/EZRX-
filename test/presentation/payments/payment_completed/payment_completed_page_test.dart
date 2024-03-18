import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_completed/payment_completed_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class NewPaymentBlocMock extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class PaymentSummaryBlocMock
    extends MockBloc<PaymentSummaryEvent, PaymentSummaryState>
    implements PaymentSummaryBloc {}

class AppRouterMock extends Mock implements AppRouter {}

void main() {
  late AppRouter autoRouterMock;
  late NewPaymentBloc newPaymentBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late PaymentSummaryBloc paymentSummaryBlocMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerFactory(() => AppRouter());
    registerFallbackValue(
      const PageRouteInfo(PaymentPageRoute.name, path: 'payments'),
    );

    autoRouterMock = locator<AppRouter>();
    registerFallbackValue((Route route) {
      return route.settings.name == PaymentPageRoute.name;
    });

    newPaymentBlocMock = NewPaymentBlocMock();
    eligibilityBlocMock = EligibilityBlockMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    paymentSummaryBlocMock = PaymentSummaryBlocMock();
  });

  setUp(() {
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => paymentSummaryBlocMock.state)
        .thenReturn(PaymentSummaryState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      useMediaQuery: true,
      usingLocalization: true,
      routeName: PaymentAdviceCreatedPageRoute.name,
      providers: [
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<PaymentSummaryBloc>(
          create: (context) => paymentSummaryBlocMock,
        ),
      ],
      child: const PaymentCompletedPage(),
    );
  }

  group('Payment Completed Page Test =>', () {
    testWidgets('Test AppBar', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.text('Payment request submitted'.tr()),
        findsOneWidget,
      );
      final paymentAdviceCreatedPageBack =
          find.byKey(WidgetKeys.paymentAdviceCreatedPageBack);
      expect(paymentAdviceCreatedPageBack, findsOneWidget);
      await tester.tap(paymentAdviceCreatedPageBack);
      await tester.pumpAndSettle();
      expect(find.byType(PaymentCompletedPage), findsNothing);
    });
    testWidgets('Test Body Content', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.byIcon(Icons.check_circle),
        findsOneWidget,
      );
      final bodyText = find.textContaining(
        'Our payment processor is coordinating with the bank to process your payment request for payment advice ',
      );
      expect(bodyText, findsOneWidget);
      final bodyText2 = find.textContaining(
        'We’ll send a payment advice copy to',
      );
      expect(bodyText2, findsOneWidget);
      final pleaseNote = find.text(
        'Please note',
      );
      expect(pleaseNote, findsOneWidget);
      final bulletWidget = find.byType(
        BulletWidget,
      );
      expect(bulletWidget, findsNWidgets(4));
      final finder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText && tapTextSpan(widget, 'Payment Summary'),
      );
      await tester.pumpAndSettle();
      expect(finder, findsOneWidget);
    });
    testWidgets('Test Account Summary Button', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final accountSummaryButton = find.byKey(
        WidgetKeys.accountSummaryButton,
      );
      expect(accountSummaryButton, findsOneWidget);
      await tester.tap(accountSummaryButton);
      await tester.pumpAndSettle();
      expect(
        autoRouterMock.current.path,
        'payments/invoice_credit',
      );
    });
    testWidgets('Test payment Summary Button', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final accountSummaryButton = find.byKey(
        WidgetKeys.paymentSummaryRouteButton,
      );
      expect(accountSummaryButton, findsOneWidget);
      await tester.tap(accountSummaryButton);
      await tester.pumpAndSettle();
      expect(
        autoRouterMock.current.path,
        'payments/payment_summary',
      );
    });
  });
}

bool findTextAndTap(InlineSpan visitor, String text) {
  if (visitor is TextSpan && visitor.text == text) {
    (visitor.recognizer as TapGestureRecognizer).onTap!();

    return false;
  }

  return true;
}

bool tapTextSpan(RichText richText, String text) {
  final isTapped = !richText.text.visitChildren(
    (visitor) => findTextAndTap(visitor, text),
  );

  return isTapped;
}
