import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/bank_in_accounts/bank_in_accounts_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../../utils/widget_utils.dart';
import '../../new_payment_page_test.dart';

class BankInAccountBlocMock
    extends MockBloc<BankInAccountsEvent, BankInAccountsState>
    implements BankInAccountsBloc {}

void main() {
  late NewPaymentBloc newPaymentBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late BankInAccountsBloc bankInAccountsBlocMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    newPaymentBlocMock = NewPaymentBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    bankInAccountsBlocMock = BankInAccountBlocMock();
    eligibilityBlocMock = EligibilityBlockMock();
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
      ),
    );
    when(() => bankInAccountsBlocMock.state)
        .thenReturn(BankInAccountsState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<BankInAccountsBloc>(
          create: (context) => bankInAccountsBlocMock,
        ),
      ],
      child: const Scaffold(
        body: PaymentMethodTab(),
      ),
    );
  }

  group('Payment method tab -', () {
    testWidgets('Initial state', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();

      expect(find.byKey(WidgetKeys.createPaymentAdviseNote), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.detailInfoSection('Select payment method'.tr())),
        findsOneWidget,
      );
      expect(find.byKey(WidgetKeys.paymentMethodSelector), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.detailInfoSection('Payment details'.tr())),
        findsOneWidget,
      );
      expect(find.byType(AddressInfoSection), findsOneWidget);
      expect(find.byKey(WidgetKeys.invoiceCreditListView), findsOneWidget);
    });

    group('Create payment advise note -', () {
      testWidgets('Not visible when market is not PH', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(WidgetKeys.createPaymentAdviseWarning), findsNothing);
      });

      testWidgets('Visible when market is PH', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial()
              .copyWith
              .salesOrganisation(salesOrg: fakePHSalesOrg),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.createPaymentAdviseWarning),
          findsOneWidget,
        );
      });
    });

    group('Payment selector -', () {
      const selectedIndex = 0;
      final paymentMethodList = [
        NewPaymentMethod(
          paymentMethod: PaymentMethodValue('fake-1'),
          options: [],
        ),
        NewPaymentMethod(
          paymentMethod: PaymentMethodValue('fake-2'),
          options: [],
        ),
        NewPaymentMethod(
          paymentMethod: PaymentMethodValue('fake-3'),
          options: [],
        ),
      ];
      testWidgets('Show shimmer when loading', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(isFetchingPaymentMethod: true),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final paymentMethodSelector =
            find.byKey(WidgetKeys.paymentMethodSelector);
        expect(paymentMethodSelector, findsOneWidget);
        expect(
          find.descendant(
            of: paymentMethodSelector,
            matching: find.byType(LoadingShimmer),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: paymentMethodSelector,
            matching: find.byKey(WidgetKeys.paymentMethodTile),
          ),
          findsNothing,
        );
      });

      testWidgets('Show list of payment method when loaded success',
          (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: paymentMethodList[selectedIndex],
            paymentMethods: paymentMethodList,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final paymentMethodSelector =
            find.byKey(WidgetKeys.paymentMethodSelector);
        expect(paymentMethodSelector, findsOneWidget);
        expect(
          find.descendant(
            of: paymentMethodSelector,
            matching: find.byType(LoadingShimmer),
          ),
          findsNothing,
        );
        final tile = find.byKey(WidgetKeys.paymentMethodTile);
        expect(
          find.descendant(of: paymentMethodSelector, matching: tile),
          findsNWidgets(paymentMethodList.length),
        );
        final radio = find.byKey(WidgetKeys.paymentMethodRadio);
        expect(
          find.descendant(of: tile, matching: radio),
          findsNWidgets(paymentMethodList.length),
        );
        for (var i = 0; i < paymentMethodList.length; i++) {
          final widget = tester.widget<Radio>(radio.at(i));
          expect(widget.value, paymentMethodList[i].paymentMethod);
          expect(widget.groupValue, paymentMethodList[selectedIndex].paymentMethod);
        }
      });

      testWidgets('Show snack bar when loaded failure', (tester) async {
        const fakeErrorMessage = 'test';
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              isFetchingPaymentMethod: true,
            ),
            NewPaymentState.initial().copyWith(
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other(fakeErrorMessage))),
            ),
          ]),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        final message = find.byKey(WidgetKeys.customSnackBarMessage);
        expect(
          tester.widget<Text>(message).data,
          equals(fakeErrorMessage.tr()),
        );
      });

      testWidgets('Update status when tap on item', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            paymentMethods: paymentMethodList,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final item = find.byKey(WidgetKeys.paymentMethodTile);
        expect(item, findsNWidgets(paymentMethodList.length));

        await tester.tap(item.at(selectedIndex));
        await tester.pump();

        verify(
          () => newPaymentBlocMock.add(
            NewPaymentEvent.updatePaymentMethodSelected(
              paymentMethodSelected: paymentMethodList[selectedIndex],
            ),
          ),
        ).called(1);
      });
    });

    group('Bank-in information -', () {
      final bankInWidget = find.byKey(WidgetKeys.bankInAccountInfo);
      final bankInfoTile = find.byKey(WidgetKeys.bankInfoTile);

      testWidgets(
          'Not visible and not fetch when selected payment method is not bank-in',
          (tester) async {
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable(
            [
              NewPaymentState.initial().copyWith(
                selectedPaymentMethod: NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('fake'),
                  options: [],
                ),
              )
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(bankInWidget, findsNothing);

        verifyNever(
          () => bankInAccountsBlocMock.add(
            BankInAccountsEvent.bankInFetch(salesOrg: fakeSalesOrg),
          ),
        );
      });

      testWidgets(
          'Visible and start fetch when selected payment method is bank-in',
          (tester) async {
        final bankInSelectedState = NewPaymentState.initial().copyWith(
          selectedPaymentMethod: NewPaymentMethod(
            paymentMethod: PaymentMethodValue('Bank-In'),
            options: [],
          ),
        );
        when(() => newPaymentBlocMock.state).thenReturn(bankInSelectedState);
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([NewPaymentState.initial(), bankInSelectedState]),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(bankInWidget, findsOneWidget);
        expect(
          find.descendant(
            of: bankInWidget,
            matching: find.byKey(WidgetKeys.bankInInstructionNote),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(of: bankInWidget, matching: bankInfoTile),
          findsNothing,
        );

        verify(
          () => bankInAccountsBlocMock.add(
            BankInAccountsEvent.bankInFetch(salesOrg: fakeSalesOrg),
          ),
        ).called(1);
      });

      testWidgets('Show loading shimmer when fetching', (tester) async {
        final bankInSelectedState = NewPaymentState.initial().copyWith(
          selectedPaymentMethod: NewPaymentMethod(
            paymentMethod: PaymentMethodValue('Bank-In'),
            options: [],
          ),
        );
        when(() => newPaymentBlocMock.state).thenReturn(bankInSelectedState);
        when(() => bankInAccountsBlocMock.state).thenReturn(
          BankInAccountsState.initial().copyWith(isFetching: true),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(bankInWidget, findsOneWidget);
        expect(
          find.descendant(
            of: bankInWidget,
            matching: find.byType(LoadingShimmer),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Show bank info detail list', (tester) async {
        final bankInfoList = [BankBeneficiary.empty(), BankBeneficiary.empty()];
        final bankInSelectedState = NewPaymentState.initial().copyWith(
          selectedPaymentMethod: NewPaymentMethod(
            paymentMethod: PaymentMethodValue('Bank-In'),
            options: [],
          ),
        );
        when(() => newPaymentBlocMock.state).thenReturn(bankInSelectedState);
        when(() => bankInAccountsBlocMock.state).thenReturn(
          BankInAccountsState.initial().copyWith(bankInAccounts: bankInfoList),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(bankInWidget, findsOneWidget);
        expect(
          find.descendant(of: bankInWidget, matching: bankInfoTile),
          findsNWidgets(bankInfoList.length),
        );
      });
    });

    group('Credit and invoice list -', () {
      const fakeAccountingDocument = 'fake-id';
      const fakeAmount = 10000.0;
      final priceText = StringUtils.priceComponentDisplayPrice(
        fakeSalesOrganisationConfigs,
        fakeAmount,
        true,
      );
      final fakeNetDueDate = DateTimeStringValue('fake');
      final fakeItem = CustomerOpenItem.empty().copyWith(
        accountingDocument: fakeAccountingDocument,
        openAmountInTransCrcy: fakeAmount,
        netDueDate: fakeNetDueDate,
      );
      final items = [fakeItem, fakeItem];
      testWidgets('Not display when no selected invoice and credit ',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(find.byKey(WidgetKeys.invoiceCreditItemTile), findsNothing);
      });

      testWidgets('Display when having selected credits', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedCredits: items,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(
          find.byKey(WidgetKeys.invoiceCreditItemTile),
          findsNWidgets(items.length),
        );
      });

      testWidgets('Display when having selected invoices', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: items,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(
          find.byKey(WidgetKeys.invoiceCreditItemTile),
          findsNWidgets(items.length),
        );
      });

      testWidgets('Display invoice/credit information', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(selectedCredits: items),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final tile = find.byKey(WidgetKeys.invoiceCreditItemTile);
        expect(
          find.byKey(WidgetKeys.invoiceCreditItemTile),
          findsNWidgets(items.length),
        );

        final id = find.byKey(WidgetKeys.invoiceCreditItemId);
        final amount = find.byKey(WidgetKeys.invoiceCreditItemAmount);
        final dueDate = find.byKey(WidgetKeys.invoiceCreditItemDate);
        expect(
          find.descendant(of: tile, matching: id),
          findsNWidgets(items.length),
        );
        expect(
          find.descendant(of: tile, matching: amount),
          findsNWidgets(items.length),
        );
        expect(
          find.descendant(of: tile, matching: dueDate),
          findsNWidgets(items.length),
        );
        expect(
          tester.widget<Text>(id.first).data,
          contains(fakeAccountingDocument),
        );
        expect(
          tester.widget<Text>(dueDate.first).data,
          equals(fakeNetDueDate.dateString),
        );
        expect(
          find.descendant(
            of: amount.first,
            matching: find.text(priceText, findRichText: true),
          ),
          findsOneWidget,
        );
      });
    });
  });
}
