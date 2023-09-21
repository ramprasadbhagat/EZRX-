import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
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
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/tester_utils.dart';
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

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ProductImageMockBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MaterialPriceMockBloc
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

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
  late EligibilityBlocMock eligibilityBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late CartBloc cartMockBloc;
  late AppRouter autoRouterMock;
  late MaterialInfo materialInfo;
  late List<MaterialInfo> similarProducts;

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('root_admin'),
    ),
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
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    materialInfo = await ProductDetailLocalDataSource().getProductDetails();
    similarProducts = await ProductDetailLocalDataSource().getSimilarProduct();
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
            user: fakeUser,
          ),
        );
        when(() => customerCodeBlocMock.state)
            .thenReturn(CustomerCodeState.initial());
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('MY')),
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
      });

      RouteDataScope getScopedWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          useMediaQuery: false,
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
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
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

      testWidgets('Add to Cart is disabled when materialWithoutPrice is false',
          (tester) async {
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              MaterialNumber('00000111111'): Price.empty().copyWith(
                finalPrice: MaterialPrice(0.0),
              ),
            },
          ),
        );
        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('00000111111'),
                quantity: 2,
              ),
            ),
          ),
        );
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
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
            configs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
            ),
          ),
        );
        when(() => materialPriceMockBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              MaterialNumber('00000111111'): Price.empty().copyWith(
                finalPrice: MaterialPrice(0.0),
              ),
            },
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
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('00000111111'),
                quantity: 2,
              ),
              stockInfo: StockInfo.empty().copyWith(
                inStock: MaterialInStock('true'),
              ),
            ),
          ),
        );
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
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
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
        await tester.pump();
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
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
        await tester.pump();
        expect(similarProductSectionFinder, findsNothing);
        expect(similarProductItemFinder, findsNothing);
        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets('Product Image  not available', (tester) async {
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
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
        await tester.pump();
        expect(similarProductSectionFinder, findsNothing);
        expect(similarProductItemFinder, findsNothing);
        expect(productImageFinder, findsOneWidget);
        expect(materialDetailsCarouselFinder, findsNothing);
        expect(materialDetailsImageCounterFinder, findsNothing);
      });

      testWidgets('Product Image available', (tester) async {
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
        whenListen(productDetailMockBloc, expectedStates);
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
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
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('00000111111'),
                isFavourite: false,
              ),
            ),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('00000111111'),
                  isFavourite: true,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavouriteIcon);
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
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('00000111111'),
                  isFavourite: false,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavouriteIcon);
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
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('00000111111'),
                isFavourite: false,
              ),
            ),
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('00000111111'),
                  isFavourite: true,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavouriteIcon);
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
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('00000111111'),
                  isFavourite: false,
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await TesterUtils.setUpLocalizationWrapper(
          widget: getScopedWidget(),
          tester: tester,
        );
        await tester.pump();
        final favouriteIcon =
            find.byKey(WidgetKeys.materialDetailsFavouriteIcon);
        final favouriteMessage = find.text('Product removed as favourite');
        expect(favouriteIcon, findsOneWidget);
        await tester.tap(favouriteIcon);
        await tester.pumpAndSettle();
        expect(favouriteMessage, findsOneWidget);
      });
    },
  );
}
