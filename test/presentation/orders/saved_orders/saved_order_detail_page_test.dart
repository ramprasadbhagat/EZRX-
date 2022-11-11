import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/presentation/orders/core/order_material_item.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

import '../../../utils/material_frame_wrapper.dart';

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
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBLocMock;
  late MaterialPriceDetailBloc materialPriceDetailBlocMock;
  late CartBloc cartBlocMock;
  late SavedOrder orderMock;
  late List<MaterialItem> orderMockItems;
  setUpAll(() async {
    final orders = await OrderLocalDataSource().getSavedOrders();
    orderMock = orders.first;
    orderMockItems = orderMock.items;
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    userBlocMock = MockUserBloc();
    salesOrgBlocMock = MockSalesOrgBloc();
    customerCodeBlocMock = MockCustomerCodeBloc();
    shipToCodeBLocMock = MockShipToCodeBloc();
    materialPriceDetailBlocMock = MockMaterialPriceDetailBloc();
    cartBlocMock = MockCartBloc();

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeBLocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => materialPriceDetailBlocMock.state)
        .thenReturn(MaterialPriceDetailState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
  });

  Widget savedOrderDetailPage() => MaterialFrameWrapper(
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
            BlocProvider<MaterialPriceDetailBloc>(
              create: (context) => materialPriceDetailBlocMock,
            ),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          ],
          child: SavedOrderDetailPage(order: orderMock),
        ),
      );

  group('Saved Order Detail Screen', () {
    testWidgets(
      'Saved Order Detail with material items',
      (tester) async {
        await tester.pumpWidget(savedOrderDetailPage());
        expect(find.byKey(const Key('SavedOrderDetailPage')), findsOneWidget);
        expect(find.text(orderMock.companyName.name), findsOneWidget);
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
                    MaterialPriceDetail.empty().copyWith.price(isValid: false),
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
                          isValid: true,
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
  });
}
