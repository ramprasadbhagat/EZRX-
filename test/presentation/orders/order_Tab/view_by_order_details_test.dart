import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockAppRouter extends Mock implements AppRouter {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

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

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ReOrderPermissionBlocMock
    extends MockBloc<ReOrderPermissionEvent, ReOrderPermissionState>
    implements ReOrderPermissionBloc {}

class MockProductImageBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final mockViewByOrderBloc = ViewByOrderBlocMock();
  final mockViewByOrderDetailsBloc = ViewByOrderDetailsBlockMock();
  final mockSalesOrgBloc = SalesOrgMockBloc();
  final userBlocMock = UserMockBloc();
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late AuthBloc mockAuthBloc;
  late CustomerCodeBloc customerCodeBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late CartBlocMock cartBlocMock;
  late ProductImageBloc mockProductImageBloc;
  final fakeOrderHistoryDetailsOrderItem =
      OrderHistoryDetailsOrderItem.empty().copyWith(
    expiryDate: DateTimeStringValue('2023-10-04'),
    batch: StringValue('fake-batch-number'),
  );

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client'),
    ),
    enableOrderType: true,
  );
  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
    locator.registerFactory(() => reOrderPermissionBlocMock);
    registerFallbackValue(CustomerCodeInfo.empty());
    registerFallbackValue(SalesOrganisation.empty());
    registerFallbackValue(ShipToInfo.empty());
    cartBlocMock = CartBlocMock();

    autoRouterMock = locator<AppRouter>();
  });
  group('Order History Details Page', () {
    setUp(() {
      customerCodeBlocMock = CustomerCodeBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      mockProductImageBloc = MockProductImageBloc();
      mockAuthBloc = MockAuthBloc();
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );
      when(() => mockViewByOrderBloc.state)
          .thenReturn(ViewByOrderState.initial());

      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => mockViewByOrderDetailsBloc.state)
          .thenReturn(ViewByOrderDetailsState.initial());
      when(() => reOrderPermissionBlocMock.state)
          .thenReturn(ReOrderPermissionState.initial());
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            disablePaymentTermsDisplay: false,
          ),
        ),
      );
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
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
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('SG'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerAttr7: CustomerAttr7('ZEV'),
            customerGrp4: CustomerGrp4('VR'),
          ),
        ),
      );
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
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
          BlocProvider<ProductImageBloc>(
            create: (context) => mockProductImageBloc,
          ),
        ],
        child: const Material(
          child: ViewByOrderDetailsPage(),
        ),
      );
    }

    testWidgets('Payment Term if empty', (tester) async {
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsPaymentTerm:
                OrderHistoryDetailsPaymentTerm.empty().copyWith(
              paymentTermCode: PaymentTermCode(''),
              paymentTermDescription: PaymentTermDescription(''),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final paymentTermWidget =
          find.byKey(WidgetKeys.balanceTextRow('Payment Term', 'NA'));
      expect(paymentTermWidget, findsOneWidget);
    });

    testWidgets('loaderImage  test ', (tester) async {
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
      final viewByOrderDetailsPageListView =
          find.byKey(WidgetKeys.viewByOrderDetailsPageListView);
      expect(viewByOrderDetailsPageListView, findsNothing);
    });

    testWidgets('test when disablePaymentTermsDisplay enabled', (tester) async {
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
        ),
      );

      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            disablePaymentTermsDisplay: true,
          ),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            disablePaymentTermsDisplay: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final viewByOrderDetailsPageListView =
          find.byKey(WidgetKeys.viewByOrderDetailsPageListView);
      expect(viewByOrderDetailsPageListView, findsOneWidget);

      final paymentTermsSection = find.byKey(
        WidgetKeys.paymentTermKey,
      );
      expect(paymentTermsSection, findsNothing);
    });

    testWidgets('test PaymentTermsDisplay for rootadminUser', (tester) async {
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
        ),
      );

      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            disablePaymentTermsDisplay: true,
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('root_admin'),
            ),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            disablePaymentTermsDisplay: true,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());

      await tester.pump();

      final viewByOrderDetailsPageListView =
          find.byKey(WidgetKeys.viewByOrderDetailsPageListView);

      expect(viewByOrderDetailsPageListView, findsOneWidget);

      final paymentTermsSection = find.byKey(
        WidgetKeys.paymentTermKey,
      );

      expect(paymentTermsSection, findsOneWidget);
    });

    testWidgets('test when disablePaymentTermsDisplay disabled',
        (tester) async {
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
        ),
      );

      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            disablePaymentTermsDisplay: false,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final viewByOrderDetailsPageListView =
          find.byKey(WidgetKeys.viewByOrderDetailsPageListView);
      expect(viewByOrderDetailsPageListView, findsOneWidget);

      final paymentTermsSection = find.byKey(
        WidgetKeys.paymentTermKey,
      );
      expect(paymentTermsSection, findsOneWidget);
    });

    testWidgets('test when enableSpecialInstructions is false', (tester) async {
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
        ),
      );

      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            enableSpecialInstructions: false,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final expectedDelivery = find.textContaining('Delivery instruction');
      expect(expectedDelivery, findsNothing);
    });

    testWidgets('test when enableSpecialInstructions is true', (tester) async {
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
        ),
      );

      when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            enableSpecialInstructions: true,
          ),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            enableSpecialInstructions: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final expectedDelivery = find.textContaining('Delivery instruction');
      expect(expectedDelivery, findsOneWidget);
    });

    testWidgets(
        'test display order details sub total & grand total as 0 for PnG materials',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2001'),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            currency: Currency('myr'),
          ),
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('external_sales_rep'),
            ),
          ),
        ),
      );

      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderNumber: OrderNumber('0200274167'),
            orderValue: 516.00,
            totalTax: 0.0,
            invoiceNumber: StringValue(''),
            orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[
              OrderHistoryDetailsOrderItem.empty().copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('0000101308'),
                  principalName: PrincipalName('PROCTER AND GAMBLE'),
                ),
                qty: 30,
                materialNumber: MaterialNumber('000000000021247719'),
                unitPrice: ZpPrice('17.2'),
                totalPrice: TotalPrice('516'),
                type: OrderItemType('Comm'),
              )
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final subTotalFinder = find
          .byKey(WidgetKeys.balanceTextRow('Subtotal (excl. tax)', 'MYR .00'));
      final grandTotalFinder =
          find.byKey(WidgetKeys.balanceTextRow('Grand total', 'MYR .00'));
      expect(subTotalFinder, findsOneWidget);
      expect(grandTotalFinder, findsOneWidget);
    });

    testWidgets(
        'test view by order detail item has price not available for PnG',
        (tester) async {
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            invoiceNumber: StringValue(''),
            orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[
              OrderHistoryDetailsOrderItem.empty().copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('0000101308'),
                  principalName: PrincipalName('PROCTER AND GAMBLE'),
                ),
                materialNumber: MaterialNumber('000000000021247719'),
                unitPrice: ZpPrice('17.2'),
                totalPrice: TotalPrice('516'),
                type: OrderItemType('Comm'),
                productType: MaterialInfoType('material'),
              )
            ],
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2001'),
          ),
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('external_sales_rep'),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.fling(find.byType(ListView), const Offset(0, -10000), 100);
      await tester.pumpAndSettle();
      final viewByOrderDetailsItemFinder = find.byKey(
        WidgetKeys.genericKey(
          key: '0',
        ),
      );
      final priceNotAvailableFinder = find.text(
        'Price Not Available',
        findRichText: true,
      );
      expect(viewByOrderDetailsItemFinder, findsOneWidget);
      expect(priceNotAvailableFinder, findsNWidgets(2));
    });

    testWidgets(
        ' => Hide Batch and EXP info when salesOrgConfig BatchNumDisplay is false',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: salesOrgConfigDisabledBatchNumDisplay,
        ),
      );
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryDetailsOrderItem,
            ],
          ),
        ),
      ];
      whenListen(
        mockViewByOrderDetailsBloc,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(find.byType(ListView), const Offset(0, -10000), 100);
      await tester.pumpAndSettle();
      final expectedDelivery = find.textContaining(
        '${'Batch'.tr()}: ${fakeOrderHistoryDetailsOrderItem.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${fakeOrderHistoryDetailsOrderItem.expiryDate.dateOrDashString})',
      );
      expect(expectedDelivery, findsNothing);
    });

    testWidgets(
        ' => Display Batch and EXP info when salesOrgConfig BatchNumDisplay is true',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: salesOrgConfigEnabledBatchNumDisplay,
        ),
      );
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryDetailsOrderItem.copyWith(
                productType: MaterialInfoType.material(),
              ),
            ],
          ),
        ),
      ];
      whenListen(
        mockViewByOrderDetailsBloc,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(find.byType(ListView), const Offset(0, -10000), 100);
      await tester.pumpAndSettle();
      final expectedDelivery = find.textContaining(
        '${'Batch'.tr()}: ${fakeOrderHistoryDetailsOrderItem.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${fakeOrderHistoryDetailsOrderItem.expiryDate.dateOrDashString})',
      );
      expect(expectedDelivery, findsOneWidget);
    });

    testWidgets(
        'Buy again button not visible when disable create order flag is true',
        (tester) async {
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
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

      final buyAgainButton = find.byKey(
        WidgetKeys.viewByOrderBuyAgainButtonKey,
      );

      expect(buyAgainButton, findsNothing);
    });
    testWidgets(
        'Buy again button visible when disable create order flag is false',
        (tester) async {
      when(() => mockViewByOrderDetailsBloc.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
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

      final buyAgainButton = find.byKey(
        WidgetKeys.viewByOrderBuyAgainButtonKey,
      );

      expect(buyAgainButton, findsOneWidget);
    });
  });
}
