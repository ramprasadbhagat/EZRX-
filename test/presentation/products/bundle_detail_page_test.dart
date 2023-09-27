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
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/bundle_detail_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

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

class MixpanelMock extends Mock implements Mixpanel {}

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
  late MaterialInfo bundle;

  //////////////////////Finder//////////////////////////////////////////////////
  final bundleImage = find.byKey(
    WidgetKeys.bundleImage,
  );
  final bundleDetailsCarousel = find.byKey(WidgetKeys.bundleDetailsCarousel);
  final materialDetailsImageCounterFinder =
      find.byKey(WidgetKeys.materialDetailsImageCounter);
  /////////////////////////////////////////////////////////////////////////////

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );

    bundle = MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('fake-bundle'),
      type: MaterialInfoType('bundle'),
      bundle: Bundle.empty().copyWith(
        materials: <MaterialInfo>[
          MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('bundle-material-1'),
          ),
          MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('bundle-material-2'),
          ),
        ],
        bundleInformation: [
          BundleInfo.empty().copyWith(
            quantity: 1,
            rate: 20,
          ),
        ],
      ),
    );
  });

  group(
    'Bundle Details Page',
    () {
      setUp(() {
        customerCodeBlocMock = CustomerCodeBlocMock();
        cartMockBloc = CartMockBloc();
        eligibilityBlocMock = EligibilityBlocMock();
        autoRouterMock = MockAppRouter();

        when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(),
        );
        when(() => customerCodeBlocMock.state)
            .thenReturn(CustomerCodeState.initial());
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(),
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
        when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
      });

      Widget getScopedWidget() {
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
          ],
          child: const BundleDetailPage(),
        );
      }

      testWidgets('Bundle is Empty Image  not available', (tester) async {
        final expectedStates = Stream.fromIterable(
          [
            ProductDetailState.initial().copyWith(
              isFetching: true,
              productDetailAggregate: ProductDetailAggregate.empty(),
            ),
            ProductDetailState.initial().copyWith(
              isFetching: false,
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  type: MaterialInfoType('bundle'),
                ),
              ),
            ),
          ],
        );

        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(bundleImage, findsOneWidget);
        expect(bundleDetailsCarousel, findsNothing);
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
                materialInfo: bundle,
              ),
            ),
          ],
        );
        when(() => mockProductImageBloc.state).thenReturn(
          ProductImageState.initial().copyWith(
            productImageMap: <MaterialNumber, ProductImages>{
              for (var material in bundle.bundle.materials)
                material.materialNumber: ProductImages.empty()
                    .copyWith(materialNumber: material.materialNumber)
            },
          ),
        );
        whenListen(productDetailMockBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(bundleImage, findsOneWidget);
        expect(bundleDetailsCarousel, findsOneWidget);
        expect(materialDetailsImageCounterFinder, findsOneWidget);
        final selectedCarouselImageKeyFinder =
            find.byKey(const ValueKey('selectedbundle-material-1true'));
        expect(selectedCarouselImageKeyFinder, findsOneWidget);
      });

      testWidgets('Wrong currency visible in bundle details page',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              currency: Currency('SGD'),
            ),
          ),
        );

        when(() => productDetailMockBloc.state).thenReturn(
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: bundle,
            ),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final price = find.text('SGD 20.00 per item', findRichText: true);
        expect(price, findsOneWidget);
      });
    },
  );
}
