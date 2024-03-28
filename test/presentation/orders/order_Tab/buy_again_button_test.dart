import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../utils/widget_utils.dart';

class ReOrderPermissionBlocMock
    extends MockBloc<ReOrderPermissionEvent, ReOrderPermissionState>
    implements ReOrderPermissionBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late CartBlocMock cartBlocMock;

  setUpAll(() async {
    locator.registerLazySingleton(() => AutoRouteMock());
    reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
    locator.registerFactory(() => reOrderPermissionBlocMock);
    cartBlocMock = CartBlocMock();
    autoRouterMock = locator<AutoRouteMock>();
    eligibilityBlocMock = EligibilityBlocMock();
  });
  group('Order History Details Page', () {
    setUp(() async {
      when(() => reOrderPermissionBlocMock.state)
          .thenReturn(ReOrderPermissionState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial(),
      );
    });

    Widget getScopedWidget(OrderHistoryDetails viewByOrderHistoryItem) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        useMediaQuery: false,
        providers: [
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
        child: Material(
          child: BuyAgainButton(
            viewByOrderHistoryItem: viewByOrderHistoryItem,
          ),
        ),
      );
    }

    testWidgets('Buy Again Button disable check', (tester) async {
      when(
        () => autoRouterMock.currentPath,
      ).thenAnswer((invocation) => 'orders/cart');

      whenListen(
        cartBlocMock,
        Stream.fromIterable([
          CartState.initial().copyWith(
            isBuyAgain: true,
          ),
          CartState.initial(),
        ]),
      );

      await tester.pumpWidget(getScopedWidget(OrderHistoryDetails.empty()));
      await tester.pumpAndSettle();

      verify(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.resetOrderNumberWillUpsert(
            orderNumberWillUpsert: OrderNumber(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('Buy Again Button disable check if current path is not cart',
        (tester) async {
      when(
        () => autoRouterMock.currentPath,
      ).thenAnswer((invocation) => 'orders/checkout');

      whenListen(
        cartBlocMock,
        Stream.fromIterable([
          CartState.initial().copyWith(
            isBuyAgain: true,
          ),
          CartState.initial(),
        ]),
      );

      await tester.pumpWidget(getScopedWidget(OrderHistoryDetails.empty()));
      await tester.pumpAndSettle();

      verifyNever(
        () => reOrderPermissionBlocMock.add(
          ReOrderPermissionEvent.resetOrderNumberWillUpsert(
            orderNumberWillUpsert: OrderNumber(''),
          ),
        ),
      );
    });
  });
}
