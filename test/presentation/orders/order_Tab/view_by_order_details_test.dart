import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
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
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/material_tax.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/quantity_and_price_with_tax.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_item.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_material.dart';
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

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ViewByOrderBlocMock extends MockBloc<ViewByOrderEvent, ViewByOrderState>
    implements ViewByOrderBloc {}

class ViewByItemDetailsBlocMock
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

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

class MockPoAttachmentBloc
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final viewByOrderBlocMock = ViewByOrderBlocMock();
  final mockViewByItemDetailsBloc = ViewByItemDetailsBlocMock();
  final viewByOrderDetailsBlocMock = ViewByOrderDetailsBlockMock();
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
  late PoAttachmentBloc mockPoAttachmentBloc;
  late List<CustomerCodeInfo> customerCodeInfoList;
  late ViewByOrder viewByOrder;
  late ViewByOrder viewByOrderWithCounterOffer;
  late ViewByOrder viewByOrderWithTax;
  late OrderHistoryDetailsOrderItem fakeOrderHistoryItem;
  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
    locator.registerFactory(() => reOrderPermissionBlocMock);
    registerFallbackValue(CustomerCodeInfo.empty());
    registerFallbackValue(SalesOrganisation.empty());
    registerFallbackValue(ShipToInfo.empty());
    cartBlocMock = CartBlocMock();

    autoRouterMock = locator<AppRouter>();
    customerCodeInfoList =
        await CustomerCodeLocalDataSource().getCustomerCodeList();
    locator.registerLazySingleton<MixpanelService>(() => MockMixpanelService());
    viewByOrder = await ViewByOrderLocalDataSource().getViewByOrders();
    fakeOrderHistoryItem =
        viewByOrder.orderHeaders.first.orderHistoryDetailsOrderItem.first;
    viewByOrderWithCounterOffer = viewByOrder.copyWith(
      orderHeaders: [
        viewByOrder.orderHeaders.first.copyWith(
          orderHistoryDetailsOrderItem: [
            fakeOrderHistoryItem.copyWith(
              isCounterOffer: true,
              originPrice: ZpPrice('100.1'),
              unitPrice: ZpPrice('98'),
            )
          ],
        ),
      ],
    );
    viewByOrderWithTax = viewByOrderWithCounterOffer.copyWith(
      orderHeaders: [
        viewByOrder.orderHeaders.first.copyWith(
          orderHistoryDetailsOrderItem: [
            fakeOrderHistoryItem.copyWith(
              tax: 9,
              totalPrice: TotalPrice('345.6'),
            )
          ],
        ),
      ],
    );
  });
  group('Order History Details Page', () {
    setUp(() {
      customerCodeBlocMock = CustomerCodeBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      mockProductImageBloc = MockProductImageBloc();
      mockAuthBloc = MockAuthBloc();
      mockPoAttachmentBloc = MockPoAttachmentBloc();
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeClientUser,
        ),
      );
      when(() => viewByOrderBlocMock.state)
          .thenReturn(ViewByOrderState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => viewByOrderDetailsBlocMock.state)
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
      when(() => mockPoAttachmentBloc.state)
          .thenReturn(PoAttachmentState.initial());

      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistory: OrderHistory.empty().copyWith(
            orderHistoryItems: <OrderHistoryItem>[
              OrderHistoryItem.empty().copyWith(
                materialNumber: MaterialNumber('000000000021247719'),
                unitPrice: ZpPrice('17.2'),
                totalPrice: TotalPrice('516'),
              )
            ],
          ),
        ),
      );
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        useMediaQuery: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<ViewByOrderBloc>(
            create: (context) => viewByOrderBlocMock,
          ),
          BlocProvider<ViewByItemDetailsBloc>(
            create: (context) => mockViewByItemDetailsBloc,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ViewByOrderDetailsBloc>(
            create: (context) => viewByOrderDetailsBlocMock,
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
          BlocProvider<PoAttachmentBloc>(
            create: (context) => mockPoAttachmentBloc,
          )
        ],
        child: const Material(
          child: ViewByOrderDetailsPage(),
        ),
      );
    }

    testWidgets('Payment Term if empty', (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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

    group('Attachments -', () {
      final attachmentList = [
        PoDocuments.empty().copyWith(name: 'fake-name-1'),
        PoDocuments.empty().copyWith(name: 'fake-name-2'),
      ];

      setUp(() {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSalesOrgConfigShowPoAttachment,
          ),
        );
      });

      testWidgets('Empty state', (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(
          find.byKey(WidgetKeys.balanceTextRow('Attachments'.tr(), 'NA')),
          findsOneWidget,
        );
      });

      testWidgets('Collapsed state', (tester) async {
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
                orderHistoryDetailsPoDocuments: attachmentList,
              ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(find.text('Attachments:'), findsOneWidget);
        expect(find.byKey(WidgetKeys.poAttachmentTile), findsOneWidget);
        final showMoreButton = find.text('Show more'.tr());
        expect(showMoreButton, findsOneWidget);
        await tester.tap(showMoreButton);
        await tester.pump();
        verify(
          () => viewByOrderDetailsBlocMock
              .add(const ViewByOrderDetailsEvent.expandAttachments()),
        ).called(1);
      });

      testWidgets('Expanded state', (tester) async {
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty()
                .copyWith(orderHistoryDetailsPoDocuments: attachmentList),
            isExpanded: true,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(find.text('Attachments:'), findsOneWidget);
        final poAttachmentTile = find.byKey(WidgetKeys.poAttachmentTile);
        const index = 1;
        expect(
          poAttachmentTile,
          findsNWidgets(attachmentList.length),
        );
        expect(find.text('Show less'.tr()), findsOneWidget);
        await tester.tap(poAttachmentTile.at(index));
        await tester.pump();
        verify(
          () => mockPoAttachmentBloc.add(
            PoAttachmentEvent.downloadFile(files: [attachmentList[index]]),
          ),
        ).called(1);
      });

      testWidgets('Download success', (tester) async {
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
                orderHistoryDetailsPoDocuments: attachmentList,
              ),
        );

        whenListen(
          mockPoAttachmentBloc,
          Stream.fromIterable([
            PoAttachmentState.initial().copyWith(
              failureOrSuccessOption: optionOf(const Right(unit)),
              fileOperationMode: FileOperationMode.download,
              isFetching: false,
            )
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        final snackBarMessage = find.byKey(WidgetKeys.customSnackBarMessage);
        expect(
          tester.widget<Text>(snackBarMessage).data,
          equals('Attachments downloaded successfully.'.tr()),
        );
      });

      testWidgets('Download failure', (tester) async {
        const fakeMessage = 'Fake-error-message';
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
                orderHistoryDetailsPoDocuments: attachmentList,
              ),
        );

        whenListen(
          mockPoAttachmentBloc,
          Stream.fromIterable([
            PoAttachmentState.initial().copyWith(
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other(fakeMessage))),
              fileOperationMode: FileOperationMode.download,
              isFetching: false,
            )
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        final snackBarMessage = find.byKey(WidgetKeys.customSnackBarMessage);
        expect(
          tester.widget<Text>(snackBarMessage).data,
          equals(fakeMessage.tr()),
        );
      });
    });

    testWidgets('test when enableSpecialInstructions is true', (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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

    testWidgets('test when enableMobileNumber is true', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            enableMobileNumber: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(BalanceTextRow),
          matching:
              find.byKey(WidgetKeys.balanceTextRow('Contact person', 'NA')),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(BalanceTextRow),
          matching: find.textContaining('Contact number'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('test when enableFutureDeliveryDay is true', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            enableFutureDeliveryDay: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(BalanceTextRow),
          matching: find.textContaining('Requested Delivery Date'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('test when enableReferenceNote is true', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            enableReferenceNote: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(BalanceTextRow),
          matching: find.textContaining('Reference Note'),
        ),
        findsOneWidget,
      );
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

      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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
      final subTotalFinder = find.byKey(WidgetKeys.viewByOrderSubtotalKey);
      final grandTotalFinder = find.byKey(WidgetKeys.viewByOrderGrandTotalKey);
      expect(subTotalFinder, findsOneWidget);
      expect(grandTotalFinder, findsOneWidget);
    });

    testWidgets(
        'test view by order detail item has price not available for PnG',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem,
            ],
          ),
        ),
      ];
      whenListen(
        viewByOrderDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(find.byType(ListView), const Offset(0, -10000), 100);
      await tester.pumpAndSettle();
      final expectedDelivery = find.textContaining(
        '${'Batch'.tr()}: ${fakeOrderHistoryItem.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${fakeOrderHistoryItem.expiryDate.dateOrDashString})',
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
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType.material(),
              ),
            ],
          ),
        ),
      ];
      whenListen(
        viewByOrderDetailsBlocMock,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.fling(find.byType(ListView), const Offset(0, -10000), 100);
      await tester.pumpAndSettle();
      final expectedDelivery = find.textContaining(
        '${'Batch'.tr()}: ${fakeOrderHistoryItem.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${fakeOrderHistoryItem.expiryDate.dateOrDashString})',
      );
      expect(expectedDelivery, findsOneWidget);
    });

    testWidgets(
        'Buy again button not visible when disable create order flag is true',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
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

    testWidgets('Find Order Created Status Label', (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                sAPStatus: OrderStepValue('Order Creating'),
                productType: MaterialInfoType('material'),
              )
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final viewByOrderDetailsList =
          find.byKey(WidgetKeys.viewByOrderDetailsPageListView);
      final orderItemsList = find.byKey(
        WidgetKeys.viewByOrderDetailItemsSection,
      );

      await tester.dragUntilVisible(
        orderItemsList,
        viewByOrderDetailsList,
        const Offset(0.0, -200.0),
      );

      await tester.pumpAndSettle();
      final orderCreatedText = find.text('Order Created');
      expect(orderCreatedText, findsOneWidget);
    });

    testWidgets('Find ordered items list when product type is empty',
        (tester) async {
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType('material'),
              )
            ],
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final viewByOrderDetailsList =
          find.byKey(WidgetKeys.viewByOrderDetailsPageListView);
      final orderItemsList = find.byKey(
        WidgetKeys.viewByOrderDetailItemsSection,
      );

      await tester.dragUntilVisible(
        orderItemsList,
        viewByOrderDetailsList,
        const Offset(0.0, -200.0),
      );
    });

    group('Offer tag -', () {
      testWidgets('Visible when material have offer', (tester) async {
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType.material(),
                promoStatus: true,
              )
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
          find.byKey(WidgetKeys.viewByOrderDetailsPageListView),
          const Offset(0.0, -200.0),
        );
        expect(find.byKey(WidgetKeys.offerTag), findsOneWidget);
      });

      testWidgets('Invisible when material is bonus', (tester) async {
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType.material(),
                type: OrderItemType('Bonus'),
                promoStatus: true,
              )
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        await tester.dragUntilVisible(
          find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
          find.byKey(WidgetKeys.viewByOrderDetailsPageListView),
          const Offset(0.0, -200.0),
        );
        expect(find.byKey(WidgetKeys.offerTag), findsNothing);
      });
    });

    testWidgets('Test display full customer address', (tester) async {
      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          customerCodeInfo: customerCodeInfoList.last,
          shipToInfo: customerCodeInfoList.last.shipToInfos.first,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      const fullCustomerAddress =
          'RSD HOSPITALS SDN BHD (SJMC)   t/a SUBANG JAYA MEDICAL CENTRE NO 1 JALAN SS 12/1A 47500 SUBANG JAYA SELANGOR 47500';
      final customerAddressFinder = find.textContaining(fullCustomerAddress);

      expect(customerAddressFinder, findsOneWidget);
    });

    testWidgets('Test display full ship-to address', (tester) async {
      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          customerCodeInfo: customerCodeInfoList.last,
          shipToInfo: customerCodeInfoList.last.shipToInfos.first,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      const fullShipToAddress =
          'RSD HOSPITALS SDN BHD (SJMC)   t/a SUBANG JAYA MEDICAL CENTRE NO 1 JALAN SS 12/1A 47500 SUBANG JAYA 47500';
      final shipToAddressFinder = find.textContaining(fullShipToAddress);
      expect(shipToAddressFinder, findsOneWidget);
    });

    testWidgets('Status tracker is  displayed with ID market', (tester) async {
      const fakeStatus = 'Order created';
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
              processingStatus: OrderStepValue(fakeStatus),
            ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.statusTracker(fakeStatus)),
        findsOneWidget,
      );
    });

    testWidgets('Order Bundle item is visible when order contains bundle',
        (tester) async {
      final bundleList = [
        OrderHistoryDetailsOrderItem.empty()
            .copyWith(productType: MaterialInfoType.bundle())
      ];
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
              orderHistoryDetailsOrderItem: bundleList,
            ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.viewByOrderDetailBundleSection),
        findsOneWidget,
      );

      expect(find.byType(OrderBundleItem), findsNWidgets(bundleList.length));
    });

    testWidgets('Order Bundle item is invisible when bundle detail is loading',
        (tester) async {
      final bundleList = [
        OrderHistoryDetailsOrderItem.empty()
            .copyWith(productType: MaterialInfoType.bundle())
      ];
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          isLoadingBundleDetail: true,
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: bundleList,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.viewByOrderDetailBundleSection),
        findsOneWidget,
      );

      expect(find.byType(LoadingShimmer), findsWidgets);
    });

    testWidgets('Bundle information is visible', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: salesOrgConfigEnabledBatchNumDisplay,
        ),
      );
      final bundleList = [
        OrderHistoryDetailsOrderItem.empty().copyWith(
          productType: MaterialInfoType.bundle(),
          material: MaterialInfo.empty().copyWith(
            bundle: Bundle.empty().copyWith(bundleCode: 'fake-code'),
          ),
        )
      ];
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: bundleList,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.viewByOrderDetailBundleSection),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.orderHistoryBundleInformation),
        findsOneWidget,
      );
    });

    testWidgets('BundleItemMaterial is visible', (tester) async {
      final fakeOrderHistory = OrderHistory.empty().copyWith(
        orderHistoryItems: <OrderHistoryItem>[
          OrderHistoryItem.empty().copyWith(
            materialNumber: MaterialNumber('1234567890'),
            unitPrice: ZpPrice('17.2'),
            totalPrice: TotalPrice('516'),
          )
        ],
      );
      final bundleList = [
        OrderHistoryDetailsOrderItem.empty().copyWith(
          materialNumber: MaterialNumber('1234567890'),
          productType: MaterialInfoType.bundle(),
        )
      ];
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
              orderHistoryDetailsOrderItem: bundleList,
            ),
      );

      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistory: fakeOrderHistory,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.viewByOrderDetailBundleSection),
        findsOneWidget,
      );

      expect(find.byType(BundleItemMaterial), findsWidgets);

      final orderHistoryBundleItemMaterial =
          find.byKey(WidgetKeys.orderHistoryBundleItemMaterial('1234567890'));

      expect(orderHistoryBundleItemMaterial, findsOneWidget);

      await tester.dragUntilVisible(
        orderHistoryBundleItemMaterial,
        find.byKey(WidgetKeys.viewByOrderDetailsPageListView),
        const Offset(0, -200),
      );
      expect(orderHistoryBundleItemMaterial, findsOneWidget);
      await tester.pump();

      await tester.tap(orderHistoryBundleItemMaterial);
      await tester.pumpAndSettle();
      verify(
        () => mockViewByItemDetailsBloc.add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            orderHistory: fakeOrderHistory,
            orderHistoryItem: fakeOrderHistory.orderHistoryItems.first,
            disableDeliveryDateForZyllemStatus: false,
          ),
        ),
      ).called(1);
    });

    group('in ID market', () {
      testWidgets('Order item', (tester) async {
        const fakeQty = 2;
        const fakePickedQty = 1;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => viewByOrderDetailsBlocMock.state).thenReturn(
          ViewByOrderDetailsState.initial().copyWith.orderHistoryDetails(
            orderHistoryDetailsOrderItem: [
              fakeOrderHistoryItem.copyWith(
                productType: MaterialInfoType.material(),
                qty: fakeQty,
                pickedQuantity: fakePickedQty,
              )
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.drag(find.byType(ListView), const Offset(0, -10000));
        await tester.pumpAndSettle();
        final item = find.byKey(WidgetKeys.genericKey(key: '0'));
        expect(item, findsOneWidget);
        expect(
          find.descendant(of: item, matching: find.byType(StatusLabel)),
          findsNothing,
        );
        expect(
          find.descendant(
            of: item,
            matching: find.text('$fakePickedQty of $fakeQty stocks fulfilled'),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Order summary section', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeEmptySalesConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.priceText),
            matching: find.text('Subtotal (excl. tax):'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.priceText),
            matching: find.text('Small order fee:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.priceText),
            matching: find.text('Tax at 11%:'),
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'Applies to orders less than ${StringUtils.displayPrice(fakeEmptySalesConfigs, 300000)}',
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.priceText),
            matching: find.textContaining('Manual fee:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.priceText),
            matching: find.textContaining('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.priceText),
            matching: find.textContaining('Total savings:'),
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets(
        '=> Display counter offer when order history item is conter offer one',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
        ),
      );
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          viewByOrderList: viewByOrderWithCounterOffer,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: viewByOrderWithCounterOffer.orderHeaders.first,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final orderItemPrice = find.byType(OrderItemPrice);
      expect(orderItemPrice, findsOneWidget);
      final offerAppliedTxt = find.text('Offer applied'.tr());
      expect(offerAppliedTxt, findsOneWidget);
    });

    testWidgets(
        '=> NOT display counter offer when order history item is NOT conter offer one',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
        ),
      );
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          viewByOrderList: viewByOrder,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: viewByOrder.orderHeaders.first,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final orderItemPrice = find.byType(OrderItemPrice);
      expect(orderItemPrice, findsOneWidget);
      final offerAppliedTxt = find.text('Offer applied'.tr());
      expect(offerAppliedTxt, findsNothing);
    });

    testWidgets(
        '=> Display material tax when order history item is applied tax',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
        ),
      );
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          viewByOrderList: viewByOrderWithTax,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: viewByOrderWithTax.orderHeaders.first,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final quantityAndPriceWithTax = find.byType(QuantityAndPriceWithTax);
      expect(quantityAndPriceWithTax, findsOneWidget);
      final materialTax = find.byType(MaterialTax);
      expect(materialTax, findsOneWidget);
    });

    testWidgets(
        '=> NOT display material tax when order history item is NOT applied tax',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
        ),
      );
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          viewByOrderList: viewByOrder,
        ),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial().copyWith(
          orderHistoryDetails: viewByOrder.orderHeaders.first,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final quantityAndPriceWithTax = find.byType(QuantityAndPriceWithTax);
      expect(quantityAndPriceWithTax, findsOneWidget);
      final materialTax = find.byType(MaterialTax);
      expect(materialTax, findsNothing);
    });
  });
}
