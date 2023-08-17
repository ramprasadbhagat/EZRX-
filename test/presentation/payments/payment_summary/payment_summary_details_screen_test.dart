import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_item/payment_item_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockAnnouncementBloc
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MockPaymentItemBloc extends MockBloc<PaymentItemEvent, PaymentItemState>
    implements PaymentItemBloc {}

final locator = GetIt.instance;

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late PaymentItemBloc mockPaymentItemBloc;
  late AuthBloc mockAuthBloc;
  late PaymentSummaryDetails fakePaymentDetails;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
  });
  setUp(() async {
    mockSalesOrgBloc = MockSalesOrgBloc();
    mockUserBloc = MockUserBloc();
    autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    mockAuthBloc = MockAuthBloc();
    mockAnnouncementBloc = MockAnnouncementBloc();
    mockPaymentItemBloc = MockPaymentItemBloc();
    fakePaymentDetails = PaymentSummaryDetails.empty()
        .copyWith(status: StatusType('In Progress'));
  });

  group('Payment Summary Details Page', () {
    setUp(() {
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockAnnouncementBloc.state)
          .thenReturn(AnnouncementState.initial());
      when(() => mockPaymentItemBloc.state)
          .thenReturn(PaymentItemState.initial());
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => mockAnnouncementBloc,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => mockCustomerCodeBloc,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<UserBloc>(create: (context) => mockUserBloc),
          BlocProvider<PaymentItemBloc>(
            create: (context) => mockPaymentItemBloc,
          ),
        ],
        child: Scaffold(
          body: PaymentSummaryDetailsPage(
            paymentSummaryDetails: fakePaymentDetails,
          ),
        ),
      );
    }

    testWidgets('Payment Summary Details Page Body Test - loading',
        (tester) async {
      when(() => mockPaymentItemBloc.state).thenReturn(
        PaymentItemState.initial().copyWith(
          isFetching: true,
        ),
      );
      final expectedStates = [
        PaymentItemState.initial().copyWith(
          isFetching: true,
        ),
      ];
      whenListen(
        mockPaymentItemBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.loaderImage),
        findsOneWidget,
      );
    });
    testWidgets(
        'Payment Summary Details Page Body Test - fina two buttons respect to the Payment Summary Details status',
        (tester) async {
      when(() => mockPaymentItemBloc.state).thenReturn(
        PaymentItemState.initial().copyWith(
          isFetching: true,
        ),
      );
      final expectedStates = [
        PaymentItemState.initial().copyWith(
          isFetching: false,
          paymentItemList: [
            PaymentItem.empty().copyWith(
              documentDate: DateTimeStringValue(''),
            )
          ],
        ),
      ];
      whenListen(
        mockPaymentItemBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final findRow = find.byKey(WidgetKeys.buttonRowKey);
      expect(findRow, findsOneWidget);
      final downloadAdviceButton = find.byKey(
        WidgetKeys.downloadAdviceButtonKey,
      );
      expect(downloadAdviceButton, findsOneWidget);
      if (!fakePaymentDetails.status.getIsSuccessfulOrProcessed) {
        final deleteadviceButton = find.byKey(
          WidgetKeys.deleteAdviceButtonKey,
        );
        expect(deleteadviceButton, findsOneWidget);
      }
    });
  });
}
