import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
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

class MockAppRouter extends Mock implements AppRouter {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

class PaymentSummaryBlocMock
    extends MockBloc<PaymentSummaryEvent, PaymentSummaryState>
    implements PaymentSummaryBloc {}

class MockPaymentSummaryDetailsBloc
    extends MockBloc<PaymentSummaryDetailsEvent, PaymentSummaryDetailsState>
    implements PaymentSummaryDetailsBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

final locator = GetIt.instance;

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late PaymentSummaryBloc paymentSummaryBloc;
  late PaymentSummaryDetailsBloc mockPaymentSummaryDetailsBloc;
  late AuthBloc mockAuthBloc;
  late EligibilityBloc eligibilityBlocMock;
  late PaymentSummaryDetails fakePaymentDetails;
  late PaymentSummaryDetails mockPaymentDetails;
  late PaymentInvoiceInfoPdf mockPaymentInvoiceInfoPdf;
  late MaterialPageX paymentSummaryPageMock;

  final routeData = RouteData(
    route: const RouteMatch(
      name: 'PaymentSummaryDetailsPageRoute',
      segments: ['payments', 'payment_summary', 'payment_summary_details'],
      path: 'payments/payment_summary/payment_summary_details',
      stringMatch: 'payments/payment_summary/payment_summary_details',
      key: ValueKey('PaymentSummaryDetailsPageRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );

  final paymentSummaryRouteData = RouteData(
    route: const RouteMatch(
      name: 'PaymentSummaryPageRoute',
      segments: ['payments', 'payment_summary'],
      path: 'payments/payment_summary',
      stringMatch: 'payments/payment_summary',
      key: ValueKey('PaymentSummaryPageRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    mockPaymentDetails =
        await PaymentItemLocalDataSource().getPaymentSummaryDetails();
    mockPaymentInvoiceInfoPdf =
        await NewPaymentLocalDataSource().getPaymentInvoiceInfoPdf();
  });
  setUp(() async {
    mockSalesOrgBloc = MockSalesOrgBloc();
    mockUserBloc = MockUserBloc();
    autoRouterMock = MockAppRouter();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    eligibilityBlocMock = EligibilityBlockMock();
    mockAuthBloc = MockAuthBloc();
    mockAnnouncementBloc = MockAnnouncementBloc();
    paymentSummaryBloc = PaymentSummaryBlocMock();
    mockPaymentSummaryDetailsBloc = MockPaymentSummaryDetailsBloc();
    fakePaymentDetails = PaymentSummaryDetails.empty()
        .copyWith(status: FilterStatus('In Progress'));
    paymentSummaryPageMock = MaterialPageX(
      routeData: paymentSummaryRouteData,
      child: const SizedBox(),
    );
  });

  group('Payment Summary Details Page', () {
    setUp(() {
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => mockAnnouncementBloc.state)
          .thenReturn(AnnouncementState.initial());
      when(() => paymentSummaryBloc.state)
          .thenReturn(PaymentSummaryState.initial());
      when(() => mockPaymentSummaryDetailsBloc.state)
          .thenReturn(PaymentSummaryDetailsState.initial());
      when(() => autoRouterMock.currentPath)
          .thenReturn('payments/payment_summary/payment_summary_details');
      when(() => autoRouterMock.current).thenReturn(routeData);
      when(() => autoRouterMock.stack)
          .thenReturn([MaterialPageXMock(), paymentSummaryPageMock]);
    });

    RouteDataScope getWUT({required Widget child}) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
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
          BlocProvider<PaymentSummaryBloc>(
            create: (context) => paymentSummaryBloc,
          ),
          BlocProvider<PaymentSummaryDetailsBloc>(
            create: (context) => mockPaymentSummaryDetailsBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: Scaffold(
          body: child,
        ),
      );
    }

    testWidgets('Payment Summary Details Page Body Test - loading',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
        ),
      );
      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
        ),
      ];
      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(),
        ),
      );
      await tester.pump();

      expect(
        find.byType(LoadingShimmer),
        findsWidgets,
      );
    });
    testWidgets(
        'Payment Summary Details Page Body Test - find two buttons respect to the Payment Summary Details status',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
          isFetchingAdvice: true,
        ),
      );
      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: false,
          isFetchingAdvice: false,
          details: PaymentSummaryDetails.empty().copyWith(
            paymentItems: [
              PaymentItem.empty().copyWith(
                documentDate: DateTimeStringValue(''),
              ),
            ],
          ),
          paymentInvoiceInfoPdf:
              PaymentInvoiceInfoPdf.empty().copyWith(paymentID: 'paymentID'),
        ),
      ];
      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(),
        ),
      );
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

    testWidgets(
        'Payment Summary Details Page - delete payment advice snackbar should not be displayed if not deleted',
        (tester) async {
      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
          isFetchingAdvice: true,
          failureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails,
          paymentInvoiceInfoPdf: mockPaymentInvoiceInfoPdf,
          failureOrSuccessOption: none(),
        ),
      ];
      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(),
        ),
      );
      await tester.pumpAndSettle();

      verifyNever(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
          ),
        ),
      );
      expect(
        find.widgetWithText(
          CustomSnackBar,
          'PA #09EZ230000544601 has been deleted',
        ),
        findsNothing,
      );
    });

    testWidgets(
        'Payment Summary Details Page - Delete payment advice and verify delete event call',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
          isFetchingAdvice: true,
        ),
      );
      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: false,
          isFetchingAdvice: false,
          details: PaymentSummaryDetails.empty().copyWith(
            paymentItems: [
              PaymentItem.empty().copyWith(
                documentDate: DateTimeStringValue(''),
              ),
            ],
          ),
          paymentInvoiceInfoPdf:
              PaymentInvoiceInfoPdf.empty().copyWith(paymentID: 'paymentID'),
        ),
      ];

      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(),
        ),
      );
      await tester.pumpAndSettle();
      final deleteAdviceButton = find.byKey(
        WidgetKeys.deleteAdviceButtonKey,
      );
      final deleteAdviceBottomSheetFinder = find.byKey(
        WidgetKeys.deleteCancelAdviceBottomSheet,
      );
      final deleteButtonFinder = find.byKey(
        WidgetKeys.deleteCancelAdviceBottomSheetButton,
      );
      expect(deleteAdviceButton, findsOneWidget);
      await tester.tap(deleteAdviceButton);
      await tester.pumpAndSettle();
      expect(deleteAdviceBottomSheetFinder, findsOneWidget);
      expect(deleteButtonFinder, findsOneWidget);
      await tester.tap(deleteButtonFinder);
      await tester.pump();
      verify(
        () => mockPaymentSummaryDetailsBloc.add(
          const PaymentSummaryDetailsEvent.deleteAdvice(),
        ),
      ).called(1);
    });

    testWidgets(
        'Payment Summary Details Page - Delete payment advice success from Payment Summary Page',
        (tester) async {
      when(
        () =>
            autoRouterMock.popUntilRouteWithName(PaymentSummaryPageRoute.name),
      ).thenAnswer((invocation) => Future(() => null));

      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDeletingPayment: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails,
          isDeletingPayment: false,
        ),
      ];

      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: DeleteCancelAdviceBottomSheet.delete(
            paymentAdviceNumber: '09EZ230000544601',
          ),
        ),
      );
      await tester.pumpAndSettle();
      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
          ),
        ),
      );

      verify(
        () =>
            autoRouterMock.popUntilRouteWithName(PaymentSummaryPageRoute.name),
      ).called(1);
      expect(
        find.widgetWithText(
          CustomSnackBar,
          'PA #09EZ230000544601 has been deleted',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Payment Summary Details Page - Delete payment advice fail',
        (tester) async {
      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDeletingPayment: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails,
          isDeletingPayment: false,
          failureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
      ];

      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: DeleteCancelAdviceBottomSheet.delete(
            paymentAdviceNumber: '09EZ230000544601',
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.widgetWithText(
          CustomSnackBar,
          'Fake-error',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'Payment Summary Details Page - Cancel payment advice and verify cancel event call',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );
      when(
        () => autoRouterMock.pop(),
      ).thenAnswer((invocation) async => false);
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
          isFetchingAdvice: true,
        ),
      );
      final expectedStates = PaymentSummaryDetailsState.initial().copyWith(
        isDetailFetching: false,
        isFetchingAdvice: false,
        details: PaymentSummaryDetails.empty().copyWith(
          paymentItems: [
            PaymentItem.empty().copyWith(
              documentDate: DateTimeStringValue(''),
            ),
          ],
        ),
        paymentInvoiceInfoPdf:
            PaymentInvoiceInfoPdf.empty().copyWith(paymentID: 'paymentID'),
      );

      when(
        () => mockPaymentSummaryDetailsBloc.state,
      ).thenReturn(expectedStates);

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(),
        ),
      );
      await tester.pumpAndSettle();
      final cancelAdviceButton = find.byKey(
        WidgetKeys.cancelAdviceButtonKey,
      );
      final deleteAdviceBottomSheetFinder = find.byKey(
        WidgetKeys.deleteCancelAdviceBottomSheet,
      );
      final deleteCancelAdviceBottomSheetButtonFinder = find.byKey(
        WidgetKeys.deleteCancelAdviceBottomSheetButton,
      );
      expect(cancelAdviceButton, findsOneWidget);
      await tester.tap(cancelAdviceButton);
      await tester.pumpAndSettle();
      expect(deleteAdviceBottomSheetFinder, findsOneWidget);
      expect(deleteCancelAdviceBottomSheetButtonFinder, findsOneWidget);
      await tester.tap(deleteCancelAdviceBottomSheetButtonFinder);
      await tester.pump();
      verify(
        () => mockPaymentSummaryDetailsBloc.add(
          const PaymentSummaryDetailsEvent.cancelAdvice(),
        ),
      ).called(1);
    });

    testWidgets('Payment Summary Details Page - Cancel payment advice success',
        (tester) async {
      final initialState = PaymentSummaryDetailsState.initial().copyWith(
        details: PaymentSummaryDetails.empty().copyWith(
          paymentItems: [
            PaymentItem.empty().copyWith(
              documentDate: DateTimeStringValue(''),
            ),
          ],
        ),
        paymentInvoiceInfoPdf:
            PaymentInvoiceInfoPdf.empty().copyWith(paymentID: 'paymentID'),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );

      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        initialState.copyWith(
          details: mockPaymentDetails,
          failureOrSuccessOption: optionOf(const Right('')),
        ),
      );
      final expectedStates = [
        initialState.copyWith(
          isCancelingAdvice: true,
        ),
        initialState.copyWith(
          details: mockPaymentDetails,
        ),
      ];

      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(),
        ),
      );
      await tester.pump();

      verify(
        () => mockPaymentSummaryDetailsBloc.add(
          PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
            details: mockPaymentDetails,
          ),
        ),
      );
    });

    testWidgets('Payment Summary Details Page - Cancel payment advice fail',
        (tester) async {
      final initialState = PaymentSummaryDetailsState.initial().copyWith(
        details: PaymentSummaryDetails.empty().copyWith(
          paymentItems: [
            PaymentItem.empty().copyWith(
              documentDate: DateTimeStringValue(''),
            ),
          ],
        ),
        paymentInvoiceInfoPdf:
            PaymentInvoiceInfoPdf.empty().copyWith(paymentID: 'paymentID'),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );

      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        initialState.copyWith(
          details: mockPaymentDetails,
          failureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
      );
      final expectedStates = [
        initialState.copyWith(
          isCancelingAdvice: true,
        ),
        initialState.copyWith(
          details: mockPaymentDetails,
          failureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
      ];

      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.widgetWithText(
          CustomSnackBar,
          'Fake-error',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'Payment Summary Details Page - Check Advice expiry for in progress',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails,
        ),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('in 23 Day(s)'), findsOneWidget);
    });

    testWidgets(
        'Payment Summary Details Page - Check Advice expiry for Successful',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails.copyWith(
            status: FilterStatus('Successful'),
          ),
        ),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('in 23 Day(s)'), findsNothing);
    });
  });
}
