import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockAppRouter extends Mock implements AppRouter {}

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

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

class ViewByItemFilterMockBloc
    extends MockBloc<ViewByItemFilterEvent, ViewByItemFilterState>
    implements ViewByItemFilterBloc {}

class ProductImageMockBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

class ViewByItemDetailsMockBloc
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

void main() {
  late CustomerCodeBloc customerCodeBlocMock;
  late AppRouter autoRouterMock;
  late OrderHistory orderHistory;
  late EligibilityBlocMock eligibilityBlocMock;
  late ViewByItemsBloc mockViewByItemsBloc;
  late ViewByOrderDetailsBloc mockViewByOrderDetailsBloc;
  late SalesOrgBloc mockSalesOrgBloc;
  late UserMockBloc userBlocMock;
  late ViewByItemFilterMockBloc mockViewByItemFilterBloc;
  late ProductImageMockBloc mockProductImageBloc;
  late ViewByItemDetailsMockBloc mockViewByItemDetailsBloc;

  final fakeOrderHistoryItems = [
    OrderHistoryItem.empty().copyWith(
      materialNumber: MaterialNumber('fakeMaterialNumber'),
      governmentMaterialCode: 'fakeGovernmentMaterialCode',
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName('fake_manufactureName_1'),
        principalCode: PrincipalCode('00000001231'),
      ),
      createdDate: DateTimeStringValue('2023041107'),
    ),
    OrderHistoryItem.empty().copyWith(
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName('fake_manufactureName_2'),
        principalCode: PrincipalCode('00000001232'),
      ),
      createdDate: DateTimeStringValue('2023041307'),
    ),
  ];

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MockMixpanelService());
    orderHistory = await ViewByItemLocalDataSource().getViewByItems();
    autoRouterMock = locator<AppRouter>();
    customerCodeBlocMock = CustomerCodeBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    mockViewByItemsBloc = ViewByItemsBlocMock();
    mockViewByOrderDetailsBloc = ViewByOrderDetailsBlockMock();
    mockSalesOrgBloc = SalesOrgMockBloc();
    userBlocMock = UserMockBloc();
    mockViewByItemFilterBloc = ViewByItemFilterMockBloc();
    mockProductImageBloc = ProductImageMockBloc();
    mockViewByItemDetailsBloc = ViewByItemDetailsMockBloc();
  });

  group('View by Item In Order section', () {
    setUp(() {
      when(() => userBlocMock.state).thenReturn(
        UserState.initial(),
      );
      when(() => mockViewByItemsBloc.state)
          .thenReturn(ViewByItemsState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockViewByOrderDetailsBloc.state)
          .thenReturn(ViewByOrderDetailsState.initial());
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial(),
      );
      when(() => mockViewByItemFilterBloc.state)
          .thenReturn(ViewByItemFilterState.initial());
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => mockViewByItemDetailsBloc.state)
          .thenReturn(ViewByItemDetailsState.initial());
    });
    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<ViewByItemsBloc>(
            create: (context) => mockViewByItemsBloc,
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
          BlocProvider<ViewByItemFilterBloc>(
            create: (context) => mockViewByItemFilterBloc,
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => mockProductImageBloc,
          ),
          BlocProvider<ViewByItemDetailsBloc>(
            create: (context) => mockViewByItemDetailsBloc,
          ),
        ],
        child: const Material(
          child: ViewByItemsPage(),
        ),
      );
    }

    testWidgets('loaderImage  test ', (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: true,
          orderHistory: OrderHistory.empty(),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
    });

    testWidgets('no record section test when orderHistory is empty',
        (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final noRecordFound = find.byType(
        NoRecordFound,
      );
      expect(noRecordFound, findsOneWidget);
      expect(
        (tester.widget(noRecordFound) as NoRecordFound).subTitle,
        'Items ordered on eZRx+ will be shown here',
      );
    });

    testWidgets(
        'no record section test when orderHistory is empty after search',
        (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          searchKey: SearchKey('fake_key'),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final noRecordFound = find.byType(
        NoRecordFound,
      );
      expect(noRecordFound, findsOneWidget);
      expect(
        (tester.widget(noRecordFound) as NoRecordFound).subTitle,
        'Try adjusting your search or filter selection to find what you’re looking for',
      );
    });

    testWidgets(
        'Show material combination code with GMC part when Government material code is enabled',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigGMCEnabled,
        ),
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: fakeOrderHistoryItems,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final materialInfo = fakeOrderHistoryItems.first;
      final combinationCode = find.text(
        '${materialInfo.materialNumber.displayMatNo} | ${materialInfo.governmentMaterialCode}',
      );
      expect(combinationCode, findsOneWidget);
    });

    testWidgets(
        'Show material combination code without GMC part when Government material code is disabled',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeEmptySalesConfigs,
        ),
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: fakeOrderHistoryItems,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final materialInfo = fakeOrderHistoryItems.first;
      final materialNumber =
          find.text(materialInfo.materialNumber.displayMatNo);
      expect(materialNumber, findsOneWidget);
      final combinationCode = find.text(
        '${materialInfo.materialNumber.displayMatNo} | ${materialInfo.governmentMaterialCode}',
      );
      expect(combinationCode, findsNothing);
    });

    testWidgets('Displaying manufactureName  test ', (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: fakeOrderHistoryItems,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.text('fake_manufactureName_1'), findsOneWidget);
      expect(find.text('fake_manufactureName_2'), findsOneWidget);
    });

    testWidgets('Items - On refresh Feature', (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistory.copyWith(
            orderHistoryItems: fakeOrderHistoryItems,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.drag(
        find.textContaining('fake_manufactureName_1'),
        const Offset(0.0, 1000.0),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );

      await tester.pump(const Duration(seconds: 1));
      verify(
        () => mockViewByItemFilterBloc
            .add(const ViewByItemFilterEvent.initialize()),
      ).called(1);
      verify(
        () => mockViewByItemsBloc.add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: ViewByItemFilter.empty(),
            searchKey: SearchKey(''),
          ),
        ),
      ).called(1);
    });

    testWidgets('Items - On loadMore Feature', (tester) async {
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          orderHistory: orderHistory,
          canLoadMore: true,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.fling(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -5000.0),
        800.0,
      );
      verify(
        () => mockViewByItemsBloc.add(
          const ViewByItemsEvent.loadMore(),
        ),
      ).called(1);
    });

    testWidgets('Tap on view by item Tile ', (tester) async {
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: fakeOrderHistoryItems,
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeShipToInfo,
          user: fakeRootAdminUser,
        ),
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetching: false,
          orderHistory: orderHistoryList,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.tap(
        find.text(
          orderHistoryList.orderHistoryItems.first.principalData.principalName
              .getOrDefaultValue(''),
        ),
      );
      verify(
        () => mockViewByItemDetailsBloc.add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            orderHistory: orderHistoryList,
            orderHistoryItem: orderHistoryList.orderHistoryItems.first,
            disableDeliveryDateForZyllemStatus: false,
          ),
        ),
      ).called(1);
      expect(
        autoRouterMock.current.name,
        'ViewByItemDetailsPageRoute',
      );
    });

    testWidgets('Invoice Number Loading', (tester) async {
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: [
          fakeOrderHistoryItems.first.copyWith(
            invoiceData: InvoiceData.empty()
                .copyWith(invoiceNumber: StringValue('fake-Invoice')),
          ),
        ],
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetchingInvoices: false,
          orderHistory: orderHistoryList,
        ),
      );
      final expectedState = [
        ViewByItemsState.initial().copyWith(
          isFetchingInvoices: true,
          orderHistory: orderHistoryList,
        ),
      ];
      whenListen(
        mockViewByItemsBloc,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.byType(LoadingShimmer), findsOneWidget);
    });

    testWidgets('Invoice Number Loaded', (tester) async {
      final fakeInvoice = StringValue('fake-Invoice');
      final orderHistoryList = orderHistory.copyWith(
        orderHistoryItems: [
          fakeOrderHistoryItems.first.copyWith(
            invoiceData:
                InvoiceData.empty().copyWith(invoiceNumber: fakeInvoice),
          ),
        ],
      );
      when(() => mockViewByItemsBloc.state).thenReturn(
        ViewByItemsState.initial().copyWith(
          isFetchingInvoices: true,
          orderHistory: orderHistoryList,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      expect(find.text('Invoice #${fakeInvoice.getOrCrash()}'), findsOneWidget);
    });
  });
}
