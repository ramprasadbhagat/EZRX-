import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_material_item/checkout_material_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/order_tag.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/widget_utils.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

void main() {
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  final fakeMaterial = PriceAggregate.empty().copyWith(
    quantity: 2,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('fake-number'),
      materialDescription: 'fake-description',
    ),
  );

  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    cartBlocMock = CartBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    materialPriceBlocMock = MaterialPriceBlocMock();
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => materialPriceBlocMock.state)
        .thenReturn(MaterialPriceState.initial());
  });

  Widget getScopedWidget(PriceAggregate material) {
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
      ],
      child: Material(
        child: CheckoutMaterialItem(cartItem: material),
      ),
    );
  }

  group('Checkout material item Test', () {
    testWidgets('Initial state', (tester) async {
      await tester.pumpWidget(getScopedWidget(fakeMaterial));
      await tester.pump();
      expect(find.byType(CustomImage), findsOneWidget);
      expect(find.byType(OfferLabel), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.cartItemProductMaterialNumber),
        findsOneWidget,
      );
      expect(find.byType(OrderTag), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.cartItemProductMaterialDescription),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.cartItemProductUnitPrice),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.cartItemProductQty),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.cartItemProductTotalPrice),
        findsOneWidget,
      );
    });

    testWidgets(
        '=> List price strike through price visible, if final price is less than list price',
        (tester) async {
      final finalPrice = MaterialPrice(80);
      final listPrice = MaterialPrice(100);
      final cartItem = PriceAggregate.empty().copyWith(
        price: Price.empty().copyWith(
          lastPrice: listPrice,
          finalPrice: finalPrice,
        ),
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material'),
          type: MaterialInfoType('material'),
        ),
      );
      await tester.pumpWidget(getScopedWidget(cartItem));
      await tester.pump();
      final materialListPriceStrikeThroughFinder =
          find.byKey(WidgetKeys.materialListPriceStrikeThrough);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains(listPrice.getOrCrash().toString()),
      );
      expect(
        find.descendant(
          of: materialListPriceStrikeThroughFinder,
          matching: listPriceFinder,
        ),
        findsOneWidget,
      );
    });
    
    testWidgets(
        '=> List price strike through price not visible, if final price is greater than and equal to list price',
        (tester) async {
      final finalPrice = MaterialPrice(200);
      final listPrice = MaterialPrice(100);
      final cartItem = PriceAggregate.empty().copyWith(
        price: Price.empty().copyWith(
          lastPrice: listPrice,
          finalPrice: finalPrice,
        ),
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material'),
          type: MaterialInfoType('material'),
        ),
      );
      await tester.pumpWidget(getScopedWidget(cartItem));
      await tester.pump();
      final materialListPriceStrikeThroughFinder =
          find.byKey(WidgetKeys.materialListPriceStrikeThrough);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text
                .toPlainText()
                .contains(listPrice.getOrCrash().toString()),
      );
      expect(
        find.descendant(
          of: materialListPriceStrikeThroughFinder,
          matching: listPriceFinder,
        ),
        findsNothing,
      );
    });
  
  });
}
