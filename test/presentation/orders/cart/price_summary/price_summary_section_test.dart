import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
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

import '../../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

class CartStateMock extends Mock implements CartState {}

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
  late List<PriceAggregate> cartItemMock;
  late List<ComboMaterialItem> fakeComboMaterialItems;
  late CartState cartStateMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerFactory<AppRouter>(() => MockAppRouter());
    autoRouter = locator<AppRouter>();
    mockCartBundleItems = await CartLocalDataSource().upsertCartItems();
    cartItemMock =
        (await CartLocalDataSource().getAddedToCartProductList()).cartProducts;
    fakeComboMaterialItems =
        (await CartLocalDataSource().upsertCartItemsWithComboOffers())
            .comboMaterialItemList;
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
      cartStateMock = CartStateMock();
      when(() => cartBloc.state).thenReturn(CartState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => autoRouter.current).thenReturn(fakeRouteData(''));
      when(() => cartStateMock.cartProducts).thenReturn([]);
      when(() => cartStateMock.checkoutSubTotalHidePriceMaterial).thenReturn(0);
      when(() => cartStateMock.subTotalHidePriceMaterial).thenReturn(0);
      when(() => cartStateMock.grandTotalHidePriceMaterial).thenReturn(0);
      when(() => cartStateMock.checkoutTotalSaving).thenReturn(0);
      when(() => cartStateMock.cartTotalSaving).thenReturn(0);
      when(() => cartStateMock.salesOrganisation)
          .thenReturn(fakeMYSalesOrganisation);
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
          fakeIDSalesOrgConfigs,
          totalSaving,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
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
          fakeIDSalesOrgConfigs,
          aplSimulatorOrder.totalDiscountValue,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
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
          salesOrganisation: fakeMYSalesOrganisation,
        );
        final totalSavingText = StringUtils.priceComponentDisplayPrice(
          fakeMYSalesOrgConfigs,
          0,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
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
          salesOrganisation: fakeMYSalesOrganisation,
        );
        final totalSavingText = StringUtils.priceComponentDisplayPrice(
          fakeMYSalesOrgConfigs,
          0,
          false,
        );
        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
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

    group('Subtotal for marketplace', () {
      final zpSubTotalSection =
          find.byKey(WidgetKeys.checkoutSummaryZPSubTotal);
      final mpSubTotalSection =
          find.byKey(WidgetKeys.checkoutSummaryMPSubTotal);

      testWidgets('ZP & MP subtotal visible when cart has MP items',
          (tester) async {
        const mpSubTotal = 200.5;
        const zpSubTotal = 100.2;
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
        );
        when(() => cartStateMock.cartProducts).thenReturn(cartItemMock);
        when(() => cartStateMock.mpSubTotalHidePriceMaterial)
            .thenReturn(mpSubTotal);
        when(() => cartStateMock.zpSubTotalHidePriceMaterial)
            .thenReturn(zpSubTotal);

        await tester.pumpWidget(getWidget(cartStateMock));
        await tester.pumpAndSettle();

        expect(mpSubTotalSection, findsOneWidget);
        expect(
          find.descendant(
            of: mpSubTotalSection,
            matching: find.text('MP Subtotal (incl.tax):'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: mpSubTotalSection,
            matching: find.text(
              StringUtils.priceComponentDisplayPrice(
                fakeMYSalesOrgConfigs,
                mpSubTotal,
                false,
              ),
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
        expect(zpSubTotalSection, findsOneWidget);
        expect(
          find.descendant(
            of: zpSubTotalSection,
            matching: find.textContaining('ZP Subtotal (incl.tax):'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: zpSubTotalSection,
            matching: find.textContaining(
              StringUtils.priceComponentDisplayPrice(
                fakeMYSalesOrgConfigs,
                zpSubTotal,
                false,
              ),
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets('ZP & MP subtotal not visible when cart has MP items',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial()
              .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
        );
        when(() => cartStateMock.cartProducts).thenReturn([]);

        await tester.pumpWidget(getWidget(cartStateMock));
        await tester.pumpAndSettle();

        expect(mpSubTotalSection, findsNothing);
        expect(zpSubTotalSection, findsNothing);
      });
    });

    group('Test SubTotal', () {
      testWidgets('Test Sub total Cart page for bundles ', (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
            matching: find.textContaining(
              'Subtotal (${fakeMYSalesOrgConfigs.displayPrefixTax}.tax)',
            ),
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
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first
                .copyWith(salesOrgConfig: fakeMYSalesOrgConfigs),
          ],
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
            matching: find.textContaining(
              'Subtotal (${fakeMYSalesOrgConfigs.displayPrefixTax}.tax)',
            ),
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
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsNothing);
      });

      testWidgets(
          'Test Tax value in Cart page for bundles with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
          ],
          salesOrganisation: fakeKHSalesOrganisation,
          config: fakeKHSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeKHSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
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
              '${fakeKHSalesOrgConfigs.currency.code} 99.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });
      testWidgets(
          'Test Tax value in Checkout page for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.checkoutSummaryTax), findsNothing);
      });

      testWidgets(
          'Test Tax value in Checkout page for bundles with displaySubtotalTaxBreakdown enabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
          ],
          salesOrganisation: fakeKHSalesOrganisation,
          config: fakeKHSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeKHSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
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
              '${fakeKHSalesOrgConfigs.currency.code} 99.00',
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
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
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
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first.copyWith(
              salesOrgConfig: fakeMYSalesOrgConfigs,
            ),
          ],
          salesOrganisation: fakeKHSalesOrganisation,
          config: fakeKHSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CartPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeKHSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
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
              '${fakeKHSalesOrgConfigs.currency.code} 990.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test Grand Total value in Checkout page for bundles with displaySubtotalTaxBreakdown disabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          salesOrganisation: fakeMYSalesOrganisation,
          config: fakeMYSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => cartBloc.state).thenReturn(cartState);
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
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
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            mockCartBundleItems.first
                .copyWith(salesOrgConfig: fakeKHSalesOrgConfigs),
          ],
          salesOrganisation: fakeKHSalesOrganisation,
          config: fakeKHSalesOrgConfigs,
        );

        when(() => autoRouter.current)
            .thenReturn(fakeRouteData(CheckoutPageRoute.name));
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeKHSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
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
              '${fakeKHSalesOrgConfigs.currency.code} 1,089.00',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });
      testWidgets(
          'Test Total Tax when displayItemTaxBreakdown is disabled and displaySubtotalTaxBreakdown is enabled',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: [
            cartItemMock.last.copyWith(
              materialInfo: cartItemMock.last.materialInfo.copyWith(
                type: MaterialInfoType('combo'),
              ),
              comboMaterials: [
                fakeComboMaterialItems.first.copyWith(
                  salesOrgConfig: fakeKHSalesOrgConfigs,
                  finalIndividualPrice: 1930.86,
                ),
              ],
            ),
          ],
          salesOrganisation: fakeKHSalesOrganisation,
          config: fakeKHSalesOrgConfigs,
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeKHSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(cartState);

        await tester.pumpWidget(getWidget(cartState));
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: find.textContaining('Tax at 10%:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTaxPrice),
            matching: find.text(
              '${fakeKHSalesOrgConfigs.currency.code} 193.09',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      });
    });
  });
}
