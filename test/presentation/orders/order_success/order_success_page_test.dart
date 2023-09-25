import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/widget_utils.dart';

class AutoRouterMock extends Mock implements AppRouter {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class OrderSummaryBlocMock
    extends MockBloc<OrderSummaryEvent, OrderSummaryState>
    implements OrderSummaryBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late AppRouter autoRouterMock;
  late SalesOrgBloc mockSalesOrgBloc;
  late CustomerCodeBloc customerCodeBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late OrderSummaryBloc orderSummaryBlocMock;
  late UserBloc userBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
      locator.registerLazySingleton(() => AutoRouterMock());
      locator.registerLazySingleton(
        () => MixpanelService(config: locator<Config>()),
      );
    },
  );
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      autoRouterMock = locator<AutoRouterMock>();
      mockSalesOrgBloc = MockSalesOrgBloc();
      customerCodeBlocMock = CustomerCodeBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      userBlocMock = UserBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();

      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial(),
      );
      when(() => autoRouterMock.currentPath).thenReturn('fake-path');
    },
  );

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      child: const OrderSuccessPage(),
      providers: [
        BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AdditionalDetailsBloc>(
          create: (context) => additionalDetailsBlocMock,
        ),
        BlocProvider<OrderSummaryBloc>(
          create: (context) => orderSummaryBlocMock,
        ),
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
    );
  }

  testWidgets(
    'Payment Term',
    (tester) async {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(
          isConfirming: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            invoiceNumber: 'fake-number',
            orderHistoryDetailsPaymentTerm:
                OrderHistoryDetailsPaymentTerm.empty().copyWith(
              paymentTermCode: PaymentTermCode(''),
              paymentTermDescription: PaymentTermDescription(''),
            ),
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final orderSuccessPage = find.byKey(WidgetKeys.orderSuccess);
      expect(orderSuccessPage, findsOneWidget);
      final paymentTermWidget =
          find.byKey(WidgetKeys.balanceTextRow('Payment term', 'NA'));
      expect(paymentTermWidget, findsOneWidget);
    },
  );

  testWidgets(
    'Order History navigation check',
    (tester) async {
      when(() => autoRouterMock.navigateNamed('main/orders_tab'))
          .thenAnswer((invocation) => Future(() => null));
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(
          isConfirming: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            invoiceNumber: 'fake-number',
            orderHistoryDetailsPaymentTerm:
                OrderHistoryDetailsPaymentTerm.empty().copyWith(
              paymentTermCode: PaymentTermCode(''),
              paymentTermDescription: PaymentTermDescription(''),
            ),
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final finder = find.byWidgetPredicate(
        (widget) => widget is RichText && tapTextSpan(widget, 'Orders'),
      );
      await tester.pumpAndSettle();
      expect(finder, findsOneWidget);
      verify(() => autoRouterMock.navigateNamed('main/orders_tab')).called(1);
      await tester.pumpAndSettle();
    },
  );

  // group(
  //   'Test Order Success Page',
  //   () {
  //     Widget getWidget() {
  //       return WidgetUtils.getScopedWidget(
  //         autoRouterMock: autoRouterMock,
  //         child: const OrderSuccessPage(),
  //         providers: [
  //           BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
  //           BlocProvider<CustomerCodeBloc>(
  //               create: (context) => customerCodeBlocMock),
  //           BlocProvider<AuthBloc>(create: (context) => authBlocMock),
  //           BlocProvider<AnnouncementBloc>(
  //               create: (context) => announcementBlocMock),
  //         ],
  //       );
  //     }

  // testWidgets(
  //   'Load Order Success',
  //   (tester) async {
  //     await tester.pumpWidget(getWidget());
  //     await tester.pump();
  //     final orderSuccessPage = find.byKey(const Key('orderSuccessKey'));
  //     expect(orderSuccessPage, findsOneWidget);
  //   },
  // );

  // testWidgets(
  //   '=> Tap Create New Order',
  //   (tester) async {
  //     await tester.pumpWidget(getWidget());
  //     await tester.pump();
  //     final orderSuccessPage = find.byKey(const Key('orderSuccessKey'));
  //     expect(orderSuccessPage, findsOneWidget);
  //     final newOrderButton = find.text('Create New Order');
  //     expect(newOrderButton, findsOneWidget);
  //     await tester.tap(newOrderButton);
  //     await tester.pump();
  //   },
  // );

  //TODO: Redirect not available currently. Change in layout
  // testWidgets(
  //   '=> Tap Go To Order History',
  //   (tester) async {
  //     await tester.pumpWidget(getWidget());
  //     await tester.pump();
  //     final orderSuccessPage = find.byKey(const Key('orderSuccessKey'));
  //     expect(orderSuccessPage, findsOneWidget);
  //     final goToOrderHistory = find.text('Go To Order History');
  //     expect(goToOrderHistory, findsOneWidget);
  //     await tester.tap(goToOrderHistory);
  //     await tester.pump();
  //   },
  // );

  // testWidgets(
  //   '=> Tap Back Button',
  //   (tester) async {
  //     await tester.pumpWidget(getWidget());
  //     await tester.pump();
  //     final orderSuccessPage = find.byKey(const Key('orderSuccessKey'));
  //     expect(orderSuccessPage, findsOneWidget);
  //     final backButton = find.byIcon(Icons.arrow_back);
  //     expect(backButton, findsOneWidget);
  //     await tester.tap(backButton);
  //     await tester.pump();
  //   },
  // );
  // },
  //);
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
