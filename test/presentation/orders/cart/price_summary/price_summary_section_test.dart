import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import '../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

void main() {
  late EligibilityBloc eligibilityBloc;
  late CartBloc cartBloc;
  late AppRouter autoRouter;
  const listPrice = 123.0;
  const finalPrice = 99.32;
  const qty = 2;
  final aplSimulatorOrder = AplSimulatorOrder.empty().copyWith(
    totalDiscountValue: 100000,
  );
  final item = PriceAggregate.empty().copyWith(
    price: Price.empty().copyWith(
      finalPrice: MaterialPrice(finalPrice),
      lastPrice: MaterialPrice(listPrice),
    ),
    quantity: qty,
  );

  late List<PriceAggregate> mockCartBundleItems;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerFactory<AppRouter>(() => MockAppRouter());
    autoRouter = locator<AppRouter>();
    mockCartBundleItems = await CartLocalDataSource().upsertCartItems();
  });

  RouteData fakeRouteData(String name) => RouteData(
        route: RouteMatch(
          name: name,
          segments: const [],
          path: '',
          stringMatch: '',
          key: ValueKey(name),
        ),
        router: autoRouter,
        pendingChildren: [],
      );

  setUp(
    () {
      cartBloc = CartBlocMock();
      eligibilityBloc = EligibilityBlocMock();
      when(() => cartBloc.state).thenReturn(CartState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => autoRouter.current).thenReturn(fakeRouteData(''));
    },
  );

  Widget getWidget(CartState state) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouter,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
        BlocProvider<CartBloc>(create: (context) => cartBloc),
      ],
      child: PriceSummarySection(cartState: state),
    );
  }

  group('Test Price summary section', () {
    group('Total saving', () {
      final widget = find.byKey(WidgetKeys.checkoutSummaryTotalSaving);
      final totalSaving =
          NumUtils.roundToPlaces((listPrice - finalPrice) * qty, 0);

      testWidgets('Show calculated value in cart page in ID market',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [item],
          salesOrganisation: fakeIDSalesOrganisation,
        );
        final totalSavingText = StringUtils.priceComponentDisplayPrice(
          fakeIDSalesOrganisationConfigs,
          totalSaving,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrganisationConfigs,
          ),
        );

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(widget, findsOneWidget);
        expect(
          find.descendant(
            of: widget,
            matching: find.textContaining(totalSavingText, findRichText: true),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Show value from API in checkout page in ID market',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [item],
          salesOrganisation: fakeIDSalesOrganisation,
          aplSimulatorOrder: aplSimulatorOrder,
        );
        final totalSavingText = StringUtils.priceComponentDisplayPrice(
          fakeIDSalesOrganisationConfigs,
          aplSimulatorOrder.totalDiscountValue,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrganisationConfigs,
          ),
        );

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(widget, findsOneWidget);
        expect(
          find.descendant(
            of: widget,
            matching: find.textContaining(totalSavingText, findRichText: true),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Not displayed in cart page', (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [item],
          salesOrganisation: fakeSalesOrganisation,
        );
        final totalSavingText = StringUtils.priceComponentDisplayPrice(
          fakeSalesOrganisationConfigs,
          0,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeSalesOrganisationConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(widget, findsNothing);
        expect(
          find.descendant(
            of: widget,
            matching: find.textContaining(totalSavingText, findRichText: true),
          ),
          findsNothing,
        );
      });

      testWidgets('Not displayed in checkout page', (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [item],
          salesOrganisation: fakeSalesOrganisation,
        );
        final totalSavingText = StringUtils.priceComponentDisplayPrice(
          fakeSalesOrganisationConfigs,
          0,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeSalesOrganisationConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(widget, findsNothing);
        expect(
          find.descendant(
            of: widget,
            matching: find.textContaining(totalSavingText, findRichText: true),
          ),
          findsNothing,
        );
      });
    });

    group('Test SubTotal', () {
      testWidgets('Test Sub total Cart page for bundles ', (tester) async {
        final config = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
          salesOrg: fakeMYSalesOrg,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: config,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: config,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
            matching: find
                .textContaining('Subtotal (${config.displayPrefixTax}.tax)'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
            matching: find.text(
              'MYR 990.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Test Sub total in Checkout page for bundles',
          (tester) async {
        final config = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
          salesOrg: fakeMYSalesOrg,
          displaySubtotalTaxBreakdown: true,
          vatValue: 10,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(salesOrgConfig: config)
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: config,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: config,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
            matching: find
                .textContaining('Subtotal (${config.displayPrefixTax}.tax)'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
            matching: find.text(
              'MYR 990.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });
    });
    group('Test Tax', () {
      testWidgets(
          'Test Tax value in Cart page for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        final config = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
          salesOrg: fakeMYSalesOrg,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: config,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: config,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsNothing);
      });

      testWidgets(
          'Test Tax value in Cart page for bundles with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final config = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
          salesOrg: fakeMYSalesOrg,
          displaySubtotalTaxBreakdown: true,
          vatValue: 10,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(salesOrgConfig: config)
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: config,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: config,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsOneWidget);
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.textContaining('Tax at 10%'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.text(
              'MYR 99.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });
      testWidgets(
          'Test Tax value in Checkout page for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        final config = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
          salesOrg: fakeMYSalesOrg,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: config,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: config,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsNothing);
      });

      testWidgets(
          'Test Tax value in Checkout page for bundles with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final config = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
          salesOrg: fakeMYSalesOrg,
          displaySubtotalTaxBreakdown: true,
          vatValue: 10,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(salesOrgConfig: config)
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: config,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: config,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsOneWidget);
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.textContaining('Tax at 10%'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.text(
              'MYR 99.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });
    });

    group('Test Grand Total', () {
      testWidgets(
          'Test Grand Total value in Cart page for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        final config = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
          salesOrg: fakeMYSalesOrg,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: config,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: config,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.text(
              'MYR 990.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test Grand Total value in Cart page for bundle with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final config = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
          salesOrg: fakeMYSalesOrg,
          displaySubtotalTaxBreakdown: true,
          vatValue: 10,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(salesOrgConfig: config)
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: config,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: config,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.text(
              'MYR 1,089.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test Grand Total value in Checkout page for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        final config = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
          salesOrg: fakeMYSalesOrg,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: config,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: config,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.text(
              'MYR 990.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test Grand Total value in Checkout page for bundle with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final config = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
          salesOrg: fakeMYSalesOrg,
          displaySubtotalTaxBreakdown: true,
          vatValue: 10,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(salesOrgConfig: config)
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: config,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: config,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
            matching: find.text(
              'MYR 1,089.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });
    });
  });
}
