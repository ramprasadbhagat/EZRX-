import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_bloc.dart';
import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_view_model.dart';
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
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_material_item.dart';
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

class MockValidCustomerMaterialBloc
    extends MockBloc<ValidCustomerMaterialEvent, ValidCustomerMaterialState>
    implements ValidCustomerMaterialBloc {}

class MockMaterialPriceDetailBloc
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  final SavedOrderListBloc savedOrderListBloc = SavedOrderListBlocMock();
  final UserBloc userBlocMock = UserBlocMock();
  final SalesOrgBloc salesOrgBlocMock = SalesOrgBlocMock();
  final CustomerCodeBloc customerCodeBlocMock = CustomerCodeBlocMock();
  final ShipToCodeBloc shipToCodeBLocMock = ShipToCodeBlocMock();
  final ValidCustomerMaterialBloc validCustomerMaterialBlocMock =
      MockValidCustomerMaterialBloc();
  final MaterialPriceDetailBloc materialPriceDetailBlocMock =
      MockMaterialPriceDetailBloc();
  final CartBloc cartBlocMock = MockCartBloc();
  var savedOrdersMock = <SavedOrder>[];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    savedOrdersMock = await OrderLocalDataSource().getSavedOrders();
    when(() => savedOrderListBloc.state)
        .thenReturn(SavedOrderListState.initial());

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeBLocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => validCustomerMaterialBlocMock.state)
        .thenReturn(ValidCustomerMaterialState.initial());
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
              create: (context) => savedOrderListBloc,
            ),
            BlocProvider<ValidCustomerMaterialBloc>(
              create: (context) => validCustomerMaterialBlocMock,
            ),
            BlocProvider<MaterialPriceDetailBloc>(
              create: (context) => materialPriceDetailBlocMock,
            ),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          ],
          child: const SavedOrderListPage(),
        ),
      );

  // TODO: Implement test case for template item fetching price
  group('Saved Order List Screen', () {
    testWidgets('Test when refresh page', (tester) async {
      final expectedStates = [SavedOrderListState.initial()];

      whenListen(savedOrderListBloc, Stream.fromIterable(expectedStates));

      await tester.runAsync(() async {
        await tester.pumpWidget(savedOrderPage());
      });
      await tester.fling(
          find.byType(CustomScrollView), const Offset(0, 300), 600);
      await tester.pump(const Duration(seconds: 2));
      await tester.pump(const Duration(seconds: 1));

      verify(
        () => savedOrderListBloc.add(
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
      verify(
        () => validCustomerMaterialBlocMock.add(
          const ValidCustomerMaterialEvent.initialized(),
        ),
      ).called(2);
    });

    testWidgets('Test that screen has been initialized', (tester) async {
      await tester.pumpWidget(savedOrderPage());

      final saveOrderAppBar = find.text('Saved Orders');
      final noSavedOrder = find.text('No saved order found');
      final orderTemplateItem = find.byType(SavedOrderItem);

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
        await tester.pumpWidget(savedOrderPage());
      });

      final noSavedOrder = find.text('No saved order found');
      final loadIndicator = find.byKey(const Key('loadIndicator'));
      final orderTemplateItem = find.byType(SavedOrderItem);

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

      await tester.runAsync(() async {
        await tester.pumpWidget(savedOrderPage());
      });

      final noSavedOrder = find.text('No saved order found');
      final loadIndicator = find.byKey(const Key('loadIndicator'));
      final orderTemplateItem = find.byType(SavedOrderItem);

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
      when(() => validCustomerMaterialBlocMock.state).thenReturn(
        ValidCustomerMaterialState.initial(),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(savedOrderPage());
      });
      final noSavedOrder = find.text('No saved order found');
      final loadIndicator = find.byKey(const Key('loadIndicator'));
      final orderTemplateItem = find.byType(SavedOrderItem);
      await tester.fling(
          find.byType(CustomScrollView), const Offset(0, -4000), 8000);
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
        await tester.pumpWidget(savedOrderPage());
      });

      final noSavedOrder = find.text('No saved order found');
      final loadIndicator = find.byKey(const Key('loadIndicator'));
      final orderTemplateItem = find.byType(SavedOrderItem);

      expect(noSavedOrder, findsOneWidget);
      expect(loadIndicator, findsNothing);
      expect(orderTemplateItem, findsNothing);
      await tester.pump();
      final errorMessage = find.byKey(const Key('snackBarMessage'));

      expect(errorMessage, findsOneWidget);
    });
  });

  group('Saved Order Item', () {
    testWidgets('Expand order item and validating materials', (tester) async {
      final orderId = savedOrdersMock.first.id;
      when(() => savedOrderListBloc.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          savedOrders: savedOrdersMock.getRange(0, 1).toList(),
          nextPageIndex: 1,
          canLoadMore: true,
        ),
      );
      when(() => validCustomerMaterialBlocMock.state).thenReturn(
        ValidCustomerMaterialState.initial().copyWith(validMaterialState: {
          orderId: const ValidCustomerMaterialViewModel(
            status: ValidatingStatus.loading,
          )
        }),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(savedOrderPage());
      });
      final orderTemplateItem = find.byType(SavedOrderItem);
      expect(orderTemplateItem, findsOneWidget);
      await tester.tap(orderTemplateItem);
      await tester.pump();
      final materialItemShimmer =
          find.byKey(const Key('material-item-shimmer'));
      expect(materialItemShimmer, findsOneWidget);
    });

    testWidgets('Order Item is validating success and start to fetch price',
        (tester) async {
      final order = savedOrdersMock.first;
      final orderId = order.id;

      when(() => savedOrderListBloc.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          savedOrders: savedOrdersMock.getRange(0, 1).toList(),
          nextPageIndex: 1,
          canLoadMore: true,
        ),
      );

      final expectedValidCustomerMaterialStates = [
        ValidCustomerMaterialState.initial().copyWith(validMaterialState: {
          orderId: const ValidCustomerMaterialViewModel(
            status: ValidatingStatus.loading,
          )
        }),
        ValidCustomerMaterialState.initial().copyWith(validMaterialState: {
          orderId: ValidCustomerMaterialViewModel(
            validMaterialNumbers:
                order.items.map((e) => e.materialNumber).toList(),
            status: ValidatingStatus.success,
          )
        }),
      ];

      whenListen(validCustomerMaterialBlocMock,
          Stream.fromIterable(expectedValidCustomerMaterialStates));
      await tester.runAsync(() async {
        await tester.pumpWidget(savedOrderPage());
      });
      final orderTemplateItem = find.byType(SavedOrderItem);
      expect(orderTemplateItem, findsOneWidget);
      await tester.tap(orderTemplateItem);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      verify(
        () => materialPriceDetailBlocMock.add(
          MaterialPriceDetailEvent.fetch(
            salesOrganisation: SalesOrganisation.empty(),
            customerCode: CustomerCodeInfo.empty(),
            shipToCode: ShipToInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            materialInfos: order.items
                .map(
                  (e) => MaterialQueryInfo.fromSavedOrder(orderMaterial: e),
                )
                .toList(),
          ),
        ),
      ).called(1);

      expect(
        order
            .validMaterialItems(
              validCustomerMaterialBlocMock.state.validMaterialNumberById(
                order.id,
              ),
            )
            .length,
        order.items.length,
      );
      expect(
        find.byType(SavedOrderMaterialItem),
        findsNWidgets(
          order.items.length,
        ),
      );
    });
    testWidgets(
        'Order Item is validating success and show loading shimmer on each material items price',
        (tester) async {
      final order = savedOrdersMock.first;
      final orderId = order.id;

      when(() => savedOrderListBloc.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          savedOrders: savedOrdersMock.getRange(0, 1).toList(),
          nextPageIndex: 1,
          canLoadMore: true,
        ),
      );

      final expectedValidCustomerMaterialStates = [
        ValidCustomerMaterialState.initial().copyWith(validMaterialState: {
          orderId: const ValidCustomerMaterialViewModel(
            status: ValidatingStatus.loading,
          )
        }),
        ValidCustomerMaterialState.initial().copyWith(validMaterialState: {
          orderId: ValidCustomerMaterialViewModel(
            validMaterialNumbers:
                order.items.map((e) => e.materialNumber).toList(),
            status: ValidatingStatus.success,
          )
        }),
      ];

      whenListen(validCustomerMaterialBlocMock,
          Stream.fromIterable(expectedValidCustomerMaterialStates));

      when(() => materialPriceDetailBlocMock.state).thenReturn(
        MaterialPriceDetailState.initial().copyWith(
          isFetching: true,
        ),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(savedOrderPage());
      });
      final orderTemplateItem = find.byType(SavedOrderItem);
      expect(orderTemplateItem, findsOneWidget);
      await tester.tap(orderTemplateItem);
      await tester.pump();

      expect(
        find.byKey(const Key('price-loading')),
        findsNWidgets(
          order.items.length,
        ),
      );
    });

    // TODO: need Hob help
    // testWidgets(
    //     'Order Item is validating success and load price success on each material items',
    //     (tester) async {
    //   final order = savedOrdersMock.first;
    //   final orderId = order.id;

    //   when(() => savedOrderListBloc.state).thenReturn(
    //     SavedOrderListState.initial().copyWith(
    //       savedOrders: savedOrdersMock.getRange(0, 1).toList(),
    //       nextPageIndex: 1,
    //       canLoadMore: true,
    //     ),
    //   );

    //   final expectedValidCustomerMaterialStates = [
    //     ValidCustomerMaterialState.initial().copyWith(validMaterialState: {
    //       orderId: const ValidCustomerMaterialViewModel(
    //         status: ValidatingStatus.loading,
    //       )
    //     }),
    //     ValidCustomerMaterialState.initial().copyWith(validMaterialState: {
    //       orderId: ValidCustomerMaterialViewModel(
    //         validMaterialNumbers:
    //             order.items.map((e) => e.materialNumber).toList(),
    //         status: ValidatingStatus.success,
    //       )
    //     }),
    //   ];

    //   whenListen(validCustomerMaterialBlocMock,
    //       Stream.fromIterable(expectedValidCustomerMaterialStates));

    //   when(() => materialPriceDetailBlocMock.state).thenReturn(
    //     MaterialPriceDetailState.initial().copyWith(materialDetails: {
    //       for (final material in order.items)
    //         MaterialQueryInfo.fromSavedOrder(orderMaterial: material):
    //             MaterialPriceDetail.empty()
    //                 .copyWith
    //                 .price(finalPrice: MaterialPrice(10))
    //     }),
    //   );
    //   await tester.runAsync(() async {
    //     await tester.pumpWidget(savedOrderPage());
    //   });
    //   final orderTemplateItem = find.byType(SavedOrderItem);
    //   expect(orderTemplateItem, findsOneWidget);
    //   await tester.tap(orderTemplateItem);
    //   await tester.pump();

    //   expect(
    //     find.text('10'),
    //     findsNWidgets(
    //       order.items.length,
    //     ),
    //   );
    // });
  });
}
