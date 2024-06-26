import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/bundle_section/bundle_section.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late MaterialListBlocMock materialListBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ProductDetailBloc productDetailBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late MaterialResponse materialResponseMock;
  final routeData = RouteData(
    route: const RouteMatch(
      name: 'HomeTabRoute',
      segments: [],
      path: 'home',
      stringMatch: 'home',
      key: ValueKey('HomeTabRoute'),
    ),
    router: AutoRouteMock(),
    pendingChildren: [],
  );
  final fakeMaterialData = MaterialData(
    materialNumber: MaterialNumber('1234'),
    manufactured: 'manufactured',
    materialDescription: StringValue('materialDescription'),
    defaultMaterialDescription: 'defaultMaterialDescription',
    genericMaterialName: '1234567',
    governmentMaterialCode: StringValue('1234567'),
    isMarketPlace: false,
    itemRegistrationNumber: ItemRegistrationNumber(''),
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    registerFallbackValue(const PageRouteInfo('HomeTabRoute', path: 'home'));
    locator.registerSingleton<MixpanelService>(MixpanelServiceMock());
    locator.registerSingleton<ClevertapService>(ClevertapServiceMock());
    locator.registerFactory<MaterialListBloc>(() => materialListBlocMock);
    locator.registerLazySingleton(() => PackageInfoService());
    materialResponseMock = await MaterialListLocalDataSource().getProductList();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    autoRouterMock = AutoRouteMock();
    productDetailBlocMock = ProductDetailBlocMock();
    when(() => autoRouterMock.currentPath).thenReturn('home');
    when(() => autoRouterMock.current).thenReturn(routeData);
    materialListBlocMock = MaterialListBlocMock();
    when(() => materialListBlocMock.state)
        .thenReturn(MaterialListState.initial());
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => productDetailBlocMock.state)
        .thenReturn(ProductDetailState.initial());
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
          BlocProvider<ProductDetailBloc>(
            create: (context) => productDetailBlocMock,
          ),
        ],
        child: const Scaffold(body: BundleSection()),
      ),
    );
  }

  group('Bundle Section Test', () {
    testWidgets(
      ' -> Find Bundle Section',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final bundleSectionFinder = find.byType(BundleSection);
        expect(bundleSectionFinder, findsOneWidget);
      },
    );
    testWidgets(
      ' -> Find Bundle Section body loading test',
      (tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            isFetching: true,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final bundleSectionLoaderImageFinder =
            find.byKey(WidgetKeys.bundleSectionLoaderImage);
        expect(bundleSectionLoaderImageFinder, findsOneWidget);
      },
    );
    testWidgets(
      ' -> Find Bundle Section body test for id market',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final bundlesFinder = find.byKey(WidgetKeys.bundlesBody);
        expect(bundlesFinder, findsNothing);
        final bundlesIconFinder = find.byKey(WidgetKeys.bundles);
        expect(bundlesIconFinder, findsNothing);
        final bundlesListFinder = find.byKey(
          WidgetKeys.bundlesList,
        );
        expect(bundlesListFinder, findsNothing);
        final bundlesListItemFinder = find.byKey(
          WidgetKeys.materialListBundleCard,
        );
        expect(bundlesListItemFinder, findsNothing);
      },
    );

    testWidgets(
      ' -> Bundle Section List item test regarding material data',
      (WidgetTester tester) async {
        when(() => autoRouterMock.pushNamed(any()))
            .thenAnswer((invocation) async => true);
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: [
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('1234'),
                data: [
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                ],
              ),
            ],
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final bundlesFinder = find.byKey(WidgetKeys.bundlesBody);
        expect(bundlesFinder, findsOneWidget);
        final bundlesListFinder = find.byKey(
          WidgetKeys.bundlesList,
        );
        expect(bundlesListFinder, findsOneWidget);
        final bundlesListItemFinder = find.byKey(
          WidgetKeys.materialListBundleCard,
        );
        expect(bundlesListItemFinder, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find Bundle Code Inside Bundle Section',
      (WidgetTester tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: [materialResponseMock.products[1]],
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final bundleCode = find.text(
          materialResponseMock.products[1].bundle.bundleCode,
        );
        expect(bundleCode, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find marketplace icon & sellername in marketplace bundle',
      (WidgetTester tester) async {
        final bundle = materialResponseMock.products
            .firstWhere((e) => e.type.typeBundle && e.isMarketPlace);
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(materialList: [bundle]),
        );

        await getWidget(tester);
        await tester.pump();
        expect(find.byType(MarketPlaceLogo), findsOneWidget);
        expect(find.text('Sold by: ${bundle.manufactured}'), findsOne);
      },
    );

    testWidgets(
      ' -> Bundle Section List item test regarding material count',
      (WidgetTester tester) async {
        when(() => autoRouterMock.pushNamed(any()))
            .thenAnswer((invocation) async => true);
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: [
              MaterialInfo.empty().copyWith(
                type: MaterialInfoType.bundle(),
                bundle: Bundle.empty().copyWith(
                  bundleCode: '1234',
                ),
                data: [
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                  fakeMaterialData,
                ],
              ),
            ],
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final bundleMaterialCount =
            find.byKey(WidgetKeys.bundleMaterialCount('1234'));
        expect(bundleMaterialCount, findsOneWidget);

        expect(find.text('+ 6 materials'), findsOneWidget);
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
