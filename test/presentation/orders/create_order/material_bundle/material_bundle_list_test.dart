import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/bundle_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_bundle_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/material_frame_wrapper.dart';
import '../../../../utils/widget_utils.dart';

class MaterialBundleListBlocMock
    extends MockBloc<MaterialBundleListEvent, MaterialBundleListState>
    implements MaterialBundleListBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class MaterialPriceDetailMockBloc
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class EligibilityMockBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserBloc userBlocMock;
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  late SalesOrgBloc salesOrgBlocMock;
  late ShipToCodeBloc shipToCodeBLocMock;
  late List<BundleInfo> mockBundleInfoList;
  late EligibilityBloc eligibilityMockBloc;
  late CustomerCodeBloc customerCodeBlocMock;
  late List<BundleAggregate> mockBundleItems;
  late MaterialBundleListBloc materialBundleListBloc;
  late MaterialPriceDetailBloc materialPriceDetailMockBloc;

  setUpAll(() async {
    autoRouterMock = AppRouter();
    userBlocMock = UserBlocMock();
    authBlocMock = AuthBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    shipToCodeBLocMock = ShipToCodeBlocMock();
    eligibilityMockBloc = EligibilityMockBloc();
    customerCodeBlocMock = CustomerCodeBlocMock();
    materialBundleListBloc = MaterialBundleListBlocMock();
    materialPriceDetailMockBloc = MaterialPriceDetailMockBloc();

    mockBundleInfoList = [
      BundleInfo(
        sequence: 1,
        quantity: 1,
        type: MaterialBundleType('%'),
        rate: -10,
      ),
      BundleInfo(
        sequence: 4,
        quantity: 10,
        type: MaterialBundleType('%'),
        rate: -15,
      ),
      BundleInfo(
        sequence: 7,
        quantity: 15,
        type: MaterialBundleType('%'),
        rate: -20,
      ),
      BundleInfo(
        sequence: 13,
        quantity: 50,
        type: MaterialBundleType('%'),
        rate: -30,
      ),
      BundleInfo(
        sequence: 10,
        quantity: 20,
        type: MaterialBundleType('%'),
        rate: -25,
      ),
    ];

    mockBundleItems = [
      BundleAggregate(
        bundle: Bundle(
          materials: <MaterialInfo>[],
          bundleName: BundleName(''),
          bundleCode: '0010276811',
          bundleInformation: mockBundleInfoList,
        ),
        materialInfos: <MaterialInfo>[],
      ),
      BundleAggregate(
          bundle: Bundle(
            materials: <MaterialInfo>[],
            bundleName: BundleName(''),
            bundleCode: '0010276812',
            bundleInformation: mockBundleInfoList,
          ),
          materialInfos: <MaterialInfo>[]),
      BundleAggregate(
        bundle: Bundle(
          materials: <MaterialInfo>[],
          bundleName: BundleName(''),
          bundleCode: '0010276813',
          bundleInformation: mockBundleInfoList,
        ),
        materialInfos: <MaterialInfo>[],
      ),
      BundleAggregate(
          bundle: Bundle(
            materials: <MaterialInfo>[],
            bundleName: BundleName(''),
            bundleCode: '0010276814',
            bundleInformation: mockBundleInfoList,
          ),
          materialInfos: <MaterialInfo>[]),
      BundleAggregate(
          bundle: Bundle(
            materials: <MaterialInfo>[],
            bundleName: BundleName(''),
            bundleCode: '0010276815',
            bundleInformation: mockBundleInfoList,
          ),
          materialInfos: <MaterialInfo>[]),
    ];

    // for (final item in materialBundleItemsMock) {
    //   if (item.bundles.isNotEmpty &&
    //       bundleItemsMock
    //           .where(
    //               (element) => element.bundleCode == item.bundles[0].bundleCode)
    //           .isEmpty) {
    //     //item.bundles[0].bundleInformation
    //     //.sort((a, b) => a.quantity.compareTo(b.quantity));
    //     bundleItemsMock.add(item.bundles[0]);
    //   }
    // }
    when(() => materialBundleListBloc.state)
        .thenReturn(MaterialBundleListState.initial());

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeBLocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(
      SalesOrgState.initial().copyWith(
        salesOrganisation: SalesOrganisation.empty().copyWith(
          salesOrg: SalesOrg('2601'),
        ),
        configs: SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('SGD'),
        ),
      ),
    );
  });

  Widget getScopedWidget(Widget child,
      [List<BlocProvider> additionalProviders = const []]) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'SG'),
      ],
      path: 'assets/langs/langs.csv',
      startLocale: const Locale('en', 'SG'),
      fallbackLocale: const Locale('en', 'SG'),
      saveLocale: true,
      useOnlyLangCode: false,
      assetLoader: CsvAssetLoader(),
      child: WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ShipToCodeBloc>(
            create: (context) => shipToCodeBLocMock,
          ),
          BlocProvider<MaterialBundleListBloc>(
            create: (context) => materialBundleListBloc,
          ),
          if (additionalProviders.isNotEmpty) ...additionalProviders,
        ],
        child: Scaffold(
          appBar: null,
          body: child,
        ),
      ),
    );
  }

  group('Material Bundle List Screen', () {
    testWidgets(
      'Test that screen has been initialized',
      (tester) async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: BlocProvider<MaterialBundleListBloc>(
              create: (context) => materialBundleListBloc,
              child: const MaterialBundleListPage(),
            ),
          ),
        );
        final materialBundleListPage =
            find.byKey(const Key('materialBundleListPage'));
        expect(materialBundleListPage, findsOneWidget);
      },
    );
    testWidgets('Test while state is fetching', (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          isFetching: true,
        ),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: BlocProvider<MaterialBundleListBloc>(
              create: (context) => materialBundleListBloc,
              child: const MaterialBundleListPage(),
            ),
          ),
        );
      });

      final noBundle =
          find.image(Image.asset('assets/images/ezrxlogo.png').image);
      expect(noBundle, findsOneWidget);
    });
    testWidgets('Test while data has been fetched', (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          bundleList: mockBundleItems,
          nextPageIndex: 1,
          canLoadMore: true,
        ),
      );

      await tester.pumpWidget(getScopedWidget(const MaterialBundleListPage()));
      await tester.pump();
      final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);
      expect(scrollWidget, findsOneWidget);
    });

    testWidgets(
        'Test have material bundle list and emit load more state include',
        (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          bundleList: mockBundleItems,
          nextPageIndex: 1,
          canLoadMore: true,
          isFetching: true,
        ),
      );

      await tester.pumpWidget(getScopedWidget(const MaterialBundleListPage()));

      final noBundleList = find.text('No bundle found');
      final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);

      final gesture = await tester
          .startGesture(const Offset(50, 100)); //Position of the scrollview
      await gesture.moveBy(const Offset(50, -2000)); //How much to scroll by
      await tester.pump(const Duration(seconds: 2));

      expect(scrollWidget, findsOneWidget);
      expect(noBundleList, findsNothing);
    });

    // testWidgets('Test have material bundle list and Refresh', (tester) async {
    //   when(() => materialBundleListBloc.state).thenReturn(
    //     MaterialBundleListState.initial().copyWith(
    //       bundleList: bundleItemsMock,
    //       nextPageIndex: 1,
    //       canLoadMore: true,
    //       isFetching: true,
    //     ),
    //   );

    //   await tester.runAsync(() async {
    //     await tester.pumpWidget(
    //       MaterialFrameWrapper(
    //         child: MultiBlocProvider(
    //           providers: [
    //             BlocProvider<UserBloc>(
    //               create: (context) => userBlocMock,
    //             ),
    //             BlocProvider<SalesOrgBloc>(
    //               create: (context) => salesOrgBlocMock,
    //             ),
    //             BlocProvider<CustomerCodeBloc>(
    //               create: (context) => customerCodeBlocMock,
    //             ),
    //             BlocProvider<ShipToCodeBloc>(
    //               create: (context) => shipToCodeBLocMock,
    //             ),
    //             BlocProvider<MaterialBundleListBloc>(
    //               create: (context) => materialBundleListBloc,
    //             ),
    //           ],
    //           child: const MaterialBundleListPage(),
    //         ),
    //       ),
    //     );
    //   });

    //   await tester.pump();
    //   final noBundleList = find.text('No bundle found');
    //   expect(noBundleList, findsNothing);
    //   final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);
    //   expect(scrollWidget, findsOneWidget);
    //   await tester.fling(scrollWidget, const Offset(0.0, 300.0), 1000.0);
    //   await tester.pump();
    //   await tester.pump(const Duration(seconds: 1));
    //   await tester.pump(const Duration(seconds: 1));
    //   await tester.pump(const Duration(seconds: 1));
    // });
    testWidgets('Test fetch fail', (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
        ),
      );

      final expectedStates = [
        MaterialBundleListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ];

      whenListen(materialBundleListBloc, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(getScopedWidget(const MaterialBundleListPage()));

      final noBundleFound = find.text('No bundle found');
      expect(noBundleFound, findsOneWidget);
      await tester.pump();

      final errorMessage = find.byKey(const Key('snackBarMessage'));

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('Test fetch fail Dynamic', (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
        ),
      );

      final expectedStates = [
        MaterialBundleListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Right(
              'No Error',
            ),
          ),
        ),
      ];

      whenListen(materialBundleListBloc, Stream.fromIterable(expectedStates));

      // await tester.pumpWidget(const MaterialBundleListPage());

      await tester.runAsync(() async {
        await tester.pumpWidget(
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
            child: MaterialFrameWrapper(
              child: Scaffold(
                body: BlocProvider<MaterialBundleListBloc>(
                  create: (context) => materialBundleListBloc,
                  child: const MaterialBundleListPage(),
                ),
              ),
            ),
          ),
        );
      });
      // verify(() => authBlocMock.add(const AuthEvent.authCheck()));
    });

    testWidgets('On Material List Item Tapped', (tester) async {
      when(() => materialBundleListBloc.state).thenReturn(
        MaterialBundleListState.initial().copyWith(
          bundleList: mockBundleItems,
          nextPageIndex: 1,
          canLoadMore: true,
        ),
      );

      when(() => materialPriceDetailMockBloc.state).thenReturn(
        MaterialPriceDetailState.initial().copyWith(materialDetails: {}),
      );

      when(() => eligibilityMockBloc.state).thenReturn(
        EligibilityState.initial(),
      );

      await tester.pumpWidget(getScopedWidget(
        const MaterialBundleListPage(),
        [
          BlocProvider<MaterialPriceDetailBloc>(
            create: (context) => materialPriceDetailMockBloc,
          ),
          BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityMockBloc),
        ],
      ));

      final firstMockBundleItem = find.text(
        mockBundleItems.first.bundle.bundleCode,
      );

      expect(firstMockBundleItem, findsOneWidget);

      await tester.tap(firstMockBundleItem);
      await tester.pump(const Duration(seconds: 2));

      expect(autoRouterMock.current.name, BundleItemDetailPageRoute.name);
    });
  });
}
