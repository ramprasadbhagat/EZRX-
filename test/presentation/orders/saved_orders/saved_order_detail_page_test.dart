import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/presentation/orders/core/order_material_item.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_detail_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class MockShipToCodeBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class MockMaterialPriceDetailBloc
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class SavedOrderListBlocMock
    extends MockBloc<SavedOrderListEvent, SavedOrderListState>
    implements SavedOrderListBloc {}

void main() {
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBLocMock;
  late MaterialPriceDetailBloc materialPriceDetailBlocMock;
  late CartBloc cartBlocMock;
  late SavedOrder orderMock;
  late List<MaterialItem> orderMockItems;
  late MockEligibilityBloc eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late SavedOrderListBlocMock savedOrderListBlocMock;
  final locator = GetIt.instance;
  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
          () => CountlyService(config: locator<Config>()));
    final orders = await OrderLocalDataSource().getSavedOrders();
    orderMock = orders.first;
    orderMockItems = orderMock.items;
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    userBlocMock = MockUserBloc();
    salesOrgBlocMock = MockSalesOrgBloc();
    customerCodeBlocMock = MockCustomerCodeBloc();
    shipToCodeBLocMock = MockShipToCodeBloc();
    materialPriceDetailBlocMock = MockMaterialPriceDetailBloc();
    cartBlocMock = MockCartBloc();
    eligibilityBlocMock = MockEligibilityBloc();
    savedOrderListBlocMock = SavedOrderListBlocMock();

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeBLocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => materialPriceDetailBlocMock.state.copyWith(
        isFetching: true,
        isValidating: true)).thenReturn(MaterialPriceDetailState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => savedOrderListBlocMock.state)
        .thenReturn(SavedOrderListState.initial());
  });

  Widget savedOrderDetailPage() => WidgetUtils.getScopedWidget(
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
          BlocProvider<MaterialPriceDetailBloc>(
            create: (context) => materialPriceDetailBlocMock,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<SavedOrderListBloc>(
            create: (context) => savedOrderListBlocMock,
          ),
        ],
        child: SavedOrderDetailPage(
          order: orderMock,
        ),
      );

  group('Saved Order Detail Screen', () {
    testWidgets(
      'Saved Order Detail with material items',
      (tester) async {
        await tester.pumpWidget(savedOrderDetailPage());
        expect(find.byKey(const Key('SavedOrderDetailPage')), findsOneWidget);
        expect(find.text('#${orderMock.id}'), findsOneWidget);
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));
        expect(find.text('Add to Cart'), findsOneWidget);
        expect(find.text('Delete'), findsOneWidget);
      },
    );

    testWidgets(
      'Saved Order Detail with all materials invalid',
      (tester) async {
        when(() => materialPriceDetailBlocMock.state).thenReturn(
          MaterialPriceDetailState.initial().copyWith(
            materialDetails: {
              for (final material in orderMockItems)
                MaterialQueryInfo.fromSavedOrder(orderMaterial: material):
                    MaterialPriceDetail.empty()
                        .copyWith
                        .price(isValidMaterial: false),
            },
          ),
        );
        await tester.pumpWidget(savedOrderDetailPage());
        await tester.pump();
        expect(find.byKey(const Key('SavedOrderDetailPage')), findsOneWidget);
        expect(find.byKey(const Key('InvalidOrderWarning')), findsOneWidget);
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));
        expect(find.text('Invalid'), findsAtLeastNWidgets(1));
        expect(find.text('NA'), findsAtLeastNWidgets(1));
      },
    );

    testWidgets(
      'Saved Order Detail with price loading',
      (tester) async {
        when(() => materialPriceDetailBlocMock.state).thenReturn(
          MaterialPriceDetailState.initial().copyWith(
            isValidating: true,
          ),
        );
        await tester.pumpWidget(savedOrderDetailPage());
        expect(
            find.byKey(const Key('OrderActionButtonShimmer')), findsOneWidget);
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));
        expect(find.byKey(const Key('price-loading')), findsAtLeastNWidgets(1));
      },
    );

    testWidgets(
      'Saved Order Detail with FOC material',
      (tester) async {
        when(() => materialPriceDetailBlocMock.state).thenReturn(
          MaterialPriceDetailState.initial().copyWith(
            materialDetails: {
              for (final material in orderMockItems)
                MaterialQueryInfo.fromSavedOrder(orderMaterial: material):
                    MaterialPriceDetail.empty().copyWith.price(
                          isValidMaterial: true,
                          isFOC: true,
                        ),
            },
          ),
        );
        await tester.pumpWidget(savedOrderDetailPage());
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));
        expect(find.text('FOC'), findsAtLeastNWidgets(1));
        expect(find.text('Add to Cart'), findsOneWidget);
        expect(find.text('Delete'), findsOneWidget);
      },
    );

    testWidgets(
      'Saved Order Detail with valid material and price displayed',
      (tester) async {
        when(() => materialPriceDetailBlocMock.state).thenReturn(
          MaterialPriceDetailState.initial().copyWith(
            materialDetails: {
              for (final material in orderMockItems)
                MaterialQueryInfo.fromSavedOrder(orderMaterial: material):
                    MaterialPriceDetail.empty()
                        .copyWith
                        .price(finalPrice: MaterialPrice(10)),
            },
          ),
        );
        await tester.pumpWidget(savedOrderDetailPage());
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));

        final currency = SalesOrganisationConfigs.empty().currency.code;
        expect(find.text('$currency 10.00'), findsAtLeastNWidgets(1));
      },
    );

    testWidgets(
      'Saved Order Detail when refreshed',
      (tester) async {
        when(() => materialPriceDetailBlocMock.state).thenReturn(
          MaterialPriceDetailState.initial().copyWith(
            materialDetails: {
              for (final material in orderMockItems)
                MaterialQueryInfo.fromSavedOrder(orderMaterial: material):
                    MaterialPriceDetail.empty()
                        .copyWith
                        .price(finalPrice: MaterialPrice(10)),
            },
          ),
        );
        await tester.pumpWidget(savedOrderDetailPage());
        await tester.drag(
            find.byKey(const ValueKey('SavedDetailRefreshIndicator')),
            const Offset(0, 500));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        verify(
          () => materialPriceDetailBlocMock.add(
            MaterialPriceDetailEvent.refresh(
                user: userBlocMock.state.user,
                customerCode: customerCodeBlocMock.state.customerCodeInfo,
                salesOrganisation: salesOrgBlocMock.state.salesOrganisation,
                shipToCode: shipToCodeBLocMock.state.shipToInfo,
                pickAndPack: eligibilityBlocMock.state.getPNPValueMaterial,
                salesOrganisationConfigs: salesOrgBlocMock.state.configs,
                materialInfoList: orderMock.items
                    .map(
                      (item) => MaterialQueryInfo.fromSavedOrder(
                        orderMaterial: item,
                      ),
                    )
                    .toList()),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Saved Order Detail when add to cart is pressed then navigate to cart page',
      (tester) async {
        when(() => materialPriceDetailBlocMock.state).thenReturn(
          MaterialPriceDetailState.initial().copyWith(
            isFetching: false,
            isValidating: false,
            materialDetails: {
              for (final material in [orderMockItems[0]])
                MaterialQueryInfo.fromSavedOrder(orderMaterial: material):
                    MaterialPriceDetail.empty()
                        .copyWith
                        .price(finalPrice: MaterialPrice(10)),
            },
          ),
        );
        await tester.pumpWidget(savedOrderDetailPage());
        await tester.tap(find.text('Add to Cart'));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        final itemInfo = MaterialPriceDetail.empty()
            .copyWith
            .price(finalPrice: MaterialPrice(10));

        verify(() => CartEvent.addToCartFromList(items: [
              PriceAggregate(
                price: itemInfo.price,
                materialInfo: itemInfo.info,
                salesOrgConfig: salesOrgBlocMock.state.configs,
                quantity: orderMockItems[0].qty,
                discountedMaterialCount: cartBlocMock.state.zmgMaterialCount,
                bundle: Bundle.empty(),
                addedBonusList: [],
                stockInfo: StockInfo.empty().copyWith(
                  materialNumber: itemInfo.info.materialNumber,
                ),
              )
            ],
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),)).called(5);
      },
    );

    testWidgets(
      'Saved Order Detail when delete is pressed',
      (tester) async {
        when(() => materialPriceDetailBlocMock.state).thenReturn(
          MaterialPriceDetailState.initial().copyWith(
            isFetching: false,
            isValidating: false,
            materialDetails: {
              for (final material in [orderMockItems[0]])
                MaterialQueryInfo.fromSavedOrder(orderMaterial: material):
                    MaterialPriceDetail.empty()
                        .copyWith
                        .price(finalPrice: MaterialPrice(10)),
            },
          ),
        );
        await tester.pumpWidget(savedOrderDetailPage());
        await tester.tap(find.text('Delete'));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        verify(() => SavedOrderListEvent.delete(
              order: orderMock,
              user: userBlocMock.state.user,
            )).called(1);
        expect(autoRouterMock.current.name, const CartPageRoute().routeName);
      },
    );
  });
}
