import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/presentation/order/order_template/order_template_list_item.dart';
import 'package:ezrxmobile/presentation/order/order_template/order_template_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/multi_bloc_provider_frame_wrapper.dart';

class OrderTemplateListBlocMock
    extends MockBloc<OrderTemplateListEvent, OrderTemplateListState>
    implements OrderTemplateListBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  late OrderTemplateListBloc orderTemplateListBloc;
  late CartBloc cartBloc;

  var orderTemplatesMock = <OrderTemplate>[];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    orderTemplateListBloc = OrderTemplateListBlocMock();
    cartBloc = CartBlocMock();

    orderTemplatesMock =
        await OrderTemplateLocalDataSource().getOrderTemplates();
    when(() => orderTemplateListBloc.state)
        .thenReturn(OrderTemplateListState.initial());
    when(() => cartBloc.state).thenReturn(CartState.initial());
  });

  group('Order Template List Screen', () {
    // TODO: need Abdul help
    // testWidgets('Test that screen has been initialized', (tester) async {
    //   await tester.pumpWidget(
    //     MaterialFrameWrapper(
    //       child: BlocProvider<OrderTemplateListBloc>(
    //         create: (context) => orderTemplateListBloc,
    //         child: const OrderTemplateListPage(),
    //       ),
    //     ),
    //   );

    //   final orderTemplateAppBar = find.text('Manage Order Templates');
    //   final noOrderTemplate = find.text('No order template found');
    //   final orderTemplateItem = find.byType(OrderTemplateListItem);

    //   expect(orderTemplateAppBar, findsOneWidget);
    //   expect(noOrderTemplate, findsOneWidget);
    //   expect(orderTemplateItem, findsNothing);
    // });

    testWidgets('Test while state is fetching', (tester) async {
      when(() => orderTemplateListBloc.state).thenReturn(
        OrderTemplateListState.initial().copyWith(
          isFetching: true,
        ),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(
          MultiBlocProviderFrameWrapper(
            providers: [
              BlocProvider<OrderTemplateListBloc>(
                create: (context) => orderTemplateListBloc,
              ),
              BlocProvider<CartBloc>(
                create: (context) => cartBloc,
              ),
            ],
            child: const OrderTemplateListPage(),
          ),
        );
      });

      final noOrderTemplate = find.text('No order template found');
      final orderTemplateItem = find.byType(OrderTemplateListItem);

      expect(noOrderTemplate, findsNothing);
      expect(orderTemplateItem, findsNothing);
    });

    testWidgets('Test while have received order templates', (tester) async {
      when(() => orderTemplateListBloc.state).thenReturn(
        OrderTemplateListState.initial().copyWith(
          orderTemplateList: orderTemplatesMock,
        ),
      );

      await tester.pumpWidget(
        MultiBlocProviderFrameWrapper(
          providers: [
            BlocProvider<OrderTemplateListBloc>(
              create: (context) => orderTemplateListBloc,
            ),
            BlocProvider<CartBloc>(
              create: (context) => cartBloc,
            ),
          ],
          child: const OrderTemplateListPage(),
        ),
      );

      final noOrderTemplate = find.text('No order template found');
      final orderTemplateItem = find.byType(OrderTemplateListItem);

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
        await tester.pumpWidget(
          MultiBlocProviderFrameWrapper(
            providers: [
              BlocProvider<OrderTemplateListBloc>(
                create: (context) => orderTemplateListBloc,
              ),
              BlocProvider<CartBloc>(
                create: (context) => cartBloc,
              ),
            ],
            child: const OrderTemplateListPage(),
          ),
        );
      });

      final noOrderTemplate = find.text('No order template found');
      final orderTemplateItem = find.byType(OrderTemplateListItem);

      expect(noOrderTemplate, findsOneWidget);
      expect(orderTemplateItem, findsNothing);
      await tester.pump();
      final errorMessage = find.byKey(const Key('snackBarMessage'));
      expect(errorMessage, findsOneWidget);
    });
  });
}
