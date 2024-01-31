import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MaterialListMockBloc
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class ProductDetailsMockBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class ComboDealMaterialDetailBlocMock
    extends MockBloc<ComboDealMaterialDetailEvent, ComboDealMaterialDetailState>
    implements ComboDealMaterialDetailBloc {}

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ProductImageMockBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MaterialPriceMockBloc
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class ComboDealListMockBloc
    extends MockBloc<ComboDealListEvent, ComboDealListState>
    implements ComboDealListBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MockMixPanelService extends Mock implements MixpanelService {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  late MaterialListBloc materialListMockBloc;
  late ProductDetailBloc productDetailMockBloc;
  late ProductImageBloc mockProductImageBloc;
  late MaterialPriceBloc materialPriceMockBloc;
  late ComboDealListBloc comboDealListMockBloc;
  late ComboDealMaterialDetailBloc comboDealMaterialDetailBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late CartBloc cartMockBloc;
  late AppRouter autoRouterMock;
  late MaterialInfo materialInfo;
  late StockInfo stockInfo;
  late StockInfo emptyStockInfo;
  late Price materialPrice;
  final user = fakeClientUser;
  final materialNumber = MaterialNumber('00000111111');
  late ProductImages productImage;
  late List<MaterialInfo> similarProducts;
  final price = Price.empty().copyWith(
    comboDeal: PriceComboDeal.empty().copyWith(
      isEligible: true,
      flexibleGroup: FlexibleGroup('flex-group'),
    ),
  );
  final comboDeal = ComboDeal.empty().copyWith(
    groupDeal: ComboDealGroupDeal.empty().copyWith(
      conditionNumber: 'conditionNumber',
    ),
    materialComboDeals: [
      ComboDealMaterialSet.empty().copyWith(
        materials: [
          ComboDealMaterial.empty().copyWith(
            materialNumber: materialNumber,
          )
        ],
      ),
    ],
  );

  final productItemWithProductItemXp = ProductItem.empty().copyWith(
    productItemXp: ProductItemXp.empty()
        .copyWith(howToUse: StringValue('fake-description')),
  );

  final routeData = RouteData(
    route: const RouteMatch(
      name: 'ProductDetailsPageRoute',
      segments: ['orders', 'material_details'],
      path: 'orders/material_details',
      stringMatch: 'orders/material_details',
      key: ValueKey('ProductDetailsPageRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );

  //////////////////////Finder//////////////////////////////////////////////////
  final similarProductSectionFinder =
      find.byKey(WidgetKeys.materialDetailsSimilarProductsSection);
  final similarProductItemFinder =
      find.byKey(WidgetKeys.materialDetailsSimilarProductItem);
  final productImageFinder = find.byKey(WidgetKeys.productImage);
  final materialDetailsCarouselFinder =
      find.byKey(WidgetKeys.materialDetailsCarousel);
  final materialDetailsImageCounterFinder =
      find.byKey(WidgetKeys.materialDetailsImageCounter);
  final materialDetailsCarouselImageFinder =
      find.byKey(WidgetKeys.materialDetailsCarouselImage);
  /////////////////////////////////////////////////////////////////////////////

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    registerFallbackValue(CustomerCodeInfo.empty());
    registerFallbackValue(SalesOrganisation.empty());
    registerFallbackValue(ShipToInfo.empty());

    locator.registerLazySingleton<MixpanelService>(() => MockMixPanelService());
    locator.registerFactory<ProductDetailBloc>(() => productDetailMockBloc);
    materialInfo = await ProductDetailLocalDataSource().getProductDetails();
    similarProducts = await ProductDetailLocalDataSource().getSimilarProduct();
    materialPrice =
        (await MaterialPriceLocalDataSource().getPriceList()).firstWhere(
      (element) => element.materialNumber == materialInfo.materialNumber,
    );
    stockInfo = (await StockInfoLocalDataSource().getStockInfo()).copyWith(
      inStock: MaterialInStock('Yes'),
    );
    emptyStockInfo = StockInfo.empty().copyWith(
      inStock: MaterialInStock('Yes'),
    );
    productImage =
        (await ProductDetailLocalDataSource().getItemProductMetaData())
            .productImages
            .first;
    registerFallbackValue(const ComboDetailPageRoute());
  });

  group(
    'Product Details Page',
    () {
      setUp(() {
        materialListMockBloc = MaterialListMockBloc();
        productDetailMockBloc = ProductDetailsMockBloc();
        mockProductImageBloc = ProductImageMockBloc();
        materialPriceMockBloc = MaterialPriceMockBloc();
        comboDealListMockBloc = ComboDealListMockBloc();
        comboDealMaterialDetailBlocMock = ComboDealMaterialDetailBlocMock();
        cartMockBloc = CartMockBloc();
        eligibilityBlocMock = EligibilityBlocMock();
        autoRouterMock = MockAppRouter();

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeRootAdminUser,
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        when(() => materialListMockBloc.state)
            .thenReturn(MaterialListState.initial());
        when(() => productDetailMockBloc.state)
            .thenReturn(ProductDetailState.initial());
        when(() => mockProductImageBloc.state)
            .thenReturn(ProductImageState.initial());
        when(() => materialPriceMockBloc.state)
            .thenReturn(MaterialPriceState.initial());
        when(() => cartMockBloc.state).thenReturn(CartState.initial());
        when(() => autoRouterMock.currentPath)
            .thenReturn('orders/material_details');
        when(() => autoRouterMock.current).thenReturn(routeData);
        when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
        when(() => autoRouterMock.navigate(any()))
            .thenAnswer((_) async => true);
        when(() => comboDealListMockBloc.state)
            .thenReturn(ComboDealListState.initial());
        when(() => comboDealMaterialDetailBlocMock.state)
            .thenReturn(ComboDealMaterialDetailState.initial());
      });

      RouteDataScope getScopedWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          providers: [
            BlocProvider<EligibilityBloc>(
              create: ((context) => eligibilityBlocMock),
            ),
            BlocProvider<MaterialListBloc>(
              create: ((context) => materialListMockBloc),
            ),
            BlocProvider<ProductDetailBloc>(
              create: ((context) => productDetailMockBloc),
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => mockProductImageBloc,
            ),
            BlocProvider<MaterialPriceBloc>(
              create: ((context) => materialPriceMockBloc),
            ),
            BlocProvider<CartBloc>(
              create: ((context) => cartMockBloc),
            ),
            BlocProvider<ComboDealMaterialDetailBloc>(
              create: ((context) => comboDealMaterialDetailBlocMock),
            ),
            BlocProvider<ComboDealListBloc>(
              create: (context) => comboDealListMockBloc,
            )
          ],
          child: ProductDetailsPage(materialInfo: materialInfo),
        );
      }

      testWidgets('Find SnackBar When Add To Cart Button Pressed',
          (tester) async {
        final expectedStates = Stream.fromIterable(
          [
            CartState.initial().copyWith(
              isUpserting: false,
              cartProducts: <PriceAggregate>[],
            ),
            CartState.initial().copyWith(
              isUpserting: true,
              cartProducts: <PriceAggregate>[],
            ),
            CartState.initial().copyWith(
              isUpserting: false,
              cartProducts: <PriceAggregate>[],
            ),
          ],
        );
        whenListen(cartMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);

        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(
          addToCartButton,
          warnIfMissed: false,
        );

        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets(
          'Find Add To Cart Error Section When Add To Cart Button Pressed',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
              ),
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(isFOCMaterial: false),
              )
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        final addToCartErrorSection =
            find.byKey(WidgetKeys.addToCartErrorSection);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pump(const Duration(seconds: 2));
        expect(addToCartErrorSection, findsOneWidget);
      });

      testWidgets('Should scroll to top when press FAB', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
              similarProduct: similarProducts,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(isFOCMaterial: false),
              )
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.pump();

        final materialDetailsMaterialDescription = find.byKey(
          WidgetKeys.materialDetailsMaterialDescription,
        );
        expect(materialDetailsMaterialDescription, findsOneWidget);
        await tester.drag(
          materialDetailsMaterialDescription,
          const Offset(0.0, -1000),
        );
        await tester.pumpAndSettle();
        final materialDetailsFloatingButton =
            find.byKey(WidgetKeys.materialDetailsFloatingButton);
        expect(
          materialDetailsFloatingButton,
          findsOneWidget,
        );
        await tester.tap(materialDetailsFloatingButton);
        await tester.pumpAndSettle();
        expect(
          materialDetailsFloatingButton,
          findsNothing,
        );
      });

      testWidgets(
          'Find Add To Cart Error Section When Add To Cart Button Pressed case 2',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: false,
              ),
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: false,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(isFOCMaterial: true),
              )
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        final addToCartErrorSection =
            find.byKey(WidgetKeys.addToCartErrorSection);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pump(const Duration(seconds: 2));
        expect(addToCartErrorSection, findsOneWidget);
      });
      testWidgets('Add to cart success when every condition is valid',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
              ),
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
                isFOCMaterial: true,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
          ),
        );
        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(isFOCMaterial: true),
              )
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        final addToCartErrorSection =
            find.byKey(WidgetKeys.addToCartErrorSection);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pump(const Duration(seconds: 2));
        expect(addToCartErrorSection, findsNothing);
      });

      testWidgets('Add to Cart is disabled when materialWithoutPrice is false',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
              ),
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        expect(tester.widget<ElevatedButton>(addToCartButton).enabled, isFalse);
        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets('Add to Cart is enabled when materialWithoutPrice is true',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
              ),
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {materialInfo.materialNumber: materialPrice},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                quantity: MaterialQty(2),
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButtonFinder =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        final addToCartButton = find.byType(ElevatedButton);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        expect(tester.widget<ElevatedButton>(addToCartButton).enabled, isTrue);
        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets('Product Details Related Products Visible', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            isRelatedProductsFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty(),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              isRelatedProductsFetching: false,
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo,
                similarProduct: similarProducts,
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final similarProductSectionFinder =
            find.byKey(WidgetKeys.materialDetailsSimilarProductsSection);
        final similarProductItemFinder =
            find.byKey(WidgetKeys.materialDetailsSimilarProductItem);

        expect(similarProductSectionFinder, findsOneWidget);
        expect(similarProductItemFinder, findsAtLeastNWidgets(1));

        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets('Product Details Related Products NotVisible',
          (tester) async {
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              isRelatedProductsFetching: true,
              productDetailAggregate: ProductDetailAggregate.empty(),
            ),
            ProductDetailState.initial().copyWith(
              isRelatedProductsFetching: false,
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo,
                similarProduct: <MaterialInfo>[],
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(similarProductSectionFinder, findsNothing);
        expect(similarProductItemFinder, findsNothing);
        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets('Product Image not available', (tester) async {
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              isDetailFetching: true,
              productDetailAggregate: ProductDetailAggregate.empty(),
            ),
            ProductDetailState.initial().copyWith(
              isDetailFetching: false,
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo:
                    materialInfo.copyWith(type: MaterialInfoType('bundle')),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(similarProductSectionFinder, findsNothing);
        expect(similarProductItemFinder, findsNothing);
        expect(productImageFinder, findsOneWidget);
        expect(materialDetailsCarouselFinder, findsNothing);
        expect(materialDetailsImageCounterFinder, findsNothing);
      });

      testWidgets('Product Image available', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            isDetailFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              similarProduct: <MaterialInfo>[],
            ),
          ),
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              materialInfo.materialNumber: ProductImages.empty().copyWith(
                materialNumber: materialInfo.materialNumber,
                image: [
                  'fake-image-1',
                  'fake-image-2',
                ],
              ),
            },
          ),
        );
        // whenListen(productDetailMockBloc, expectedStates);
        await tester
            .runAsync(() async => await tester.pumpWidget(getScopedWidget()));
        await tester.pump();
        expect(similarProductSectionFinder, findsNothing);
        expect(similarProductItemFinder, findsNothing);
        expect(productImageFinder, findsOneWidget);
        expect(materialDetailsCarouselFinder, findsOneWidget);
        expect(materialDetailsCarouselImageFinder, findsNWidgets(2));
        expect(materialDetailsImageCounterFinder, findsOneWidget);
        final selectedCarouselImageKeyFinder =
            find.byKey(const ValueKey('selected0true'));
        expect(selectedCarouselImageKeyFinder, findsOneWidget);
      });

      testWidgets('Add Product As Favourite Test', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                isFavourite: false,
              ),
            ),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  isFavourite: true,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavoriteIcon);
        final updatedFavouriteIcon = find.byIcon(Icons.favorite);
        expect(favouriteIcon, findsOneWidget);
        await tester.tap(favouriteIcon);
        await tester.pumpAndSettle();
        expect(updatedFavouriteIcon, findsOneWidget);
      });

      testWidgets('Remove Product As Favourite Test', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                isFavourite: true,
              ),
            ),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  isFavourite: false,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavoriteIcon);
        final updatedFavouriteIcon =
            find.byIcon(Icons.favorite_border_outlined);
        expect(favouriteIcon, findsOneWidget);
        await tester.tap(favouriteIcon);
        await tester.pumpAndSettle();
        expect(updatedFavouriteIcon, findsOneWidget);
      });

      testWidgets('Find product added as favourite message', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                isFavourite: false,
              ),
            ),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  isFavourite: true,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavoriteIcon);
        final favouriteMessage = find.text('Product added as favourite');
        expect(favouriteIcon, findsOneWidget);
        await tester.tap(favouriteIcon);
        await tester.pumpAndSettle();
        expect(favouriteMessage, findsOneWidget);
      });

      testWidgets('Find product removed as favourite message', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('00000111111'),
                isFavourite: true,
              ),
            ),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  isFavourite: false,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavoriteIcon);
        final favouriteMessage = find.text('Product removed as favourite');
        expect(favouriteIcon, findsOneWidget);
        await tester.tap(favouriteIcon);
        await tester.pumpAndSettle();
        expect(favouriteMessage, findsOneWidget);
      });

      testWidgets('Add to cart button pressed test when isFetching is true',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('00000111111'),
                isFavourite: true,
                isSuspended: false,
                isFOCMaterial: true,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('Yes'),
              ),
            ),
            isDetailFetching: true,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              username: Username('fake-user'),
            ),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('MY')),
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final addToCartButton =
            find.byKey(WidgetKeys.materialDetailsAddToCartButton);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        verifyNever(
          () => cartMockBloc.add(
            CartEvent.upsertCart(
              priceAggregate: PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('00000111111'),
                  isFavourite: true,
                  isSuspended: false,
                  isFOCMaterial: true,
                ),
                quantity: 1,
              ),
            ),
          ),
        );
      });
      testWidgets('MaterialDetailsToggle should be visible', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
            ),
            isDetailFetching: true,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.materialDetailsPromoSeeMore),
          findsOneWidget,
        );
      });

      testWidgets('ComboOffersProduct should be visible', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: materialNumber,
                isSuspended: false,
                isFOCMaterial: true,
                productImages: productImage,
              ),
              stockInfo: emptyStockInfo,
              productItem: productItemWithProductItemXp,
            ),
            isDetailFetching: false,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: CustomerCodeInfo.empty()
                .copyWith(salesDeals: [SalesDealNumber('0000000000')]),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {materialNumber: price},
          ),
        );
        when(() => comboDealListMockBloc.state).thenReturn(
          ComboDealListState.initial().copyWith(
            isFetching: false,
            comboDeals: {
              '${price.comboDeal.flexibleGroup.getValue()}-': [comboDeal],
            },
          ),
        );
        whenListen(
          materialPriceMockBloc,
          Stream.fromIterable([
            MaterialPriceState.initial().copyWith(
              isFetching: true,
            ),
            MaterialPriceState.initial().copyWith(
              isFetching: false,
              materialPrice: {materialNumber: price},
            )
          ]),
        );
        whenListen(
          comboDealListMockBloc,
          Stream.fromIterable([
            ComboDealListState.initial().copyWith(
              isFetching: true,
            ),
            ComboDealListState.initial().copyWith(
              isFetching: false,
              comboDeals: {
                '${price.comboDeal.flexibleGroup.getValue()}-': [comboDeal],
              },
            )
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        await tester.tap(
          find.byKey(WidgetKeys.getComboDealButton),
        );
        await tester.pump();
        expect(
          find.text('Get combo deal'.tr()),
          findsOneWidget,
        );
      });

      testWidgets(
          '_MaterialInfoDialog should be shown when tap icon - display expiry date',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
            ),
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.materialDetailsInfoTile), findsOneWidget);
        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
        );
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.materialInfoDialog),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow('Expiry'.tr(), '30 Nov 2025'),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          '_MaterialInfoDialog should be shown when tap icon - hide expiry date',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
            ),
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakePHSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.materialDetailsInfoTile), findsOneWidget);
        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
        );
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.materialInfoDialog),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow('Expiry'.tr(), '30 Nov 2025'),
          ),
          findsNothing,
        );
      });

      testWidgets('Similar product should be display', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                materialNumber: materialNumber,
                isFavourite: true,
                isSuspended: false,
                isFOCMaterial: true,
                productImages: productImage,
              ),
              productItem: productItemWithProductItemXp,
              similarProduct: similarProducts,
            ),
          ),
        );
        when(
          () => autoRouterMock.push(
            ProductDetailsPageRoute(materialInfo: materialInfo),
          ),
        ).thenAnswer((invocation) => Future(() => null));
        whenListen(
          productDetailMockBloc,
          Stream.fromIterable([
            ProductDetailState.initial()
                .copyWith(isRelatedProductsFetching: true),
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(
                  materialNumber: materialNumber,
                  isFavourite: true,
                  isSuspended: false,
                  isFOCMaterial: true,
                  productImages: productImage,
                ),
                productItem: productItemWithProductItemXp,
                similarProduct: similarProducts,
              ),
              isRelatedProductsFetching: false,
            ),
          ]),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.favoritesIcon).last,
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pumpAndSettle();
        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsSimilarProductItem).first,
        );
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.favoritesIcon), findsNWidgets(5));
      });
      testWidgets('Stock should be display', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
              similarProduct: similarProducts,
            ),
          ),
        );
        whenListen(
          productDetailMockBloc,
          Stream.fromIterable([
            ProductDetailState.initial().copyWith(isStockFetching: true),
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo,
                stockInfo: stockInfo,
                productItem: productItemWithProductItemXp,
                similarProduct: similarProducts,
              ),
              isStockFetching: false,
            ),
          ]),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeMYSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
      });

      testWidgets('product quantity update', (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
              similarProduct: similarProducts,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {materialNumber: price},
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final productDetailQuantityAddKey =
            find.byKey(WidgetKeys.productDetailQuantityAddKey);

        expect(
          find.byKey(WidgetKeys.materialDetailsQuantityInput),
          findsOneWidget,
        );
        expect(productDetailQuantityAddKey, findsOneWidget);
        await tester.tap(productDetailQuantityAddKey);
        verify(
          () => productDetailMockBloc.add(
            const ProductDetailEvent.fetchItemQuantityForZdp5Discount(
              quantity: 2,
            ),
          ),
        ).called(1);
      });

      testWidgets('product price call for zdp5 ', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: {
              materialNumber: price.copyWith(
                zdp5MaxQuota: ZDP5Info('2'),
                zdp5RemainingQuota: ZDP5Info('2'),
              )
            },
          ),
        );

        whenListen(
          productDetailMockBloc,
          Stream.fromIterable([
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo.copyWith(quantity: MaterialQty(3)),
                stockInfo: stockInfo,
                productItem: productItemWithProductItemXp,
                similarProduct: similarProducts,
              ),
            ),
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsQuantityInput),
          findsOneWidget,
        );
        verify(
          () => materialPriceMockBloc.add(
            MaterialPriceEvent.fetchPriceForZDP5Materials(
              materialInfo: materialInfo.copyWith(quantity: MaterialQty(3)),
            ),
          ),
        ).called(1);
        verify(
          () => productDetailMockBloc.add(
            const ProductDetailEvent.setExceedQty(
              exceedQty: true,
            ),
          ),
        ).called(1);
      });

      testWidgets(
        'Test enter minimum quantity',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final inputFinder =
              find.byKey(WidgetKeys.productDetailQuantityTextKey);
          await tester.enterText(inputFinder, '0');
          await tester.pump();
          await tester.testTextInput.receiveAction(TextInputAction.done);
          expect(
            tester.widget<TextFormField>(inputFinder).controller?.text,
            '1',
          );
        },
      );

      testWidgets(
        'Test limit enter quantity input up to 5 digits',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final inputFinder =
              find.byKey(WidgetKeys.productDetailQuantityTextKey);
          await tester.enterText(inputFinder, '999999');
          await tester.pump();
          await tester.testTextInput.receiveAction(TextInputAction.done);
          expect(
            tester.widget<TextFormField>(inputFinder).controller?.text,
            '99999',
          );
        },
      );

      testWidgets(
          'Test the Covid tag on product item and the price of the product',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakePHSalesOrganisation,
            salesOrgConfigs: fakePHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfoForCovid,
            user: fakeClientAdmin,
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(isFOCMaterial: true),
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
              similarProduct: similarProducts,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final productDetailList = find.byType(ProductDetailsPage);
        expect(productDetailList, findsOneWidget);
        final covidLabel = find.byKey(
          WidgetKeys.covidLabel,
        );
        expect(covidLabel, findsOneWidget);
        final priceText = find.text(
          'Price Not Available',
        );
        expect(priceText, findsOneWidget);
      });

      testWidgets('Should reset input qty in state to 1 at initial',
          (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        verify(
          () => productDetailMockBloc.add(ProductDetailEvent.updateQty(qty: 1)),
        ).called(1);
      });

      testWidgets(
        ' -> Find customer blocked banner',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              shipToInfo: ShipToInfo.empty()
                  .copyWith(customerBlock: CustomerBlock('blocked')),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final customerBlockedBanner =
              find.byKey(WidgetKeys.customerBlockedBanner);

          expect(customerBlockedBanner, findsOneWidget);
        },
      );

      testWidgets(
          'List price strike through price visible, if final price is less than list price && enableListPrice = true',
          (tester) async {
        final finalPrice = MaterialPrice(80);
        final listPrice = MaterialPrice(100);
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              materialInfo.materialNumber: Price.empty().copyWith(
                lastPrice: listPrice,
                finalPrice: finalPrice,
                materialNumber: materialInfo.materialNumber,
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

      testWidgets(
          'List price strike through price not visible, if final price is less than list price && enableListPrice = false',
          (tester) async {
        final finalPrice = MaterialPrice(80);
        final listPrice = MaterialPrice(100);
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              materialInfo.materialNumber: Price.empty().copyWith(
                lastPrice: listPrice,
                finalPrice: finalPrice,
                materialNumber: materialInfo.materialNumber,
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

      testWidgets(
          'List price strike through price not visible, if final price is greater than and equal to list price && enableListPrice = true',
          (tester) async {
        final finalPrice = MaterialPrice(100);
        final listPrice = MaterialPrice(80);
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              materialInfo.materialNumber: Price.empty().copyWith(
                lastPrice: listPrice,
                finalPrice: finalPrice,
                materialNumber: materialInfo.materialNumber,
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

      testWidgets(
          'Product details Page should not display batch number for TW Market',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: stockInfo,
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeTWSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.textContaining(
            'Batch 12S017',
            findRichText: true,
          ),
          findsNothing,
        );
      });

      testWidgets(
          '_MaterialInfoDialog should be shown when tap icon - not display batch for TW Market',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
            ),
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeTWSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.materialDetailsInfoTile), findsOneWidget);
        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
        );
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.materialInfoDialog),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow('Batch'.tr(), '12S017'),
          ),
          findsNothing,
        );
      });

      testWidgets(
          'Product details Page should display batch number for Other Market',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: stockInfo,
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.textContaining(
            'Batch 12S017',
            findRichText: true,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          '_MaterialInfoDialog should be shown when tap icon - display batch for Other Market',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
            ),
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.materialDetailsInfoTile), findsOneWidget);
        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
        );
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.materialInfoDialog),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow('Batch'.tr(), '12S017'),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Product details Page should not display batch number for SG Market',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: stockInfo,
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSGSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.textContaining(
            'Batch 12S017',
            findRichText: true,
          ),
          findsNothing,
        );
      });

      testWidgets(
          '_MaterialInfoDialog should be shown when tap icon - not display batch for SG Market',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
            ),
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSGSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.materialDetailsInfoTile), findsOneWidget);
        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
        );
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.materialInfoDialog),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow('Batch'.tr(), '12S017'),
          ),
          findsNothing,
        );
      });

      testWidgets(
          'Expiry Date visible for PH Mdi for materials with principal code 107381',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('107381'),
                ),
              ),
              stockInfo: stockInfo,
            ),
            salesOrganisation: fakePhMDISalesOrganisation,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.textContaining('EXP: 30 Nov 2025', findRichText: true),
          findsOneWidget,
        );

        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
        );
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.materialInfoDialog),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow('Expiry', '30 Nov 2025'),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Expiry Date not visible for PH Mdi for materials with any principal code other than 107381',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo.copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('fake-code'),
                ),
              ),
              stockInfo: stockInfo,
            ),
            salesOrganisation: fakePhMDISalesOrganisation,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.textContaining('EXP: NA', findRichText: true),
          findsOneWidget,
        );

        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
        );
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.materialInfoDialog),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow('Expiry', 'NA'),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Expiry Date visible for all markets and all materials except PH Mdi for materials without principal code 107381',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
            ),
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.textContaining('EXP: 30 Nov 2025', findRichText: true),
          findsOneWidget,
        );

        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
        );
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.materialInfoDialog),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow('Expiry', '30 Nov 2025'),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'Expiry Date not visible for all markets if expiry date toggle is off from salesOrgConfig',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
            ),
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakePHSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.textContaining('EXP: 30 Nov 2025', findRichText: true),
          findsNothing,
        );

        await tester.tap(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
        );
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.materialInfoDialog),
          findsOneWidget,
        );
        expect(
          find.byKey(
            WidgetKeys.balanceTextRow('Expiry', '30 Nov 2025'),
          ),
          findsNothing,
        );
      });

      testWidgets(
          'Test Material Quantity field reset when item from similar product is selected',
          (tester) async {
        when(
          () => autoRouterMock
              .push(ProductDetailsPageRoute(materialInfo: materialInfo)),
        ).thenAnswer((invocation) => Future(() => null));

        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              similarProduct: similarProducts,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.materialDetailsSimilarProductsSection),
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsSimilarProductsSection),
          findsOneWidget,
        );

        final relatedProduct =
            find.byKey(WidgetKeys.materialDetailsSimilarProductItem).first;

        expect(relatedProduct, findsOneWidget);

        await tester.tap(relatedProduct);
        verify(
          () => autoRouterMock
              .push(ProductDetailsPageRoute(materialInfo: materialInfo)),
        ).called(1);

        await tester.pumpAndSettle();
      });
    },
  );
}
