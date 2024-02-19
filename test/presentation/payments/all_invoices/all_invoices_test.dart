import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/all_invoices.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class AllInvoicesBlocMock extends MockBloc<AllInvoicesEvent, AllInvoicesState>
    implements AllInvoicesBloc {}

class AllInvoicesFilterBlocMock
    extends MockBloc<AllInvoicesFilterEvent, AllInvoicesFilterState>
    implements AllInvoicesFilterBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class NewPaymentBlocMock extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}

void main() {
  late AllInvoicesBloc allInvoicesBlocMock;
  late AllInvoicesFilterBloc allInvoicesFilterBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late List<CreditAndInvoiceItem> allInvoicesData;
  final thSalesOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('2900'),
  );
  final sgSalesOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('2601'),
  );
  late NewPaymentBlocMock newPaymentBlocMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    allInvoicesBlocMock = AllInvoicesBlocMock();
    eligibilityBlocMock = EligibilityBlockMock();
    allInvoicesFilterBlocMock = AllInvoicesFilterBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    allInvoicesData =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();

    when(() => allInvoicesBlocMock.state)
        .thenReturn(AllInvoicesState.initial());
    when(() => allInvoicesFilterBlocMock.state)
        .thenReturn(AllInvoicesFilterState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      useMediaQuery: false,
      usingLocalization: true,
      providers: [
        BlocProvider<AllInvoicesBloc>(
          create: (context) => allInvoicesBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AllInvoicesFilterBloc>(
          create: (context) => allInvoicesFilterBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
      ],
      child: const AllInvoicesPage(),
    );
  }

  group('All Invoices Screen', () {
    testWidgets('=> Invoice Due date formatting for TH market', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: thSalesOrganisation,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: thSalesOrganisation,
        ),
      );

      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('20230919'),
              postingDate: DateTimeStringValue('20230917'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());

      await tester.pump();
      //Make sure due date display on format dd MMM yyyy for TH market
      final dueDateText = find.textContaining('${'Due on'.tr()} 19 Sep 2023');
      expect(dueDateText, findsOneWidget);
    });

    testWidgets('=> Invoice Due date formatting for SG market', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: sgSalesOrganisation,
        ),
      );

      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456781'),
              netDueDate: DateTimeStringValue('20230920'),
              postingDate: DateTimeStringValue('20230917'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      //Make sure due date display on format dd MMM yyyy for TH market
      final dueDateText = find.textContaining('${'Due on'.tr()} 20 Sep 2023');
      expect(dueDateText, findsOneWidget);
    });

    testWidgets('=> Body Test when loading', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'mock-customerCodeSoldTo',
          ),
          shipToInfo: ShipToInfo.empty().copyWith(
            shipToCustomerCode: 'mock-shipToCustomerCode',
          ),
        ),
      );
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          isLoading: true,
        ),
      );

      final expectedState = [
        AllInvoicesFilterState.initial(),
        AllInvoicesFilterState.initial(),
      ];
      whenListen(allInvoicesFilterBlocMock, Stream.fromIterable(expectedState));

      await tester.pumpWidget(getWidget());
      await tester.pump(const Duration(milliseconds: 100));

      final loaderImage = find.byKey(WidgetKeys.loaderImage);
      expect(loaderImage, findsOneWidget);
      await tester.pump();
    });

    testWidgets('=> Body Test onRefresh', (tester) async {
      when(() => allInvoicesBlocMock.state)
          .thenReturn(AllInvoicesState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
        ),
      );

      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          isLoading: false,
          failureOrSuccessOption: optionOf(const Right('')),
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456789'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            )
          ],
        ),
      );
      final handle = tester.ensureSemantics();
      await tester.runAsync(() async => await tester.pumpWidget(getWidget()));
      await tester.pump(const Duration(milliseconds: 100));

      await tester.drag(
        find.textContaining('123456789'),
        const Offset(0.0, 1000.0),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );

      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator settle animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator hide animation

      handle.dispose();
      await tester.pump();
    });

    testWidgets('=> Body Test onLoadMore', (tester) async {
      when(() => allInvoicesFilterBlocMock.state)
          .thenReturn(AllInvoicesFilterState.initial());
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          isLoading: false,
          canLoadMore: true,
          items: <CreditAndInvoiceItem>[
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
        ),
      );
      await tester.pumpWidget(getWidget());
      // await tester.drag(
      //   find.textContaining('123456780').last,
      //   const Offset(0.0, -1000.0),
      // );
      // await tester.pump(const Duration(seconds: 1));
      // await tester
      //     .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator settle animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator hide animation
      await tester.pump();
    });

    testWidgets('=> Invoice order Id', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: thSalesOrganisation,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: thSalesOrganisation,
        ),
      );

      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          items: <CreditAndInvoiceItem>[
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('20230919'),
              postingDate: DateTimeStringValue('20230917'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
              orderId: StringValue('123456789'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());

      await tester.pump();
      expect(find.byKey(WidgetKeys.invoiceItemOrderId), findsWidgets);
    });

    testWidgets('=> Invoice order Id Loading', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: thSalesOrganisation,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: thSalesOrganisation,
        ),
      );

      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          isFetchingOrder: true,
          items: <CreditAndInvoiceItem>[
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('20230919'),
              postingDate: DateTimeStringValue('20230917'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());

      await tester.pump();
      expect(
        find.byKey(WidgetKeys.invoiceItemOrderIdLoadingShimmer),
        findsWidgets,
      );
    });

    testWidgets('Find Gov.No for all invoices', (tester) async {
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(items: allInvoicesData),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final documentReferenceID = find.text('Gov. no 0810055826');
      expect(documentReferenceID, findsOneWidget);
    });

    testWidgets(
        '=> Invoice details should display no found invoice screen in failure state',
        (tester) async {
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final loaderImage = find.byKey(WidgetKeys.loaderImage);
      expect(loaderImage, findsNothing);
      final noRecordFoundWidgetFinder = find.byType(NoRecordFound);
      expect(noRecordFoundWidgetFinder, findsOneWidget);

      final noRecordTextFinder = find.text('No invoice found');

      expect(noRecordTextFinder, findsOneWidget);
    });
  });
}
