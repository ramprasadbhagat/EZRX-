import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/product_offer_section/product_offer_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class ProductDetailBlocMock
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

class ClevertapServiceMock extends Mock implements ClevertapService {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  late GetIt locator;
  late EligibilityBloc eligibilityBlocMock;
  late MaterialListBloc materialListBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ProductImageBloc productImageBlocMock;
  late ProductDetailBloc productDetailBlocMock;
  late CartBloc cartBloc;
  late List<MaterialInfo> fakeMaterialList;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    locator = GetIt.instance;
    locator.registerLazySingleton(() => MockAppRouter());
    locator.registerLazySingleton(() => eligibilityBlocMock);
    locator.registerLazySingleton(() => materialListBlocMock);
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator
        .registerLazySingleton<ClevertapService>(() => ClevertapServiceMock());
    autoRouterMock = locator<MockAppRouter>();
    eligibilityBlocMock = EligibilityBlocMock();
    materialListBlocMock = MaterialListBlocMock();
    materialPriceBlocMock = MaterialPriceBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    productDetailBlocMock = ProductDetailBlocMock();
    cartBloc = CartBlocMock();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    fakeMaterialList =
        (await MaterialListLocalDataSource().getProductList()).products;
  });

  group('ProductsOnOffer Screen', () {
    setUp(() {
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => productImageBlocMock.state)
          .thenReturn(ProductImageState.initial());
      when(() => productDetailBlocMock.state)
          .thenReturn(ProductDetailState.initial());
      when(() => cartBloc.state).thenReturn(CartState.initial());
      resetMocktailState();
    });
    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        routeName: HomeNavigationTabbarRoute.name,
        providers: [
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<MaterialListBloc>(
            create: (context) => materialListBlocMock,
          ),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<ProductDetailBloc>(
            create: (context) => productDetailBlocMock,
          ),
          BlocProvider<CartBloc>(
            create: (context) => cartBloc,
          ),
        ],
        child: const Scaffold(body: ProductsOnOffer()),
      );
    }

    testWidgets('ProductsOnOffer test - click ProductOnOffer', (tester) async {
      final materialListBloc = locator<MaterialListBloc>();
      final materialExpectState = [
        MaterialListState.initial().copyWith(
          materialCount: 2,
          materialList: <MaterialInfo>[
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('bundle-material-1'),
            ),
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('bundle-material-2'),
            ),
          ],
          canLoadMore: true,
          isFetching: false,
        ),
      ];
      whenListen(
        materialListBlocMock,
        Stream.fromIterable(materialExpectState),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      verify(
        () => materialListBloc.add(
          MaterialListEvent.initialized(
            salesOrganisation: SalesOrganisation.empty(),
            configs: eligibilityBlocMock.state.salesOrgConfigs,
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              bundleOffers: false,
              isProductOffer: true,
            ),
            user: fakeClientUser,
          ),
        ),
      ).called(2);
    });
    testWidgets('ProductsOnOffer test - when Salesorg  changed - Success',
        (tester) async {
      final expectedState = [
        EligibilityState.initial(),
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeClientUser,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
        ),
      ];
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      verify(
        () => materialListBlocMock.add(
          MaterialListEvent.initialized(
            shipToInfo: fakeShipToInfo,
            configs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
            user: fakeClientUser,
            customerCodeInfo: fakeCustomerCodeInfo,
            selectedMaterialFilter:
                MaterialFilter.empty().copyWith(isProductOffer: true),
          ),
        ),
      ).called(1);
    });

    testWidgets(
      'ProductsOnOffer test - listen when EligibilityState finish loading',
      (tester) async {
        final expectedState = [
          EligibilityState.initial().copyWith(
            isLoadingCustomerCode: true,
          ),
          EligibilityState.initial().copyWith(
            user: fakeClientUser,
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          ),
        ];
        whenListen(
          eligibilityBlocMock,
          Stream.fromIterable(expectedState),
        );
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();
        verify(
          () => materialListBlocMock.add(
            MaterialListEvent.initialized(
              salesOrganisation: fakeSalesOrganisation,
              configs: fakeMYSalesOrgConfigs,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                isProductOffer: true,
              ),
              user: fakeClientUser,
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      'ProductsOnOffer test - listen when MaterialListState load next page failure',
      (tester) async {
        final expectedState = [
          MaterialListState.initial().copyWith(
            nextPageIndex: 1,
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ];
        whenListen(
          materialListBlocMock,
          Stream.fromIterable(expectedState),
        );
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
      },
    );

    testWidgets(
      'ProductsOnOffer test - listen when MaterialListState load next page success',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(),
        );
        final expectedState = [
          MaterialListState.initial().copyWith(
            nextPageIndex: 1,
            apiFailureOrSuccessOption: optionOf(
              const Right(''),
            ),
            materialList: fakeMaterialList,
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              isProductOffer: true,
            ),
          ),
        ];
        whenListen(
          materialListBlocMock,
          Stream.fromIterable(expectedState),
        );
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();
        verify(
          () => materialPriceBlocMock.add(
            MaterialPriceEvent.fetch(
              comboDealEligible: false,
              materials: fakeMaterialList,
            ),
          ),
        ).called(1);
        verify(
          () => productImageBlocMock.add(
            ProductImageEvent.fetch(
              list: fakeMaterialList,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'ProductsOnOffer test - Material List is Fetching',
      (tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            isFetching: true,
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.productOfferSectionLoaderImage),
          findsOneWidget,
        );
        expect(find.byKey(WidgetKeys.productsOnOffer), findsOneWidget);
        final iconTileFinder = find.byKey(
          WidgetKeys.sectionTileIcon(
            'Products on offer'.tr(),
          ),
        );
        await tester.tap(iconTileFinder);
        verifyNever(
          () => materialListBlocMock.add(
            MaterialListEvent.initialized(
              salesOrganisation: fakeSalesOrganisation,
              configs: fakeMYSalesOrgConfigs,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                isProductOffer: true,
              ),
              user: fakeClientUser,
            ),
          ),
        );
        verifyNever(
          () => autoRouterMock.navigate(const ProductsTabRoute()),
        );
      },
    );

    testWidgets(
      'ProductsOnOffer test - Material List Not Empty',
      (tester) async {
        when(() => autoRouterMock.navigate(const ProductsTabRoute()))
            .thenAnswer(
          (_) => Future.value(),
        );
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: fakeMaterialList,
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClientUser,
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.productOfferSectionLoaderImage),
          findsNothing,
        );
        expect(find.byKey(WidgetKeys.productsOnOffer), findsOneWidget);
        final iconTileFinder = find.byKey(
          WidgetKeys.sectionTileIcon(
            'Products on offer'.tr(),
          ),
        );
        await tester.tap(iconTileFinder);
        verify(
          () => materialListBlocMock.add(
            MaterialListEvent.initialized(
              salesOrganisation: fakeSalesOrganisation,
              configs: fakeMYSalesOrgConfigs,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                isProductOffer: true,
              ),
              user: fakeClientUser,
            ),
          ),
        ).called(1);
        verify(
          () => autoRouterMock.navigate(const ProductsTabRoute()),
        ).called(1);
      },
    );

    testWidgets(
      'ProductsOnOffer test - Material List is Empty',
      (tester) async {
        when(() => autoRouterMock.navigate(const ProductsTabRoute()))
            .thenAnswer(
          (_) => Future.value(),
        );
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: [],
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.productOfferSectionLoaderImage),
          findsNothing,
        );
        expect(find.byKey(WidgetKeys.productsOnOffer), findsNothing);
      },
    );

    testWidgets(
      'ProductsOnOffer test - Tap on Tile',
      (tester) async {
        when(() => autoRouterMock.currentPath).thenReturn(
          '',
        );
        when(
          () => autoRouterMock.push(
            ProductDetailsPageRoute(materialInfo: fakeMaterialList.first),
          ),
        ).thenAnswer(
          (_) => Future.value(),
        );
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: fakeMaterialList,
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final tileFinder = find.byKey(WidgetKeys.productOnOffer);
        await tester.tap(tileFinder.first);

        verify(
          () => autoRouterMock.push(
            ProductDetailsPageRoute(materialInfo: fakeMaterialList.first),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'ProductsOnOffer test - Price Label',
      (tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: fakeMaterialList,
          ),
        );
        when(() => materialPriceBlocMock.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {
              fakeMaterialList.first.materialNumber: Price.empty(),
            },
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();
        final tileFinder = find.byKey(WidgetKeys.productOnOffer);
        final priceComponentFinder = find.descendant(
          of: tileFinder.first,
          matching: find.byType(ProductPriceLabel),
        );
        expect(priceComponentFinder, findsOneWidget);
      },
    );

    testWidgets(
      'ProductsOnOffer test - Price Label Fetching',
      (tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: fakeMaterialList,
          ),
        );
        when(() => materialPriceBlocMock.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: true,
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final tileFinder = find.byKey(WidgetKeys.productOnOffer);
        final priceComponentFinder = find.descendant(
          of: tileFinder.first,
          matching: find.byKey(WidgetKeys.priceLoading),
        );
        expect(priceComponentFinder, findsOneWidget);
      },
    );

    testWidgets(
      'ProductsOnOffer test - Tap on FavIcon',
      (tester) async {
        final fakeFavList = [
          MaterialInfo.empty().copyWith(
            isFavourite: false,
            materialNumber: MaterialNumber('1234'),
          ),
        ];

        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: fakeFavList,
          ),
        );

        final expectedState = [
          MaterialListState.initial().copyWith(
            materialList: [fakeFavList.first.copyWith(isFavourite: true)],
          ),
        ];
        whenListen(
          materialListBlocMock,
          Stream.fromIterable(expectedState),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        final isFavFalse = find.byKey(WidgetKeys.statusFavoriteIcon(false));
        expect(
          isFavFalse,
          findsOneWidget,
        );

        final favIconFinder = find.byType(FavouriteIcon);
        await tester.tap(favIconFinder);
        verify(
          () => materialListBlocMock.add(
            MaterialListEvent.addFavourite(
              item: fakeFavList.first,
            ),
          ),
        ).called(1);
        await tester.pumpAndSettle();

        final isFavTrue = find.byKey(WidgetKeys.statusFavoriteIcon(true));
        expect(
          isFavTrue,
          findsOneWidget,
        );
      },
    );

    testWidgets('PreOrder Label', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          materialList: fakeMaterialList,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.productOnOffer),
        findsWidgets,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.productOnOffer).first,
          matching: find.byType(PreOrderLabel),
        ),
        findsOneWidget,
      );
    });
  });
}
