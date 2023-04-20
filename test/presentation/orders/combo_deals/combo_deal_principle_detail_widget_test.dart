import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_principle_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/combo_deal_principle_detail_page.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_checkout.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_header_message.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_item.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockMaterialPriceDetailBloc
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockComboDealListBloc
    extends MockBloc<ComboDealListEvent, ComboDealListState>
    implements ComboDealListBloc {}

class MockComboDealDetailBloc extends MockBloc<ComboDealPrincipleDetailEvent,
    ComboDealPrincipleDetailState> implements ComboDealPrincipleDetailBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockTenderContractBloc
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class MockMaterialListRepository extends Mock
    implements MaterialListRepository {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialPriceDetailBloc materialPriceDetailBloc;
  late CartBloc cartBloc;
  late EligibilityBloc eligibilityBloc;
  late ComboDealPrincipleDetailBloc comboDealDetailBloc;
  late ComboDealListBloc comboDealListBloc;
  late UserBloc userBloc;
  late TenderContractBloc tenderContractBloc;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter router;
  final locator = GetIt.instance;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    router = locator<AppRouter>();
  });

  setUp(() async {
    materialPriceDetailBloc = MockMaterialPriceDetailBloc();
    cartBloc = MockCartBloc();
    eligibilityBloc = MockEligibilityBloc();
    comboDealDetailBloc = MockComboDealDetailBloc();
    comboDealListBloc = MockComboDealListBloc();
    userBloc = MockUserBloc();
    tenderContractBloc = MockTenderContractBloc();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();

    when(() => materialPriceDetailBloc.state)
        .thenReturn(MaterialPriceDetailState.initial());
    when(() => cartBloc.state).thenReturn(CartState.initial());
    when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
    when(() => comboDealDetailBloc.state)
        .thenReturn(ComboDealPrincipleDetailState.initial());
    when(() => comboDealListBloc.state)
        .thenReturn(ComboDealListState.initial());
    when(() => userBloc.state).thenReturn(UserState.initial());
    when(() => tenderContractBloc.state)
        .thenReturn(TenderContractState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
  });

  Widget wrapper(Widget child) => WidgetUtils.getScopedWidget(
        autoRouterMock: router,
        providers: [
          BlocProvider<MaterialPriceDetailBloc>(
            create: (context) => materialPriceDetailBloc,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBloc,
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBloc,
          ),
          BlocProvider<TenderContractBloc>(
            create: (context) => tenderContractBloc,
          ),
          BlocProvider<ComboDealPrincipleDetailBloc>(
            create: (context) => comboDealDetailBloc,
          ),
          BlocProvider<ComboDealListBloc>(
            create: (context) => comboDealListBloc,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: child,
      );
  const fakePrinciple = 'fake-principle';

  final fakePriceComboDeal = PriceComboDeal.empty().copyWith(
    category: PriceComboDealCategory(
      type: ComboDealCategoryType('ZPRINC'),
      values: [
        fakePrinciple,
      ],
    ),
  );

  PriceAggregate newPriceAggregate(String materialNumber) =>
      PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber(materialNumber),
        ),
      );

  testWidgets('Initalize page', (tester) async {
    locator.registerSingleton<ComboDealPrincipleDetailBloc>(
        MockComboDealDetailBloc());
    final comboDealDetailBloc = locator<ComboDealPrincipleDetailBloc>();
    when(() => comboDealDetailBloc.state)
        .thenReturn(ComboDealPrincipleDetailState.initial());
    final initialItems = [newPriceAggregate('fake-1')];
    await tester.pumpWidget(
      wrapper(
        WrappedRoute(
          child: ComboDealPrincipleDetailPage(
            comboDeal: fakePriceComboDeal,
            initialComboItems: initialItems,
          ),
        ),
      ),
    );

    verify(
      () => comboDealDetailBloc.add(
        ComboDealPrincipleDetailEvent.initFromCart(
          items: initialItems,
        ),
      ),
    ).called(1);

    verify(
      () => comboDealDetailBloc.add(
        ComboDealPrincipleDetailEvent.fetch(
          user: User.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesConfigs: SalesOrganisationConfigs.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          principles: [fakePrinciple],
          fetchFromCart: true,
        ),
      ),
    ).called(1);
  });

  testWidgets('When fetch material success (edit = false)', (tester) async {
    whenListen(
      comboDealDetailBloc,
      Stream.fromIterable(
        [
          ComboDealPrincipleDetailState.initial().copyWith(
            isFetchingMaterials: true,
          ),
          ComboDealPrincipleDetailState.initial().copyWith(
            isFetchingMaterials: false,
            items: {MaterialNumber('fake-1'): newPriceAggregate('fake-1')},
          ),
        ],
      ),
    );

    await tester.pumpWidget(
      wrapper(
        ComboDealPrincipleDetailPage(
          comboDeal: fakePriceComboDeal,
        ),
      ),
    );

    verify(
      () => comboDealListBloc.add(
        ComboDealListEvent.fetchPrincipleGroupDeal(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          comboDeals: fakePriceComboDeal,
        ),
      ),
    ).called(1);
    verify(
      () => materialPriceDetailBloc.add(
        MaterialPriceDetailEvent.comboDealFetch(
          user: User.empty(),
          customerCode: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToCode: ShipToInfo.empty(),
          materialInfoList: [MaterialNumber('fake-1')],
        ),
      ),
    ).called(1);
  });

  testWidgets('When fetch material success (edit = true)', (tester) async {
    final fakeComboDeal = ComboDeal.empty().copyWith(
      flexiTierRule: [ComboDealTierRule.empty()],
    );

    whenListen(
      comboDealDetailBloc,
      Stream.fromIterable(
        [
          ComboDealPrincipleDetailState.initial().copyWith(
            isFetchingMaterials: true,
          ),
          ComboDealPrincipleDetailState.initial().copyWith(
            isFetchingMaterials: false,
          ),
        ],
      ),
    );

    await tester.pumpWidget(
      wrapper(
        ComboDealPrincipleDetailPage(
          comboDeal: fakePriceComboDeal,
          initialComboItems: [
            newPriceAggregate('fake-1').copyWith(comboDeal: fakeComboDeal)
          ],
        ),
      ),
    );

    verify(
      () => comboDealDetailBloc.add(
        ComboDealPrincipleDetailEvent.setComboDealInfo(
          comboDealInfo: fakeComboDeal,
        ),
      ),
    ).called(1);
  });

  testWidgets('When fetch combo deal success', (tester) async {
    final fakeComboDeal = ComboDeal.empty().copyWith(
      flexiTierRule: [ComboDealTierRule.empty()],
    );

    whenListen(
      comboDealListBloc,
      Stream.fromIterable(
        [
          ComboDealListState.initial().copyWith(
            isFetching: true,
          ),
          ComboDealListState.initial().copyWith(
            isFetching: false,
            comboDeals: {
              '-': [fakeComboDeal],
            },
          ),
        ],
      ),
    );

    await tester.pumpWidget(
      wrapper(
        ComboDealPrincipleDetailPage(
          comboDeal: fakePriceComboDeal,
        ),
      ),
    );

    verify(
      () => comboDealDetailBloc.add(
        ComboDealPrincipleDetailEvent.setComboDealInfo(
          comboDealInfo: fakeComboDeal,
        ),
      ),
    ).called(1);
  });

  testWidgets('When fetch price success', (tester) async {
    whenListen(
      materialPriceDetailBloc,
      Stream.fromIterable(
        [
          MaterialPriceDetailState.initial().copyWith(isFetching: true),
          MaterialPriceDetailState.initial().copyWith(
            isFetching: false,
            materialDetails: {
              MaterialQueryInfo.empty().copyWith(
                value: MaterialNumber('fake-1'),
                isComboDealMaterial: true,
              ): MaterialPriceDetail.empty(),
            },
          ),
        ],
      ),
    );

    await tester.pumpWidget(
      wrapper(
        ComboDealPrincipleDetailPage(
          comboDeal: fakePriceComboDeal,
        ),
      ),
    );

    verify(
      () => comboDealDetailBloc.add(
        ComboDealPrincipleDetailEvent.setPriceInfo(
          comboDeal: fakePriceComboDeal,
          priceMap: {
            MaterialNumber('fake-1'): MaterialPriceDetail.empty(),
          },
        ),
      ),
    ).called(1);
  });

  testWidgets('When initialize all combo deal info', (tester) async {
    when(() => comboDealDetailBloc.state).thenReturn(
      ComboDealPrincipleDetailState.initial().copyWith(
        isFetchingComboInfo: true,
      ),
    );
    await tester.pumpWidget(
      wrapper(
        ComboDealPrincipleDetailPage(
          comboDeal: fakePriceComboDeal,
        ),
      ),
    );

    expect(find.byKey(const Key('loaderImage')), findsOneWidget);
  });

  testWidgets('Load more combo deal materials', (tester) async {
    when(() => comboDealDetailBloc.state).thenReturn(
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
          MaterialNumber('fake-3'): newPriceAggregate('fake-3'),
          MaterialNumber('fake-4'): newPriceAggregate('fake-4'),
          MaterialNumber('fake-5'): newPriceAggregate('fake-5'),
        },
      ),
    );
    await tester.pumpWidget(
      wrapper(
        ComboDealPrincipleDetailPage(
          comboDeal: fakePriceComboDeal,
        ),
      ),
    );
    expect(find.byType(ComboDealHeaderMessage), findsOneWidget);
    expect(find.byType(ComboDealCheckout), findsOneWidget);
    expect(find.byType(ComboDealItem), findsNWidgets(5));

    await tester.fling(
        find.byType(CustomScrollView), const Offset(0, -4000), 8000);
    await tester.pump(const Duration(seconds: 2));
    verify(
      () => comboDealDetailBloc.add(
        ComboDealPrincipleDetailEvent.loadMore(
          user: User.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesConfigs: SalesOrganisationConfigs.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          principles: [fakePrinciple],
        ),
      ),
    ).called(1);
  });

  testWidgets('Header message', (tester) async {
    final comboDeal = ComboDeal.empty().copyWith(
      flexiTierRule: [
        ComboDealTierRule.empty().copyWith(
          minTotalAmount: 50,
          minTotalCurrency: 'VN',
        ),
        ComboDealTierRule.empty().copyWith(
          minTotalAmount: 60,
          minTotalCurrency: 'VN',
        ),
      ],
    );
    when(() => comboDealDetailBloc.state).thenReturn(
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1').copyWith(
            comboDeal: comboDeal,
          ),
        },
      ),
    );
    await tester.pumpWidget(
      wrapper(
        ComboDealPrincipleDetailPage(
          comboDeal: fakePriceComboDeal,
        ),
      ),
    );
    expect(find.byType(ComboDealHeaderMessage), findsOneWidget);

    expect(find.byType(ComboDealItem), findsNWidgets(1));
    const headerMessage =
        'You need to reach min order value (VN) of 50 OR 60 from any product or products below';
    expect(find.text(headerMessage), findsOneWidget);
  });

  testWidgets('checkout combo', (tester) async {
    when(() => comboDealDetailBloc.state).thenReturn(
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
        },
        selectedItems: {
          MaterialNumber('fake-1'): true,
        },
      ),
    );
    await tester.pumpWidget(
      wrapper(
        ComboDealPrincipleDetailPage(
          comboDeal: fakePriceComboDeal,
        ),
      ),
    );

    expect(find.byType(ComboDealCheckout), findsOneWidget);
    expect(find.byType(ComboDealItem), findsNWidgets(2));
    final addToCartButton = find.byKey(const ValueKey('addToCartButton'));
    expect(addToCartButton, findsOneWidget);
    await tester.tap(addToCartButton);
    await tester.pump();

    verify(
      () => cartBloc.add(
        CartEvent.addComboDealToCart(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          comboDealItems: [newPriceAggregate('fake-1')],
          doNotallowOutOfStockMaterial: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          overrideQty: true,
        ),
      ),
    ).called(1);
  });
}
