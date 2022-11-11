import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_item.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_list_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

import '../../../utils/material_frame_wrapper.dart';

class MockSavedOrderListBloc
    extends MockBloc<SavedOrderListEvent, SavedOrderListState>
    implements SavedOrderListBloc {}

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

void main() {
  late SavedOrderListBloc savedOrderListBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBLocMock;
  late MaterialPriceDetailBloc materialPriceDetailBlocMock;
  late CartBloc cartBlocMock;
  var savedOrdersMock = <SavedOrder>[];

  setUpAll(() async {
    savedOrdersMock = await OrderLocalDataSource().getSavedOrders();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    savedOrderListBlocMock = MockSavedOrderListBloc();
    userBlocMock = MockUserBloc();
    salesOrgBlocMock = MockSalesOrgBloc();
    customerCodeBlocMock = MockCustomerCodeBloc();
    shipToCodeBLocMock = MockShipToCodeBloc();
    materialPriceDetailBlocMock = MockMaterialPriceDetailBloc();
    cartBlocMock = MockCartBloc();

    when(() => savedOrderListBlocMock.state)
        .thenReturn(SavedOrderListState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeBLocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => materialPriceDetailBlocMock.state)
        .thenReturn(MaterialPriceDetailState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
  });

  Widget savedOrderPage() => MaterialFrameWrapper(
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
              create: (context) => savedOrderListBlocMock,
            ),
            BlocProvider<MaterialPriceDetailBloc>(
              create: (context) => materialPriceDetailBlocMock,
            ),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          ],
          child: const SavedOrderListPage(),
        ),
      );

  group('Saved Order List Screen', () {
    testWidgets('Test when refresh page', (tester) async {
      await tester.pumpWidget(savedOrderPage());
      expect(find.text('Saved Orders'), findsOneWidget);
      expect(find.text('No saved order found'), findsOneWidget);
      expect(find.byType(SavedOrderItem), findsNothing);
      await tester.fling(
          find.byType(CustomScrollView), const Offset(0, 300), 600);
      await tester.pump(const Duration(seconds: 2));
      await tester.pump(const Duration(seconds: 1));
      verify(
        () => savedOrderListBlocMock.add(
          SavedOrderListEvent.fetch(
            userInfo: User.empty(),
            selectedSalesOrganisation: SalesOrganisation.empty(),
            selectedCustomerCode: CustomerCodeInfo.empty(),
            selectedShipTo: ShipToInfo.empty(),
          ),
        ),
      ).called(1);
      verify(
        () => materialPriceDetailBlocMock.add(
          const MaterialPriceDetailEvent.initialized(),
        ),
      ).called(1);
    });

    testWidgets('Test while state is fetching', (tester) async {
      when(() => savedOrderListBlocMock.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          isFetching: true,
        ),
      );
      await tester.pumpWidget(savedOrderPage());
      await tester.pump(const Duration(milliseconds: 100));
      final loadIndicator = find.byKey(const Key('loadIndicator'));
      final orderTemplateItem = find.byType(SavedOrderItem);

      expect(loadIndicator, findsOneWidget);
      expect(orderTemplateItem, findsNothing);
    });

    testWidgets('Test while have saved orders', (tester) async {
      when(() => savedOrderListBlocMock.state)
          .thenReturn(SavedOrderListState.initial().copyWith(
        savedOrders: savedOrdersMock,
        nextPageIndex: 1,
        canLoadMore: true,
        isFetching: false,
      ));

      await tester.pumpWidget(savedOrderPage());
      await tester.pump(const Duration(milliseconds: 100));
      final orderTemplateItem = find.byType(SavedOrderItem);
      expect(orderTemplateItem, findsAtLeastNWidgets(1));
    });

    testWidgets('Test have saved orders and emit load more state include',
        (tester) async {
      when(() => savedOrderListBlocMock.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          savedOrders: savedOrdersMock,
          nextPageIndex: 1,
          canLoadMore: true,
          isFetching: true,
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(savedOrderPage());
      });
      final loadIndicator = find.byKey(const Key('loadIndicator'));
      final orderTemplateItem = find.byType(SavedOrderItem);
      await tester.fling(
          find.byType(CustomScrollView), const Offset(0, -4000), 8000);
      await tester.pump(const Duration(seconds: 2));
      expect(loadIndicator, findsOneWidget);
      expect(orderTemplateItem, findsAtLeastNWidgets(1));
    });

    testWidgets('Test fetch fail', (tester) async {
      when(() => savedOrderListBlocMock.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
        ),
      );
      whenListen(
          savedOrderListBlocMock,
          Stream.fromIterable([
            SavedOrderListState.initial().copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-error'),
                ),
              ),
            ),
          ]));
      await tester.runAsync(() async {
        await tester.pumpWidget(savedOrderPage());
      });
      final noSavedOrder = find.text('No saved order found');
      final orderTemplateItem = find.byType(SavedOrderItem);
      expect(noSavedOrder, findsOneWidget);
      expect(orderTemplateItem, findsNothing);
      await tester.pump();
      final errorMessage = find.byKey(const Key('snackBarMessage'));
      expect(errorMessage, findsOneWidget);
    });
  });

  group('Saved Order Item', () {
    testWidgets('Order Item slide to delete', (tester) async {
      final order = savedOrdersMock.first;
      when(() => savedOrderListBlocMock.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          savedOrders: [order],
          nextPageIndex: 1,
          canLoadMore: true,
          isFetching: true,
        ),
      );

      await tester.pumpWidget(savedOrderPage());
      await tester.pump(const Duration(milliseconds: 100));
      final orderTemplateItem = find.byType(SavedOrderItem);
      expect(orderTemplateItem, findsOneWidget);
      await tester.drag(
          find.byKey(const Key('slidable')), const Offset(-300, 0.0));
      await tester.pump();
      final removeWidget = tester.widget(find.byIcon(Icons.delete_outline));
      await tester.tap(find.byWidget(removeWidget));
      await tester.pump();

      verify(() => savedOrderListBlocMock.add(
              SavedOrderListEvent.delete(order: order, user: User.empty())))
          .called(1);
    });

    testWidgets('Press order item to go to Detail screen', (tester) async {
      final order = savedOrdersMock.first;
      final mockRouter = AppRouter();
      when(() => savedOrderListBlocMock.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          savedOrders: [order],
          nextPageIndex: 1,
          canLoadMore: true,
          isFetching: true,
        ),
      );

      await tester.pumpWidget(StackRouterScope(
          controller: mockRouter, stateHash: 0, child: savedOrderPage()));
      await tester.pump(const Duration(milliseconds: 100));
      final orderTemplateItem = find.byType(SavedOrderItem);
      expect(orderTemplateItem, findsOneWidget);
      await tester.tap(orderTemplateItem);
      await tester.pump();

      verify(() =>
          materialPriceDetailBlocMock.add(MaterialPriceDetailEvent.fetch(
            user: User.empty(),
            customerCode: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToCode: ShipToInfo.empty(),
            materialInfoList: order.items
                .map((e) => MaterialQueryInfo.fromSavedOrder(orderMaterial: e))
                .toList(),
          ))).called(1);
      await tester.pump();
      expect(mockRouter.current.name,
          SavedOrderDetailPageRoute(order: order).routeName);
    });
  });
}
