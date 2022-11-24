import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/create_order/add_to_cart.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AddToCartBlocMock extends MockBloc<AddToCartEvent, AddToCartState>
    implements AddToCartBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late CartBloc cartBlocMock;
  final AddToCartBloc addToCartBlocMock = AddToCartBlocMock();

  final priceAggregate = PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168451'),
      materialDescription: ' Triglyceride Mosys D',
      principalData: PrincipalData.empty().copyWith(
        principalName: '台灣拜耳股份有限公司',
      ),
    ),
    price: Price.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168451'),
      tiers: [
        PriceTier.empty().copyWith(
          tier: '',
          items: [PriceTierItem.empty()],
        )
      ],
      zmgDiscount: false,
      finalPrice: MaterialPrice(5200),
    ),
  );

  setUpAll(() async {
    setupLocator();
  });

  group('Material List Test', () {
    setUp(() {
      salesOrgBlocMock = SalesOrgMockBloc();
      materialPriceBlocMock = MaterialPriceBlocMock();
      cartBlocMock = CartBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
    });

    Widget getScopedWidget(Widget child) {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en', 'SG'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en', 'SG'),
        fallbackLocale: const Locale('en', 'SG'),
        saveLocale: true,
        useOnlyLangCode: false,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<SalesOrgBloc>(create: ((context) => salesOrgBlocMock)),
            BlocProvider<MaterialPriceBloc>(
                create: ((context) => materialPriceBlocMock)),
            BlocProvider<CartBloc>(create: ((context) => cartBlocMock)),
            BlocProvider<AddToCartBloc>(
                create: ((context) => addToCartBlocMock)),
          ],
          child: child,
        ),
      );
    }

    testWidgets('Add to Cart zmg Discount Material', (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          cartItem: priceAggregate.copyWith(
            price: priceAggregate.price.copyWith(
              zmgDiscount: true,
            ),
          ),
        ),
      );

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('SG'))));
      await tester.pumpWidget(getScopedWidget(const AddToCart()));
      await tester.pump();
      final tirePriceLable = find.byKey(const Key('priceTierLable'));

      expect(
        tirePriceLable,
        findsNWidgets(
          priceAggregate.price.tiers.first.items.length,
        ),
      );
    });

    testWidgets('Add to Cart Tire Discount Material', (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          cartItem: priceAggregate.copyWith(
              price: priceAggregate.price.copyWith(zmgDiscount: false)),
        ),
      );

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('SG'))));
      await tester.pumpWidget(getScopedWidget(const AddToCart()));
      await tester.pump();
      final tirePriceLable = find.byKey(const Key('priceTierLable'));

      expect(
        tirePriceLable,
        findsNWidgets(
          priceAggregate.price.tiers.first.items.length,
        ),
      );
    });
  });
}
