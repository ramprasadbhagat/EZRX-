import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/home/selector/sales_org_selector.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/widget_utils.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class BannerBlocMock extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late CustomerCodeBlocMock mockCustomerCodeBloc;
  late AuthBlocMock authBlocMock;
  late SalesOrgBlocMock salesOrgBlocMock;
  late CartBlocMock cartBlocMock;
  late BannerBlocMock bannerBlocMock;
  late OrderDocumentTypeBlocMock orderDocumentTypeBlocMock;
  late UserBlocMock userBlocMock;
  late AppRouter autoRouterMock;
  const salesCodeText = '1300 - ZPBN';
  const salesCodeText2 = '1500 - ZPKH';

  final fakeSalesOrg = SalesOrganisation(
    salesOrg: SalesOrg('1300'),
    customerInfos: [],
  );
  final fakeSalesOrg2 = SalesOrganisation(
    salesOrg: SalesOrg('1500'),
    customerInfos: [],
  );

  final priceTierItem1 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 1,
    rate: 5230,
  );
  final priceTierItem2 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 3,
    rate: 5530,
  );
  final priceTierItem3 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 5,
    rate: 5730,
  );

  final fakeCartItemList = [
    PriceAggregate.empty().copyWith(
      quantity: 1,
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168451'),
        materialDescription: ' Triglyceride Mosys D',
        principalData: PrincipalData.empty().copyWith(
          principalName: '台灣拜耳股份有限公司',
        ),
      ),
      price: Price.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168451'),
        tiers: [
          PriceTier.empty().copyWith(
            tier: '',
            items: [
              priceTierItem1,
              priceTierItem2,
              priceTierItem3,
            ],
          )
        ],
        zmgDiscount: false,
        finalPrice: MaterialPrice(5200),
      ),
    ),
  ];

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator = GetIt.instance;
    mockCustomerCodeBloc = CustomerCodeBlocMock();
    authBlocMock = AuthBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    cartBlocMock = CartBlocMock();
    userBlocMock = UserBlocMock();
    autoRouterMock = AppRouter();
    bannerBlocMock = BannerBlocMock();
    orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();
    when(() => mockCustomerCodeBloc.state)
        .thenReturn(CustomerCodeState.initial());

    when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(salesOrganisation: fakeSalesOrg));
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => bannerBlocMock.state).thenReturn(BannerState.initial());
    when(() => orderDocumentTypeBlocMock.state)
        .thenReturn(OrderDocumentTypeState.initial());
  });

  group('Sales Org Selector Test ', () {
    Future getScopedWidget(tester) async {
      return await tester.pumpWidget(
        EasyLocalization(
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
              BlocProvider<CustomerCodeBloc>(
                  create: (context) => mockCustomerCodeBloc),
              BlocProvider<AuthBloc>(create: (context) => authBlocMock),
              BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
              BlocProvider<CartBloc>(create: (context) => cartBlocMock),
              BlocProvider<BannerBloc>(create: (context) => bannerBlocMock),
              BlocProvider<OrderDocumentTypeBloc>(
                  create: (context) => orderDocumentTypeBlocMock),
              BlocProvider<UserBloc>(create: (context) => userBlocMock),
            ],
            child: Material(
              child: Scaffold(
                body: Row(
                  children: const [
                    SalesOrgSelector(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('When salesOrg has data', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(salesOrganisation: fakeSalesOrg));
      await getScopedWidget(tester);
      final salesOrgText = find.text('Sales Org');
      final salesOrgValue = find.text(salesCodeText);
      expect(salesOrgValue, findsOneWidget);
      expect(salesOrgText, findsOneWidget);
    });

    testWidgets('When salesOrg data is empty', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(salesOrganisation: SalesOrganisation.empty()));
      await getScopedWidget(tester);
      final salesCodeText = find.text('Sales Org');
      final shimmer = find.byType(Shimmer);
      expect(salesCodeText, findsOneWidget);
      expect(shimmer, findsOneWidget);
    });

    testWidgets('when tapped on custom selector show Platform Dialog',
        (tester) async {
      locator<Config>().appFlavor = Flavor.dev;
      WidgetsFlutterBinding.ensureInitialized();

      when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(salesOrganisation: fakeSalesOrg));

      await getScopedWidget(tester);
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
          user: User.empty().copyWith(
        userSalesOrganisations: [fakeSalesOrg],
        customerCode: CustomerCode('130046'),
      )));
      final selectorWidget = find.byType(CustomSelector);
      await tester.tap(selectorWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      final platformDialog = find.byType(PlatformAlertDialog);
      expect(platformDialog, findsOneWidget);
    });

    testWidgets(
        'when tapped on custom selector show Platform Dialog with different data',
        (tester) async {
      locator<Config>().appFlavor = Flavor.dev;
      WidgetsFlutterBinding.ensureInitialized();

      when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(salesOrganisation: fakeSalesOrg));
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
          user: User.empty().copyWith(
        userSalesOrganisations: [fakeSalesOrg2],
      )));

      await getScopedWidget(tester);

      final selectorWidget = find.byType(CustomSelector);
      await tester.tap(selectorWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      final platformDialog = find.byType(PlatformAlertDialog);
      const headerText = 'Please select a Sales Org';
      expect(platformDialog, findsOneWidget);
      expect(find.text(headerText), findsOneWidget);

      final salesOrg = find.byType(PlatformDialogAction).first;
      await tester.tap(salesOrg, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text(salesCodeText2), findsOneWidget);
    });

    testWidgets(
        'when different sales org selected and cart item is not empty, then show change dialog',
        (tester) async {
      locator<Config>().appFlavor = Flavor.dev;
      WidgetsFlutterBinding.ensureInitialized();

      when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(salesOrganisation: fakeSalesOrg));
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
          user: User.empty().copyWith(
        userSalesOrganisations: [fakeSalesOrg2],
      )));
      when(() => cartBlocMock.state).thenReturn(
          CartState.initial().copyWith(cartItemList: fakeCartItemList));

      await getScopedWidget(tester);

      final selectorWidget = find.byType(CustomSelector);
      await tester.tap(selectorWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      final platformDialog = find.byType(PlatformAlertDialog);
      const headerText = 'Please select a Sales Org';
      expect(platformDialog, findsOneWidget);
      expect(find.text(headerText), findsOneWidget);

      final salesOrg = find.byType(PlatformDialogAction).first;
      await tester.tap(salesOrg, warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text('Change sales organization'), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.text('Change'));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text(salesCodeText2), findsOneWidget);
    });

    testWidgets('When there is an error fetching salesOrg data',
        (tester) async {
      final expectedSalesOrgListStates = [
        SalesOrgState.initial().copyWith(salesOrganisation: fakeSalesOrg),
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeSalesOrg2,
          salesOrgFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('authentication failed'),
            ),
          ),
        ),
      ];
      whenListen(
          salesOrgBlocMock, Stream.fromIterable(expectedSalesOrgListStates));

      await getScopedWidget(tester);
      final selectedCustomerCodeText = find.text(salesCodeText2);
      expect(selectedCustomerCodeText, findsNothing);
    });
  });
}
