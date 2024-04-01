import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/combo_offers_product.dart';
import 'package:ezrxmobile/presentation/products/widgets/combo_offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ProductDetailMockBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CartMocBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class CustomerLicenseBlocMock
    extends MockBloc<CustomerLicenseEvent, CustomerLicenseState>
    implements CustomerLicenseBloc {}

class ProductImageMockBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ComboDealListMockBloc
    extends MockBloc<ComboDealListEvent, ComboDealListState>
    implements ComboDealListBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  final mockSalesOrgBloc = SalesOrgMockBloc();
  late EligibilityBloc eligibilityBlocMock;
  late ProductDetailBloc productDetailBloc;
  final mockCartBloc = CartMocBloc();
  late CustomerLicenseBloc customerLicenseBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  final mockProductImageBloc = ProductImageMockBloc();
  late Map<MaterialNumber, Price> mockPriceList;
  final comboDealListMockBloc = ComboDealListMockBloc();

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory<ProductDetailBloc>(() => productDetailBloc);
    // locator.registerFactory<ProductDetailEvent>(() => productDetailBloc);
  });
  group('ProductDetail page', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      autoRouterMock = locator<AppRouter>();
      productDetailBloc = ProductDetailMockBloc();
      customerCodeBlocMock = CustomerCodeBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      customerLicenseBlocMock = CustomerLicenseBlocMock();
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => productDetailBloc.state)
          .thenReturn(ProductDetailState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockCartBloc.state).thenReturn(CartState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => comboDealListMockBloc.state)
          .thenReturn(ComboDealListState.initial());
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());

      mockPriceList = {};
      mockPriceList.putIfAbsent(
        MaterialNumber('000000000023168451'),
        () => Price.empty().copyWith(
          finalPrice: MaterialPrice(4.5),
        ),
      );
    });
    Widget getScopedWidget() {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
            BlocProvider<ProductDetailBloc>(
              create: (context) => productDetailBloc,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<CartBloc>(create: (context) => mockCartBloc),
            BlocProvider<MaterialPriceBloc>(
              create: ((context) => materialPriceBlocMock),
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => mockProductImageBloc,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
            BlocProvider<ComboDealListBloc>(
              create: (context) => comboDealListMockBloc,
            ),
            BlocProvider<CustomerLicenseBloc>(
              create: (context) => customerLicenseBlocMock,
            ),
          ],
          child: Scaffold(
            body: ProductDetailsPage(materialInfo: MaterialInfo.empty()),
          ),
        ),
      );
    }

    testWidgets(
      ' Add To cart button disable test when order toggle is disable ',
      (tester) async {
        when(() => materialPriceBlocMock.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: mockPriceList,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final addToCartButton =
            find.widgetWithText(ElevatedButton, 'Add to cart');

        expect(
          addToCartButton,
          findsOneWidget,
        );
        await tester.pump();
        expect(
          (tester.widget(addToCartButton) as ElevatedButton).enabled,
          false,
        );
      },
    );

    testWidgets(
      ' Product details page offer tag',
      (tester) async {
        when(() => productDetailBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material'),
              ),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final offerLabel = find.byType(OfferLabel);

        expect(
          offerLabel,
          findsOneWidget,
        );
      },
    );

    testWidgets(
      ' Product details page combo offer tag',
      (tester) async {
        when(() => productDetailBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material'),
              ),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final offerLabel = find.byType(ComboOfferLabel);

        expect(
          offerLabel,
          findsOneWidget,
        );
      },
    );

    testWidgets(
      ' Product details page get combo deal section',
      (tester) async {
        when(() => productDetailBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material'),
              ),
            ),
          ),
        );
        when(() => comboDealListMockBloc.state).thenReturn(
          ComboDealListState.initial().copyWith(
            comboDeals: {
              'fake-combo-deal-id': [
                ComboDeal.empty(),
              ],
            },
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final offerLabel = find.byType(ComboOffersProduct);

        expect(
          offerLabel,
          findsOneWidget,
        );
      },
    );
  });
}
