import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bundle.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../utils/widget_utils.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late OrderEligibilityBloc orderEligibilityBlocMock;
  final fakeCart =
      (await CartLocalDataSource().getAddedToCartProductList()).cartProducts;

  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    cartBlocMock = CartBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    materialPriceBlocMock = MaterialPriceBlocMock();
    orderEligibilityBlocMock = OrderEligibilityBlocMock();
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => materialPriceBlocMock.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => orderEligibilityBlocMock.state)
        .thenReturn(OrderEligibilityState.initial());
  });

  Widget getScopedWidget({required PriceAggregate cartItem}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<CartBloc>(
          create: (context) => cartBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<MaterialPriceBloc>(
          create: (context) => materialPriceBlocMock,
        ),
        BlocProvider<OrderEligibilityBloc>(
          create: (context) => orderEligibilityBlocMock,
        ),
      ],
      child: Material(
        child: SingleChildScrollView(
          child: CartProductBundle(cartItem: cartItem),
        ),
      ),
    );
  }

  testWidgets('Check stock detail display', (tester) async {
    final bundle = fakeCart.firstWhere(
      (e) => e.materialInfo.type.typeBundle && !e.materialInfo.isMarketPlace,
    );
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeMYSalesOrgConfigs,
      ),
    );
    await tester.pumpWidget(getScopedWidget(cartItem: bundle));
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: find.byKey(
          WidgetKeys.cartItemProductTile(
            bundle.bundle.materials.first.materialNumber.displayMatNo,
          ),
        ),
        matching: find.byKey(WidgetKeys.materialDetailsStock),
      ),
      findsOneWidget,
    );
  });

  testWidgets('Show MP logo + Batch & Expiry as NA for marketplace bundle',
      (tester) async {
    final mpBundle = fakeCart.firstWhere(
      (e) => e.materialInfo.type.typeBundle && e.materialInfo.isMarketPlace,
    );
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        salesOrgConfigs:
            fakeMYSalesOrgConfigs.copyWith(enableBatchNumber: true),
      ),
    );

    await tester.pumpWidget(
      getScopedWidget(cartItem: mpBundle),
    );
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.cartItemBundleName),
        matching: find.byType(MarketPlaceLogo),
      ),
      findsOne,
    );
    final stockWidget = find.byType(StockInfoWidget);
    expect(
      find.descendant(
        of: stockWidget,
        matching: find.textContaining(
          'Batch: NA - Expires: NA',
          findRichText: true,
        ),
      ),
      findsNWidgets(stockWidget.evaluate().length),
    );
  });
}
