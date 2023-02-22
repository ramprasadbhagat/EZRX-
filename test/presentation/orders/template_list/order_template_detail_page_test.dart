import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/core/order_material_item.dart';
import 'package:ezrxmobile/presentation/orders/order_template/order_template_detail_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../home/selectors/shipping_address_selector_test.dart';

List<MaterialQueryInfo> _getMaterialList(List<MaterialItem> items) {
  final materialList = items
      .map((item) => item.type.isBundle
          ? item.materials
              .map((material) =>
                  MaterialQueryInfo.fromBundles(materialInfo: material))
              .toList()
          : [MaterialQueryInfo.fromSavedOrder(orderMaterial: item)])
      .toList()
      .expand((element) => element)
      .toList();

  return materialList;
}

class AutoRouterMock extends Mock implements AppRouter {}

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

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class OrderTemplateListBlocMock
    extends MockBloc<OrderTemplateListEvent, OrderTemplateListState>
    implements OrderTemplateListBloc {}

class TenderContractListBlocMock
    extends MockBloc<TenderContractListEvent, TenderContractListState>
    implements TenderContractListBloc {}

void main() {
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBLocMock;
  late MaterialPriceDetailBloc materialPriceDetailBlocMock;
  late CartBloc cartBlocMock;
  late OrderTemplate orderMock;
  late List<MaterialItem> orderMockItems;
  late EligibilityBlocMock eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late OrderTemplateListBloc orderTemplateListBlocMock;
  late TenderContractListBloc tenderContractListBlocMock;

  setUpAll(() async {
    setupLocator();

    final orders = await OrderTemplateLocalDataSource().getOrderTemplates();
    orderMock = orders.first;
    orderMockItems = orderMock.items;
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    WidgetsFlutterBinding.ensureInitialized();
    eligibilityBlocMock = EligibilityBlocMock();

    userBlocMock = MockUserBloc();
    salesOrgBlocMock = MockSalesOrgBloc();
    customerCodeBlocMock = MockCustomerCodeBloc();
    shipToCodeBLocMock = MockShipToCodeBloc();
    materialPriceDetailBlocMock = MockMaterialPriceDetailBloc();
    cartBlocMock = MockCartBloc();
    orderTemplateListBlocMock = OrderTemplateListBlocMock();
    tenderContractListBlocMock = TenderContractListBlocMock();
    when(() => userBlocMock.state).thenReturn(
      UserState.initial().copyWith(
        user: fakeUser,
      ),
    );
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeBLocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => materialPriceDetailBlocMock.state)
        .thenReturn(MaterialPriceDetailState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => orderTemplateListBlocMock.state)
        .thenReturn(OrderTemplateListState.initial());
    when(() => tenderContractListBlocMock.state)
        .thenReturn(TenderContractListState.initial());
  });

  group('Order Template Detail Screen', () {
    setUp(() {
      autoRouterMock = locator<AppRouter>();
    });

    Widget orderTemplateDetailPage() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
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
          BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock),
          BlocProvider<OrderTemplateListBloc>(
              create: (context) => orderTemplateListBlocMock),
          BlocProvider<TenderContractListBloc>(
            create: (context) => tenderContractListBlocMock,
          ),
        ],
        child: OrderTemplateDetailPage(order: orderMock),
      );
    }

    testWidgets('Reload order template and price when refresh page',
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
      await tester.pumpWidget(orderTemplateDetailPage());
      await tester.fling(
          find.byType(RefreshIndicator), const Offset(0, 300), 600);
      await tester.pumpAndSettle(const Duration(
        seconds: 3,
      ));
      // verify(
      //   () => materialPriceDetailBlocMock.add(MaterialPriceDetailEvent.refresh(
      //     user: User.empty(),
      //     customerCode: CustomerCodeInfo.empty(),
      //     salesOrganisation: SalesOrganisation.empty(),
      //     salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
      //     shipToCode: ShipToInfo.empty(),
      //     materialInfoList: <MaterialQueryInfo>[
      //       MaterialQueryInfo.empty().copyWith(
      //         value: MaterialNumber('000000000011007178'),
      //         materialGroup4: MaterialGroup.four('6PA'),
      //         description: '(TG)Amoxil Cap 500mg 1x100\'s',
      //         principalName: 'NA',
      //         qty: MaterialQty(5),
      //       ),
      //       MaterialQueryInfo.empty().copyWith(
      //         value: MaterialNumber('000000000023007401'),
      //         materialGroup2: MaterialGroup.two('50'),
      //         materialGroup4: MaterialGroup.four('6GS'),
      //         description: 'Veg Glucosamine Sulphate 1500mg  2x60s',
      //         principalName: 'Ocean Health Pte Ltd',
      //         qty: MaterialQty(1),
      //       ),
      //       MaterialQueryInfo.empty().copyWith(
      //         value: MaterialNumber('000000000023007377'),
      //         materialGroup2: MaterialGroup.two('50'),
      //         materialGroup4: MaterialGroup.four('6GS'),
      //         description: 'Skin Nutrition Capsule 2x60s',
      //         principalName: 'Ocean Health Pte Ltd',
      //         qty: MaterialQty(1),
      //       ),
      //       MaterialQueryInfo.empty().copyWith(
      //         value: MaterialNumber('000000000023007310'),
      //         materialGroup2: MaterialGroup.two('50'),
      //         materialGroup4: MaterialGroup.four('6GS'),
      //         description: 'Joint RX Cap w       300s + 50g',
      //         principalName: 'Ocean Health Pte Ltd',
      //         qty: MaterialQty(1),
      //       ),
      //       MaterialQueryInfo.empty().copyWith(
      //         value: MaterialNumber('000000000023007396'),
      //         materialGroup2: MaterialGroup.two('50'),
      //         materialGroup4: MaterialGroup.four('6GS'),
      //         description: 'Joint GS-500        Cap          270\'s',
      //         principalName: 'Ocean Health Pte Ltd',
      //         qty: MaterialQty(1),
      //       ),
      //     ],
      //     pickAndPack: '',
      //   )),
      // ).called(1);
    });

    testWidgets(
      'Order Template Detail with material items',
      (tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        when(() => materialPriceDetailBlocMock.state).thenReturn(
            MaterialPriceDetailState.initial().copyWith(isValidating: false));
        final expectedStates = [
          MaterialPriceDetailState.initial().copyWith(isValidating: false)
        ];

        whenListen(
            materialPriceDetailBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(orderTemplateDetailPage());
        expect(
            find.byKey(const Key('OrderTemplateDetailPage')), findsOneWidget);
        expect(find.text(orderMock.templateName), findsOneWidget);
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));
        expect(find.text('Add to Cart'), findsOneWidget);
        expect(find.text('Delete'), findsOneWidget);
      },
    );
    testWidgets(
      'Order Template Detail with all materials invalid',
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
        await tester.pumpWidget(orderTemplateDetailPage());
        await tester.pump();
        expect(find.byKey(const Key('invalidOrderWarning')), findsOneWidget);
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));
        expect(find.text('Invalid'), findsAtLeastNWidgets(1));
        expect(find.text('NA'), findsAtLeastNWidgets(1));
      },
    );

    testWidgets(
      'Order Template Detail with price loading',
      (tester) async {
        when(() => materialPriceDetailBlocMock.state).thenReturn(
          MaterialPriceDetailState.initial().copyWith(
            isValidating: true,
          ),
        );
        await tester.pumpWidget(orderTemplateDetailPage());
        expect(
            find.byKey(const Key('orderActionButtonShimmer')), findsOneWidget);
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));
        expect(find.byKey(const Key('price-loading')), findsAtLeastNWidgets(1));
      },
    );

    testWidgets(
      'Order Template Detail with FOC material',
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
        await tester.pumpWidget(orderTemplateDetailPage());
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));
        expect(find.text(': FOC'), findsAtLeastNWidgets(1));
        expect(find.text('Add to Cart'), findsOneWidget);
        expect(find.text('Delete'), findsOneWidget);
      },
    );

    testWidgets(
      'Order Template Detail with valid material and price displayed',
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
        await tester.pumpWidget(orderTemplateDetailPage());
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));

        final currency = SalesOrganisationConfigs.empty().currency.code;
        expect(find.text(': $currency 10.00'), findsAtLeastNWidgets(1));
      },
    );

    testWidgets('Order Template Detail with all bundle materials invalid',
        (tester) async {
      final materialInfoList = _getMaterialList(orderMockItems);
      final bundleItems = orderMockItems.where((item) => item.type.isBundle);
      final bundleMaterials = bundleItems
          .map((item) => item.materials
              .map((material) =>
                  MaterialQueryInfo.fromBundles(materialInfo: material))
              .toList())
          .toList()
          .expand((element) => element)
          .toList();

      final materialDetails = {
        for (final materialInfo in materialInfoList)
          materialInfo: MaterialPriceDetail.empty().copyWith.price(
                isValidMaterial: !bundleMaterials.contains(materialInfo),
              )
      };

      final customerCodeInfo = eligibilityBlocMock.state.customerCodeInfo;
      final salesOrgConfigs = eligibilityBlocMock.state.salesOrgConfigs;
      final salesOrganisation = eligibilityBlocMock.state.salesOrganisation;
      final doNotAllowOutOfStockMaterials =
          eligibilityBlocMock.state.doNotAllowOutOfStockMaterials;
      final shipToInfo = shipToCodeBLocMock.state.shipToInfo;

      final orderMockItemsWithoutBundle =
          orderMockItems.where((item) => !item.type.isBundle).toList();
      final withoutBundleCartItemList = orderMockItemsWithoutBundle
          .map(
            (item) => CartItem.materialFromOrder(
              priceDetailMap: materialDetails,
              material: item,
              salesConfigs: eligibilityBlocMock.state.salesOrgConfigs,
              tenderContractMap: {},
            ),
          )
          .toList();

      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      when(() => materialPriceDetailBlocMock.state).thenReturn(
        MaterialPriceDetailState.initial().copyWith(
          materialDetails: materialDetails,
        ),
      );

      await tester.pumpWidget(orderTemplateDetailPage());

      final addToCartButton = find.byKey(const Key('onAddToCartPressed'));
      await tester.tap(addToCartButton);

      verify(() => cartBlocMock.add(CartEvent.replaceWithOrderItems(
            items: withoutBundleCartItemList,
            customerCodeInfo: customerCodeInfo,
            salesOrganisation: salesOrganisation,
            salesOrganisationConfigs: salesOrgConfigs,
            shipToInfo: shipToInfo,
            doNotallowOutOfStockMaterial: doNotAllowOutOfStockMaterials,
          ))).called(1);
    });

    testWidgets('Order Template Detail with all bundle materials valid',
        (tester) async {
      final materialInfoList = _getMaterialList(orderMockItems);

      final materialDetails = {
        for (final materialInfo in materialInfoList)
          materialInfo: MaterialPriceDetail.empty().copyWith.price(
                isValidMaterial: true,
              ),
      };

      final customerCodeInfo = eligibilityBlocMock.state.customerCodeInfo;
      final salesOrgConfigs = eligibilityBlocMock.state.salesOrgConfigs;
      final salesOrganisation = eligibilityBlocMock.state.salesOrganisation;
      final doNotAllowOutOfStockMaterials =
          eligibilityBlocMock.state.doNotAllowOutOfStockMaterials;
      final shipToInfo = shipToCodeBLocMock.state.shipToInfo;

      final cartItemList = orderMockItems
          .map(
            (item) => item.type.isBundle
                ? CartItem.bundleFromOrder(
                    priceDetailMap: materialDetails,
                    savedItem: item,
                    salesConfigs: eligibilityBlocMock.state.salesOrgConfigs,
                  )
                : CartItem.materialFromOrder(
                    priceDetailMap: materialDetails,
                    material: item,
                    salesConfigs: eligibilityBlocMock.state.salesOrgConfigs,
                    tenderContractMap: {},
                  ),
          )
          .toList();

      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      when(() => materialPriceDetailBlocMock.state).thenReturn(
        MaterialPriceDetailState.initial().copyWith(
          materialDetails: materialDetails,
        ),
      );

      await tester.pumpWidget(orderTemplateDetailPage());

      final addToCartButton = find.byKey(const Key('onAddToCartPressed'));
      await tester.tap(addToCartButton);

      verify(() => cartBlocMock.add(CartEvent.replaceWithOrderItems(
            items: cartItemList,
            customerCodeInfo: customerCodeInfo,
            salesOrganisation: salesOrganisation,
            salesOrganisationConfigs: salesOrgConfigs,
            shipToInfo: shipToInfo,
            doNotallowOutOfStockMaterial: doNotAllowOutOfStockMaterials,
          ))).called(1);
    });

    testWidgets('Reload order template OrderInvalidWarning', (tester) async {
      final materialInfoList = _getMaterialList(orderMockItems);
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      when(() => materialPriceDetailBlocMock.state).thenReturn(
        MaterialPriceDetailState.initial().copyWith(
          materialDetails: {
            for (final materialInfo in materialInfoList)
              materialInfo: MaterialPriceDetail.empty()
                  .copyWith
                  .price(finalPrice: MaterialPrice(10)),
          },
        ),
      );
      await tester.pumpWidget(orderTemplateDetailPage());
      final orderAction = find.byKey(const Key('orderAction'));
      final addToCart = find.text('Add to Cart');
      expect(orderAction, findsOneWidget);
      expect(addToCart, findsOneWidget);
      final delete = find.text('Delete');
      expect(delete, findsOneWidget);

      final addToCartPressed =
          tester.widget(find.byKey(const Key('onAddToCartPressed')));
      await tester.tap(find.byWidget(addToCartPressed));
      await tester.pump();
      final onDeletePressed =
          tester.widget(find.byKey(const Key('onDeletePressed')));
      await tester.tap(find.byWidget(onDeletePressed));
      await tester.pump();
    });

    testWidgets(
      'Test Order Template Disable create order Add To Cart Button Hidden - Return Admin',
      (tester) async {
        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          role: Role(
            type: RoleType('return_admin'),
            description: '',
            id: '',
            name: '',
          ),
        );

        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(orderTemplateDetailPage());
        await tester.pump();

        final addToCartButton = find.byKey(const Key('onAddToCartPressed'));
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Order Template Disable create order Add To Cart Button Hidden - Return Requestor',
      (tester) async {
        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          role: Role(
            type: RoleType('return_requestor'),
            description: '',
            id: '',
            name: '',
          ),
        );

        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(orderTemplateDetailPage());
        await tester.pump();

        final addToCartButton = find.byKey(const Key('onAddToCartPressed'));
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Order Template Disable create order Add To Cart Button Hidden - Return Approver',
      (tester) async {
        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          role: Role(
            type: RoleType('return_approver'),
            description: '',
            id: '',
            name: '',
          ),
        );

        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(orderTemplateDetailPage());
        await tester.pump();

        final addToCartButton = find.byKey(const Key('onAddToCartPressed'));
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Order Template Disable create order Add To Cart Button Hidden - disableCreateOrder true',
      (tester) async {
        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          disableCreateOrder: true,
          role: Role(
            type: RoleType('fakeRole'),
            description: '',
            id: '',
            name: '',
          ),
        );

        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(orderTemplateDetailPage());
        await tester.pump();

        final addToCartButton = find.byKey(const Key('onAddToCartPressed'));
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Order Template Disable create order Add To Cart Button Hidden - disableCreateOrder false',
      (tester) async {
        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          disableCreateOrder: false,
          role: Role(
            type: RoleType('fakeRole'),
            description: '',
            id: '',
            name: '',
          ),
        );

        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(orderTemplateDetailPage());
        await tester.pump();

        final addToCartButton = find.byKey(const Key('onAddToCartPressed'));
        expect(addToCartButton, findsOneWidget);
      },
    );
  });
}
