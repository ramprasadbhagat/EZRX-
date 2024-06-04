import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_license_local.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
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
import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../common_mock_data/mock_other.dart';
import '../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

void main() {
  late MaterialListBlocMock materialListBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ProductDetailBlocMock productDetailBlocMock;
  late MaterialPriceBlocMock materialPriceBlocMock;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late CartBlocMock cartBlocMock;
  late OrderEligibilityBloc orderEligibilityBloc;
  late AppRouter autoRouterMock;
  late MaterialFilterBlocMock materialFilterBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late MaterialResponse materialResponseMock;
  late List<Price> priceList;
  late Map<MaterialNumber, Price> materialPriceMock;
  late List<PriceAggregate> mockCartItems;
  late List<CustomerLicense> customerLicense;
  setUpAll(() async {
    locator.registerFactory(() => AutoRouteMock());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator.registerSingleton<ClevertapService>(ClevertapServiceMock());
    autoRouterMock = locator<AutoRouteMock>();
    orderEligibilityBloc = OrderEligibilityBlocMock();
    materialResponseMock = await MaterialListLocalDataSource().getProductList();
    priceList = await MaterialPriceLocalDataSource().getPriceList();

    mockCartItems = await CartLocalDataSource().upsertCart();
    customerLicense =
        await CustomerLicenseLocalDataSource().getCustomerLicense();
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
        customerLicenseBlocMock = CustomerLicenseBlocMock();

        materialPriceBlocMock = MaterialPriceBlocMock();
        materialFilterBlocMock = MaterialFilterBlocMock();
        productImageBlocMock = ProductImageBlocMock();
        cartBlocMock = CartBlocMock();
        materialPriceMock = Map.fromEntries(
          priceList.map((price) => MapEntry(price.materialNumber, price)),
        );
        when(() => autoRouterMock.pushNamed(any())).thenAnswer(
          (_) => Future.value(),
        );
        when(() => materialListBlocMock.state)
            .thenReturn(MaterialListState.initial());
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => customerLicenseBlocMock.state)
            .thenReturn(CustomerLicenseState.initial());
        when(() => orderEligibilityBloc.state)
            .thenReturn(OrderEligibilityState.initial());
        when(() => productDetailBlocMock.state)
            .thenReturn(ProductDetailState.initial());
        when(() => materialPriceBlocMock.state)
            .thenReturn(MaterialPriceState.initial());
        when(() => autoRouterMock.currentPath).thenReturn('fake-path');
        when(() => cartBlocMock.state).thenReturn(CartState.initial());
        when(() => materialFilterBlocMock.state)
            .thenReturn(MaterialFilterState.initial());
        when(() => productImageBlocMock.state)
            .thenReturn(ProductImageState.initial());
        when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
        resetMocktailState();
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
            BlocProvider<CartBloc>(
              create: (context) => cartBlocMock,
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
            BlocProvider<CustomerLicenseBloc>(
              create: (context) => customerLicenseBlocMock,
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
          expect(find.byKey(WidgetKeys.materialListLoader), findsOneWidget);
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

          expect(find.byKey(WidgetKeys.materialListLoader), findsNothing);
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

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          await tester.fling(
            find.byKey(WidgetKeys.scrollList),
            const Offset(0.0, -5000.0),
            800.0,
          );
          verify(
            () => materialListBlocMock.add(
              const MaterialListEvent.loadMore(),
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

          when(
            () => autoRouterMock.push(
              ProductDetailsPageRoute(materialInfo: MaterialInfo.empty()),
            ),
          ).thenAnswer((invocation) => Future(() => null));
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          await tester.tap(find.byType(MaterialGridItem).first);
          await tester.pumpAndSettle();
          verify(
            () => autoRouterMock.push(
              ProductDetailsPageRoute(materialInfo: MaterialInfo.empty()),
            ),
          ).called(1);
        },
      );

      testWidgets(
          'Show material combination code with GMC part when Government material code is enabled',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTWSalesOrgConfigs,
          ),
        );
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: materialResponseMock.products,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final materialInfo = materialResponseMock.products.first;
        final combinationCode = find.text(
          '${materialInfo.materialNumber.displayMatNo} | ${materialInfo.data.first.governmentMaterialCode.getOrDefaultValue('')}',
        );
        expect(combinationCode, findsOneWidget);
      });

      testWidgets(
          'Show material combination code without GMC part when Government material code is disabled',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: materialResponseMock.products,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final materialInfo = materialResponseMock.products.first;
        final materialNumber =
            find.text(materialInfo.materialNumber.displayMatNo);
        expect(materialNumber, findsOneWidget);
        final combinationCode = find.text(
          '${materialInfo.materialNumber.displayMatNo} | ${materialInfo.data.first.governmentMaterialCode}',
        );
        expect(combinationCode, findsNothing);
      });

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
          when(
            () => autoRouterMock.push(
              BundleDetailPageRoute(
                materialInfo: materialResponseMock.products[12],
              ),
            ),
          ).thenAnswer((invocation) async => true);
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          final bundleFinder =
              find.byKey(WidgetKeys.materialListBundleCard).first;
          await tester.tap(bundleFinder);
          await tester.pumpAndSettle();

          verify(
            () => autoRouterMock.push(
              BundleDetailPageRoute(
                materialInfo: materialResponseMock.products[12],
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        '=> Test MP bundle item',
        (tester) async {
          final bundle = materialResponseMock.products
              .firstWhere((e) => e.type.typeBundle && e.isMarketPlace);
          when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial().copyWith(materialList: [bundle]),
          );

          when(
            () => autoRouterMock
                .push(BundleDetailPageRoute(materialInfo: bundle)),
          ).thenAnswer((_) async => true);
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          final bundleFinder = find.byKey(WidgetKeys.materialListBundleCard);
          expect(
            find.descendant(
              of: bundleFinder,
              matching: find.byType(MarketPlaceLogo),
            ),
            findsOne,
          );
          expect(
            find.descendant(
              of: bundleFinder,
              matching: find.text('Sold by: ${bundle.manufactured}'),
            ),
            findsOne,
          );
          await tester.tap(bundleFinder);
          await tester.pumpAndSettle();

          verify(
            () => autoRouterMock
                .push(BundleDetailPageRoute(materialInfo: bundle)),
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
              salesOrganisation: fakeSalesOrganisation,
              salesOrgConfigs: fakeKHSalesOrgConfigs,
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
                ),
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
          CartState.initial().copyWith(
            cartProducts: mockCartItems
                .map(
                  (e) => e.copyWith(
                    materialInfo: e.materialInfo.copyWith(
                      type: MaterialInfoType('material'),
                    ),
                  ),
                )
                .toList(),
          ),
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
      testWidgets('Test the Covid filter button', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakePHSalesOrganisation,
            salesOrgConfigs: fakePHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfoForCovid,
            user: fakeClientAdmin,
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
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                hasAccessToCovidMaterial: true,
                isCovidSelected: true,
              ),
            ),
          ),
        ).called(1);
        verify(
          () => materialFilterBlocMock.add(
            const MaterialFilterEvent.updateSelectedMaterialFilter(
              MaterialFilterType.isCovidSelected,
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
            salesOrgConfigs: fakePHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfoForCovid,
            user: fakeClientAdmin,
          ),
        );
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: [
              materialResponseMock.products.first.copyWith(
                type: MaterialInfoType('material'),
                isFOCMaterial: true,
              ),
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
        ' -> Find Account Suspended Banner when Customer Code is blocked',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeBlockedCustomerCodeInfo,
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
        ' -> Find Account Suspended Banner when ship to Code is blocked',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              shipToInfo: fakeBlockedShipToInfo,
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
        '=> Test full bundle code displayed ',
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
          expect(bundleFinder, findsOneWidget);
          expect(
            find.text(materialResponseMock.products[12].bundle.bundleCode),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Find default material description if material description has whitespace characters',
        (tester) async {
          when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial().copyWith(
              materialList: [
                materialResponseMock.products.first.copyWith(
                  materialDescription: '',
                  data: [
                    MaterialData.empty().copyWith(
                      defaultMaterialDescription: 'fake-default-description',
                      materialDescription: StringValue('        '),
                    ),
                  ],
                ),
              ],
            ),
          );

          await tester.pumpWidget(getScopedWidget());

          await tester.pumpAndSettle();
          final defaultDescription = find.text('fake-default-description');
          expect(defaultDescription, findsOneWidget);
        },
      );
      testWidgets('Ships To Code AccountSuspendedBanner ', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());

        await tester.pump();
        final accountSuspendedBanner = find.byKey(
          WidgetKeys.customerBlockedBanner,
        );
        expect(accountSuspendedBanner, findsOneWidget);

        expect(
          find.descendant(
            of: accountSuspendedBanner,
            matching: find.text(
              'Your account is blocked.'.tr(),
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: accountSuspendedBanner,
            matching: find.text(
              'To continue using eZRx+, please contact your system administrator.'
                  .tr(),
            ),
          ),
          findsOneWidget,
        );
      });
      testWidgets(
        '=> Test SearchAndFilter',
        (tester) async {
          when(() => materialFilterBlocMock.state).thenReturn(
            MaterialFilterState.initial().copyWith.materialFilter(
                  bundleOffers: true,
                ),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byType(SearchAndFilter), findsOneWidget);
          final filterProductBtn = find.byKey(WidgetKeys.filterProductIcon);
          await tester.tap(filterProductBtn);
          await tester.pumpAndSettle();
          final applyBtn = find.byKey(WidgetKeys.filterApplyButton);
          expect(applyBtn, findsOneWidget);
          await tester.tap(applyBtn);
          await tester.pumpAndSettle();
          verify(
            () => materialListBlocMock.add(
              MaterialListEvent.fetch(
                selectedMaterialFilter: MaterialFilter.empty().copyWith(
                  bundleOffers: true,
                ),
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        ' -> Find edi if customer info status is edi',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeEDICustomerCodeInfo,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
          final ediBannerTitle = find.text('You are an EDI customer.');
          final ediBannerSubTitle = find.text(
            'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
          );
          expect(ediBanner, findsOneWidget);
          expect(ediBannerTitle, findsOneWidget);
          expect(ediBannerSubTitle, findsOneWidget);
        },
      );

      testWidgets(
        ' -> Not Find edi if customer info status is not edi',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final ediBanner = find.byKey(WidgetKeys.ediUserBanner);
          final ediBannerTitle = find.text('You are an EDI customer.');
          final ediBannerSubTitle = find.text(
            'Ordering is disabled on eZRx+, please place your orders through the EDI system only.',
          );
          expect(ediBanner, findsNothing);
          expect(ediBannerTitle, findsNothing);
          expect(ediBannerSubTitle, findsNothing);
        },
      );

      testWidgets(
        ' -> Find License expired banner in products tab',
        (WidgetTester tester) async {
          when(
            () => autoRouterMock.push(const ProfilePageRoute()),
          ).thenAnswer((invocation) => Future(() => null));
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            ),
          );

          when(() => customerLicenseBlocMock.state).thenReturn(
            CustomerLicenseState.initial().copyWith(
              customerLicenses: customerLicense,
              salesOrganization: fakeIDSalesOrganisation,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final licenseExpiredBanner =
              find.byKey(WidgetKeys.licenseExpiredBanner);
          final viewLicenseButton = find.byKey(WidgetKeys.viewLicenseButton);
          final licenseExpiredBannerTitle = find.text(
            'You have licenses that are about to expire or has expired.',
          );
          final licenseExpiredBannerSubTitle = find.text(
            'To continue using eZRx+, please renew your license.',
          );

          expect(licenseExpiredBanner, findsOneWidget);
          expect(licenseExpiredBannerTitle, findsOneWidget);
          expect(licenseExpiredBannerSubTitle, findsOneWidget);

          await tester.tap(viewLicenseButton);

          verify(
            () => autoRouterMock.push(const ProfilePageRoute()),
          ).called(1);

          await tester.pumpAndSettle();
        },
      );

      testWidgets(
        ' -> License expired banner not visible in home tab',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            ),
          );

          when(() => customerLicenseBlocMock.state).thenReturn(
            CustomerLicenseState.initial().copyWith(customerLicenses: []),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final licenseExpiredBanner =
              find.byKey(WidgetKeys.licenseExpiredBanner);
          final licenseExpiredBannerTitle = find.text(
            'You have licenses that are about to expire or has expired.',
          );
          final licenseExpiredBannerSubTitle = find.text(
            'To continue using eZRx+, please renew your license.',
          );

          expect(licenseExpiredBanner, findsNothing);
          expect(licenseExpiredBannerTitle, findsNothing);
          expect(licenseExpiredBannerSubTitle, findsNothing);
        },
      );
    },
  );
}
