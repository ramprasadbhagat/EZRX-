import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/covid_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../utils/widget_utils.dart';

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  late ProductImageBlocMock productImageBlocMock;
  late MaterialPriceBlocMock materialPriceBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late CartBlocMock cartBlocMock;
  late AppRouter autoRouterMock;
  late MaterialInfo materialInfoMock;
  late List<MaterialInfo> listMaterialInfo;
  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    listMaterialInfo =
        (await MaterialListLocalDataSource().getProductList()).products;
    materialInfoMock = listMaterialInfo.first;
  });

  group('Test "Material Grid Item"', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      locator = GetIt.instance;
      productImageBlocMock = ProductImageBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      cartBlocMock = CartBlocMock();
      when(() => productImageBlocMock.state)
          .thenReturn(ProductImageState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
    });

    Widget getScopedWidget({MaterialInfo? materialInfo}) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<CartBloc>(
            create: (context) => cartBlocMock,
          ),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: Material(
          child: MaterialGridItem(
            materialInfo: materialInfo ?? materialInfoMock,
            onFavouriteTap: () {},
            onTap: () {},
          ),
        ),
      );
    }

    testWidgets(
      '=> Test display',
      (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byType(ProductImage), findsOneWidget);
          expect(find.byType(OfferLabel), findsOneWidget);
          expect(find.byType(StockLabel), findsOneWidget);
          expect(find.byType(CovidLabel), findsOneWidget);
          expect(find.byType(FavouriteIcon), findsOneWidget);
          expect(
            find.text(materialInfoMock.materialNumber.displayMatNo),
            findsOneWidget,
          );
          expect(
            find.text(materialInfoMock.displayDescription),
            findsOneWidget,
          );
          expect(find.text(materialInfoMock.getManufactured), findsOneWidget);
          expect(find.byType(ProductPriceLabel), findsOneWidget);
        });
      },
    );

    testWidgets(
      'List price strike through price visible, if final price is less than list price && enableListPrice = true',
      (tester) async {
        await tester.runAsync(() async {
          final finalPrice = MaterialPrice(80);
          final listPrice = MaterialPrice(100);
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeVNSalesOrgConfigs,
            ),
          );
          when(() => materialPriceBlocMock.state).thenReturn(
            MaterialPriceState.initial().copyWith(
              materialPrice: {
                materialInfoMock.materialNumber: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                  materialNumber: materialInfoMock.materialNumber,
                ),
              },
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final listPriceStrikeThroughComponent =
              find.byType(ListPriceStrikeThroughComponent);
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
              of: listPriceStrikeThroughComponent,
              matching: listPriceFinder,
            ),
            findsOneWidget,
          );
        });
      },
    );

    testWidgets(
      'List price strike through price not visible, if final price is less than list price && enableListPrice = false',
      (tester) async {
        await tester.runAsync(() async {
          final finalPrice = MaterialPrice(80);
          final listPrice = MaterialPrice(100);
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeMYSalesOrgConfigs,
            ),
          );
          when(() => materialPriceBlocMock.state).thenReturn(
            MaterialPriceState.initial().copyWith(
              materialPrice: {
                materialInfoMock.materialNumber: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                  materialNumber: materialInfoMock.materialNumber,
                ),
              },
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final listPriceStrikeThroughComponent =
              find.byType(ListPriceStrikeThroughComponent);
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
              of: listPriceStrikeThroughComponent,
              matching: listPriceFinder,
            ),
            findsNothing,
          );
        });
      },
    );

    testWidgets(
      'List price strike through price not visible, if final price is greater than and equal to list price && enableListPrice = true',
      (tester) async {
        await tester.runAsync(() async {
          final finalPrice = MaterialPrice(200);
          final listPrice = MaterialPrice(100);
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            ),
          );
          when(() => materialPriceBlocMock.state).thenReturn(
            MaterialPriceState.initial().copyWith(
              materialPrice: {
                materialInfoMock.materialNumber: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                  materialNumber: materialInfoMock.materialNumber,
                ),
              },
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final listPriceStrikeThroughComponent =
              find.byType(ListPriceStrikeThroughComponent);
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
              of: listPriceStrikeThroughComponent,
              matching: listPriceFinder,
            ),
            findsNothing,
          );
        });
      },
    );
    group('MarketPlace Logo appearance', () {
      testWidgets('should display MarketPlaceLogo when isMarketPlace is true',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          getScopedWidget(
            materialInfo:
                listMaterialInfo.firstWhere((element) => element.isMarketPlace),
          ),
        );
        await tester.pump();
        expect(find.byType(MarketPlaceLogo), findsOneWidget);
      });
      testWidgets(
          'should not display MarketPlaceLogo when isMarketPlace is false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          getScopedWidget(
            materialInfo: listMaterialInfo
                .firstWhere((element) => !element.isMarketPlace),
          ),
        );
        await tester.pump();
        expect(find.byType(MarketPlaceLogo), findsNothing);
      });
    });
  });
}
