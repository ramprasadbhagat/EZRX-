import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_item_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/update_cart.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';
import '../../../order_history/order_history_details_widget_test.dart';

class MockAddToCartBloc extends MockBloc<AddToCartEvent, AddToCartState>
    implements AddToCartBloc {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockOrderDocumentTypeBloc
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class MockTenderContractBloc
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AddToCartBloc addToCartBloc;
  late CartBloc cartBloc;
  late OrderDocumentTypeBloc orderDocumentTypeBloc;
  late TenderContractBloc tenderContractBloc;
  late EligibilityBloc eligibilityBloc;
  late SalesOrgBloc salesOrgBloc;
  late AppRouter router;
  final locator = GetIt.instance;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    router = locator<AppRouter>();
  });

  setUp(() async {
    addToCartBloc = MockAddToCartBloc();
    cartBloc = MockCartBloc();
    orderDocumentTypeBloc = MockOrderDocumentTypeBloc();
    tenderContractBloc = MockTenderContractBloc();
    eligibilityBloc = MockEligibilityBloc();
    salesOrgBloc = MockSalesOrgBloc();

    when(() => addToCartBloc.state).thenReturn(AddToCartState.initial());
    when(() => cartBloc.state).thenReturn(CartState.initial());
    when(() => orderDocumentTypeBloc.state)
        .thenReturn(OrderDocumentTypeState.initial());
    when(() => tenderContractBloc.state)
        .thenReturn(TenderContractState.initial());
    when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
    when(() => salesOrgBloc.state).thenReturn(SalesOrgState.initial());
  });

  Widget wrapper(Widget child) => WidgetUtils.getScopedWidget(
        autoRouterMock: router,
        providers: [
          BlocProvider<AddToCartBloc>(
            create: (context) => addToCartBloc,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
          BlocProvider<OrderDocumentTypeBloc>(
            create: (context) => orderDocumentTypeBloc,
          ),
          BlocProvider<TenderContractBloc>(
              create: (context) => tenderContractBloc),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBloc,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBloc,
          ),
        ],
        child: child,
      );

  PriceAggregate newPriceAggregate(String materialNumber) =>
      PriceAggregate.empty().copyWith(
          isSpecialOrderType: false,
          materialInfo: MaterialInfo.empty().copyWith(
            hasValidTenderContract: true,
          ));

  testWidgets('Initalize page', (tester) async {
    locator.registerSingleton<AddToCartBloc>(MockAddToCartBloc());
    final addToCartB = locator<AddToCartBloc>();
    when(() => addToCartB.state).thenReturn(AddToCartState.initial());
    final initialItems = newPriceAggregate('fake-1');
    await tester.pumpWidget(
      wrapper(
        WrappedRoute(
          child: UpdateCart(
            material: initialItems,
          ),
        ),
      ),
    );

    verify(
      () => addToCartB.add(
        AddToCartEvent.setCartItem(initialItems),
      ),
    ).called(1);

    verify(
      () => addToCartB.add(
        AddToCartEvent.updateQuantity(
            quantity: initialItems.quantity,
            cartZmgQtyExcludeCurrent:
                cartBloc.state.zmgMaterialWithoutMaterial(initialItems),
            customerCode: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToCode: ShipToInfo.empty()),
      ),
    ).called(1);
  });

  testWidgets('When call TenderContractEvent', (tester) async {
    whenListen(
      addToCartBloc,
      Stream.fromIterable(
        [
          AddToCartState.initial().copyWith(
              isFetching: true, cartItem: newPriceAggregate('fake-1')),
          AddToCartState.initial().copyWith(
              isFetching: false, cartItem: newPriceAggregate('fake-1')),
        ],
      ),
    );

    await tester.pumpWidget(
      wrapper(
        UpdateCart(
          material: newPriceAggregate('fake-1'),
        ),
      ),
    );

    verify(
      () => tenderContractBloc.add(
        TenderContractEvent.fetch(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          materialInfo: newPriceAggregate('fake-1').materialInfo,
          defaultSelectedTenderContract:
              newPriceAggregate('fake-1').tenderContract,
        ),
      ),
    ).called(1);
  });

  testWidgets('When isFetching = true', (tester) async {
    when(() => addToCartBloc.state).thenReturn(
      AddToCartState.initial().copyWith(
        isFetching: true,
      ),
    );
    await tester.pumpWidget(
      wrapper(
        UpdateCart(
          material: newPriceAggregate('fake-1'),
        ),
      ),
    );

    expect(find.byType(CartBottomSheetShimmer), findsOneWidget);
  });

  testWidgets('When isFetching = false', (tester) async {
    when(() => addToCartBloc.state).thenReturn(
      AddToCartState.initial().copyWith(
        isFetching: false,
        cartItem: newPriceAggregate('fake-1'),
      ),
    );
    await tester.pumpWidget(
      wrapper(
        UpdateCart(
          material: newPriceAggregate('fake-1'),
        ),
      ),
    );

    expect(find.byType(CartItemDetailWidget), findsOneWidget);
  });
}
