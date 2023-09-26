import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class PaymentTermBlocMock extends MockBloc<PaymentTermEvent, PaymentTermState>
    implements PaymentTermBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class OrderSummaryBlocMock
    extends MockBloc<OrderSummaryEvent, OrderSummaryState>
    implements OrderSummaryBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class MockAppRouter extends Mock implements AppRouter {}

void main() {
  late CartBloc cartBloc;
  late SalesOrgBloc salesOrgBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late PaymentTermBloc paymentTermBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBloc;
  late CustomerCodeBloc customerCodeBloc;
  late OrderSummaryBloc orderSummaryBlocMock;
  final userBlocMock = UserMockBloc();
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client'),
    ),
    enableOrderType: true,
  );
  setUpAll(() async {
    locator.registerFactory(() => AppRouter());

    autoRouterMock = locator<AppRouter>();
  });
  group('DeliveryInfo Page', () {
    setUp(() {
      locator = GetIt.instance;
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );
      eligibilityBloc = EligibilityBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      cartBloc = CartBlocMock();
      paymentTermBlocMock = PaymentTermBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      customerCodeBloc = CustomerCodeBlocMock();
      autoRouterMock = locator<AppRouter>();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();
      when(() => orderDocumentTypeBlocMock.state).thenReturn(
        OrderDocumentTypeState.initial(),
      );
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(),
      );
      when(() => customerCodeBloc.state).thenReturn(
        CustomerCodeState.initial(),
      );

      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(isFetching: false),
      );
      when(() => paymentTermBlocMock.state)
          .thenReturn(PaymentTermState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
    });
    Widget getScopedWidget() {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<PaymentTermBloc>(
              create: (context) => paymentTermBlocMock,
            ),
            BlocProvider<AdditionalDetailsBloc>(
              create: (context) => additionalDetailsBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<OrderSummaryBloc>(
              create: (context) => orderSummaryBlocMock,
            ),
            BlocProvider<OrderDocumentTypeBloc>(
              create: (context) => orderDocumentTypeBlocMock,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBloc,
            ),
            BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
            BlocProvider<CartBloc>(create: (context) => cartBloc),
          ],
          child: const Material(
            child: CheckoutPage(),
          ),
        ),
      );
    }

    testWidgets(
      '=> test PO Reference in place Order when  poNumberRequired is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              poNumberRequired: PoNumberRequired(true),
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              poNumberRequired: PoNumberRequired(true),
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerPOReferenceKey = find.byKey(const Key('pOReferenceKey'));
        expect(customerPOReferenceKey, findsOneWidget);

        expect(
          (tester.widget(customerPOReferenceKey) as TextFormField)
              .validator
              ?.call('PO field'),
          'PO reference is a required field.',
        );
      },
    );
    testWidgets(
      '=> test PO Reference in place Order when  poNumberRequired is false ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              poNumberRequired: PoNumberRequired(false),
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerPOReferenceKey = find.byKey(const Key('pOReferenceKey'));
        expect(customerPOReferenceKey, findsOneWidget);

        expect(
          (tester.widget(customerPOReferenceKey) as TextFormField)
              .validator
              ?.call('PO reference is a required field.'),
          null,
        );
      },
    );

    testWidgets(
      '=> test Payment Terms enabled',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              enablePaymentTerms: true,
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              enablePaymentTerms: true,
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPage = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPage, findsOneWidget);

        final paymentTermDropdown =
            find.byKey(WidgetKeys.paymentTermDropdownKey);
        expect(paymentTermDropdown, findsOneWidget);
      },
    );

    testWidgets(
      '=> test Payment Terms disabled',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              enablePaymentTerms: false,
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPage = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPage, findsOneWidget);

        final paymentTermDropdown =
            find.byKey(WidgetKeys.paymentTermDropdownKey);
        expect(paymentTermDropdown, findsNothing);
      },
    );

    testWidgets(
      'Show tax details on material level when displaySubtotalTaxBreakdown && displayItemTaxBreakdown is enabled for vn with material level tax',
      (tester) async {
        final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
          displayItemTaxBreakdown: true,
          displaySubtotalTaxBreakdown: true,
          vatValue: 5,
          currency: Currency('vnd'),
        );
        final salesOrgState = SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('3700'),
          ),
          configs: salesOrgConfig,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                tax: 10,
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(234.50),
              ),
              salesOrgConfig: salesOrgConfig,
            ),
          ],
          config: salesOrgConfig,
        );

        when(() => salesOrgBlocMock.state).thenReturn(
          salesOrgState,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('3700'),
            ),
            salesOrgConfigs: salesOrgConfig,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.byWidgetPredicate((w) => w is SliverToBoxAdapter),
          findsAtLeastNWidgets(3),
        );
        final sliverFinder =
            find.byWidgetPredicate((w) => w is CustomScrollView);
        await tester.fling(sliverFinder, const Offset(0, -10000), 100);
        await tester.pump();

        final taxPercentageFinder = find.text('Tax at 10%');
        expect(taxPercentageFinder, findsOneWidget);
        final vatPercentageFinder = find.text('Tax at 5%');
        expect(vatPercentageFinder, findsNothing);
        final listPriceWithTax = cartState
            .cartProducts.first.finalPriceTotalWithTax
            .toStringAsFixed(2);
        expect(
          find.text(
            'VND $listPriceWithTax',
            findRichText: true,
          ),
          findsAtLeastNWidgets(1),
        );
        expect(find.text('Subtotal (excl.tax):'), findsOneWidget);
      },
    );

    testWidgets(
      'Show tax details when displaySubtotalTaxBreakdown && displayItemTaxBreakdown is enabled for my ',
      (tester) async {
        final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
          displayItemTaxBreakdown: true,
          displaySubtotalTaxBreakdown: true,
          vatValue: 5,
          currency: Currency('myr'),
        );
        final salesOrgState = SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2001'),
          ),
          configs: salesOrgConfig,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                tax: 10,
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(234.50),
              ),
              salesOrgConfig: salesOrgConfig,
            ),
          ],
          config: salesOrgConfig,
        );

        when(() => salesOrgBlocMock.state).thenReturn(
          salesOrgState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
            salesOrgConfigs: salesOrgConfig,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.byWidgetPredicate((w) => w is SliverToBoxAdapter),
          findsAtLeastNWidgets(3),
        );
        final sliverFinder =
            find.byWidgetPredicate((w) => w is CustomScrollView);
        await tester.fling(sliverFinder, const Offset(0, -10000), 100);
        await tester.pump();

        final taxPercentageFinder = find.text('Tax at 10%');
        expect(taxPercentageFinder, findsNothing);
        final vatPercentageFinder = find.text('Tax at 5%');
        expect(vatPercentageFinder, findsOneWidget);
        final listPriceWithTax = cartState
            .cartProducts.first.finalPriceTotalWithTax
            .toStringAsFixed(2);
        expect(
          find.text(
            'MYR $listPriceWithTax',
            findRichText: true,
          ),
          findsAtLeastNWidgets(1),
        );
        expect(find.text('Subtotal (excl.tax):'), findsOneWidget);
      },
    );

    testWidgets(
      'Do not Show tax details on total when displaySubtotalTaxBreakdown is disabled for vn',
      (tester) async {
        final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
          displayItemTaxBreakdown: true,
          displaySubtotalTaxBreakdown: false,
          vatValue: 5,
          currency: Currency('vnd'),
        );
        final salesOrgState = SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('3700'),
          ),
          configs: salesOrgConfig,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                tax: 10,
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(234.50),
              ),
              salesOrgConfig: salesOrgConfig,
            ),
          ],
          config: salesOrgConfig,
        );

        when(() => salesOrgBlocMock.state).thenReturn(
          salesOrgState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('3700'),
            ),
            salesOrgConfigs: salesOrgConfig,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.byWidgetPredicate((w) => w is SliverToBoxAdapter),
          findsAtLeastNWidgets(3),
        );
        final sliverFinder =
            find.byWidgetPredicate((w) => w is CustomScrollView);
        await tester.fling(sliverFinder, const Offset(0, -10000), 100);
        await tester.pump();

        final taxPercentageFinder = find.text('Tax at 10%');
        expect(taxPercentageFinder, findsNothing);
        final vatPercentageFinder = find.text('Tax at 5%');
        expect(vatPercentageFinder, findsNothing);
        final listPriceWithTax = cartState
            .cartProducts.first.finalPriceTotalWithTax
            .toStringAsFixed(2);
        expect(
          find.text(
            'VND $listPriceWithTax',
            findRichText: true,
          ),
          findsAtLeastNWidgets(1),
        );
        expect(find.text('Subtotal (incl.tax):'), findsOneWidget);
      },
    );

    testWidgets(
      'Do not Show delivery Instruction textfield  when displaySubtotalTaxBreakdown is false',
      (tester) async {
        final salesOrgConfig = SalesOrganisationConfigs.empty();
        final salesOrgState = SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('3050'),
          ),
          configs: salesOrgConfig,
        );

        when(() => salesOrgBlocMock.state).thenReturn(
          salesOrgState,
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey')),
          findsNothing,
        );
      },
    );

    testWidgets(
      'Do not Show delivery Instruction textfield  when displaySubtotalTaxBreakdown is true',
      (tester) async {
        final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
          enableSpecialInstructions: true,
        );
        final salesOrgState = SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('3050'),
          ),
          configs: salesOrgConfig,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('3050'),
            ),
            salesOrgConfigs: salesOrgConfig,
          ),
        );

        when(() => salesOrgBlocMock.state).thenReturn(
          salesOrgState,
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey')),
          findsOneWidget,
        );
      },
    );
  });
}
