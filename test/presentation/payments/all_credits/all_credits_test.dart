import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_address.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';

import '../../../utils/widget_utils.dart';

class AllCreditsBlocMock extends MockBloc<AllCreditsEvent, AllCreditsState>
    implements AllCreditsBloc {}

class AllCreditsFilterBlocMock
    extends MockBloc<AllCreditsFilterEvent, AllCreditsFilterState>
    implements AllCreditsFilterBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late AllCreditsBloc allCreditsBlocMock;
  late AllCreditsFilterBloc allCreditsFilterBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

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
    allCreditsBlocMock = AllCreditsBlocMock();
    eligibilityBlocMock = EligibilityBlockMock();
    allCreditsFilterBlocMock = AllCreditsFilterBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();

    when(() => allCreditsBlocMock.state).thenReturn(AllCreditsState.initial());
    when(() => allCreditsFilterBlocMock.state)
        .thenReturn(AllCreditsFilterState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());

    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<AllCreditsBloc>(
          create: (context) => allCreditsBlocMock,
        ),
        BlocProvider<AllCreditsFilterBloc>(
          create: (context) => allCreditsFilterBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
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
      ],
      child: const AllCreditsPage(),
    );
  }

  group('All Credits Screen', () {
    // testWidgets('=> AppBar Test', (tester) async {
    //   when(() => allCreditsBlocMock.state)
    //       .thenReturn(AllCreditsState.initial().copyWith(
    //     isLoading: true,
    //   ));
    //   final expectedState = [
    //     AllCreditsFilterState.initial(),
    //     AllCreditsFilterState.initial(),
    //     AllCreditsFilterState.initial(),
    //   ];
    //   whenListen(allCreditsFilterBlocMock, Stream.fromIterable(expectedState));

    //   await getWidget(tester);

    //   await tester.pump(const Duration(milliseconds: 100));
    //   final allCreditsText = find.text('Credits'.tr());
    //   expect(allCreditsText, findsOneWidget);
    // });

    testWidgets('=> Body Test when loading', (tester) async {
      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'mock-customerCodeSoldTo',
          ),
        ),
      );
      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          shipToInfo: ShipToInfo.empty().copyWith(
            shipToCustomerCode: 'mock-shipToCustomerCode',
          ),
        ),
      );
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          isLoading: true,
        ),
      );

      final expectedState = [
        AllCreditsFilterState.initial(),
        AllCreditsFilterState.initial(),
      ];
      whenListen(allCreditsFilterBlocMock, Stream.fromIterable(expectedState));

      await tester.pumpWidget(getWidget());
      await tester.pump(const Duration(milliseconds: 100));

      final loaderImage = find.byKey(WidgetKeys.loaderImage);
      expect(loaderImage, findsOneWidget);
      await tester.pump();
    });

    testWidgets('=> Body Test onRefresh', (tester) async {
      when(() => allCreditsBlocMock.state)
          .thenReturn(AllCreditsState.initial());
      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          shipToInfo: ShipToInfo(
            defaultShipToAddress: true,
            shipToCustomerCode: '',
            shipToName: ShipToName.empty(),
            shipToAddress: ShipToAddress.empty(),
            status: Status(''),
            building: '',
            city1: '',
            city2: '',
            postalCode: '',
            houseNumber1: '',
            telephoneNumber: '',
            region: '',
            floor: '',
            plant: '',
            licenses: [],
            country: '',
          ),
        ),
      );

      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          isLoading: false,
          failureOrSuccessOption: optionOf(const Right('')),
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456789'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            )
          ],
        ),
      );

      final handle = tester.ensureSemantics();
      await tester.runAsync(() async => await tester.pumpWidget(getWidget()));
      await tester.pumpAndSettle();

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
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial());
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          isLoading: false,
          canLoadMore: true,
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      // await tester.drag(
      //   find.textContaining('123456780').last,
      //   const Offset(0.0, -1000.0),
      // );
      await tester.pump(const Duration(seconds: 1));
      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator settle animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator hide animation
      await tester.pump();
    });

    testWidgets('Find Created on text', (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          isLoading: false,
          canLoadMore: true,
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());

      await tester.pump();
      final createdOnText = find.textContaining('Created on');
      expect(createdOnText, findsOneWidget);
    });
  });
}
