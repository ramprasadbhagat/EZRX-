import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_material_item/checkout_material_item.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../../../common_mock_data/sales_organsiation_mock.dart';
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
  late AplSimulatorOrder aplSimulatorOrderMock;

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
    aplSimulatorOrderMock = await CartLocalDataSource().aplSimulateOrder();
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
      expect(find.byType(PreOrderLabel), findsOneWidget);
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
      expect(
        find.byType(GovtListPriceComponent),
        findsOneWidget,
      );
    });

    testWidgets(
        '=> List price strike through price visible, if final price is less than list price && enableListPrice = true',
        (tester) async {
      final finalPrice = MaterialPrice(80);
      final listPrice = MaterialPrice(100);
      final cartItem = PriceAggregate.empty().copyWith(
        price: Price.empty().copyWith(
          lastPrice: listPrice,
          finalPrice: finalPrice,
        ),
        salesOrgConfig: fakeIDSalesOrgConfigs,
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
        findsOneWidget,
      );
    });

    testWidgets(
        '=> List price strike through price not visible, if final price is less than list price && enableListPrice = false',
        (tester) async {
      final finalPrice = MaterialPrice(80);
      final listPrice = MaterialPrice(100);
      final cartItem = PriceAggregate.empty().copyWith(
        price: Price.empty().copyWith(
          lastPrice: listPrice,
          finalPrice: finalPrice,
        ),
        salesOrgConfig: fakeMYSalesOrgConfigs,
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

    testWidgets(
        '=> List price strike through price not visible, if final price is greater than and equal to list price && enableListPrice = true',
        (tester) async {
      final finalPrice = MaterialPrice(200);
      final listPrice = MaterialPrice(100);
      final cartItem = PriceAggregate.empty().copyWith(
        price: Price.empty().copyWith(
          lastPrice: listPrice,
          finalPrice: finalPrice,
        ),
        salesOrgConfig: fakeIDSalesOrgConfigs,
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

    testWidgets('Show Stock Info When Config Enabled', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getScopedWidget(fakeMaterial));
      await tester.pump();
      expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
    });

    testWidgets('=> Show promotion label when AplPromotion is notEmpty',
        (tester) async {
      final cartItem = PriceAggregate.empty().copyWith(
        salesOrgConfig: fakeIDSalesOrgConfigs,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000003353621001'),
          type: MaterialInfoType('material'),
        ),
      );
      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          aplSimulatorOrder: aplSimulatorOrderMock,
        ),
      );
      await tester.pumpWidget(getScopedWidget(cartItem));
      await tester.pump();
      final promotionTextFinder = find.byKey(
        WidgetKeys.promotionLabel(cartItem.getMaterialNumber.getValue()),
      );

      expect(promotionTextFinder, findsOneWidget);

      expect(
        find.text(
          '5.0% discount,IDR 10.0 offer applied',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('=> Hide promotion label when AplPromotion is empty',
        (tester) async {
      final cartItem = PriceAggregate.empty().copyWith(
        salesOrgConfig: fakeIDSalesOrgConfigs,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000003353621001'),
          type: MaterialInfoType('material'),
        ),
      );
      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          aplSimulatorOrder: AplSimulatorOrder.empty(),
        ),
      );
      await tester.pumpWidget(getScopedWidget(cartItem));
      await tester.pump();
      final promotionTextFinder = find.byKey(
        WidgetKeys.promotionLabel(cartItem.getMaterialNumber.getValue()),
      );

      expect(promotionTextFinder, findsNothing);
    });

    testWidgets('Show IRN when enableIRN is true',
        (tester) async {
      const iRNNumber = '12C 234/11';

      final cartItem = PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000003353621001'),
          type: MaterialInfoType('material'),
          itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
            enableIRN: true,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget(cartItem));
      await tester.pump();

      expect(find.textContaining(iRNNumber), findsOneWidget);
    });

    testWidgets('Do not show IRN when enableIRN is false',
        (tester) async {
      const iRNNumber = '12C 234/11';

      final cartItem = PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000003353621001'),
          type: MaterialInfoType('material'),
          itemRegistrationNumber: ItemRegistrationNumber(iRNNumber),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs.copyWith(
            enableIRN: false,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget(cartItem));
      await tester.pump();

      expect(find.textContaining(iRNNumber), findsNothing);
    });
  });
}
