import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/presentation/orders/order_template/order_template_item.dart';
import 'package:ezrxmobile/presentation/orders/order_template/order_template_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/material_frame_wrapper.dart';
import '../../../utils/multi_bloc_provider_frame_wrapper.dart';

class OrderTemplateListBlocMock
    extends MockBloc<OrderTemplateListEvent, OrderTemplateListState>
    implements OrderTemplateListBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MaterialPriceDetailBlocMock
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

void main() {
  late OrderTemplateListBloc orderTemplateListBloc;
  late CartBloc cartBloc;
  late UserBloc userBloc;
  late MaterialPriceDetailBloc priceBloc;
  var orderTemplatesMock = <OrderTemplate>[];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    orderTemplatesMock =
        await OrderTemplateLocalDataSource().getOrderTemplates();
  });

  setUp(() async {
    orderTemplateListBloc = OrderTemplateListBlocMock();
    cartBloc = CartBlocMock();
    priceBloc = MaterialPriceDetailBlocMock();
    userBloc = UserBlocMock();
    when(() => userBloc.state).thenReturn(UserState.initial());
    when(() => orderTemplateListBloc.state)
        .thenReturn(OrderTemplateListState.initial());
    when(() => cartBloc.state).thenReturn(CartState.initial());
    when(() => priceBloc.state).thenReturn(MaterialPriceDetailState.initial());
  });

  Widget orderTemplatePage() => MaterialFrameWrapper(
        child: MultiBlocProvider(
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
          ],
          child: const OrderTemplateListPage(),
        ),
      );

  group('Order Template List Screen', () {
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
}
