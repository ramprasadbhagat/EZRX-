import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockAppRouter extends Mock implements AppRouter {}

class ViewByOrderBlocMock extends MockBloc<ViewByOrderEvent, ViewByOrderState>
    implements ViewByOrderBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ViewByOrderDetailsBlockMock
    extends MockBloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState>
    implements ViewByOrderDetailsBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ReOrderPermissionBlocMock
    extends MockBloc<ReOrderPermissionEvent, ReOrderPermissionState>
    implements ReOrderPermissionBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final mockViewByOrderBloc = ViewByOrderBlocMock();
  final mockViewByOrderDetailsBloc = ViewByOrderDetailsBlockMock();
  final mockSalesOrgBloc = SalesOrgMockBloc();
  final userBlocMock = UserMockBloc();
  late CustomerCodeBloc customerCodeBlocMock;
  late CartBloc cartBlocMock;
  late ReOrderPermissionBloc reOrderPermissionBlocMock;

  late AppRouter autoRouterMock;

  late ViewByOrder viewByOrder;
  late EligibilityBlocMock eligibilityBlocMock;
  late ViewByOrderDetailsBloc viewByOrderDetailsBlocMock;

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client'),
    ),
    enableOrderType: true,
  );

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory(() => viewByOrderDetailsBlocMock);
    locator.registerFactory(() => reOrderPermissionBlocMock);
    registerFallbackValue(CustomerCodeInfo.empty());
    registerFallbackValue(SalesOrganisation.empty());
    registerFallbackValue(ShipToInfo.empty());

    viewByOrder = await ViewByOrderLocalDataSource().getViewByOrders();
    autoRouterMock = locator<AppRouter>();
    viewByOrderDetailsBlocMock = ViewByOrderDetailsBlockMock();
    cartBlocMock = CartBlocMock();
  });
  group('Order History Details', () {
    setUp(() {
      customerCodeBlocMock = CustomerCodeBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      cartBlocMock = CartBlocMock();
      reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );
      when(() => mockViewByOrderBloc.state)
          .thenReturn(ViewByOrderState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => reOrderPermissionBlocMock.state)
          .thenReturn(ReOrderPermissionState.initial());

      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockViewByOrderDetailsBloc.state)
          .thenReturn(ViewByOrderDetailsState.initial());

      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role(
              description: '',
              name: '',
              id: '',
              type: RoleType('client'),
            ),
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('SG')),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerAttr7: CustomerAttr7('ZEV'),
            customerGrp4: CustomerGrp4('VR'),
          ),
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state)
          .thenReturn(ViewByOrderDetailsState.initial());
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<ViewByOrderBloc>(
            create: (context) => mockViewByOrderBloc,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ViewByOrderDetailsBloc>(
            create: (context) => mockViewByOrderDetailsBloc,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<EligibilityBloc>(
            create: ((context) => eligibilityBlocMock),
          ),
          BlocProvider<CartBloc>(
            create: ((context) => cartBlocMock),
          ),
          BlocProvider<ReOrderPermissionBloc>(
            create: ((context) => reOrderPermissionBlocMock),
          ),
        ],
        child: const Material(
          child: ViewByOrdersPage(),
        ),
      );
    }

    testWidgets('loaderImage  test ', (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          isFetching: true,
          viewByOrderList:
              viewByOrder.copyWith(orderHeaders: <OrderHistoryDetails>[]),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
    });
    testWidgets("Displaying 'items' text test ", (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          isFetching: false,
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [OrderHistoryDetails.empty().copyWith(itemCount: 2)],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final materials = find.text(
        '2 items',
      );
      expect(materials, findsOneWidget);
    });

    testWidgets(
        'Buy again button not visible when disable create order flag true',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          isFetching: false,
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [OrderHistoryDetails.empty().copyWith(itemCount: 2)],
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            disableCreateOrder: true,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsNothing);
    });

    testWidgets('Buy again button visible when disable create order flag false',
        (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          isFetching: false,
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [OrderHistoryDetails.empty().copyWith(itemCount: 2)],
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            disableCreateOrder: false,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final buyAgainButton =
          find.byKey(WidgetKeys.viewByOrderBuyAgainButtonKey);

      expect(buyAgainButton, findsOneWidget);
    });

    testWidgets('Test order total price visibility with tax', (tester) async {
      when(() => mockViewByOrderBloc.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          viewByOrderList: viewByOrder.copyWith(
            orderHeaders: [
              viewByOrder.orderHeaders.first.copyWith(totalTax: 20)
            ],
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            currency: Currency('SGD'),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final totalOrderValue =
          find.text('Order total : SGD 384.80', findRichText: true);

      expect(totalOrderValue, findsOneWidget);
    });
  });
}
