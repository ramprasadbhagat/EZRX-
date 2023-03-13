import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/order_template/order_template_item.dart';
import 'package:ezrxmobile/presentation/orders/order_template/order_template_list_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class OrderTemplateListBlocMock
    extends MockBloc<OrderTemplateListEvent, OrderTemplateListState>
    implements OrderTemplateListBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MaterialPriceDetailBlocMock
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockShipToCodeBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late OrderTemplateListBloc orderTemplateListBloc;
  late CartBloc cartBloc;
  late UserBloc userBloc;
  late MaterialPriceDetailBloc priceBloc;
  late MockCustomerCodeBloc mockCustomerBloc;
  late MockSalesOrgBloc mockSalesOrgBloc;
  late MockShipToCodeBloc mockShipToCodeBloc;
  late EligibilityBlocMock mockEligiblityBloc;

  var orderTemplatesMock = <OrderTemplate>[];
  late AppRouter autoRouterMock;

  setupLocator();

  setUpAll(() async {
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    WidgetsFlutterBinding.ensureInitialized();
    orderTemplatesMock =
        await OrderTemplateLocalDataSource().getOrderTemplates();
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    WidgetsFlutterBinding.ensureInitialized();

    orderTemplateListBloc = OrderTemplateListBlocMock();
    cartBloc = CartBlocMock();
    priceBloc = MaterialPriceDetailBlocMock();
    userBloc = UserBlocMock();
    mockCustomerBloc = MockCustomerCodeBloc();
    mockSalesOrgBloc = MockSalesOrgBloc();
    mockShipToCodeBloc = MockShipToCodeBloc();
    mockEligiblityBloc = EligibilityBlocMock();
    when(() => userBloc.state).thenReturn(UserState.initial());
    when(() => orderTemplateListBloc.state)
        .thenReturn(OrderTemplateListState.initial());
    when(() => cartBloc.state).thenReturn(CartState.initial());
    when(() => priceBloc.state).thenReturn(MaterialPriceDetailState.initial());
    when(() => mockCustomerBloc.state).thenReturn(CustomerCodeState.initial());
    when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
    when(() => mockShipToCodeBloc.state).thenReturn(ShipToCodeState.initial());

    when(() => mockEligiblityBloc.state).thenReturn(EligibilityState.initial());
  });

  Widget orderTemplatePage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => userBloc,
        ),
        BlocProvider<OrderTemplateListBloc>(
          create: (context) => orderTemplateListBloc,
        ),
        BlocProvider<MaterialPriceDetailBloc>(
          create: (context) => priceBloc,
        ),
        BlocProvider<CartBloc>(create: (context) => cartBloc),
        BlocProvider<CustomerCodeBloc>(create: (context) => mockCustomerBloc),
        BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
        BlocProvider<ShipToCodeBloc>(create: (context) => mockShipToCodeBloc),
        BlocProvider<EligibilityBloc>(create: (context) => mockEligiblityBloc),
      ],
      child: const OrderTemplateListPage(),
    );
  }

  group('Order Template List Screen', () {
    setUp(() {
      autoRouterMock = locator<AppRouter>();
    });

    testWidgets('Order Template Page Initialized', (tester) async {
      when(() => orderTemplateListBloc.state).thenReturn(
        OrderTemplateListState.initial().copyWith(
          isFetching: true,
        ),
      );

      await tester.pumpWidget(
        orderTemplatePage(),
      );

      final materialsListPage = find.byKey(const Key('OrderTemplateListPage'));
      expect(materialsListPage, findsOneWidget);
      final cartButton = find.byKey(const Key('CartButton'));
      expect(cartButton, findsOneWidget);
    });

    testWidgets('Show loading shimmer when loading', (tester) async {
      when(() => orderTemplateListBloc.state).thenReturn(
        OrderTemplateListState.initial().copyWith(
          isFetching: true,
        ),
      );

      await tester.pumpWidget(
        orderTemplatePage(),
      );

      final loadIndicator = find.byKey(
        const Key('loading-shimmer'),
      );
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(loadIndicator, findsOneWidget);
      expect(orderTemplateItem, findsNothing);
    });

    testWidgets('Show no order template found when order template is empty',
        (tester) async {
      when(() => orderTemplateListBloc.state).thenReturn(
        OrderTemplateListState.initial(),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(orderTemplatePage());
      });

      final noOrderTemplate = find.text('No order template found');
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(noOrderTemplate, findsOneWidget);
      expect(orderTemplateItem, findsNothing);
    });

    testWidgets('Test while have received order templates', (tester) async {
      when(() => orderTemplateListBloc.state).thenReturn(
        OrderTemplateListState.initial().copyWith(
          orderTemplateList: orderTemplatesMock,
        ),
      );
      final expectedStates = [
        OrderTemplateListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(Right(orderTemplatesMock)),
        ),
      ];

      whenListen(orderTemplateListBloc, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(orderTemplatePage());

      final noOrderTemplate = find.text('No order template found');
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(noOrderTemplate, findsNothing);
      expect(orderTemplateItem, findsAtLeastNWidgets(1));
    });

    testWidgets('Test fetch fail', (tester) async {
      when(() => orderTemplateListBloc.state).thenReturn(
        OrderTemplateListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
        ),
      );

      final expectedStates = [
        OrderTemplateListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ];

      whenListen(orderTemplateListBloc, Stream.fromIterable(expectedStates));

      await tester.runAsync(() async {
        await tester.pumpWidget(orderTemplatePage());
      });

      final noOrderTemplate = find.text('No order template found');
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(noOrderTemplate, findsOneWidget);
      expect(orderTemplateItem, findsNothing);
      await tester.pump();
      final errorMessage = find.byKey(const Key('snackBarMessage'));
      expect(errorMessage, findsOneWidget);
    });

    testWidgets('No Test fetch fail', (tester) async {
      when(() => orderTemplateListBloc.state).thenReturn(
        OrderTemplateListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
        ),
      );

      final expectedStates = [
        OrderTemplateListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
        ),
      ];

      whenListen(orderTemplateListBloc, Stream.fromIterable(expectedStates));

      await tester.runAsync(() async {
        await tester.pumpWidget(orderTemplatePage());
      });

      final noOrderTemplate = find.text('No order template found');
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(noOrderTemplate, findsOneWidget);
      expect(orderTemplateItem, findsNothing);
      await tester.pump();
    });

    testWidgets('Test order templates deletion', (tester) async {
      when(() => orderTemplateListBloc.state).thenReturn(
        OrderTemplateListState.initial().copyWith(
          orderTemplateList: orderTemplatesMock,
        ),
      );

      await tester.pumpWidget(orderTemplatePage());

      final noOrderTemplate = find.text('No order template found');
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(noOrderTemplate, findsNothing);
      expect(orderTemplateItem, findsAtLeastNWidgets(1));

      final oneSlidableItem = find.byKey(Key(
          'materialOption${orderTemplateListBloc.state.orderTemplateList.first.templateId}'));
      expect(oneSlidableItem, findsOneWidget);
      await tester.drag(oneSlidableItem, const Offset(-300, 0.0));
      await tester.pump();
      final removeWidget = tester.widget(find.byIcon(Icons.delete_outline));
      await tester.tap(find.byWidget(removeWidget));
      await tester.pump();
    });

    testWidgets('Test order templates Listtile', (tester) async {
      when(() => orderTemplateListBloc.state).thenReturn(
        OrderTemplateListState.initial().copyWith(
          orderTemplateList: orderTemplatesMock,
        ),
      );

      await tester.pumpWidget(orderTemplatePage());

      final noOrderTemplate = find.text('No order template found');
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(noOrderTemplate, findsNothing);
      expect(orderTemplateItem, findsAtLeastNWidgets(1));

      final listTile = find.byKey(Key(
          'orderListTile${orderTemplateListBloc.state.orderTemplateList.first.templateId}'));
      expect(listTile, findsAtLeastNWidgets(1));
      final removeWidget = tester.widget(find.byKey(Key(
          'orderListTile${orderTemplateListBloc.state.orderTemplateList.first.templateId}')));
      await tester.tap(find.byWidget(removeWidget));
      await tester.pump();
    });

    testWidgets('Reload order template and price when refresh page',
        (tester) async {
      await tester.pumpWidget(orderTemplatePage());
      expect(find.text('No order template found'), findsOneWidget);
      expect(find.byType(OrderTemplateItem), findsNothing);
      await tester.fling(
          find.byType(CustomScrollView), const Offset(0, 300), 600);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      verify(
        () => orderTemplateListBloc.add(OrderTemplateListEvent.fetch(
          User.empty(),
        )),
      ).called(1);
      verify(
        () => priceBloc.add(
          const MaterialPriceDetailEvent.initialized(),
        ),
      ).called(1);
    });
  });
}
