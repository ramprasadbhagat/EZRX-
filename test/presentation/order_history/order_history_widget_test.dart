import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';

import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:ezrxmobile/presentation/history/history_tab.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

class MockOrderHistoryRepository extends Mock
    implements OrderHistoryRepository {}

class CustomerCodeMockBloc extends Mock implements CustomerCodeBloc {}

class ShipToCodeMocBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetIt locator;
  final mockOrderHistoryListBloc = OrderHistoryListBlocMock();
  late MockHTTPService mockHTTPService;
  late AppRouter autoRouterMock;
  // late OrderHistoryRepository orderHistoryRepoMock = OrderHistoryRepoMock();
  // late CustomerCodeBloc customerCodeBloc = CustomerCodeMockBloc();
  // late ShipToCodeBloc shipToCodeBloc = ShipToCodeMocBloc();
  // late UserBloc userMockBloc = UserMockBloc();
  // final orderHistoryState = OrderHistoryListState.initial();
  // var fakeSort = 'desc';
  // var user = User(
  //   id: '1',
  //   username: Username(''),
  //   email: EmailAddress(''),
  //   fullName: const FullName(firstName: '', lastName: ''),
  //   role: Role(id: '', description: '', name: '', type: RoleType('Developer')),
  //   customerCode: CustomerCode(''),
  //   userSalesOrganisations: [],
  //   settings: Settings.empty(),
  //   settingTc: SettingTc.empty(),
  //   settingAup: SettingAup.empty(),
  // );
  // var fakeorderBy = 'orderDate';
  // var fakeFromDate = '20220916';
  // var fakeToDate = '20220923';
  // var shipToWithoutValue = ShipToInfo.empty();
  // var shipToWithValue = const ShipToInfo(
  //   building: 'test',
  //   city1: 'test',
  //   city2: 'test',
  //   defaultShipToAddress: false,
  //   floor: 'test',
  //   houseNumber1: 'test',
  //   plant: 'test',
  //   postalCode: 'test',
  //   region: 'test',
  //   shipToAddress: ShipToAddress(
  //     street2: 'test',
  //     street3: 'test',
  //     street4: 'test',
  //     street5: 'test',
  //     street: 'test',
  //   ),
  //   shipToCustomerCode: '1111111111',
  //   shipToName: ShipToName(
  //     name1: 'test',
  //     name2: 'test',
  //     name3: 'test',
  //     name4: 'test',
  //   ),
  //   status: 'test',
  //   telephoneNumber: '12345',
  // );
  // var soldTo = CustomerCodeInfo(
  //   customerCodeSoldTo: '',
  //   customerAddress: CustomerAddress.empty(),
  //   billToInfos: [],
  //   customerClassification: '',
  //   customerLocalGroup: '',
  //   customerName: const CustomerName(
  //     name1: '',
  //     name2: '',
  //     name3: '',
  //     name4: '',
  //   ),
  //   paymentTermDescription: '',
  //   postalCode: '',
  //   shipToInfos: [],
  //   status: '',
  // );
  // late CustomerCodeState customerCodeInitState;
  // late UserState userInitState;
  // late ShipToCodeState shipToInitState;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;

    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => CountlyService());
    locator.registerLazySingleton(() => mockOrderHistoryListBloc);
    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
    // customerCodeBloc = CustomerCodeMockBloc();
    // orderHistoryRepoMock = OrderHistoryRepoMock();
    // shipToCodeBloc = ShipToCodeMocBloc();
    // userMockBloc = UserMockBloc();
    // userInitState = UserState.initial();
    // customerCodeInitState = CustomerCodeState.initial();
    // shipToInitState = ShipToCodeState.initial();
  });
  group(
    'Order-History',
    () {
      setUp(() {
        when(() => mockOrderHistoryListBloc.state)
            .thenReturn(OrderHistoryListState.initial());
      });
      StackRouterScope getWUT() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<OrderHistoryListBloc>(
                create: (context) => mockOrderHistoryListBloc),
          ],
          child: const HistoryTab(),
        );
      }

      testWidgets('Order History test', (tester) async {
        final favouriteBloc = locator<OrderHistoryListBlocMock>();
        when(() => favouriteBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: [],
            ),
          ]);
        });
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final materialList = find.byKey(const Key('scrollList'));
        expect(materialList, findsOneWidget);
        final noRecordFound = find.text('No history found');
        expect(noRecordFound, findsOneWidget);
        await tester.pump();
      });
      testWidgets('Load history_tab widget', (tester) async {
        final favouriteBloc = locator<OrderHistoryListBlocMock>();

        when(() => favouriteBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: [],
            ),
          ]);
        });

        await tester.pumpWidget(getWUT());
        await tester.pump();
        // final titleFinder = find.text('History');
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(Scaffold), findsOneWidget);
        // expect(titleFinder, findsOneWidget);
      });

      testWidgets('app bar test', (tester) async {
        final favouriteBloc = locator<OrderHistoryListBlocMock>();

        when(() => favouriteBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: [],
            ),
          ]);
        });

        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.text('Order History'), findsOneWidget);

        await tester.pump();
      });

      testWidgets('order Type test', (tester) async {
        final favouriteBloc = locator<OrderHistoryListBlocMock>();

        when(() => favouriteBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: [OrderHistory.empty()],
            ),
          ]);
        });

        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.byKey(const Key('orderTypeKey')), findsWidgets);

        await tester.pump();
      });
    },
  );
}
