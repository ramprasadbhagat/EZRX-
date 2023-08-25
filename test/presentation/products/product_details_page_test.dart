import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
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

class ProductImageMockBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

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
  late MaterialPriceBloc materialPriceBlocMock;
  final mockProductImageBloc = ProductImageMockBloc();
  late Map<MaterialNumber, Price> mockPriceList;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
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
          ],
          child: const Scaffold(
            body: ProductDetailsPage(),
          ),
        ),
      );
    }

    testWidgets(
      ' Add To cart button disable test when order toggle is disable ',
      (tester) async {
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              username: Username('fakeUser'),
              role: Role(
                type: RoleType('client_user'),
                description: '',
                id: '',
                name: '',
              ),
              disableCreateOrder: true,
              accessRight: AccessRight.empty().copyWith(
                orders: true,
              ),
            ),
          ),
        );
        when(() => productDetailBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            isFetching: false,
          ),
        );
        when(() => mockCartBloc.state).thenReturn(
          CartState.initial().copyWith(
            isUpserting: false,
          ),
        );
        when(() => materialPriceBlocMock.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: mockPriceList,
          ),
        );
        when(() => mockSalesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final addToCartButton =
            find.widgetWithText(ElevatedButton, 'Add To Cart');

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
  });
}
