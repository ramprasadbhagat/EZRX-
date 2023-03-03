import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/history/history_tab.dart';
import 'package:ezrxmobile/presentation/history/history_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import '../../utils/multi_bloc_provider_frame_wrapper.dart';
import '../../utils/widget_utils.dart';
import '../orders/create_order/material_bundle/material_bundle_list_test.dart';

class MockHTTPService extends Mock implements HttpService {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

class MockOrderHistoryRepository extends Mock
    implements OrderHistoryRepository {}

class CustomerCodeMockBloc extends Mock implements CustomerCodeBloc {}

class ShipToCodeMocBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class CartMocBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class OrderHistoryFilterMockBloc
    extends MockBloc<OrderHistoryFilterEvent, OrderHistoryFilterState>
    implements OrderHistoryFilterBloc {}

class OrderHistoryStatusByFilterBloc extends MockBloc<
        OrderHistoryFilterByStatusEvent, OrderHistoryFilterByStatusState>
    implements OrderHistoryFilterByStatusBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MaterialPriceDetailBlocMock
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class OrderHistoryDetailsBlocMock
    extends MockBloc<OrderHistoryDetailsEvent, OrderHistoryDetailsState>
    implements OrderHistoryDetailsBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetIt locator;
  final mockOrderHistoryListBloc = OrderHistoryListBlocMock();
  final mockOrderHistoryFilterBloc = OrderHistoryFilterMockBloc();
  final mockOrderHistoryFilterByStatusBloc = OrderHistoryStatusByFilterBloc();
  final mockShipToCodeBloc = ShipToCodeMocBloc();
  final mockCartBloc = CartMocBloc();
  final mockSalesOrgBloc = SalesOrgMockBloc();
  final userBlocMock = UserBlocMock();
  late CustomerCodeBloc customerCodeBlocMock;

  late MockHTTPService mockHTTPService;
  late AppRouter autoRouterMock;

  late OrderHistory orderHistoryItem;
  late EligibilityBlocMock eligibilityBlocMock;
  final fakeSalesOrg = SalesOrganisation(
    salesOrg: SalesOrg('1300'),
    customerInfos: [],
  );
  late MaterialPriceDetailBlocMock mockMaterialPriceDetailBloc;
  late OrderHistoryDetailsBlocMock mockOrderHistoryDetailsBloc;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    orderHistoryItem = await OrderHistoryLocalDataSource().getOrderHistory();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator
        .registerLazySingleton(() => CountlyService(config: locator<Config>()));
    locator.registerLazySingleton(() => mockOrderHistoryListBloc);

