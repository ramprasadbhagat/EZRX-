import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/order_template_item.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/material_frame_wrapper.dart';

class SavedOrderListBlocMock
    extends MockBloc<SavedOrderListEvent, SavedOrderListState>
    implements SavedOrderListBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

void main() {
  late SavedOrderListBloc savedOrderListBloc;
  final UserBloc userBlocMock = UserBlocMock();
  final SalesOrgBloc salesOrgBlocMock = SalesOrgBlocMock();
  final CustomerCodeBloc customerCodeBlocMock = CustomerCodeBlocMock();
  final ShipToCodeBloc shipToCodeBLocMock = ShipToCodeBlocMock();
  var savedOrdersMock = <SavedOrder>[];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    savedOrderListBloc = SavedOrderListBlocMock();

    savedOrdersMock = await OrderLocalDataSource().getSavedOrders();
    when(() => savedOrderListBloc.state)
        .thenReturn(SavedOrderListState.initial());

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeBLocMock.state).thenReturn(ShipToCodeState.initial());
  });

  group('Saved Order List Screen', () {
    testWidgets('Test that screen has been initialized', (tester) async {
      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: BlocProvider<SavedOrderListBloc>(
            create: (context) => savedOrderListBloc,
            child: const SavedOrderListPage(),
          ),
        ),
      );

      final saveOrderAppBar = find.text('Saved Orders');
      final noSavedOrder = find.text('No saved order found');
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(saveOrderAppBar, findsOneWidget);
      expect(noSavedOrder, findsOneWidget);
      expect(orderTemplateItem, findsNothing);
    });

    testWidgets('Test while state is fetching', (tester) async {
      when(() => savedOrderListBloc.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          isFetching: true,
        ),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: BlocProvider<SavedOrderListBloc>(
              create: (context) => savedOrderListBloc,
              child: const SavedOrderListPage(),
            ),
          ),
        );
      });

      final noSavedOrder = find.text('No saved order found');
      final loadIndicator = find.byKey(const Key('loadIndicator'));
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(loadIndicator, findsOneWidget);
      expect(noSavedOrder, findsNothing);
      expect(orderTemplateItem, findsNothing);
    });

    testWidgets('Test while have saved orders', (tester) async {
      when(() => savedOrderListBloc.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          savedOrders: savedOrdersMock,
          nextPageIndex: 1,
          canLoadMore: true,
        ),
      );

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: BlocProvider<SavedOrderListBloc>(
            create: (context) => savedOrderListBloc,
            child: const SavedOrderListPage(),
          ),
        ),
      );

      final noSavedOrder = find.text('No saved order found');
      final loadIndicator = find.byKey(const Key('loadIndicator'));
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(loadIndicator, findsNothing);
      expect(noSavedOrder, findsNothing);
      expect(orderTemplateItem, findsAtLeastNWidgets(1));
    });

    testWidgets('Test have saved orders and emit load more state include',
        (tester) async {
      when(() => savedOrderListBloc.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          savedOrders: savedOrdersMock,
          nextPageIndex: 1,
          canLoadMore: true,
          isFetching: true,
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: MultiBlocProvider(
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
                BlocProvider<SavedOrderListBloc>(
                  create: (context) => savedOrderListBloc,
                ),
              ],
              child: const SavedOrderListPage(),
            ),
          ),
        );
      });

      final noSavedOrder = find.text('No saved order found');
      final loadIndicator = find.byKey(const Key('loadIndicator'));
      final orderTemplateItem = find.byType(OrderTemplateItem);

      final gesture = await tester
          .startGesture(const Offset(50, 100)); //Position of the scrollview
      await gesture.moveBy(const Offset(50, -2000)); //How much to scroll by
      await tester.pump(const Duration(seconds: 2));

      expect(loadIndicator, findsOneWidget);
      expect(noSavedOrder, findsNothing);
      expect(orderTemplateItem, findsAtLeastNWidgets(1));
    });

    testWidgets('Test fetch fail', (tester) async {
      when(() => savedOrderListBloc.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
        ),
      );

      final expectedStates = [
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ];

      whenListen(savedOrderListBloc, Stream.fromIterable(expectedStates));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialFrameWrapper(
            child: BlocProvider<SavedOrderListBloc>(
              create: (context) => savedOrderListBloc,
              child: const SavedOrderListPage(),
            ),
          ),
        );
      });

      final noSavedOrder = find.text('No saved order found');
      final loadIndicator = find.byKey(const Key('loadIndicator'));
      final orderTemplateItem = find.byType(OrderTemplateItem);

      expect(noSavedOrder, findsOneWidget);
      expect(loadIndicator, findsNothing);
      expect(orderTemplateItem, findsNothing);
      await tester.pump();
      final errorMessage = find.byKey(const Key('snackBarMessage'));

      expect(errorMessage, findsOneWidget);
    });
  });
}
