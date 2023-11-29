import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/products_tab.dart';
import 'package:ezrxmobile/presentation/products/widgets/filter_value_list.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/search_and_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ProductDetailBlocMock
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MaterialFilterBlocMock
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

class OrderEligibilityBlocMock
    extends MockBloc<OrderEligibilityEvent, OrderEligibilityState>
    implements OrderEligibilityBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockAppRouter extends Mock implements AppRouter {}

void main() {
  late MaterialListBlocMock materialListBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ProductDetailBlocMock productDetailBlocMock;
  late MaterialPriceBlocMock materialPriceBlocMock;
  late CustomerCodeBlocMock customerCodeBlocMock;
  late CartBlocMock cartBlocMock;
  late OrderEligibilityBloc orderEligibilityBloc;
  late AppRouter autoRouterMock;
  late MaterialFilterBlocMock materialFilterBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late SalesOrgBlocMock salesOrgBlocMock;
  late MaterialResponse materialResponseMock;
  late List<Price> priceList;
  late Map<MaterialNumber, Price> materialPriceMock;
  late List<PriceAggregate> mockCartItems;
  setUpAll(() async {
    locator.registerFactory(() => MockAppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<MockAppRouter>();
    orderEligibilityBloc = OrderEligibilityBlocMock();
    materialResponseMock = await MaterialListLocalDataSource().getProductList();
    priceList = await MaterialPriceLocalDataSource().getPriceList();

    mockCartItems = await CartLocalDataSource().upsertCart();
  });

  group(
    'Test "Product Tabs"',
    () {
      setUp(() async {
        TestWidgetsFlutterBinding.ensureInitialized();
        locator = GetIt.instance;
        materialListBlocMock = MaterialListBlocMock();
        productDetailBlocMock = ProductDetailBlocMock();
        eligibilityBlocMock = EligibilityBlocMock();

        materialPriceBlocMock = MaterialPriceBlocMock();
        customerCodeBlocMock = CustomerCodeBlocMock();
        materialFilterBlocMock = MaterialFilterBlocMock();
        productImageBlocMock = ProductImageBlocMock();
        cartBlocMock = CartBlocMock();
        salesOrgBlocMock = SalesOrgBlocMock();
        materialPriceMock = Map.fromEntries(
          priceList.map((price) => MapEntry(price.materialNumber, price)),
        );
        when(() => autoRouterMock.pushNamed(any())).thenAnswer(
          (_) => Future.value(),
        );
        when(() => materialListBlocMock.state)
            .thenReturn(MaterialListState.initial());
        when(() => eligibilityBlocMock.state)
            .thenReturn(EligibilityState.initial());
        when(() => orderEligibilityBloc.state)
            .thenReturn(OrderEligibilityState.initial());
        when(() => productDetailBlocMock.state)
            .thenReturn(ProductDetailState.initial());
        when(() => materialPriceBlocMock.state)
            .thenReturn(MaterialPriceState.initial());
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(isFetching: false),
        );
        when(() => autoRouterMock.currentPath).thenReturn('fake-path');
        when(() => cartBlocMock.state).thenReturn(CartState.initial());
        when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
        when(() => materialFilterBlocMock.state)
            .thenReturn(MaterialFilterState.initial());
        when(() => productImageBlocMock.state)
            .thenReturn(ProductImageState.initial());
      });

      Widget getScopedWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          providers: [
            BlocProvider<MaterialListBloc>(
              create: (context) => materialListBlocMock,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<CartBloc>(
              create: (context) => cartBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(
              create: (context) => salesOrgBlocMock,
            ),
            BlocProvider<ProductDetailBloc>(
              create: (context) => productDetailBlocMock,
            ),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBlocMock,
            ),
            BlocProvider<MaterialFilterBloc>(
              create: (context) => materialFilterBlocMock,
            ),
            BlocProvider<OrderEligibilityBloc>(
              create: (context) => orderEligibilityBloc,
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => productImageBlocMock,
            ),
          ],
          child: const ProductsTab(),
        );
      }

      testWidgets(
        '=> Test base page display',
        (tester) async {
          await tester.runAsync(() async {
            await tester.pumpWidget(getScopedWidget());
            await tester.pump();
            expect(find.byKey(WidgetKeys.customerCodeSelector), findsOneWidget);
            expect(find.byType(SearchAndFilter), findsOneWidget);
            expect(find.byType(FilterValueList), findsOneWidget);
          });
        },
      );

      testWidgets(
        '=> Test loading state display',
        (tester) async {
          when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial().copyWith(
              isFetching: true,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byKey(WidgetKeys.loaderImage), findsOneWidget);
          expect(find.byKey(WidgetKeys.scrollList), findsNothing);
        },
      );

      testWidgets(
        '=> Test fetch data success',
        (tester) async {
          final expectedState = [
            MaterialListState.initial().copyWith(
              isFetching: true,
            ),
            MaterialListState.initial().copyWith(
              materialList: materialResponseMock.products,
            ),
          ];
          whenListen(
            materialListBlocMock,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          expect(find.byKey(WidgetKeys.loaderImage), findsNothing);
          expect(find.byKey(WidgetKeys.scrollList), findsOneWidget);
        },
      );

      testWidgets(
        '=> Test reload list',
        (tester) async {
          when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial().copyWith(
              materialList: materialResponseMock.products,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          await tester.fling(
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, 300.0),
            800.0,
          );
          expect(
            find.byType(RefreshProgressIndicator),
            findsOneWidget,
          );

          await tester.pumpAndSettle();
          verify(
            () => materialListBlocMock.add(
              MaterialListEvent.fetch(
                salesOrganisation: SalesOrganisation.empty(),
                configs: SalesOrganisationConfigs.empty(),
                customerCodeInfo: CustomerCodeInfo.empty(),
                shipToInfo: ShipToInfo.empty(),
                selectedMaterialFilter: MaterialFilter.empty(),
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        '=> Test load more material list',
        (tester) async {
          when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial().copyWith(
              materialList: materialResponseMock.products,
              canLoadMore: true,
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial(),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          await tester.fling(
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, -5000.0),
            800.0,
          );
          verify(
            () => materialListBlocMock.add(
              MaterialListEvent.loadMore(
                salesOrganisation: SalesOrganisation.empty(),
                configs: SalesOrganisationConfigs.empty(),
                customerCodeInfo: CustomerCodeInfo.empty(),
                shipToInfo: ShipToInfo.empty(),
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        '=> Test tap on Material Grid Item',
        (tester) async {
          when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial().copyWith(
              materialList: materialResponseMock.products,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          await tester.tap(find.byType(MaterialGridItem).first);
          await tester.pumpAndSettle();
          verify(
            () => productDetailBlocMock.add(
              ProductDetailEvent.fetch(
                materialNumber:
                    materialResponseMock.products.first.materialNumber,
                locale: const Locale('en'),
                type: materialResponseMock.products.first.type,
              ),
            ),
          ).called(1);

          verify(
            () => materialPriceBlocMock.add(
              MaterialPriceEvent.fetch(
                comboDealEligible: false,
                materials: [materialResponseMock.products.first],
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        '=> Test tap on favorite button when is favorite',
        (tester) async {
          when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial().copyWith(
              materialList: materialResponseMock.products
                  .map((e) => e.copyWith(isFavourite: true))
                  .toList(),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final favoriteButtonFinder = find.descendant(
            of: find.byType(MaterialGridItem).first,
            matching: find.byType(FavouriteIcon),
          );
          await tester.dragUntilVisible(
            favoriteButtonFinder,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, -200.0),
          );
          await tester.pump();
          await tester.tap(favoriteButtonFinder);
          await tester.pumpAndSettle();

          verify(
            () => materialListBlocMock.add(
              MaterialListEvent.deleteFavourite(
                item: materialResponseMock.products.first.copyWith(
                  isFavourite: true,
                ),
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        '=> Test tap on favorite button when is not favorite',
        (tester) async {
          when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial().copyWith(
              materialList: materialResponseMock.products
                  .map((e) => e.copyWith(isFavourite: false))
                  .toList(),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final favoriteButtonFinder = find.descendant(
            of: find.byType(MaterialGridItem).first,
            matching: find.byType(FavouriteIcon),
          );
          await tester.dragUntilVisible(
            favoriteButtonFinder,
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, -200.0),
          );
          await tester.pump();
          await tester.tap(favoriteButtonFinder);
          await tester.pumpAndSettle();

          verify(
            () => materialListBlocMock.add(
              MaterialListEvent.addFavourite(
                item: materialResponseMock.products.first.copyWith(
                  isFavourite: false,
                ),
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        '=> Test bundle item',
        (tester) async {
          when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial().copyWith(
              materialList: [materialResponseMock.products[12]],
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          final bundleFinder =
              find.byKey(WidgetKeys.materialListBundleCard).first;
          await tester.tap(bundleFinder);
          await tester.pumpAndSettle();

          verify(
            () => productDetailBlocMock.add(
              ProductDetailEvent.fetch(
                materialNumber:
                    materialResponseMock.products[12].materialNumber,
                locale: const Locale('en'),
                type: materialResponseMock.products[12].type,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        '=> Test material not found',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.text("That didn't match anything"),
            findsOneWidget,
          );
          expect(
            find.textContaining(
              'Try adjusting your search or filter selection to find what you’re looking for.',
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> Test favourite material not found',
        (tester) async {
          when(() => materialFilterBlocMock.state).thenReturn(
            MaterialFilterState.initial().copyWith.materialFilter(
                  isFavourite: true,
                ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.text('No favourites yet'.tr()),
            findsOneWidget,
          );
          expect(
            find.byIcon(Icons.favorite_border_outlined),
            findsOneWidget,
          );
          expect(
            find.textContaining(
              'Tap on'.tr(),
              findRichText: true,
            ),
            findsOneWidget,
          );
          expect(
            find.textContaining(
              'to add an item to your favourites'.tr(),
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> Test Filter combo material not found',
        (tester) async {
          when(() => materialFilterBlocMock.state).thenReturn(
            MaterialFilterState.initial().copyWith.materialFilter(
                  comboOffers: true,
                ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(
            find.text("That didn't match anything"),
            findsOneWidget,
          );
          expect(
            find.textContaining(
              'Try adjusting your search or filter selection to find what you’re looking for.',
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> Test Filter combo material found',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeMYSalesOrganisation,
              salesOrgConfigs:
                  salesOrgConfigEnabledMaterialWithoutPriceAndCombo,
              customerCodeInfo: CustomerCodeInfo.empty()
                  .copyWith(salesDeals: [SalesDealNumber('0000000000')]),
            ),
          );

          when(() => materialFilterBlocMock.state).thenReturn(
            MaterialFilterState.initial().copyWith.materialFilter(
                  comboOffers: true,
                ),
          );
          when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial().copyWith(
              materialList: [
                materialResponseMock.products.first.copyWith(
                  type: MaterialInfoType('material'),
                )
              ],
            ),
          );
          when(() => materialPriceBlocMock.state).thenReturn(
            MaterialPriceState.initial().copyWith(
              materialPrice: materialPriceMock,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final materialCardFinder =
              find.byKey(WidgetKeys.materialListMaterialCard);
          final comboOfferTextFinder = find.text('Combo offer');
          expect(materialCardFinder, findsOneWidget);
          expect(comboOfferTextFinder, findsOneWidget);
        },
      );
      testWidgets('show nothing if disableCreateOrder', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(user: fakeReturnApproverUser),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(find.byKey(WidgetKeys.cartButton), findsNothing);
      });
      testWidgets('render the cart button ', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(user: fakeClientUser),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(find.byKey(WidgetKeys.cartButton), findsOneWidget);
      });
      testWidgets('should rebuild icon badge when the cart products is updated',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(user: fakeClientUser),
        );
        when(() => cartBlocMock.state).thenReturn(
          CartState.initial().copyWith(cartProducts: mockCartItems),
        );
        whenListen(
          cartBlocMock,
          Stream.fromIterable([
            CartState.initial(),
            CartState.initial().copyWith(cartProducts: mockCartItems),
          ]),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(find.byKey(WidgetKeys.cartButton), findsOneWidget);
        expect(find.text('3'), findsOneWidget);
      });
      testWidgets(
          'should initialize the OrderEligibilityBloc when click icon button',
          (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cartButton = find.byKey(WidgetKeys.cartButton);
        expect(cartButton, findsOneWidget);
        await tester.ensureVisible(cartButton);
        await tester.tap(cartButton);
        await tester.pumpAndSettle();
        verify(
          () => orderEligibilityBloc.add(
            OrderEligibilityEvent.initialized(
              configs: fakeEmptySalesConfigs,
              customerCodeInfo: fakeEmptyCustomerCodeInfo,
              orderType: '',
              salesOrg: fakeEmptySalesOrganisation,
              shipInfo: ShipToInfo.empty(),
              user: User.empty(),
            ),
          ),
        ).called(1);
      });
      testWidgets('Test the Covid filter button', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakePHSalesOrganisation,
            salesOrgConfigs: fakeSalesOrganisationConfigs,
            customerCodeInfo: fakeCustomerCodeInfoForCovid,
            user: fakeRootAdminUser,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            salesOrganisation: fakePHSalesOrganisation,
            configs: fakeSalesOrganisationConfigs,
          ),
        );
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfoForCovid,
            shipToInfo: fakeShipToInfo,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final covidFilterButton = find.text(
          'Covid-19'.tr(),
        );
        expect(covidFilterButton, findsOneWidget);
        await tester.tap(covidFilterButton);
        await tester.pump();
        verify(
          () => materialListBlocMock.add(
            MaterialListEvent.fetch(
              salesOrganisation: fakePHSalesOrganisation,
              configs: fakeSalesOrganisationConfigs,
              customerCodeInfo: fakeCustomerCodeInfoForCovid,
              shipToInfo: fakeShipToInfo,
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                isFOCMaterial: true,
              ),
            ),
          ),
        ).called(1);
        verify(
          () => materialFilterBlocMock.add(
            const MaterialFilterEvent.updateSelectedMaterialFilter(
              MaterialFilterType.isFOCMaterial,
              true,
            ),
          ),
        ).called(1);
      });
      testWidgets(
          'Test the Covid tag on product item and the price of the product',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakePHSalesOrganisation,
            salesOrgConfigs: fakeSalesOrganisationConfigs,
            customerCodeInfo: fakeCustomerCodeInfoForCovid,
            user: fakeRootAdminUser,
          ),
        );
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: [
              materialResponseMock.products.first.copyWith(
                type: MaterialInfoType('material'),
                isFOCMaterial: true,
              )
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final materialListMaterialCard = find.byKey(
          WidgetKeys.materialListMaterialCard,
        );
        expect(materialListMaterialCard, findsOneWidget);
        final covidLabel = find.byKey(
          WidgetKeys.covidLabel,
        );
        expect(covidLabel, findsOneWidget);
        final priceText = find.text(
          'Price Not Available',
        );
        expect(priceText, findsOneWidget);
      });
    },
  );
}
