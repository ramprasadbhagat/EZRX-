import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/browse_products/browse_products.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class MockAppRouter extends Mock implements AppRouter {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class ProductDetailBlocMock
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

class ClevertapServiceMock extends Mock implements ClevertapService {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  late MaterialListBlocMock materialListBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late ProductDetailBloc productDetailBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late UserBlocMock userBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  final routeData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const [],
      stringMatch: 'home',
      config: AutoRoute(
        page: const PageInfo(HomeTabRoute.name),
      ),
      key: const ValueKey('HomeTabRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    registerFallbackValue(const PageRouteInfo('HomeTabRoute'));
    locator.registerSingleton<MixpanelService>(MockMixpanelService());
    locator.registerSingleton<ClevertapService>(ClevertapServiceMock());
    locator.registerFactory<MaterialListBloc>(() => materialListBlocMock);
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    autoRouterMock = MockAppRouter();
    materialPriceBlocMock = MaterialPriceBlocMock();
    productDetailBlocMock = ProductDetailBlocMock();
    materialListBlocMock = MaterialListBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    userBlocMock = UserBlocMock();
    when(() => autoRouterMock.currentPath).thenReturn('home');
    when(() => autoRouterMock.current).thenReturn(routeData);
    when(() => autoRouterMock.current).thenReturn(routeData);
    when(() => materialListBlocMock.state)
        .thenReturn(MaterialListState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
    when(() => materialPriceBlocMock.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => productDetailBlocMock.state)
        .thenReturn(ProductDetailState.initial());
    when(() => userBlocMock.state).thenReturn(
      UserState.initial(),
    );
  });

  Future getWidget(tester) async {
    return await tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<MaterialListBloc>(
            create: (context) => materialListBlocMock,
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
          BlocProvider<ProductDetailBloc>(
            create: (context) => productDetailBlocMock,
          ),
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
        ],
        child: const Scaffold(body: BrowseProduct()),
      ),
    );
  }

  group('Browse Product Test', () {
    testWidgets(
      ' -> Find Browse Product',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final browseProductFinder = find.byType(BrowseProduct);
        expect(browseProductFinder, findsOneWidget);
      },
    );
    testWidgets(
      ' -> Find Browse Product body loading test',
      (tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            isFetching: true,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final browseProductLoadingShimmerFinder =
            find.byKey(WidgetKeys.browseProductLoadingShimmer);
        expect(browseProductLoadingShimmerFinder, findsOneWidget);
      },
    );

    testWidgets(
      '-> Test error text visible when there is error from BE',
      (WidgetTester tester) async {
        whenListen(
          materialListBlocMock,
          Stream.fromIterable([
            MaterialListState.initial().copyWith(isFetching: true),
            MaterialListState.initial().copyWith(
              apiFailureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('fake-error'))),
            ),
          ]),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();
        final customSnackBar = find.byType(CustomSnackBar);
        final errorText = find.text('fake-error');
        expect(customSnackBar, findsOneWidget);
        expect(errorText, findsOneWidget);
      },
    );
  });
}
