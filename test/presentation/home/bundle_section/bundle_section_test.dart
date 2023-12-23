import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/bundle_section/bundle_section.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
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

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class MockAppRouter extends Mock implements AppRouter {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ProductDetailBlocMock
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

void main() {
  late MaterialListBlocMock materialListBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ProductDetailBloc productDetailBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late List<MaterialInfo> materialList;
  final routeData = RouteData(
    route: const RouteMatch(
      name: 'HomeTabRoute',
      segments: [],
      path: 'home',
      stringMatch: 'home',
      key: ValueKey('HomeTabRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );
  final fakeMaterialData = MaterialData(
    materialNumber: MaterialNumber('1234'),
    manufactured: 'manufactured',
    materialDescription: 'materialDescription',
    defaultMaterialDescription: 'defaultMaterialDescription',
    genericMaterialName: '1234567',
    governmentMaterialCode: '1234567',
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    registerFallbackValue(const PageRouteInfo('HomeTabRoute', path: 'home'));
    locator.registerSingleton<MixpanelService>(MockMixpanelService());
    locator.registerFactory<MaterialListBloc>(() => materialListBlocMock);
    locator.registerLazySingleton(() => PackageInfoService());
    materialList = await MaterialListLocalDataSource().getMaterialList();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    autoRouterMock = MockAppRouter();
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
      ' -> Find Bundle Section body test',
      (WidgetTester tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: materialList,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final bundlesFinder = find.byKey(WidgetKeys.bundlesBody);
        expect(bundlesFinder, findsOneWidget);
        final bundlesIconFinder = find.byKey(WidgetKeys.bundles);
        expect(bundlesIconFinder, findsOneWidget);
        final bundlesListFinder = find.byKey(
          WidgetKeys.bundlesList,
        );
        expect(bundlesListFinder, findsOneWidget);
        final bundlesListItemFinder = find.byKey(
          WidgetKeys.bundlesListItem,
        );
        expect(bundlesListItemFinder, findsWidgets);
      },
    );
    testWidgets(
      ' -> Find Bundle Section body test for id market',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeSalesOrgConfigWithdisableBundles,
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
          WidgetKeys.bundlesListItem,
        );
        expect(bundlesListItemFinder, findsNothing);
      },
    );

    testWidgets(
      ' -> Tap Bundle Section Icon test',
      (WidgetTester tester) async {
        when(() => autoRouterMock.navigate(any()))
            .thenAnswer((_) async => true);
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSalesOrganisationConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: materialList,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final bundlesIconFinder = find.byKey(WidgetKeys.bundles);
        expect(bundlesIconFinder, findsOneWidget);
        final bundlesIcon =
            find.byKey(WidgetKeys.sectionTileIcon('Bundles'.tr()));
        expect(bundlesIcon, findsOneWidget);
        await tester.tap(bundlesIcon);
        await tester.pump();
        verify(
          () => materialListBlocMock.add(
            MaterialListEvent.fetch(
              configs: fakeSalesOrganisationConfigs,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeSalesOrganisation,
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                bundleOffers: true,
                isProductOffer: true,
              ),
              shipToInfo: fakeShipToInfo,
            ),
          ),
        ).called(1);
        verify(() => autoRouterMock.navigate(const ProductsTabRoute()))
            .called(1);
      },
    );

    testWidgets(
      ' -> Tap Bundle Section List item test',
      (WidgetTester tester) async {
        when(() => autoRouterMock.pushNamed(any()))
            .thenAnswer((invocation) async => true);

        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: materialList,
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
          WidgetKeys.bundlesListItem,
        );
        expect(bundlesListItemFinder, findsWidgets);
        await tester.tap(bundlesListItemFinder.first);
        await tester.pump();
        verify(
          () => productDetailBlocMock.add(
            ProductDetailEvent.fetch(
              materialInfo: materialList.first,
            ),
          ),
        ).called(1);
        verify(() => autoRouterMock.pushNamed('orders/bundle_detail_page'))
            .called(1);
        verify(
          () => trackMixpanelEvent(
            MixpanelEvents.productItemClicked,
            props: {
              MixpanelProps.clickAt: RouterUtils.buildRouteTrackingName(
                autoRouterMock.currentPath,
              ),
              MixpanelProps.isBundle: true,
              MixpanelProps.productName: materialList.first.displayDescription,
              MixpanelProps.productCode:
                  materialList.first.materialNumber.displayMatNo,
              MixpanelProps.productManufacturer:
                  materialList.first.getManufactured,
              MixpanelProps.section: 'Bundles',
            },
          ),
        ).called(1);
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
              )
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
          WidgetKeys.bundlesListItem,
        );
        expect(bundlesListItemFinder, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find Bundle Name Inside Bundle Section',
      (WidgetTester tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: [
              materialList.first.copyWith(
                bundle: Bundle.empty().copyWith(
                  bundleName: BundleName('fake-name'),
                ),
              )
            ],
          ),
        );

        await getWidget(tester);
        await tester.pump();

        final bundleBody = find.byKey(WidgetKeys.bundlesBody);
        expect(bundleBody, findsOneWidget);
        final bundleName = find.text('fake-name');
        expect(bundleName, findsOneWidget);
      },
    );
  });
}
