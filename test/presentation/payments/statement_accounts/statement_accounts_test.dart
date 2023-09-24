import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/entities/soa_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart';
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

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MockSoaBloc extends MockBloc<SoaEvent, SoaState> implements SoaBloc {}

class MockSoaFilterBloc extends MockBloc<SoaFilterEvent, SoaFilterState>
    implements SoaFilterBloc {}

class MockDownloadPaymentAttachmentsBloc extends MockBloc<
        DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState>
    implements DownloadPaymentAttachmentsBloc {}

class MockOutstandingInvoicesBloc
    extends MockBloc<OutstandingInvoicesEvent, OutstandingInvoicesState>
    implements OutstandingInvoicesBloc {}

class MockAvailableCreditsBloc
    extends MockBloc<AvailableCreditsEvent, AvailableCreditsState>
    implements AvailableCreditsBloc {}

class MockNewPaymentBloc extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}

final locator = GetIt.instance;

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late EligibilityBloc mockEligibilityBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late DownloadPaymentAttachmentsBloc mockDownloadPaymentAttachmentsBloc;
  late OutstandingInvoicesBloc mockOutstandingInvoicesBloc;
  late AvailableCreditsBloc mockAvailableCreditsBloc;
  late NewPaymentBloc mockNewPaymentBloc;
  late SoaBloc mockSoaBloc;
  late SoaFilterBloc mockSoaFilterBloc;
  late AuthBloc mockAuthBloc;
  late List<Soa> fakeSoaList;
  final salesOrg = SalesOrg('2001');
  final applyFilter = SoaFilter.empty().copyWith(
    fromDate: DateTimeStringValue('20230615'),
    toDate: DateTimeStringValue('20230705'),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    fakeSoaList = await SoaLocalDataSource().getSoa();
  });
  setUp(() async {
    mockSalesOrgBloc = MockSalesOrgBloc();
    mockUserBloc = MockUserBloc();
    autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    mockEligibilityBloc = MockEligibilityBloc();
    mockAuthBloc = MockAuthBloc();
    mockAnnouncementBloc = MockAnnouncementBloc();
    mockSoaBloc = MockSoaBloc();
    mockSoaFilterBloc = MockSoaFilterBloc();
    mockDownloadPaymentAttachmentsBloc = MockDownloadPaymentAttachmentsBloc();
    mockAvailableCreditsBloc = MockAvailableCreditsBloc();
    mockOutstandingInvoicesBloc = MockOutstandingInvoicesBloc();
    mockNewPaymentBloc = MockNewPaymentBloc();
  });

  group('Statement of accounts Page', () {
    setUp(() {
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockEligibilityBloc.state)
          .thenReturn(EligibilityState.initial());
      when(() => mockAnnouncementBloc.state)
          .thenReturn(AnnouncementState.initial());
      when(() => mockSoaBloc.state).thenReturn(SoaState.initial());
      when(() => mockSoaFilterBloc.state).thenReturn(SoaFilterState.initial());
      when(() => mockDownloadPaymentAttachmentsBloc.state)
          .thenReturn(DownloadPaymentAttachmentsState.initial());
      when(() => mockAvailableCreditsBloc.state)
          .thenReturn(AvailableCreditsState.initial());
      when(() => mockOutstandingInvoicesBloc.state)
          .thenReturn(OutstandingInvoicesState.initial());
      when(() => mockNewPaymentBloc.state)
          .thenReturn(NewPaymentState.initial());
    });

    RouteDataScope getWUT() {
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
          BlocProvider<EligibilityBloc>(
            create: (context) => mockEligibilityBloc,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<UserBloc>(create: (context) => mockUserBloc),
          BlocProvider<SoaBloc>(
            create: (context) => mockSoaBloc,
          ),
          BlocProvider<SoaFilterBloc>(
            create: (context) => mockSoaFilterBloc,
          ),
          BlocProvider<DownloadPaymentAttachmentsBloc>(
            create: (context) => mockDownloadPaymentAttachmentsBloc,
          ),
          BlocProvider<AvailableCreditsBloc>(
            create: (context) => mockAvailableCreditsBloc,
          ),
          BlocProvider<OutstandingInvoicesBloc>(
            create: (context) => mockOutstandingInvoicesBloc,
          ),
          BlocProvider<NewPaymentBloc>(
            create: (context) => mockNewPaymentBloc,
          ),
        ],
        child: Scaffold(
          body: StatementAccountsPage(),
        ),
      );
    }

    testWidgets('Body Test - loading', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          isFetching: true,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.loaderImage),
        findsOneWidget,
      );
    });
    testWidgets('Body Test - Error', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          isFetching: true,
        ),
      );
      final expectedStates = [
        SoaState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        ),
      ];
      whenListen(
        mockSoaBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.customSnackBar),
        findsOneWidget,
      );
    });
    testWidgets('Body Test - Load with data', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          isFetching: true,
          soaList: [],
        ),
      );
      final expectedStates = [
        SoaState.initial().copyWith(
          soaList: fakeSoaList,
          appliedFilter: applyFilter,
        ),
      ];
      whenListen(
        mockSoaBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final findSoaItem = find.byKey(WidgetKeys.genericKey(key: 'SoaItem#0'));
      expect(findSoaItem, findsOneWidget);
      expect(find.text('Search results'), findsOneWidget);
    });

    testWidgets('Body Test - Header Test', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          soaList: fakeSoaList,
          appliedFilter: applyFilter,
        ),
      );
      final expectedStates = [
        CustomerCodeState.initial()
            .copyWith(customerCodeInfo: CustomerCodeInfo.empty()),
        CustomerCodeState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: '0030082707'),
        ),
      ];
      whenListen(
        mockCustomerCodeBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.soaHeaderCustomerCodeKey), findsOneWidget);
    });

    testWidgets(
        'Statement of accounts Page Body Test - Download Button Pressed when Download In Progress',
        (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          soaList: fakeSoaList,
          appliedFilter: applyFilter,
        ),
      );
      final expectedStatesForDownloadPaymentAttachments = [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
        ),
        DownloadPaymentAttachmentsState.initial(),
      ];
      whenListen(
        mockDownloadPaymentAttachmentsBloc,
        Stream.fromIterable(expectedStatesForDownloadPaymentAttachments),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final findSoaItem = find.byKey(WidgetKeys.genericKey(key: 'SoaItem#0'));
      expect(findSoaItem, findsOneWidget);
      final downloadButtonKey = find.byKey(WidgetKeys.soaDownloadButtonKey);
      expect(downloadButtonKey, findsOneWidget);
      await tester.tap(downloadButtonKey);
    });

    testWidgets(
        'Statement of accounts Page Body Test - Find LoadingAnimationWidget ',
        (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          soaList: fakeSoaList,
          appliedFilter: applyFilter,
        ),
      );
      when(() => mockDownloadPaymentAttachmentsBloc.state).thenReturn(
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          fileUrl: const DownloadPaymentAttachment(
            url:
                'ezrx_prod/uploads/MY_QA/20010030082707_0723_20230705_155346.pdf',
          ),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump(const Duration(seconds: 2));
      final findSoaItem = find.byKey(WidgetKeys.genericKey(key: 'SoaItem#0'));
      expect(findSoaItem, findsOneWidget);
      final soaLoadingAnimationWidgetKey = find.byKey(
        WidgetKeys.soaLoadingAnimationWidgetKey,
      );
      expect(soaLoadingAnimationWidgetKey, findsOneWidget);
    });

    testWidgets('Body Test - onRefresh', (tester) async {
      when(() => mockEligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          isLoading: false,
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: '0030082707'),
        ),
      );

      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          soaList: <Soa>[],
        ),
      );
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(getWUT());

      await tester.pump(const Duration(milliseconds: 100));
      final soaNotFoundRecordKey = find.byKey(WidgetKeys.soaNotFoundRecordKey);
      await tester.drag(
        soaNotFoundRecordKey,
        const Offset(0.0, 1000.0),
        warnIfMissed: false,
      );
      await tester.pump(const Duration(seconds: 1));
      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );
      await tester.pumpAndSettle();

      verify(
        () => mockSoaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: mockEligibilityBloc.state.customerCodeInfo,
          ),
        ),
      ).called(1);
      handle.dispose();
    });

    testWidgets('New payment Button', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(),
      );
      when(
        () => mockSalesOrgBloc.state,
      ).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: salesOrg,
          ),
        ),
      );
      when(() => mockCustomerCodeBloc.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'mock-customerCodeSoldTo',
          ),
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      final paymentButton = find.byKey(WidgetKeys.soaNewpaymentButtonKey);
      expect(
        paymentButton,
        findsOneWidget,
      );
      await tester.tap(paymentButton);
      await tester.pumpAndSettle();
      verify(
        () => mockNewPaymentBloc.add(
          NewPaymentEvent.initialized(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: salesOrg,
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'mock-customerCodeSoldTo',
            ),
            user: User.empty(),
          ),
        ),
      ).called(1);
    });
    group('Filter test-', () {
      testWidgets('bottomSheet ', (tester) async {
        final expectedStates = [
          SoaState.initial().copyWith(
            isFetching: true,
          ),
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        ];
        whenListen(
          mockSoaBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        final filterIcon = find.byIcon(Icons.tune);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterbottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterbottomSheetKey);
        expect(
          soaFilterbottomSheetFinder,
          findsOneWidget,
        );
        final closeButtonFinder = find.byKey(WidgetKeys.closeButton);
        expect(closeButtonFinder, findsOneWidget);
        await tester.tap(closeButtonFinder);
        await tester.pumpAndSettle();
        expect(
          soaFilterbottomSheetFinder,
          findsNothing,
        );
      });

      testWidgets('bottomSheet Apply button', (tester) async {
        final expectedStates = [
          SoaState.initial().copyWith(
            isFetching: true,
          ),
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        ];
        whenListen(
          mockSoaBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        final filterIcon = find.byIcon(Icons.tune);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterbottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterbottomSheetKey);
        expect(
          soaFilterbottomSheetFinder,
          findsOneWidget,
        );

        final applyButtonKey = find.byKey(
          WidgetKeys.soaFilterApplyButtonKey,
        );
        expect(applyButtonKey, findsOneWidget);
        await tester.tap(applyButtonKey);
        await tester.pumpAndSettle();
        expect(
          soaFilterbottomSheetFinder,
          findsNothing,
        );
      });

      testWidgets('bottomSheet Reset button', (tester) async {
        final expectedStates = [
          SoaState.initial().copyWith(
            isFetching: true,
          ),
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        ];
        whenListen(
          mockSoaBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        final filterIcon = find.byIcon(Icons.tune);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterbottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterbottomSheetKey);
        expect(
          soaFilterbottomSheetFinder,
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        final resetButtonKey = find.byKey(
          WidgetKeys.soaFilterResetButtonKey,
        );
        expect(resetButtonKey, findsOneWidget);
        await tester.tap(resetButtonKey);
        await tester.pumpAndSettle();
        expect(
          soaFilterbottomSheetFinder,
          findsNothing,
        );
      });

      testWidgets('bottomSheet - FormDataField', (tester) async {
        when(() => mockSoaFilterBloc.state).thenReturn(
          SoaFilterState.initial().copyWith(
            filter: applyFilter,
          ),
        );
        final expectedStates = [
          SoaState.initial().copyWith(
            isFetching: true,
            appliedFilter: applyFilter,
          ),
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        ];
        whenListen(
          mockSoaBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        final filterIcon = find.byIcon(Icons.tune);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterbottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterbottomSheetKey);
        expect(
          soaFilterbottomSheetFinder,
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.closeButton), findsOneWidget);

        final fromDataField = find.byKey(WidgetKeys.soaFromDateFieldKey);
        expect(fromDataField, findsOneWidget);
        await tester.tap(fromDataField);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.monthPickerKey), findsOneWidget);
      });

      testWidgets('bottomSheet - ToDataField', (tester) async {
        final expectedStates = [
          SoaState.initial().copyWith(
            isFetching: true,
            appliedFilter: applyFilter,
          ),
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        ];
        whenListen(
          mockSoaBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();
        final filterIcon = find.byIcon(Icons.tune);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterbottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterbottomSheetKey);
        expect(
          soaFilterbottomSheetFinder,
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        final toDataField = find.byKey(WidgetKeys.soaToDateFieldKey);
        expect(toDataField, findsOneWidget);
        await tester.tap(toDataField);
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.monthPickerKey), findsOneWidget);
      });

      testWidgets('bottomSheet - Respect with soafilter bloc ', (tester) async {
        when(() => mockSoaBloc.state).thenReturn(
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        );
        when(() => mockSoaFilterBloc.state).thenReturn(
          SoaFilterState.initial().copyWith(
            filter: SoaFilter.empty(),
          ),
        );
        final expectedStates = [
          SoaFilterState.initial().copyWith(
            filter: applyFilter,
          ),
        ];
        whenListen(
          mockSoaFilterBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();
        final filterIcon = find.byIcon(Icons.tune);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterbottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterbottomSheetKey);
        expect(
          soaFilterbottomSheetFinder,
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        final toDataField = find.byKey(WidgetKeys.soaToDateFieldKey);
        expect(toDataField, findsOneWidget);
        await tester.tap(toDataField);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.monthPickerKey), findsOneWidget);
      });
    });
  });
}
