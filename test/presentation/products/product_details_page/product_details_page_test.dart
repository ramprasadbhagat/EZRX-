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
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

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

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    registerFallbackValue(CustomerCodeInfo.empty());
    registerFallbackValue(SalesOrganisation.empty());
    registerFallbackValue(ShipToInfo.empty());
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
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
    },
  );
}