    locator.registerLazySingleton(() => mockShipToCodeBloc);
    locator.registerLazySingleton(() => mockCartBloc);
    locator.registerLazySingleton(() => mockSalesOrgBloc);

    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
    customerCodeBlocMock = CustomerCodeBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    mockMaterialPriceDetailBloc = MaterialPriceDetailBlocMock();
    mockOrderHistoryDetailsBloc = OrderHistoryDetailsBlocMock();

    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
  });
  group(
    'Order-History',
    () {
      setUp(() {
        when(() => userBlocMock.state).thenReturn(UserState.initial());
        when(() => mockOrderHistoryListBloc.state)
            .thenReturn(OrderHistoryListState.initial());
        when(() => mockOrderHistoryFilterBloc.state)
            .thenReturn(OrderHistoryFilterState.initial());
        when(() => mockShipToCodeBloc.state)
            .thenReturn(ShipToCodeState.initial());
        when(() => mockCartBloc.state).thenReturn(CartState.initial());
        when(() => customerCodeBlocMock.state)
            .thenReturn(CustomerCodeState.initial());
        when(() => mockOrderHistoryFilterByStatusBloc.state)
            .thenReturn(OrderHistoryFilterByStatusState.initial());
        when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
        when(() => eligibilityBlocMock.state)
            .thenReturn(EligibilityState.initial());
        when(() => mockMaterialPriceDetailBloc.state)
            .thenReturn(MaterialPriceDetailState.initial());
      });
      Widget getWUT() {
        return EasyLocalization(
          supportedLocales: const [
            Locale('en', 'SG'),
          ],
          path: 'assets/langs/langs.csv',
          startLocale: const Locale('en', 'SG'),
          fallbackLocale: const Locale('en', 'SG'),
          saveLocale: true,
          useOnlyLangCode: false,
          assetLoader: CsvAssetLoader(),
          child: WidgetUtils.getScopedWidget(
            autoRouterMock: autoRouterMock,
            providers: [
              BlocProvider<UserBloc>(create: (context) => userBlocMock),
              BlocProvider<OrderHistoryListBloc>(
                  create: (context) => mockOrderHistoryListBloc),
              BlocProvider<OrderHistoryFilterBloc>(
                  create: (context) => mockOrderHistoryFilterBloc),
              BlocProvider<ShipToCodeBloc>(
                  create: (context) => mockShipToCodeBloc),
              BlocProvider<CartBloc>(create: (context) => mockCartBloc),
              BlocProvider<CustomerCodeBloc>(
                  create: (context) => customerCodeBlocMock),
              BlocProvider<OrderHistoryFilterByStatusBloc>(
                  create: (context) => mockOrderHistoryFilterByStatusBloc),
              BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
              BlocProvider<EligibilityBloc>(
                  create: (context) => eligibilityBlocMock),
              BlocProvider<MaterialPriceDetailBloc>(
                  create: (context) => mockMaterialPriceDetailBloc),
            ],
            child: Material(child: HistoryTab()),
          ),
        );
      }

      testWidgets('Order History test', (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();
        final expectedStates = [
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        ];
        whenListen(mockShipToCodeBloc, Stream.fromIterable(expectedStates));

        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: OrderHistory(
                orderBasicInformation: OrderHistoryBasicInfo.empty(),
                orderHistoryItems: <OrderHistoryItem>[],
              ),
              isFetching: false,
              canLoadMore: false,
              nextPageIndex: 0,
            ),
          ]);
        });
        // final mockCartBloc = locator<CartMocBloc>();
        // when(() => mockCartBloc.stream).thenAnswer((invocation) {
        //   return Stream.fromIterable([
        //     CartState.initial().copyWith(cartItemList: <PriceAggregate>[]),
        //   ]);
        // });
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle(const Duration(seconds: 1));
        final orderList = find.byKey(const Key('scrollList'));
        expect(orderList, findsOneWidget);

        final noRecordFound = find.text('No history found');
        expect(noRecordFound, findsOneWidget);

        await tester.pump();
      });

      testWidgets('Load history_tab widget', (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();

        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: OrderHistory(
                orderBasicInformation: OrderHistoryBasicInfo.empty(),
                orderHistoryItems: <OrderHistoryItem>[],
              ),
              isFetching: false,
              canLoadMore: false,
              nextPageIndex: 0,
            ),
          ]);
        });

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle(const Duration(seconds: 1));
        // final titleFinder = find.text('History');
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(Scaffold), findsOneWidget);

        // expect(titleFinder, findsOneWidget);
      });

      testWidgets('app bar test', (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();

        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: OrderHistory(
                orderBasicInformation: OrderHistoryBasicInfo.empty(),
                orderHistoryItems: <OrderHistoryItem>[],
              ),
              isFetching: false,
              canLoadMore: false,
              nextPageIndex: 0,
            ),
          ]);
        });

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Order History'.tr()), findsOneWidget);

        await tester.pump();
      });

      testWidgets('order Type test', (tester) async {
        final newShortList = orderHistoryItem.orderHistoryItems.sublist(0, 3);
        final list = orderHistoryItem.copyWith(orderHistoryItems: newShortList);
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();
        final expectedStates = [
          OrderHistoryFilterState.initial().copyWith(
            sortDirection: 'asc',
            isSubmitting: false,
          ),
        ];
        whenListen(
            mockOrderHistoryFilterBloc, Stream.fromIterable(expectedStates));

        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '0000',
            ),
          ),
        );

        when(() => mockShipToCodeBloc.state).thenReturn(
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              shipToCustomerCode: '0000',
            ),
          ),
        );

        final expectedFilterStates = [
          OrderHistoryFilterByStatusState.initial().copyWith(
            filterByStatusName: [],
          ),
        ];
        whenListen(mockOrderHistoryFilterByStatusBloc,
            Stream.fromIterable(expectedFilterStates));

        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: list,
              isFetching: false,
            ),
          ]);
        });
        when(() => mockOrderHistoryListBloc.state).thenReturn(
          OrderHistoryListState.initial().copyWith(isFetching: true),
        );
        when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
          OrderHistoryFilterByStatusState.initial().copyWith(
            filterByStatusName: [],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle(const Duration(seconds: 3));
        expect(find.byKey(const Key('orderHistoryList')), findsWidgets);
        expect(find.byType(OrderHistoryListTile), findsWidgets);

        await tester.drag(
            find.byKey(const Key('scrollList')), const Offset(0.0, -800));
        await tester.pump();
      });

      testWidgets('order Type error test 1', (tester) async {
        final expectedStates = [
          OrderHistoryListState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(ApiFailure.other('fake-message')),
            ),
          ),
        ];
        whenListen(
            mockOrderHistoryListBloc, Stream.fromIterable(expectedStates));

        when(() => mockOrderHistoryListBloc.state).thenReturn(
          OrderHistoryListState.initial().copyWith(
            isFetching: false,
            failureOrSuccessOption: none(),
          ),
        );
        await tester.pumpWidget(getWUT());

        final errorMessage = find.byKey(const Key('snackBarMessage'));
        expect(errorMessage, findsNothing);
        await tester.pump();
        expect(errorMessage, findsOneWidget);
      });

      testWidgets('order Type error test 2', (tester) async {
        when(() => mockOrderHistoryListBloc.state).thenReturn(
          OrderHistoryListState.initial().copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-error'),
                ),
              )),
        );
        whenListen(
            mockOrderHistoryListBloc,
            Stream.fromIterable([
              OrderHistoryListState.initial().copyWith(
                failureOrSuccessOption: none(),
              ),
              mockOrderHistoryListBloc.state,
            ]));
        await tester.pumpWidget(getWUT());
        await tester.pump();
      });

      testWidgets('order Type success test', (tester) async {
        final expectedStates = [
          OrderHistoryListState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Right('fake-message'),
            ),
          ),
        ];
        whenListen(
            mockOrderHistoryListBloc, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWUT());
        await tester.pump();
      });

      testWidgets('Filter button test', (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();
        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: OrderHistory(
                orderBasicInformation: OrderHistoryBasicInfo.empty(),
                orderHistoryItems: <OrderHistoryItem>[],
              ),
              isFetching: false,
            ),
          ]);
        });
        await tester.pumpWidget(getWUT());

        expect(find.byKey(const Key('Filter_list_not_empty')), findsNothing);
      });
      testWidgets('Filter list not empty test', (tester) async {
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.byKey(const Key('filterCount')), findsOneWidget);
      });

      testWidgets('Filter button test 1', (tester) async {
        when(() => mockOrderHistoryListBloc.state)
            .thenReturn(OrderHistoryListState.initial());
        final expectedStates = [
          OrderHistoryFilterState.initial().copyWith(isSubmitting: true),
        ];
        whenListen(
            mockOrderHistoryFilterBloc, Stream.fromIterable(expectedStates));
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final filterButton = find.byType(FilterCountButton);
        expect(filterButton, findsOneWidget);
        await tester.tap(filterButton);
        final orderDateFilter = find.byKey(const Key('orderDateFilter'));
        expect(orderDateFilter, findsOneWidget);
        await tester.tap(orderDateFilter);
      });

      testWidgets('Filter button test 2', (tester) async {
        when(() => mockOrderHistoryListBloc.state)
            .thenReturn(OrderHistoryListState.initial());
        final expectedStates = [
          OrderHistoryFilterState.initial()
              .copyWith(isSubmitting: false, sortDirection: 'desc'),
        ];
        whenListen(
            mockOrderHistoryFilterBloc, Stream.fromIterable(expectedStates));
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final filterButton = find.byType(FilterCountButton);
        expect(filterButton, findsOneWidget);
        await tester.tap(filterButton);
        final orderDateFilter = find.byKey(const Key('orderDateFilter'));
        expect(orderDateFilter, findsOneWidget);
        await tester.tap(orderDateFilter);
      });

      testWidgets('Filter status button test ', (tester) async {
        when(() => mockOrderHistoryListBloc.state)
            .thenReturn(OrderHistoryListState.initial());
        when(() => mockOrderHistoryFilterBloc.state).thenReturn(
          OrderHistoryFilterState.initial().copyWith(isSubmitting: true),
        );
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.byKey(const Key('statusFilterButton')), findsOneWidget);
        await tester.tap(find.byKey(const Key('statusFilterButton')));
        // await tester.pump();
      });
      testWidgets('Filter status  test ', (tester) async {
        when(() => mockOrderHistoryListBloc.state)
            .thenReturn(OrderHistoryListState.initial());
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));

        final filterstatus = find.byKey(const Key('status'));
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(filterstatus, findsOneWidget);
        await tester.tap(filterstatus);
        await tester.pumpAndSettle(const Duration(seconds: 3));
        final filterclearAllButton =
            find.byKey(const Key('filterclearAllButton'));

        expect(filterclearAllButton, findsOneWidget);
        await tester.tap(filterclearAllButton);
        await tester.pumpAndSettle(const Duration(seconds: 3));
      });
      testWidgets('Filter status list not empty test', (tester) async {
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
          OrderHistoryFilterByStatusState.initial().copyWith(
            filterByStatusName: [
              StatusType('Cancelled'),
              StatusType('Delivered'),
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.byKey(const Key('Filter_by_status_list_not_empty')),
            findsOneWidget);
      });

      testWidgets(
          'When selected filter status order history list should be filtered',
          (tester) async {
        when(() => mockOrderHistoryListBloc.state).thenReturn(
          OrderHistoryListState.initial().copyWith(
            isFetching: false,
            orderHistoryList: orderHistoryItem,
          ),
        );
        when(() => mockShipToCodeBloc.state).thenReturn(
            ShipToCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
          OrderHistoryFilterByStatusState.initial().copyWith(
            filterByStatusName: [
              StatusType('Pending'),
            ],
          ),
        );
        whenListen(mockOrderHistoryFilterByStatusBloc,
            Stream.fromIterable([mockOrderHistoryFilterByStatusBloc.state]));
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(find.byKey(const Key('SelectedStatusChip')), findsOneWidget);

        expect(find.byType(OrderHistoryListTile), findsNWidgets(2));
      });

      testWidgets('OrderHistoryList Tile Tap Test', (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();
        final fakeOrderHistoryItem =
            orderHistoryItem.orderHistoryItems[0].copyWith(
          deliveryDate: DateTimeStringValue('2022/10/11'),
        );

        orderHistoryItem = orderHistoryItem.copyWith(
          orderHistoryItems: [fakeOrderHistoryItem],
        );

        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: orderHistoryItem,
              isFetching: false,
            ),
          ]);
        });
        when(() => mockOrderHistoryListBloc.state).thenReturn(
          OrderHistoryListState.initial().copyWith(isFetching: true),
        );
        when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
          OrderHistoryFilterByStatusState.initial().copyWith(
            filterByStatusName: [],
          ),
        );
        when(() => mockSalesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            salesOrganisation: fakeSalesOrg,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrg,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              enableTaxDisplay: true,
              enableTaxAtTotalLevelOnly: true,
              disableDeliveryDate: true,
            ),
          ),
        );

        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              billToInfos: <BillToInfo>[
                BillToInfo.empty().copyWith(
                  billToCustomerCode: '123456789',
                  billToAddress: BillToAddress.empty().copyWith(
                    city1: 'city1',
                    city2: 'city2',
                    street: 'street',
                  ),
                ),
              ],
              customerCodeSoldTo: '987654321',
            ),
          ),
        );

        await tester.pumpWidget(
          MultiBlocProviderFrameWrapper(
            providers: [
              BlocProvider<MaterialPriceDetailBloc>(
                create: (context) => mockMaterialPriceDetailBloc,
              ),
              BlocProvider<OrderHistoryDetailsBloc>(
                create: (context) => mockOrderHistoryDetailsBloc,
              ),
            ],
            child: getWUT(),
          ),
        );

        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byKey(const Key('orderHistoryList')), findsWidgets);

        final taxDisplay = find.byKey(const Key('includedTax'));
        expect(taxDisplay, findsWidgets);

        final orderHistoryList = find.byType(OrderHistoryListTile);
        expect(orderHistoryList, findsWidgets);

        await tester.tap(orderHistoryList.first);
        await tester.pump();
      });

      testWidgets('OrderHistoryList refresh & loading more test',
          (tester) async {
        final orderHistoryBloc = locator<OrderHistoryListBlocMock>();
        when(() => orderHistoryBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            OrderHistoryListState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: orderHistoryItem,
              isFetching: false,
            ),
          ]);
        });
        when(() => mockOrderHistoryListBloc.state).thenReturn(
          OrderHistoryListState.initial().copyWith(isFetching: true),
        );
        when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
          OrderHistoryFilterByStatusState.initial().copyWith(
            filterByStatusName: [],
          ),
        );
        when(() => mockSalesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            salesOrganisation: fakeSalesOrg,
          ),
        );
        when(() => mockShipToCodeBloc.state).thenReturn(
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
              shipToCustomerCode: '00001234',
            ),
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle(const Duration(seconds: 3));

        final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);
        expect(scrollWidget, findsOneWidget);

        await tester.fling(scrollWidget, const Offset(0.0, 300.0), 1000.0);
        await tester.pump();

        final historyTitle = find.byKey(const ValueKey('historyTitle56'));

        try {
          await tester.dragUntilVisible(
            historyTitle,
            scrollWidget,
            const Offset(0, -1000),
            duration: const Duration(seconds: 5),
          );
        } catch (e) {
          expect(historyTitle, findsNothing);
        }
        await tester.pump();
      });
    },
  );
}
