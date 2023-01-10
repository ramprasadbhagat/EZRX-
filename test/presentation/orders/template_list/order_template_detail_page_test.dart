import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/presentation/orders/core/order_material_item.dart';
import 'package:ezrxmobile/presentation/orders/order_template/order_template_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

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

void main() {
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBLocMock;
  late MaterialPriceDetailBloc materialPriceDetailBlocMock;
  late CartBloc cartBlocMock;
  late OrderTemplate orderMock;
  late List<OrderTemplateMaterial> orderMockItems;
  late EligibilityBlocMock eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late OrderTemplateListBloc orderTemplateListBlocMock;

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
    when(() => userBlocMock.state).thenReturn(UserState.initial());
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
        ],
        child: OrderTemplateDetailPage(order: orderMock),
      );
    }

    testWidgets(
      'Order Template Detail with material items',
      (tester) async {
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
                MaterialQueryInfo.fromOrderTemplate(orderMaterial: material):
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
                MaterialQueryInfo.fromOrderTemplate(orderMaterial: material):
                    MaterialPriceDetail.empty().copyWith.price(
                          isValidMaterial: true,
                          isFOC: true,
                        ),
            },
          ),
        );
        await tester.pumpWidget(orderTemplateDetailPage());
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));
        expect(find.text('FOC'), findsAtLeastNWidgets(1));
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
                MaterialQueryInfo.fromOrderTemplate(orderMaterial: material):
                    MaterialPriceDetail.empty()
                        .copyWith
                        .price(finalPrice: MaterialPrice(10)),
            },
          ),
        );
        await tester.pumpWidget(orderTemplateDetailPage());
        expect(find.byType(OrderMaterialItem), findsAtLeastNWidgets(1));

        final currency = SalesOrganisationConfigs.empty().currency.code;
        expect(find.text('$currency 10.00'), findsAtLeastNWidgets(1));
      },
    );
    testWidgets('Reload order template and price when refresh page',
        (tester) async {
      when(() => materialPriceDetailBlocMock.state).thenReturn(
        MaterialPriceDetailState.initial().copyWith(
          materialDetails: {
            for (final material in orderMockItems)
              MaterialQueryInfo.fromOrderTemplate(orderMaterial: material):
                  MaterialPriceDetail.empty()
                      .copyWith
                      .price(finalPrice: MaterialPrice(10)),
          },
        ),
      );
      await tester.pumpWidget(orderTemplateDetailPage());
      await tester.fling(
          find.byType(RefreshIndicator), const Offset(0, 300), 600);
      await tester.pumpAndSettle(const Duration(seconds: 2));
    });
    testWidgets('Reload order template OrderInvalidWarning', (tester) async {
      when(() => materialPriceDetailBlocMock.state).thenReturn(
        MaterialPriceDetailState.initial().copyWith(
          materialDetails: {
            for (final material in orderMockItems)
              MaterialQueryInfo.fromOrderTemplate(orderMaterial: material):
                  MaterialPriceDetail.empty()
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
  });
}
