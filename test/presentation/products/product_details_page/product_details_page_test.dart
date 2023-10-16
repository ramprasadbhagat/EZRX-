import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
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
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/product_image/datasource/product_image_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

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

class MockTokenStorage extends Mock implements TokenStorage {}

final locator = GetIt.instance;
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  final mockSalesOrgBloc = SalesOrgMockBloc();
  final userBlocMock = UserMockBloc();
  final materialListMockBloc = MaterialListMockBloc();
  final productDetailMockBloc = ProductDetailsMockBloc();
  final mockProductImageBloc = ProductImageMockBloc();
  final materialPriceMockBloc = MaterialPriceMockBloc();
  final comboDealListMockBloc = ComboDealListMockBloc();
  final comboDealMaterialDetailBlocMock = ComboDealMaterialDetailBlocMock();
  late EligibilityBlocMock eligibilityBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late CartBloc cartMockBloc;
  late AppRouter autoRouterMock;
  late MaterialInfo materialInfo;
  late StockInfo stockInfo;
  late StockInfo emptyStockInfo;
  late Price materialPrice;
  late TokenStorage tokenStorage;
  late User user;
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
    tokenStorage = MockTokenStorage();
    locator.registerLazySingleton<MixpanelService>(() => MockMixPanelService());
    materialInfo = await ProductDetailLocalDataSource().getProductDetails();
    similarProducts = await ProductDetailLocalDataSource().getSimilarProduct();
    materialPrice =
        (await MaterialPriceLocalDataSource().getPriceList()).firstWhere(
      (element) => element.materialNumber == materialInfo.materialNumber,
    );
    when(() => tokenStorage.get())
        .thenAnswer((invocation) async => JWTDto(access: '', refresh: ''));
    user = await UserLocalDataSource(tokenStorage: tokenStorage).getUser();
    stockInfo = (await StockInfoLocalDataSource().getStockInfo()).copyWith(
      inStock: MaterialInStock('Yes'),
    );
    emptyStockInfo = StockInfo.empty().copyWith(
      inStock: MaterialInStock('Yes'),
    );
    productImage =
        (await ProductImageLocalDataSource().getItemProductDetails()).first;
    registerFallbackValue(const ComboDetailPageRoute());
  });

  group(
    'Product Details Page',
    () {
      setUp(() {
        customerCodeBlocMock = CustomerCodeBlocMock();
        cartMockBloc = CartMockBloc();
        eligibilityBlocMock = EligibilityBlocMock();
        autoRouterMock = MockAppRouter();

        when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeRootAdminUser,
          ),
        );
        when(() => customerCodeBlocMock.state)
            .thenReturn(CustomerCodeState.initial());
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
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
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
          child: const ProductDetailsPage(),
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
        final itemAddedSnackBar =
            find.byKey(WidgetKeys.materialDetailsAddToCartSnackBar);
        expect(cartButtonFinder, findsOneWidget);
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pump(const Duration(seconds: 1));
        expect(itemAddedSnackBar, findsOneWidget);
      });

      testWidgets(
          'Find Add To Cart Error Section When Add To Cart Button Pressed',
          (tester) async {
        when(() => mockSalesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: salesOrgConfigEnabledMaterialWithoutPrice,
          ),
        );
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
        when(() => mockSalesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: salesOrgConfigEnabledMaterialWithoutPrice,
          ),
        );
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
        when(() => mockSalesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: salesOrgConfigEnabledMaterialWithoutPrice,
          ),
        );
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
        when(() => mockSalesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: salesOrgConfigEnabledMaterialWithoutPrice,
          ),
        );
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
        when(() => mockSalesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: salesOrgConfigEnabledMaterialWithoutPrice,
          ),
        );
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
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty(),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              isFetching: false,
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
              isFetching: true,
              productDetailAggregate: ProductDetailAggregate.empty(),
            ),
            ProductDetailState.initial().copyWith(
              isFetching: false,
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
              isFetching: true,
              productDetailAggregate: ProductDetailAggregate.empty(),
            ),
            ProductDetailState.initial().copyWith(
              isFetching: false,
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
            isFetching: false,
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
            isFetching: true,
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
              ),
              quantity: 1,
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
            isFetching: true,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesMYOrganisation,
            salesOrgConfigs: salesOrgConfigEnabledMaterialWithoutPrice,
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
            isFetching: false,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesMYOrganisation,
            salesOrgConfigs: salesOrgConfigEnabledMaterialWithoutPriceAndCombo,
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

      testWidgets('_MaterialInfoDialog should be shown when tap icon',
          (tester) async {
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: materialInfo,
              stockInfo: stockInfo,
              productItem: productItemWithProductItemXp,
            ),
            isFetching: false,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesMYOrganisation,
            salesOrgConfigs: salesOrgConfigEnabledMaterialWithoutPrice,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.materialDetailsInfoTile),
          find.byKey(WidgetKeys.productDetailList),
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
            isFetching: false,
          ),
        );
        whenListen(
          productDetailMockBloc,
          Stream.fromIterable([
            ProductDetailState.initial().copyWith(isFetching: true),
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
              isFetching: false,
            ),
          ]),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesMYOrganisation,
            salesOrgConfigs: salesOrgConfigEnabledMaterialWithoutPrice,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.favoritesIcon).last,
          find.byKey(WidgetKeys.productDetailList),
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
            isFetching: false,
          ),
        );
        whenListen(
          productDetailMockBloc,
          Stream.fromIterable([
            ProductDetailState.initial().copyWith(isFetching: true),
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: materialInfo,
                stockInfo: stockInfo,
                productItem: productItemWithProductItemXp,
                similarProduct: similarProducts,
              ),
              isFetching: false,
            ),
          ]),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: user,
            salesOrganisation: fakeSalesMYOrganisation,
            salesOrgConfigs: salesOrgConfigEnabledMaterialWithoutPrice,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.materialDetailsStock), findsOneWidget);
      });
    },
  );
}
