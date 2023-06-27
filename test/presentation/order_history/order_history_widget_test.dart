import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
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
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_item_repository.dart';
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
import '../../utils/widget_utils.dart';
import '../orders/create_order/material_bundle/material_bundle_list_test.dart';
import 'order_history_details_widget_test.dart';

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class MockOrderHistoryRepository extends Mock
    implements ViewByItemRepository {}

class CustomerCodeMockBloc extends Mock implements CustomerCodeBloc {}

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

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetIt locator;
  late ViewByItemsBloc mockViewByItemsBloc;
  late OrderHistoryFilterBloc mockOrderHistoryFilterBloc;
  late OrderHistoryFilterByStatusBloc mockOrderHistoryFilterByStatusBloc;
  late CartBloc mockCartBloc;
  late SalesOrgBloc mockSalesOrgBloc;
  late UserBloc userBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;

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
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockViewByItemsBloc);
    locator.registerLazySingleton(() => mockCartBloc);
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    autoRouterMock = locator<AppRouter>();
  });
  group(
    'Order-History',
    () {
      setUp(() {
        customerCodeBlocMock = CustomerCodeBlocMock();
        eligibilityBlocMock = EligibilityBlocMock();
        mockMaterialPriceDetailBloc = MaterialPriceDetailBlocMock();
        mockOrderHistoryDetailsBloc = OrderHistoryDetailsBlocMock();
        mockViewByItemsBloc = ViewByItemsBlocMock();
        mockOrderHistoryFilterBloc = OrderHistoryFilterMockBloc();
        mockOrderHistoryFilterByStatusBloc = OrderHistoryStatusByFilterBloc();
        mockCartBloc = CartMocBloc();
        mockSalesOrgBloc = SalesOrgMockBloc();
        userBlocMock = UserBlocMock();
        authBlocMock = AuthBlocMock();
        announcementBlocMock = AnnouncementBlocMock();
        when(() => userBlocMock.state).thenReturn(UserState.initial());
        when(() => mockViewByItemsBloc.state)
            .thenReturn(ViewByItemsState.initial());
        when(() => mockOrderHistoryFilterBloc.state)
            .thenReturn(OrderHistoryFilterState.initial());
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
        when(() => authBlocMock.state).thenReturn(const AuthState.initial());
        when(() => announcementBlocMock.state)
            .thenReturn(AnnouncementState.initial());
        when(() => mockOrderHistoryDetailsBloc.state)
            .thenReturn(OrderHistoryDetailsState.initial());
      });
      Widget getWUT() {
        return EasyLocalization(
          supportedLocales: const [
            Locale('en'),
          ],
          path: 'assets/langs/langs.csv',
          startLocale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          saveLocale: true,
          useOnlyLangCode: true,
          assetLoader: CsvAssetLoader(),
          child: WidgetUtils.getScopedWidget(
            autoRouterMock: autoRouterMock,
            providers: [
              BlocProvider<UserBloc>(create: (context) => userBlocMock),
              BlocProvider<ViewByItemsBloc>(
                  create: (context) => mockViewByItemsBloc),
              BlocProvider<OrderHistoryFilterBloc>(
                  create: (context) => mockOrderHistoryFilterBloc),
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
              BlocProvider<AuthBloc>(create: (context) => authBlocMock),
              BlocProvider<AnnouncementBloc>(
                  create: (context) => announcementBlocMock),
              BlocProvider<OrderHistoryDetailsBloc>(
                  create: (context) => mockOrderHistoryDetailsBloc),
            ],
            child: Material(child: HistoryTab()),
          ),
        );
      }

      testWidgets('Order History test', (tester) async {
        final expectedStates = [
          CustomerCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        ];
        whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));

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
        await tester.pumpWidget(getWUT());
        // final titleFinder = find.text('History');
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(Scaffold), findsOneWidget);

        // expect(titleFinder, findsOneWidget);
      });

      testWidgets('app bar test', (tester) async {
        await tester.pumpWidget(getWUT());

        expect(find.text('Order History'.tr()), findsOneWidget);

        await tester.pump();
      });

      /* testWidgets('order Type test', (tester) async {
        final newShortList = orderHistoryItem.orderHistoryItems.sublist(0, 3);
        final firstItem = newShortList.first
            .copyWith(deliveryDate: DateTimeStringValue('00000000'));
        newShortList.insert(0, firstItem);
        final list = orderHistoryItem.copyWith(orderHistoryItems: newShortList);

        final expectedStates = [
          OrderHistoryFilterState.initial().copyWith(
            sortDirection: 'asc',
            isSubmitting: false,
          ),
        ];
        whenListen(
            mockOrderHistoryFilterBloc, Stream.fromIterable(expectedStates));

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
              salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            disableDeliveryDate: false,
          )),
        );

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
        whenListen(
            mockOrderHistoryListBloc,
            Stream.fromIterable([
              OrderHistoryListState.initial().copyWith(isFetching: true),
              OrderHistoryListState.initial().copyWith(
                failureOrSuccessOption: none(),
                orderHistoryList: list,
                isFetching: false,
              ),
            ]));

        when(() => mockOrderHistoryFilterByStatusBloc.state).thenReturn(
          OrderHistoryFilterByStatusState.initial().copyWith(
            filterByStatusName: [],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(find.byKey(const Key('orderHistoryList')), findsWidgets);
        expect(find.byType(OrderHistoryListTile), findsWidgets);

        final materialDeliveryDate = find
            .byKey(const Key('material0000000000210221754deliveryDateTime-'));
        expect(
          materialDeliveryDate,
          findsWidgets,
        );

        final descendantDateValue = find.descendant(
            of: materialDeliveryDate, matching: find.textContaining('-'));
        expect(descendantDateValue, findsWidgets);

        await tester.drag(
            find.byKey(const Key('scrollList')), const Offset(0.0, -800));
        await tester.pump();
      });*/

      testWidgets('order Type error test 1', (tester) async {
        final expectedStates = [
          ViewByItemsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(ApiFailure.other('fake-message')),
            ),
          ),
        ];
        whenListen(
            mockViewByItemsBloc, Stream.fromIterable(expectedStates));

        when(() => mockViewByItemsBloc.state).thenReturn(
          ViewByItemsState.initial().copyWith(
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
        when(() => mockViewByItemsBloc.state).thenReturn(
          ViewByItemsState.initial().copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-error'),
                ),
              )),
        );
        whenListen(
            mockViewByItemsBloc,
            Stream.fromIterable([
              ViewByItemsState.initial().copyWith(
                failureOrSuccessOption: none(),
              ),
              mockViewByItemsBloc.state,
            ]));
        await tester.pumpWidget(getWUT());
        await tester.pump();
      });

      testWidgets('order Type success test', (tester) async {
        final expectedStates = [
          ViewByItemsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Right('fake-message'),
            ),
          ),
        ];
        whenListen(
            mockViewByItemsBloc, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWUT());
        await tester.pump();
      });

      testWidgets('Filter button test', (tester) async {
        await tester.pumpWidget(getWUT());

        expect(find.byKey(const Key('Filter_list_not_empty')), findsNothing);
      });
      testWidgets('Filter list not empty test', (tester) async {
        when(() => customerCodeBlocMock.state).thenReturn(
            CustomerCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));

        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.byKey(const Key('filterCount')), findsOneWidget);
      });

      testWidgets('Filter button test 1', (tester) async {
        when(() => mockViewByItemsBloc.state)
            .thenReturn(ViewByItemsState.initial());
        final expectedStates = [
          OrderHistoryFilterState.initial().copyWith(isSubmitting: true),
        ];
        whenListen(
            mockOrderHistoryFilterBloc, Stream.fromIterable(expectedStates));
        when(() => customerCodeBlocMock.state).thenReturn(
            CustomerCodeState.initial().copyWith(
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
        when(() => mockViewByItemsBloc.state)
            .thenReturn(ViewByItemsState.initial());
        final expectedStates = [
          OrderHistoryFilterState.initial()
              .copyWith(isSubmitting: false, sortDirection: 'desc'),
        ];
        whenListen(
            mockOrderHistoryFilterBloc, Stream.fromIterable(expectedStates));
        when(() => customerCodeBlocMock.state).thenReturn(
            CustomerCodeState.initial().copyWith(
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
        when(() => mockViewByItemsBloc.state)
            .thenReturn(ViewByItemsState.initial());
        when(() => mockOrderHistoryFilterBloc.state).thenReturn(
          OrderHistoryFilterState.initial().copyWith(isSubmitting: true),
        );
        when(() => customerCodeBlocMock.state).thenReturn(
            CustomerCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.byKey(const Key('statusFilterButton')), findsOneWidget);
        await tester.tap(find.byKey(const Key('statusFilterButton')));
        await tester.pump();
      });
      testWidgets('Filter status  test ', (tester) async {
        when(() => mockViewByItemsBloc.state)
            .thenReturn(ViewByItemsState.initial());
        when(() => customerCodeBlocMock.state).thenReturn(
            CustomerCodeState.initial().copyWith(
                shipToInfo:
                    ShipToInfo.empty().copyWith(defaultShipToAddress: true)));

        final filterstatus = find.byKey(const Key('status'));
        await tester.pumpWidget(getWUT());
        await tester.pump();
        expect(filterstatus, findsOneWidget);
        await tester.tap(filterstatus);
        await tester.pump();
        final filterclearAllButton =
            find.byKey(const Key('filterclearAllButton'));

        expect(filterclearAllButton, findsOneWidget);
        await tester.tap(filterclearAllButton);
        await tester.pump();
      });
      testWidgets('Filter status list not empty test', (tester) async {
        when(() => customerCodeBlocMock.state).thenReturn(
            CustomerCodeState.initial().copyWith(
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
        when(() => mockViewByItemsBloc.state).thenReturn(
          ViewByItemsState.initial().copyWith(
            isFetching: false,
            orderHistoryList: orderHistoryItem,
          ),
        );
        when(() => customerCodeBlocMock.state).thenReturn(
            CustomerCodeState.initial().copyWith(
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
        final fakeOrderHistoryItem =
            orderHistoryItem.orderHistoryItems[0].copyWith(
          deliveryDate: DateTimeStringValue('2022/10/11'),
        );

        orderHistoryItem = orderHistoryItem.copyWith(
          orderHistoryItems: [fakeOrderHistoryItem],
        );

        when(() => mockViewByItemsBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            ViewByItemsState.initial().copyWith(isFetching: true),
            ViewByItemsState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: orderHistoryItem,
              isFetching: false,
            ),
          ]);
        });

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

        await tester.pumpWidget(getWUT());

        await tester.pump();

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
        when(() => mockViewByItemsBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            ViewByItemsState.initial().copyWith(isFetching: true),
            ViewByItemsState.initial().copyWith(
              failureOrSuccessOption: none(),
              orderHistoryList: orderHistoryItem,
              isFetching: false,
            ),
          ]);
        });
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
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
              shipToCustomerCode: '00001234',
            ),
          ),
        );

        await tester.pumpWidget(getWUT());

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

      testWidgets('rebuild when new list is different from old list',
          (tester) async {
        final initialState = ViewByItemsState.initial().copyWith(
            orderHistoryList: orderHistoryItem.copyWith(orderHistoryItems: [
          OrderHistoryItem.empty(),
        ]));
        when(() => mockViewByItemsBloc.state).thenReturn(initialState);
        whenListen(
          mockViewByItemsBloc,
          Stream.fromIterable(
            [
              initialState,
              ViewByItemsState.initial().copyWith(
                orderHistoryList: orderHistoryItem.copyWith(
                  orderHistoryItems: [],
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(find.byType(OrderHistoryListTile), findsNothing);
      });

      //TODO: Revisit later. Failing as a result of UI Flow change
      // testWidgets('onLoadMore should use currently set historyFilter',
      //     (tester) async {
      //   when(() => mockOrderHistoryListBloc.state).thenReturn(
      //     ViewByItemsState.initial().copyWith(
      //       canLoadMore: true,
      //       orderHistoryList: OrderHistory.empty().copyWith(orderHistoryItems: [
      //         for (var i = 0; i < 10; i++)
      //           OrderHistoryItem.empty().copyWith(
      //             orderNumber: OrderNumber(i.toString()),
      //             materialNumber: MaterialNumber(
      //               '0000000000${i.toString()}',
      //             ),
      //           ),
      //       ]),
      //     ),
      //   );
      //   final filter = OrderHistoryFilter.empty().copyWith(
      //     fromDate: DateTimeStringValue('20230401'),
      //     toDate: DateTimeStringValue('20230505'),
      //   );
      //   final expectedStates = [
      //     OrderHistoryFilterState.initial().copyWith(
      //       orderHistoryFilter: filter,
      //     ),
      //   ];
      //   whenListen(
      //       mockOrderHistoryFilterBloc, Stream.fromIterable(expectedStates));
      //   await tester.pumpWidget(getWUT());
      //   await tester.pump();
      //   final fourthListItem = find.byKey(const Key('historyTitle2'));
      //   expect(fourthListItem, findsOneWidget);
      //   await tester.drag(
      //     fourthListItem,
      //     const Offset(0.0, -2000.0),
      //   );
      //   await tester.pump(const Duration(seconds: 2));
      //   await tester
      //       .pump(const Duration(seconds: 1)); // finish the scroll animation
      //   await tester.pump(const Duration(
      //       seconds: 1)); // finish the indicator settle animation
      //   await tester.pump(const Duration(seconds: 1));
      //   verify(() => mockOrderHistoryListBloc.add(
      //         OrderHistoryListEvent.loadMore(
      //           customerCodeInfo: CustomerCodeInfo.empty(),
      //           salesOrgConfigs: SalesOrganisationConfigs.empty(),
      //           shipToInfo: ShipToInfo.empty(),
      //           user: User.empty(),
      //           sortDirection: 'desc',
      //           orderHistoryFilter: filter,
      //         ),
      //       )).called(1);
      // });
    },
  );
}
