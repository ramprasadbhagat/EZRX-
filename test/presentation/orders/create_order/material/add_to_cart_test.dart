import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart.dart';
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

class EligibilityMockBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class FavoriteMockBloc extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late CartBloc cartBlocMock;
  late ShipToCodeBloc shipToCodeMockBloc;
  late EligibilityBloc eligibilityMockBloc;
  final AddToCartBloc addToCartBlocMock = AddToCartBlocMock();
  late TenderContractBloc tenderContractBlocMock;
  late FavouriteBloc favouriteMockBloc;

  final materialInfo = MaterialInfo.empty().copyWith(
    materialNumber: MaterialNumber('000000000023168451'),
    materialDescription: ' Triglyceride Mosys D',
    principalData: PrincipalData.empty().copyWith(
      principalName:
          'Ã¥ï¿½Â°Ã§ï¿½Â£Ã¦â€¹Å“Ã¨â‚¬Â³Ã¨â€šÂ¡Ã¤Â»Â½Ã¦Å“â€°Ã©â„¢ï¿½Ã¥â€¦Â¬Ã¥ï¿½Â¸',
    ),
  );

  final priceAggregate = PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: materialInfo,
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
      eligibilityMockBloc = EligibilityMockBloc();
      shipToCodeMockBloc = ShipToCodeMockBloc();
      tenderContractBlocMock = TenderContractBlocMock();
      favouriteMockBloc = FavoriteMockBloc();

      autoRouterMock = locator<AppRouter>();
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => eligibilityMockBloc.state)
          .thenReturn(EligibilityState.initial());
      when(() => shipToCodeMockBloc.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial());
      when(() => favouriteMockBloc.state).thenReturn(FavouriteState.initial());
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
            BlocProvider<ShipToCodeBloc>(
                create: ((context) => shipToCodeMockBloc)),
            BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityMockBloc),
            BlocProvider<TenderContractBloc>(
                create: (context) => tenderContractBlocMock),
            BlocProvider<FavouriteBloc>(create: (context) => favouriteMockBloc),
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
      await tester.pumpWidget(getScopedWidget(const AddToCart(
        isCovid19Tab: false,
      )));
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
      await tester.pumpWidget(getScopedWidget(const AddToCart(
        isCovid19Tab: false,
      )));
      await tester.pump();
      final tirePriceLable = find.byKey(const Key('priceTierLable'));

      expect(
        tirePriceLable,
        findsNWidgets(
          priceAggregate.price.tiers.first.items.length,
        ),
      );
    });

    // testWidgets('Test add to cart covid material + commercial material',
    //     (tester) async {
    //   when(() => cartBlocMock.state).thenReturn(CartState.initial().copyWith(
    //     cartItemList: [
    //       priceAggregate.copyWith(
    //         materialInfo: materialInfo,
    //       ),
    //     ],
    //   ));

    //   when(() => addToCartBlocMock.state).thenReturn(
    //     AddToCartState.initial().copyWith(
    //       cartItem: priceAggregate.copyWith(
    //         price: priceAggregate.price.copyWith(
    //           zmgDiscount: true,
    //         ),
    //         materialInfo: materialInfo.copyWith(
    //           isFOCMaterial: true,
    //           materialGroup4: MaterialGroup.four('6A1'),
    //         ),
    //       ),
    //     ),
    //   );

    //   await tester.pumpWidget(getScopedWidget(const AddToCart(
    //     isCovid19Tab: true,
    //   )));

    //   final button = find.text('Add to Cart');
    //   await tester.tap(button);
    //   await tester.pump(const Duration(seconds: 1));

    //   const snackbarText =
    //       'Covid material cannot be combined with commercial material.';
    //   final snackbarWidget = find.text(snackbarText);

    //   expect(snackbarWidget, findsOneWidget);
    // });

    // testWidgets('Test add to cart commercial material + covid material test',
    //     (tester) async {
    //   when(() => cartBlocMock.state).thenReturn(CartState.initial().copyWith(
    //     cartItemList: [
    //       priceAggregate.copyWith(
    //         materialInfo: materialInfo.copyWith(
    //           isFOCMaterial: true,
    //           materialGroup4: MaterialGroup.four('6A1'),
    //         ),
    //       ),
    //     ],
    //   ));

    //   when(() => addToCartBlocMock.state).thenReturn(
    //     AddToCartState.initial().copyWith(
    //       cartItem: priceAggregate.copyWith(
    //         price: priceAggregate.price.copyWith(
    //           zmgDiscount: true,
    //         ),
    //         materialInfo: materialInfo,
    //       ),
    //     ),
    //   );

    //   await tester.pumpWidget(getScopedWidget(
    //     const AddToCart(
    //       isCovid19Tab: true,
    //     ),
    //   ));

    //   final button = find.text('Add to Cart');
    //   await tester.tap(button);
    //   await tester.pump(const Duration(seconds: 1));

    //   const snackbarText =
    //       'Commercial material cannot be combined with covid material.';
    //   final snackbarWidget = find.text(snackbarText);

    //   expect(snackbarWidget, findsOneWidget);
    // });

    // testWidgets('Test add to cart eligible items', (tester) async {
    //   when(() => cartBlocMock.state).thenReturn(CartState.initial().copyWith(
    //     cartItemList: [
    //       priceAggregate.copyWith(
    //         materialInfo: materialInfo,
    //       ),
    //     ],
    //   ));

    //   when(() => addToCartBlocMock.state).thenReturn(
    //     AddToCartState.initial().copyWith(
    //       cartItem: priceAggregate.copyWith(
    //         price: priceAggregate.price.copyWith(
    //           zmgDiscount: true,
    //         ),
    //         materialInfo: materialInfo,
    //       ),
    //     ),
    //   );

    //   await tester.pumpWidget(getScopedWidget(
    //     const AddToCart(
    //       isCovid19Tab: false,
    //     ),
    //   ));

    //   final button = find.text('Add to Cart');
    //   await tester.tap(button);
    //   await tester.pump(const Duration(seconds: 1));
    // });
  });
}
