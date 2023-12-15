import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
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

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerFactory<AppRouter>(() => MockAppRouter());
    autoRouter = locator<AppRouter>();
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

      testWidgets('Show 0 in cart page', (tester) async {
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
        expect(widget, findsOneWidget);
        expect(
          find.descendant(
            of: widget,
            matching: find.textContaining(totalSavingText, findRichText: true),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Show 0 in checkout page', (tester) async {
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
        expect(widget, findsOneWidget);
        expect(
          find.descendant(
            of: widget,
            matching: find.textContaining(totalSavingText, findRichText: true),
          ),
          findsOneWidget,
        );
      });
    });
  });
}
