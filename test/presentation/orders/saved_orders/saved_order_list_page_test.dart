import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_item.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_list_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

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

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late SavedOrderListBloc savedOrderListBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBLocMock;
  late MaterialPriceDetailBloc materialPriceDetailBlocMock;
  late CartBloc cartBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

  var savedOrdersMock = <SavedOrder>[];
  final locator = GetIt.instance;

  setUpAll(() async {
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    savedOrdersMock = await OrderLocalDataSource().getSavedOrders();
    autoRouterMock = locator<AppRouter>();
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
    eligibilityBlocMock = EligibilityBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();

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
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
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
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: const SavedOrderListPage(),
      ),
    );
  }

  group('Saved Order List Screen', () {
    testWidgets('Test when refresh page', (tester) async {
      await getWidget(tester);
      expect(find.text('Saved Orders'), findsOneWidget);
      expect(find.text('No saved order found'), findsOneWidget);
      expect(find.byType(SavedOrderItem), findsNothing);
      await tester.fling(
          find.byType(CustomScrollView), const Offset(0, 300), 600);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      verify(
        () => savedOrderListBlocMock.add(
          SavedOrderListEvent.fetch(
            userInfo: User.empty(),
            selectedSalesOrganisation: SalesOrganisation.empty(),
            selectedCustomerCode: CustomerCodeInfo.empty(),
            selectedShipTo: ShipToInfo.empty().copyWith(
              shipToName: ShipToName.empty(),
            ),
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

      final expectedStates = [
        SavedOrderListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
      ];

      whenListen(savedOrderListBlocMock, Stream.fromIterable(expectedStates));

      await getWidget(tester);
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
      final expectedStates = [
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(Right(savedOrdersMock)),
        ),
      ];

      whenListen(savedOrderListBlocMock, Stream.fromIterable(expectedStates));

      await getWidget(tester);
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
        await getWidget(tester);
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
        await getWidget(tester);
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

      await getWidget(tester);
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

      final expectedStatess = [
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          savedOrders: [order],
          apiFailureOrSuccessOption: optionOf(
            Right(savedOrdersMock),
          ),
        ),
        SavedOrderListState.initial().copyWith(
          isFetching: false,
          savedOrders: [order],
          apiFailureOrSuccessOption: none(),
        ),
      ];

      whenListen(savedOrderListBlocMock, Stream.fromIterable(expectedStatess));
      when(() => savedOrderListBlocMock.state).thenReturn(
        SavedOrderListState.initial().copyWith(
          savedOrders: [order],
          nextPageIndex: 1,
          canLoadMore: true,
          isFetching: true,
        ),
      );

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));
      final orderTemplateItem = find.byType(SavedOrderItem);
      expect(orderTemplateItem, findsOneWidget);
      await tester.tap(orderTemplateItem);
      await tester.pump();

      // verify(
      //     () => materialPriceDetailBlocMock.add(MaterialPriceDetailEvent.fetch(
      //           user: User.empty(),
      //           customerCode: CustomerCodeInfo.empty(),
      //           salesOrganisation: SalesOrganisation.empty(),
      //           salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
      //           shipToCode: ShipToInfo.empty(),
      //           materialInfoList: [
      //             MaterialQueryInfo.empty().copyWith(
      //               value: MaterialNumber('000000000021247917'),
      //               materialGroup4: MaterialGroup.four('6GS'),
      //               description: '(E) Dostinex Tab 0.5mg  2\'s',
      //               principalName: 'NA',
      //               qty: MaterialQty(2),
      //             ),
      //             MaterialQueryInfo.empty().copyWith(
      //               value: MaterialNumber('000000000021016132'),
      //               materialGroup2: MaterialGroup.two('45'),
      //               materialGroup4: MaterialGroup.four('6GS'),
      //               description: 'Simple Hydrat Light  Moist  (NEW)',
      //               principalName: 'Unilever Ireland',
      //               qty: MaterialQty(1),
      //             ),
      //           ],
      //           pickAndPack: '',
      //         ))).called(1);

      await tester.pump();
      expect(autoRouterMock.current.name,
          SavedOrderDetailPageRoute(order: order).routeName);
    });
  });
}
