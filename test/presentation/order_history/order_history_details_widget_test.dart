import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/download_attachment/bloc/download_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_messages.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:ezrxmobile/presentation/history/history_details.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';
import '../orders/material_bundle_list/material_bundle_list_test.dart';

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

class OrderHistoryDetailsMockBloc
    extends MockBloc<OrderHistoryDetailsEvent, OrderHistoryDetailsState>
    implements OrderHistoryDetailsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockMaterialPriceDetailBloc
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class MockDownloadAttachmentBloc
    extends MockBloc<DownloadAttachmentEvent, DownloadAttachmentState>
    implements DownloadAttachmentBloc {}

class MockOrderHistoryDetailsRepository extends Mock
    implements OrderHistoryDetailsRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetIt locator;
  final mockOrderHistoryListBloc = OrderHistoryListBlocMock();
  final mockOrderHistoryFilterBloc = OrderHistoryFilterMockBloc();
  final mockOrderHistoryDetailsBloc = OrderHistoryDetailsMockBloc();
  final mockShipToCodeBloc = ShipToCodeMocBloc();
  final mockCartBloc = CartMocBloc();
  final mockSalesOrgBloc = SalesOrgMockBloc();

  late CustomerCodeBloc customerCodeBlocMock;

  late MockHTTPService mockHTTPService;
  late AppRouter autoRouterMock;

  late OrderHistoryDetails orderHistoryDetails;
  late EligibilityBlocMock eligibilityBlocMock;
  late MaterialPriceDetailBloc materialPriceDetailBlocMock;
  late DownloadAttachmentBloc downloadAttachmentBlocMock;
  late OrderHistory orderHistory;
  late OrderHistoryDetailsRepository orderHistoryDetailsRepository;

  setUpAll(() async {
    orderHistoryDetailsRepository = MockOrderHistoryDetailsRepository();
    TestWidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    orderHistoryDetails =
        await OrderHistoryDetailsLocalDataSource().getOrderHistoryDetails();
    orderHistory = await OrderHistoryLocalDataSource().getOrderHistory();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => locator<CountlyService>());
    locator.registerLazySingleton(() => mockOrderHistoryListBloc);
    locator.registerLazySingleton(() => mockOrderHistoryDetailsBloc);
    locator.registerLazySingleton(() => mockShipToCodeBloc);
    locator.registerLazySingleton(() => mockCartBloc);
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => orderHistoryDetailsRepository);

    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
    customerCodeBlocMock = CustomerCodeBlocMock();

    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
  });
  group('Order History Details', () {
    setUp(() {
      eligibilityBlocMock = EligibilityBlocMock();
      materialPriceDetailBlocMock = MockMaterialPriceDetailBloc();
      downloadAttachmentBlocMock = MockDownloadAttachmentBloc();
      when(() => mockOrderHistoryListBloc.state)
          .thenReturn(OrderHistoryListState.initial());
      when(() => mockOrderHistoryFilterBloc.state)
          .thenReturn(OrderHistoryFilterState.initial());
      when(() => mockShipToCodeBloc.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => mockCartBloc.state).thenReturn(CartState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockOrderHistoryDetailsBloc.state)
          .thenReturn(OrderHistoryDetailsState.initial());
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
                customerGrp4: CustomerGrp4('VR'))),
      );
      when(() => materialPriceDetailBlocMock.state)
          .thenReturn(MaterialPriceDetailState.initial());
      when(() => downloadAttachmentBlocMock.state)
          .thenReturn(DownloadAttachmentState.initial());
    });
    StackRouterScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<OrderHistoryListBloc>(
              create: (context) => mockOrderHistoryListBloc),
          BlocProvider<OrderHistoryFilterBloc>(
              create: (context) => mockOrderHistoryFilterBloc),
          BlocProvider<ShipToCodeBloc>(create: (context) => mockShipToCodeBloc),
          BlocProvider<CartBloc>(create: (context) => mockCartBloc),
          BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock),
          BlocProvider<OrderHistoryDetailsBloc>(
              create: (context) => mockOrderHistoryDetailsBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<EligibilityBloc>(
              create: ((context) => eligibilityBlocMock)),
          BlocProvider<MaterialPriceDetailBloc>(
            create: (context) => materialPriceDetailBlocMock,
          ),
          BlocProvider<DownloadAttachmentBloc>(
            create: (context) => downloadAttachmentBlocMock,
          ),
        ],
        child: Material(
            child: HistoryDetails(
          billToInfo: BillToInfo.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          orderHistoryBasicInfo:
              OrderHistoryBasicInfo.empty().copyWith(soldTo: 'slkfjdl'),
          orderHistoryItem: OrderHistoryItem.empty(),
        )),
      );
    }

    testWidgets('Order History Details page test ', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty(),
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      await tester.pumpWidget(getWUT());
      final orderHistoryDetailsList =
          find.byKey(const Key('orderHistoryDetailsPage'));
      final orderDetailsField = find.byKey(const Key('orderDetails'));
      final soldToAddressField = find.byKey(const Key('soldToAddress'));
      final shiptoAddressField = find.byKey(const Key('shipToAddress'));

      final invoicesField = find.byKey(const Key('invoices'));

      expect(orderHistoryDetailsList, findsOneWidget);

      expect(orderDetailsField, findsOneWidget);
      expect(soldToAddressField, findsOneWidget);
      expect(shiptoAddressField, findsOneWidget);

      expect(invoicesField, findsOneWidget);
    });
    testWidgets(' system message test ', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: orderHistoryDetails,
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      await tester.pumpWidget(getWUT());
      final systemMessage = find.byKey(const Key('systemMessage'));

      expect(systemMessage, findsOneWidget);
    });
    testWidgets('Message empty', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: orderHistoryDetails,
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsMessages: <OrderHistoryDetailsMessages>[
                OrderHistoryDetailsMessages.empty().copyWith(message: '')
              ]),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      final message = find.textContaining('messageEmpty ');
      expect(message, findsNothing);
      if (mockOrderHistoryDetailsBloc
          .state.orderHistoryDetails.orderHistoryDetailsMessages.isEmpty) {
        expect(message, findsOneWidget);
      }
    });

    testWidgets('Bill to address  not visiable test ', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: orderHistoryDetails,
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(),
      );
      final isBillToenable = eligibilityBlocMock.state.isOrderTypeEnable;

      expect(isBillToenable, false);
      when(() => mockOrderHistoryListBloc.state).thenReturn(
        OrderHistoryListState.initial()
            .copyWith(orderHistoryList: orderHistory),
      );

      await tester.pumpWidget(getWUT());
      final billToAddress = find.byKey(const Key('billToAddress'));

      expect(billToAddress, findsNothing);
    });
    testWidgets('Bill to address   visiable test ', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: orderHistoryDetails,
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
          enableBillTo: true,
        )),
      );
      // final isBillToenable = eligibilityBlocMock.state.isOrderTypeEnable;

      // expect(isBillToenable, false);
      // when(() => mockOrderHistoryListBloc.state).thenReturn(
      //   OrderHistoryListState.initial()
      //       .copyWith(orderHistoryList: orderHistory),
      // );

      await tester.pumpWidget(getWUT());
      final billToAddress = find.byKey(const Key('billToAddress'));

      expect(billToAddress, findsOneWidget);
    });

    testWidgets('PaymentTerm text visiable test ', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: orderHistoryDetails,
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty()
                .copyWith(enablePaymentTerms: true)),
      );
      // final isPaymentTermEnable = eligibilityBlocMock.state.isPaymentTermEnable;
      // expect(isPaymentTermEnable, false);

      await tester.pumpWidget(getWUT());
      final paymentTerm = find.byKey(const Key('paymentTerm'));

      expect(paymentTerm, findsOneWidget);
    });
    testWidgets('OrderHistoryDetailsPaget not visiable test ', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty(),
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final orderHistoryDetailsList =
          find.byKey(const Key('backToOrderHistoryDetailsPage'));

      await tester.tap(orderHistoryDetailsList);
      await tester.pumpAndSettle(const Duration(milliseconds: 50));

      expect(orderHistoryDetailsList, findsNothing);
    });

    testWidgets('Reorder test ', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty(),
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      when(() => materialPriceDetailBlocMock.state).thenReturn(
        MaterialPriceDetailState.initial().copyWith(
          isValidating: true,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final reorder = find.byKey(const Key('reorder'));

      await tester.tap(reorder);
      await tester.pump();
    });
    testWidgets('Additional comments test ', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: orderHistoryDetails,
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty()
                .copyWith(showPOAttachment: true)),
      );
      when(() => downloadAttachmentBlocMock.state).thenReturn(
        DownloadAttachmentState.initial()
            .copyWith(fileFetchMode: FileFetchMode.view),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final additionCommentsField = find.byKey(const Key('additionalComment'));
      expect(additionCommentsField, findsOneWidget);
    });
    testWidgets('poDocument empty', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: orderHistoryDetails,
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsPoDocuments: <OrderHistoryDetailsPODocuments>[
                OrderHistoryDetailsPODocuments.empty().copyWith(url: '')
              ]),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      final pODocumentsUrl = find.textContaining('pODocumentsUrl');
      // expect(pODocumentsUrl, findsNothing);
      if (mockOrderHistoryDetailsBloc
          .state.orderHistoryDetails.orderHistoryDetailsPoDocuments.isEmpty) {
        expect(pODocumentsUrl, findsOneWidget);
      }
    });
    testWidgets('addToCartPressed test ', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty(),
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      when(() => materialPriceDetailBlocMock.state).thenReturn(
        MaterialPriceDetailState.initial().copyWith(
          isValidating: false,
          isFetching: false,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final addToCartPressed = find.byKey(const Key('addToCartPressed'));
      expect(addToCartPressed, findsOneWidget);
      await tester.tap(addToCartPressed);
      await tester.pumpAndSettle(const Duration(milliseconds: 50));
    });

    testWidgets('dispalyPrice test ', (tester) async {
      when(() => mockOrderHistoryDetailsBloc.state).thenReturn(
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: orderHistoryDetails,
          failureOrSuccessOption: none(),
          isLoading: false,
          showErrorMessage: false,
        ),
      );
      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty()
                .copyWith(currency: Currency('vnd'))),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      // final addToCartPressed = find.byKey(const Key('addToCartPressed'));
      // expect(addToCartPressed, findsOneWidget);
      // await tester.tap(addToCartPressed);
      // await tester.pumpAndSettle(const Duration(milliseconds: 50));
    });
  });
}
