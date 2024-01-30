import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/item_tax.dart';
import 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';
import 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_attachment_section.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_material.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class AutoRouterMock extends Mock implements AppRouter {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ViewByOrderBlocMock extends MockBloc<ViewByOrderEvent, ViewByOrderState>
    implements ViewByOrderBloc {}

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class OrderSummaryBlocMock
    extends MockBloc<OrderSummaryEvent, OrderSummaryState>
    implements OrderSummaryBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ViewByOrderDetailsBlocMock
    extends MockBloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState>
    implements ViewByOrderDetailsBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ViewByItemDetailsBlocMock
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

class PaymentCustomerInformationBlocMock extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

void main() {
  late AppRouter autoRouterMock;
  late SalesOrgBloc mockSalesOrgBloc;
  late CustomerCodeBloc customerCodeBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late OrderSummaryBloc orderSummaryBlocMock;
  late UserBloc userBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late ViewByOrderDetailsBloc viewByOrderDetailsBlocMock;
  late CartBloc cartBlocMock;
  late MixpanelService mixpanelServiceMock;
  late ViewByItemDetailsBloc viewByItemDetailsBlocMock;
  late ProductImageBloc productImageBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  late ViewByOrderBloc viewByOrderBlocMock;
  late ViewByItemsBloc viewByItemsBlocMock;
  final fakeOrderNumber = OrderNumber('fake-order-number');
  late OrderHistoryDetailsOrderItem fakeBundleItem;
  late OrderHistoryDetailsOrderItem fakeMaterialItem;
  late OrderHistoryDetails fakeOrderHistoryDetails;
  late OrderHistory fakeOrderHistory;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  setUpAll(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
      locator.registerLazySingleton(() => AutoRouterMock());
      locator
          .registerLazySingleton<MixpanelService>(() => MockMixpanelService());

      autoRouterMock = locator<AutoRouterMock>();
      customerCodeBlocMock = CustomerCodeBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      viewByOrderBlocMock = ViewByOrderBlocMock();
      viewByItemsBlocMock = ViewByItemsBlocMock();
      userBlocMock = UserBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      viewByOrderDetailsBlocMock = ViewByOrderDetailsBlocMock();
      cartBlocMock = CartBlocMock();
      viewByItemDetailsBlocMock = ViewByItemDetailsBlocMock();
      productImageBlocMock = ProductImageBlocMock();
      poAttachmentBlocMock = PoAttachmentBlocMock();
      mixpanelServiceMock = locator<MixpanelService>();
      paymentCustomerInformationBlocMock = PaymentCustomerInformationBlocMock();
      fakeOrderHistoryDetails =
          await ViewByOrderDetailsLocalDataSource().getOrderHistoryDetails();
      fakeOrderHistory = await ViewByItemLocalDataSource().getViewByItems();
      fakeBundleItem = fakeOrderHistoryDetails.orderHistoryDetailsOrderItem
          .firstWhere((e) => e.productType.typeBundle);
      fakeMaterialItem =
          fakeOrderHistoryDetails.orderHistoryDetailsOrderItem.firstWhere(
        (e) => e.productType.typeMaterial && e.type.isMaterialTypeComm,
      );
    },
  );
  setUp(
    () async {
      mockSalesOrgBloc = MockSalesOrgBloc();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial(),
      );
      when(() => viewByOrderDetailsBlocMock.state).thenReturn(
        ViewByOrderDetailsState.initial(),
      );
      when(() => cartBlocMock.state).thenReturn(
        CartState.initial(),
      );
      when(() => viewByItemDetailsBlocMock.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          orderHistory: fakeOrderHistory,
        ),
      );
      when(() => productImageBlocMock.state).thenReturn(
        ProductImageState.initial(),
      );
      when(() => poAttachmentBlocMock.state).thenReturn(
        PoAttachmentState.initial(),
      );
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial(),
      );
      when(() => viewByItemsBlocMock.state).thenReturn(
        ViewByItemsState.initial(),
      );
      when(() => autoRouterMock.currentPath).thenReturn('fake-path');
      when(() => paymentCustomerInformationBlocMock.state).thenReturn(
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation:
              await PaymentCustomerInformationLocalDataSource()
                  .getPaymentCustomerInformation(),
        ),
      );
    },
  );

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      child: const OrderSuccessPage(),
      providers: [
        BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AdditionalDetailsBloc>(
          create: (context) => additionalDetailsBlocMock,
        ),
        BlocProvider<OrderSummaryBloc>(
          create: (context) => orderSummaryBlocMock,
        ),
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<ViewByOrderDetailsBloc>(
          create: (context) => viewByOrderDetailsBlocMock,
        ),
        BlocProvider<CartBloc>(
          create: (context) => cartBlocMock,
        ),
        BlocProvider<ViewByItemDetailsBloc>(
          create: (context) => viewByItemDetailsBlocMock,
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => productImageBlocMock,
        ),
        BlocProvider<ViewByOrderBloc>(
          create: (context) => viewByOrderBlocMock,
        ),
        BlocProvider<ViewByItemsBloc>(
          create: (context) => viewByItemsBlocMock,
        ),
        BlocProvider<PoAttachmentBloc>(
          create: (context) => poAttachmentBlocMock,
        ),
        BlocProvider<PaymentCustomerInformationBloc>(
          create: ((context) => paymentCustomerInformationBlocMock),
        ),
      ],
    );
  }

  //////////////////////Finder//////////////////////////////////////////////////
  final orderSummaryTotalSaving =
      find.byKey(WidgetKeys.orderSummaryTotalSaving);
  /////////////////////////////////////////////////////////////////////////////

  group('Test Order Success Page', () {
    testWidgets(
      'Payment Term',
      (tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isConfirming: false,
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              invoiceNumber: StringValue('fake-number'),
              orderHistoryDetailsPaymentTerm:
                  OrderHistoryDetailsPaymentTerm.empty().copyWith(
                paymentTermCode: PaymentTermCode(''),
                paymentTermDescription: PaymentTermDescription(''),
              ),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final orderSuccessPage = find.byKey(WidgetKeys.orderSuccess);
        expect(orderSuccessPage, findsOneWidget);
        final paymentTermWidget =
            find.byKey(WidgetKeys.balanceTextRow('Payment term', 'NA'));
        expect(paymentTermWidget, findsOneWidget);
      },
    );

    testWidgets(
      'Find NA if Po Reference is left empty',
      (tester) async {
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              invoiceNumber: StringValue('fake-number'),
              pOReference: POReference(''),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final poReference =
            find.byKey(WidgetKeys.balanceTextRow('PO reference', 'NA'));
        expect(poReference, findsOneWidget);
      },
    );

    testWidgets(
      'Order History navigation check',
      (tester) async {
        when(() => autoRouterMock.navigateNamed('main/orders_tab'))
            .thenAnswer((invocation) => Future(() => null));
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isConfirming: false,
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              invoiceNumber: StringValue('fake-number'),
              orderHistoryDetailsPaymentTerm:
                  OrderHistoryDetailsPaymentTerm.empty().copyWith(
                paymentTermCode: PaymentTermCode(''),
                paymentTermDescription: PaymentTermDescription(''),
              ),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final finder = find.byWidgetPredicate(
          (widget) => widget is RichText && tapTextSpan(widget, 'Orders'),
        );
        await tester.pumpAndSettle();
        expect(finder, findsOneWidget);
        verify(() => autoRouterMock.navigateNamed('main/orders_tab')).called(1);
        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      'Order summary price check - subTotal include tax & grandTotal price ',
      (tester) async {
        const finalPrice = 88.0;
        const vatValue = 9;
        const quantity = 2;
        const subTotalValueWithoutTax = finalPrice * quantity;
        const totalTax = subTotalValueWithoutTax * vatValue * 0.01;
        const grandTotalValue = subTotalValueWithoutTax + totalTax;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isConfirming: false,
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsOrderItem: [
                OrderHistoryDetailsOrderItem.empty().copyWith(
                  qty: quantity,
                )
              ],
              orderValue: subTotalValueWithoutTax,
              totalTax: totalTax,
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final orderSummarySection =
            find.byKey(WidgetKeys.orderSuccessOrderSummarySection);
        final scrollList = find.byKey(WidgetKeys.scrollList);
        await tester.dragUntilVisible(
          orderSummarySection,
          scrollList,
          const Offset(0, -300),
        );
        //sub total (excl. tax)
        expect(
          find.descendant(
            of: orderSummarySection,
            matching: find.text('Subtotal (excl.tax):'),
          ),
          findsOneWidget,
        );
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is RichText &&
                widget.key == WidgetKeys.priceComponent &&
                widget.text
                    .toPlainText()
                    .contains(subTotalValueWithoutTax.toStringAsFixed(2)),
          ),
          findsOneWidget,
        );
        //grand total
        expect(
          find.descendant(
            of: orderSummarySection,
            matching: find.text('Grand total:'),
          ),
          findsOneWidget,
        );
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is RichText &&
                widget.key == WidgetKeys.priceComponent &&
                widget.text
                    .toPlainText()
                    .contains(grandTotalValue.toStringAsFixed(2)),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Order summary check - Tax rate display for other market except VN',
      (tester) async {
        const finalPrice = 100.0;
        const vatValue = 10.0;
        const quantity = 2;
        const subTotalValueWithoutTax = finalPrice * quantity;
        const totalTax = subTotalValueWithoutTax * vatValue * 0.01;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
            salesOrganisation: fakeSGSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsOrderItem: [
                OrderHistoryDetailsOrderItem.empty().copyWith(
                  qty: quantity,
                  tax: vatValue,
                  unitPrice: finalPrice,
                )
              ],
              orderValue: subTotalValueWithoutTax,
              totalTax: totalTax,
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final orderSummarySection =
            find.byKey(WidgetKeys.orderSuccessOrderSummarySection);
        final scrollList = find.byKey(WidgetKeys.scrollList);
        await tester.dragUntilVisible(
          orderSummarySection,
          scrollList,
          const Offset(0, -300),
        );
        //Fetching the vat value for other market - 5
        final taxRateFinder = find.text(
          'Tax at ${fakeSGSalesOrgConfigs.vatValue}%:',
        );
        expect(
          find.descendant(
            of: find.byKey(
              WidgetKeys.orderSummaryTax,
            ),
            matching: taxRateFinder,
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Order summary check - Tax rate display from salesOrgConfig vat value for other market except VN',
      (tester) async {
        const finalPrice = 100.0;
        const quantity = 2;
        const subTotalValueWithoutTax = finalPrice * quantity;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            salesOrganisation: fakeKHSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsOrderItem: [
                OrderHistoryDetailsOrderItem.empty().copyWith(
                  qty: quantity,
                  unitPrice: finalPrice,
                )
              ],
              orderValue: subTotalValueWithoutTax,
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final orderSummarySection =
            find.byKey(WidgetKeys.orderSuccessOrderSummarySection);
        final scrollList = find.byKey(WidgetKeys.scrollList);
        await tester.dragUntilVisible(
          orderSummarySection,
          scrollList,
          const Offset(0, -300),
        );
        //Fetching the vat value from salesOrgConfig - 10
        final taxRateFinder = find.text(
          'Tax at ${fakeKHSalesOrgConfigs.vatValue}%:',
        );
        expect(
          find.descendant(
            of: find.byKey(
              WidgetKeys.orderSummaryTax,
            ),
            matching: taxRateFinder,
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Order summary check - Hide Tax rate display for VN',
      (tester) async {
        const finalPrice = 88.0;
        const vatValue = 9;
        const quantity = 2;
        const subTotalValueWithoutTax = finalPrice * quantity;
        const totalTax = subTotalValueWithoutTax * vatValue * 0.01;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsOrderItem: [
                OrderHistoryDetailsOrderItem.empty().copyWith(
                  qty: quantity,
                )
              ],
              orderValue: subTotalValueWithoutTax,
              totalTax: totalTax,
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final orderSummarySection =
            find.byKey(WidgetKeys.orderSuccessOrderSummarySection);
        final scrollList = find.byKey(WidgetKeys.scrollList);
        await tester.dragUntilVisible(
          orderSummarySection,
          scrollList,
          const Offset(0, -300),
        );
        //Hide the vat value
        final taxRateFinder = find.text('Tax:');
        expect(
          find.descendant(
            of: find.byKey(
              WidgetKeys.orderSummaryTax,
            ),
            matching: taxRateFinder,
          ),
          findsOneWidget,
        );
      },
    );
    testWidgets(
      'Order summary price check - subTotal include exclude tax & grandTotal price & tax',
      (tester) async {
        const finalPrice = 88.0;
        const vatValue = 9;
        const quantity = 2;
        const subTotalValueWithoutTax = finalPrice * quantity;
        const totalTax = subTotalValueWithoutTax * vatValue * 0.01;
        const grandTotalValue = subTotalValueWithoutTax + totalTax;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isConfirming: false,
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsOrderItem: [
                OrderHistoryDetailsOrderItem.empty().copyWith(
                  qty: quantity,
                )
              ],
              orderValue: subTotalValueWithoutTax,
              totalTax: totalTax,
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final orderSummarySection =
            find.byKey(WidgetKeys.orderSuccessOrderSummarySection);
        //sub total (excl. tax)
        expect(
          find.descendant(
            of: orderSummarySection,
            matching: find.text('Subtotal (excl.tax):'),
          ),
          findsOneWidget,
        );
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is RichText &&
                widget.key == WidgetKeys.priceComponent &&
                widget.text
                    .toPlainText()
                    .contains(subTotalValueWithoutTax.toStringAsFixed(2)),
          ),
          findsOneWidget,
        );
        //grand total
        expect(
          find.descendant(
            of: orderSummarySection,
            matching: find.text('${'Grand total'.tr()}:'),
          ),
          findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.orderSummaryTax),
          findsOneWidget,
        );
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is RichText &&
                widget.key == WidgetKeys.priceComponent &&
                widget.text
                    .toPlainText()
                    .contains(grandTotalValue.toStringAsFixed(2)),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Tap on order number',
      (tester) async {
        when(
          () => autoRouterMock.push(const ViewByOrderDetailsPageRoute()),
        ).thenAnswer((invocation) => Future(() => null));
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderNumber: fakeOrderNumber,
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final orderIdFinder = find.byKey(WidgetKeys.orderSuccessOrderId);
        expect(orderIdFinder, findsOneWidget);
        await tester.tap(orderIdFinder);
        await tester.pumpAndSettle();
        verify(
          () => viewByOrderDetailsBlocMock.add(
            ViewByOrderDetailsEvent.fetch(
              orderNumber: fakeOrderNumber,
            ),
          ),
        ).called(1);
        verify(
          () => autoRouterMock.push(const ViewByOrderDetailsPageRoute()),
        ).called(1);
      },
    );
    testWidgets('Tap back button', (tester) async {
      when(
        () => autoRouterMock.popUntilRouteWithPath('main'),
      ).thenAnswer((invocation) => Future(() => null));
      await tester.pumpWidget(getWidget());
      await tester.pump();
      await tester.tap(find.byKey(WidgetKeys.closeButton));
      await tester.pumpAndSettle();
      verify(
        () => autoRouterMock.popUntilRouteWithPath('main'),
      ).called(1);
    });

    testWidgets('Order Confirm Done', (tester) async {
      final fakeOrderDetail = OrderHistoryDetails.empty().copyWith(
        orderNumber: fakeOrderNumber,
        orderHistoryDetailsOrderItem: [
          fakeBundleItem,
        ],
      );
      whenListen(
        orderSummaryBlocMock,
        Stream.fromIterable(
          [
            OrderSummaryState.initial().copyWith(
              isConfirming: true,
            ),
            OrderSummaryState.initial().copyWith(
              orderHistoryDetails: fakeOrderDetail,
            ),
          ],
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: MixpanelEvents.placeOrderSuccess,
          properties: {
            MixpanelProps.orderNumber:
                fakeOrderDetail.orderNumber.getOrDefaultValue(''),
            MixpanelProps.grandTotal: fakeOrderDetail.grandTotal(false),
            MixpanelProps.totalQty: fakeOrderDetail.orderItemsCount,
            MixpanelProps.requestDeliveryDate:
                fakeOrderDetail.requestedDeliveryDate.dateOrNaString,
          },
        ),
      ).called(1);

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: MixpanelEvents.successOrderItem,
          properties: {
            MixpanelProps.orderNumber:
                fakeOrderDetail.orderNumber.getOrDefaultValue(''),
            MixpanelProps.productName: fakeBundleItem.materialDescription,
            MixpanelProps.productCode:
                fakeBundleItem.materialNumber.displayMatNo,
            MixpanelProps.productQty: fakeBundleItem.qty,
            MixpanelProps.grandTotal: fakeBundleItem.itemTotalPrice(
              false,
            ),
            MixpanelProps.unitPrice: fakeBundleItem.itemUnitPrice(
              false,
            ),
          },
        ),
      ).called(1);

      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.fetch(
            filter: ViewByOrdersFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
          ),
        ),
      ).called(1);

      verify(
        () => viewByItemsBlocMock.add(
          ViewByItemsEvent.fetch(
            viewByItemFilter: ViewByItemFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
          ),
        ),
      ).called(1);

      verify(
        () => viewByItemDetailsBlocMock.add(
          ViewByItemDetailsEvent.searchOrderHistory(
            searchKey: SearchKey(
              fakeOrderDetail.orderNumber.getOrDefaultValue(''),
            ),
          ),
        ),
      ).called(1);

      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text(
            'Order submitted'.tr(),
          ),
        ),
        findsOneWidget,
      );
      verify(
        () => cartBlocMock.add(
          const CartEvent.clearCart(),
        ),
      ).called(1);
    });

    testWidgets('Show Shimmer When Confirming', (tester) async {
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          isConfirming: true,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.loaderImage), findsOneWidget);
    });

    group('Bundle -', () {
      setUp(() {
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith.orderHistoryDetails(
            orderHistoryDetailsOrderItem: [fakeBundleItem],
          ),
        );
      });
      testWidgets('Show section when have data', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
          findsOneWidget,
        );
        expect(find.byType(BundleItemMaterial), findsWidgets);

        expect(
          find.byKey(
            WidgetKeys.orderHistoryBundleItemMaterial(
              fakeBundleItem.materialNumber.displayMatNo,
            ),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Show nothing when view by item detail API failure',
          (tester) async {
        when(() => viewByItemDetailsBlocMock.state)
            .thenReturn(ViewByItemDetailsState.initial());

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
          findsOneWidget,
        );
        expect(find.byType(BundleItemMaterial), findsNothing);
      });

      testWidgets('Navigate to item detail on tap', (tester) async {
        when(() => autoRouterMock.push(const ViewByItemDetailsPageRoute()))
            .thenAnswer((_) => Future.value(true));

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final item = find.byKey(
          WidgetKeys.orderHistoryBundleItemMaterial(
            fakeBundleItem.materialNumber.displayMatNo,
          ),
        );
        await tester.dragUntilVisible(
          item,
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -200),
        );
        await tester.pump();
        await tester.tap(item);

        verify(() => autoRouterMock.push(const ViewByItemDetailsPageRoute()))
            .called(1);

        verify(
          () => mixpanelServiceMock.trackEvent(
            eventName: MixpanelEvents.orderDetailViewed,
            properties: any(named: 'properties'),
          ),
        ).called(1);

        verify(
          () => viewByItemDetailsBlocMock.add(
            ViewByItemDetailsEvent.setItemOrderDetails(
              orderHistory: fakeOrderHistory,
              orderHistoryItem: fakeOrderHistory.orderHistoryItems[1],
              disableDeliveryDateForZyllemStatus: false,
            ),
          ),
        ).called(1);
      });
    });

    group('Material -', () {
      setUp(() {
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith.orderHistoryDetails(
            orderHistoryDetailsOrderItem: [fakeMaterialItem],
          ),
        );
      });

      testWidgets('Show section when have data', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.orderSuccessItemsSection),
          findsOneWidget,
        );
      });
    });

    testWidgets(
        'List price strike through price visible, if final price is less than list price && enableListPrice = true',
        (tester) async {
      final finalPrice = MaterialPrice(80);
      final listPrice = MaterialPrice(100);
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeMaterialItem.copyWith(
                material: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-1'),
                ),
                priceAggregate: PriceAggregate.empty().copyWith(
                  salesOrgConfig: fakeIDSalesOrgConfigs,
                  price: Price.empty().copyWith(
                    lastPrice: listPrice,
                    finalPrice: finalPrice,
                    materialNumber: MaterialNumber('fake-material-1'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.orderSuccessItemsSection),
        findsOneWidget,
      );
      final listPriceStrikeThroughComponent =
          find.byType(ListPriceStrikeThroughComponent);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text
                .toPlainText()
                .contains(listPrice.getOrCrash().toString()),
      );
      expect(
        find.descendant(
          of: listPriceStrikeThroughComponent,
          matching: listPriceFinder,
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'List price strike through price not visible, if final price is less than list price && enableListPrice = false',
        (tester) async {
      final finalPrice = MaterialPrice(80);
      final listPrice = MaterialPrice(100);
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeMaterialItem.copyWith(
                material: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-1'),
                ),
                priceAggregate: PriceAggregate.empty().copyWith(
                  salesOrgConfig: fakeMYSalesOrgConfigs,
                  price: Price.empty().copyWith(
                    lastPrice: listPrice,
                    finalPrice: finalPrice,
                    materialNumber: MaterialNumber('fake-material-1'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.orderSuccessItemsSection),
        findsOneWidget,
      );
      final listPriceStrikeThroughComponent =
          find.byType(ListPriceStrikeThroughComponent);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text
                .toPlainText()
                .contains(listPrice.getOrCrash().toString()),
      );
      expect(
        find.descendant(
          of: listPriceStrikeThroughComponent,
          matching: listPriceFinder,
        ),
        findsNothing,
      );
    });

    testWidgets(
        'List price strike through price not visible, if final price is greater than and equal to list price && enableListPrice = true',
        (tester) async {
      final finalPrice = MaterialPrice(200);
      final listPrice = MaterialPrice(100);
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeMaterialItem.copyWith(
                material: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-1'),
                ),
                priceAggregate: PriceAggregate.empty().copyWith(
                  salesOrgConfig: fakeIDSalesOrgConfigs,
                  price: Price.empty().copyWith(
                    lastPrice: listPrice,
                    finalPrice: finalPrice,
                    materialNumber: MaterialNumber('fake-material-1'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.orderSuccessItemsSection),
        findsOneWidget,
      );
      final listPriceStrikeThroughComponent =
          find.byType(ListPriceStrikeThroughComponent);
      final listPriceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text
                .toPlainText()
                .contains(listPrice.getOrCrash().toString()),
      );
      expect(
        find.descendant(
          of: listPriceStrikeThroughComponent,
          matching: listPriceFinder,
        ),
        findsNothing,
      );
    });

    testWidgets('Order Detail Header', (tester) async {
      final fakeRequestedDeliveryDate = DateTimeStringValue('2023-09-11');
      const fakeReferenceNotes = 'fake-ref-note';
      final fakeOrderHistoryDetailsPaymentTerm =
          OrderHistoryDetailsPaymentTerm.empty();
      final fakeInstruction = SpecialInstructions('fake-instruction');
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) =>
            OrderSummaryState.initial().copyWith.orderHistoryDetails(
                  requestedDeliveryDate: fakeRequestedDeliveryDate,
                  referenceNotes: fakeReferenceNotes,
                  orderHistoryDetailsPaymentTerm:
                      fakeOrderHistoryDetailsPaymentTerm,
                  orderHistoryDetailsSpecialInstructions: fakeInstruction,
                ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.byKey(
          WidgetKeys.balanceTextRow(
            'Request delivery date'.tr(),
            fakeRequestedDeliveryDate.dateString,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          WidgetKeys.balanceTextRow(
            'Reference note'.tr(),
            fakeReferenceNotes,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          WidgetKeys.balanceTextRow(
            'Payment term'.tr(),
            fakeOrderHistoryDetailsPaymentTerm.displayPaymentTerm,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.byKey(
          WidgetKeys.balanceTextRow(
            'Delivery instructions'.tr(),
            fakeInstruction.displaySpecialInstructions,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byType(OrderSuccessAttachmentSection),
        findsOneWidget,
      );
    });

    testWidgets('Show Contact Detail In Order Detail Header', (tester) async {
      final fakeContactPerson = ContactPerson('fake-contact-person');
      final fakePhoneNumber = PhoneNumber('fake-phone-number');
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
        ),
      );
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) =>
            OrderSummaryState.initial().copyWith.orderHistoryDetails(
                  telephoneNumber: fakePhoneNumber,
                ),
      );
      when(() => additionalDetailsBlocMock.state).thenAnswer(
        (invocation) =>
            AdditionalDetailsState.initial().copyWith.deliveryInfoData(
                  contactPerson: fakeContactPerson,
                ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();

      expect(
        find.byKey(
          WidgetKeys.balanceTextRow(
            'Contact person'.tr(),
            fakeContactPerson.getOrDefaultValue(''),
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          WidgetKeys.balanceTextRow(
            'Contact number'.tr(),
            fakePhoneNumber.displayTelephoneNumber,
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Show Payer Information', (tester) async {
      final customerCodeInfo = fakeCustomerCodeInfo.copyWith(
        billToInfos: [
          BillToInfo.empty().copyWith(
            billToCustomerCode: 'fake-bill-to',
            emailAddresses: [EmailAddress('fake-email@fake.com')],
          ),
        ],
      );
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) =>
            OrderSummaryState.initial().copyWith.orderHistoryDetails(
                  referenceNotes: 'fake-reference-notes',
                ),
      );
      when(() => customerCodeBlocMock.state).thenAnswer(
        (invocation) => CustomerCodeState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.byType(ExpansionTile), findsOneWidget);
    });

    testWidgets('Show Attachment Document Showing Less', (tester) async {
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) =>
            OrderSummaryState.initial().copyWith.orderHistoryDetails(
          orderHistoryDetailsPoDocuments: [
            PoDocuments.empty(),
            PoDocuments.empty(),
          ],
        ),
      );
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.orderSuccessAttachment), findsOneWidget);
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessAttachmentShowButton),
          matching: find.text(
            'Show more'.tr(),
          ),
        ),
        findsOneWidget,
      );
      await tester.tap(
        find.byKey(WidgetKeys.orderSuccessAttachmentShowButton),
      );
      verify(
        () => orderSummaryBlocMock.add(
          const OrderSummaryEvent.updateIsExpanded(
            isExpanded: true,
          ),
        ),
      ).called(1);
    });

    testWidgets('Show Attachment Document Showing All', (tester) async {
      final fakeFiles = [
        PoDocuments.empty(),
        PoDocuments.empty(),
      ];
      when(
        () => orderSummaryBlocMock.state,
      ).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsPoDocuments: fakeFiles,
          ),
          isExpanded: true,
        ),
      );

      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessAttachmentShowButton),
          matching: find.text(
            'Show less'.tr(),
          ),
        ),
        findsOneWidget,
      );
      final downloadButtonFinder = find.byIcon(Icons.cloud_download_outlined);
      expect(
        downloadButtonFinder,
        findsNWidgets(fakeFiles.length),
      );
      await tester.tap(downloadButtonFinder.first);
      verify(
        () => poAttachmentBlocMock.add(
          PoAttachmentEvent.downloadFile(
            files: [fakeFiles.first],
          ),
        ),
      ).called(1);
    });

    testWidgets('Show Toast When Download Success', (tester) async {
      final fakeFiles = [
        PoDocuments.empty(),
        PoDocuments.empty(),
      ];
      when(
        () => orderSummaryBlocMock.state,
      ).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsPoDocuments: fakeFiles,
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );
      whenListen(
        poAttachmentBlocMock,
        Stream.fromIterable(
          [
            PoAttachmentState.initial().copyWith(
              fileOperationMode: FileOperationMode.download,
              isFetching: false,
              failureOrSuccessOption: optionOf(
                const Right(''),
              ),
            )
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text(
            'Attachments downloaded successfully.'.tr(),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Show Toast When Download Failure', (tester) async {
      final fakeFiles = [
        PoDocuments.empty(),
        PoDocuments.empty(),
      ];
      when(
        () => orderSummaryBlocMock.state,
      ).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsPoDocuments: fakeFiles,
          ),
        ),
      );

      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );
      whenListen(
        poAttachmentBlocMock,
        Stream.fromIterable(
          [
            PoAttachmentState.initial().copyWith(
              fileOperationMode: FileOperationMode.download,
              isFetching: false,
              failureOrSuccessOption: optionOf(
                const Left(ApiFailure.other('fake-error')),
              ),
            )
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text(
            'fake-error'.tr(),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Show offer tag when material have offer', (tester) async {
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeMaterialItem.copyWith(promoStatus: true),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.offerTag), findsOneWidget);
    });

    testWidgets(
      'Should not show total saving on SG',
      (tester) async {
        final currentSalesOrgVariant =
            salesOrgVariant.currentValue ?? fakeSalesOrg;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeEmptySalesOrganisation.copyWith(
              salesOrg: currentSalesOrgVariant,
            ),
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsOrderItem: [
                OrderHistoryDetailsOrderItem.empty().copyWith(
                  qty: 2,
                )
              ],
              totalDiscount: 21.39,
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(
          orderSummaryTotalSaving,
          currentSalesOrgVariant.isID ? findsOneWidget : findsNothing,
        );

        expect(
          find.textContaining('21.39', findRichText: true),
          currentSalesOrgVariant.isID ? findsOneWidget : findsNothing,
        );
      },
      variant: salesOrgVariant,
    );

    // testWidgets(
    //   '=> Do not Show Tax Value if Tax value from item level is 0',
    //   (tester) async {
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: fakeSalesOrganisation,
    //         salesOrgConfigs: fakeSalesOrganisationDisplaySubtotalTaxBreakdown,
    //       ),
    //     );
    //     when(() => orderSummaryBlocMock.state).thenReturn(
    //       OrderSummaryState.initial().copyWith(
    //         orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
    //           orderHistoryDetailsOrderItem: [
    //             OrderHistoryDetailsOrderItem.empty()
    //           ],
    //         ),
    //       ),
    //     );

    //     await tester.pumpWidget(getWidget());
    //     await tester.pumpAndSettle();

    //     final taxText = find.descendant(
    //       of: find.byKey(WidgetKeys.orderSummaryTax),
    //       matching: find.text('${'Tax at'.tr()} %:'),
    //     );

    //     expect(
    //       taxText,
    //       findsOneWidget,
    //     );
    //   },
    // );
    testWidgets('Display Price Not Available Message for hide price materials',
        (tester) async {
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderValue: 516.0,
            orderHistoryDetailsOrderItem: <OrderHistoryDetailsOrderItem>[
              OrderHistoryDetailsOrderItem.empty().copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('0000101308'),
                  principalName: PrincipalName('PROCTER AND GAMBLE'),
                ),
                materialNumber: MaterialNumber(''),
                unitPrice: 17.2,
                totalPrice: 516,
                type: OrderItemType('Comm'),
                productType: MaterialInfoType('material'),
                hidePrice: true,
              )
            ],
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final priceMessageWidgetFinder =
          find.byKey(WidgetKeys.priceNotAvailableMessageWidget);
      final priceMessageFinder = find.text(
        'Price is not available for at least one item. Grand total reflected may not be accurate.'
            .tr(),
      );
      expect(priceMessageWidgetFinder, findsOneWidget);
      expect(priceMessageFinder, findsOneWidget);
    });

    testWidgets(
        'Test Bundle Order, Grand total and Sub total only with displaySubtotalTaxBreakdown is enabled ',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
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
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderNumber: OrderNumber('Fake-Order-Number'),
            orderValue: 990.0,
            totalTax: 99.0,
            orderHistoryDetailsOrderItem: bundleList,
          ),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessSubTotal),
          matching: find.textContaining(
            'Subtotal (${fakeSGSalesOrgConfigs.displayPrefixTax}.tax)',
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessSubTotal),
          matching: find.text(
            'SGD 990.00',
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSummaryTax),
          matching: find.text(
            'SGD 99.00',
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
          matching: find.textContaining('Grand total:'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
          matching: find.text(
            'SGD 1,089.00',
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
        findsOneWidget,
      );
    });

    testWidgets(
        'Test Bundle Order, Grand total and Sub total only with displaySubtotalTaxBreakdown is disabled ',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
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
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderNumber: OrderNumber('Fake-Order-Number'),
            orderValue: 990.0,
            totalTax: 99.0,
            orderHistoryDetailsOrderItem: bundleList,
          ),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessSubTotal),
          matching: find.textContaining(
            'Subtotal (${fakeMYSalesOrgConfigs.displayPrefixTax}.tax)',
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessSubTotal),
          matching: find.text(
            'MYR 990.00',
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSummaryTax),
          matching: find.textContaining('Tax at 10%'),
        ),
        findsNothing,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSummaryTax),
          matching: find.text(
            'MYR 99.00',
            findRichText: true,
          ),
        ),
        findsNothing,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
          matching: find.textContaining('Grand total:'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessGrandTotal),
          matching: find.text(
            'MYR 990.00',
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
        findsOneWidget,
      );
    });

    testWidgets(
      'Show GovtListPriceComponent For Material Item',
      (tester) async {
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
              orderHistoryDetailsOrderItem: [fakeMaterialItem],
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(
          find.byType(GovtListPriceComponent),
          findsOneWidget,
        );
      },
    );
    testWidgets('Show Small Order Fee And Manual Fee For ID Market',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        ),
      );
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: fakeOrderHistoryDetails,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final smallFeeSection = find.byKey(WidgetKeys.orderSummarySmallFee);
      final manualFeeSection = find.byKey(WidgetKeys.orderSummaryManualFee);
      expect(smallFeeSection, findsOneWidget);
      expect(manualFeeSection, findsOneWidget);

      expect(
        find.descendant(
          of: smallFeeSection,
          matching: find.text('${'Small order fee'.tr()}:'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: smallFeeSection,
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              fakeIDSalesOrgConfigs,
              fakeOrderHistoryDetails.deliveryFee,
              false,
            ),
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.text(
            '${'Applies to orders less than'.tr()} ${StringUtils.displayPrice(
          fakeIDSalesOrgConfigs,
          fakeIDSalesOrganisation.salesOrg.smallOrderThreshold,
        )}'),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: manualFeeSection,
          matching: find.text('${'Manual fee'.tr()}:'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: manualFeeSection,
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              fakeIDSalesOrgConfigs,
              fakeOrderHistoryDetails.manualFee,
              false,
            ),
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Find Material tax Breakdown', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
        ),
      );
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: fakeOrderHistoryDetails.copyWith(
            orderHistoryDetailsOrderItem: [
              fakeMaterialItem.copyWith(
                priceAggregate: PriceAggregate.empty().copyWith(
                  salesOrgConfig: fakeVNSalesOrgConfigs,
                  materialInfo: MaterialInfo.empty().copyWith(tax: 5),
                  price: Price.empty().copyWith(
                    finalPrice: MaterialPrice(100),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final orderItemsSection = find.byKey(WidgetKeys.orderSuccessItemsSection);
      await tester.scrollUntilVisible(orderItemsSection, -500);
      expect(orderItemsSection, findsOneWidget);
      final itemTax = find.byType(ItemTax);
      expect(itemTax, findsOneWidget);
      final totalPriceWithTax = find.textContaining(
        'VND 105.00',
        findRichText: true,
      );
      final tax = find.textContaining(
        '(5% tax)',
        findRichText: true,
      );
      final taxAmount = find.textContaining(
        'VND 5.00',
        findRichText: true,
      );
      expect(tax, findsOneWidget);
      expect(taxAmount, findsOneWidget);
      expect(totalPriceWithTax, findsOneWidget);
    });
    testWidgets('Bonus Stock tag', (tester) async {
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: fakeOrderHistoryDetails,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.orderSuccessItemsSection),
        findsOneWidget,
      );
      await tester.fling(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -10000),
        100,
      );
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.orderSuccessMaterialItem(0)),
        findsWidgets,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessMaterialItem(0)).first,
          matching: find.widgetWithText(StatusLabel, 'Bonus'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.orderSuccessMaterialItem(0)).first,
          matching: find.widgetWithText(StatusLabel, 'Out of stock'),
        ),
        findsOneWidget,
      );
    });
  });
}

bool findTextAndTap(InlineSpan visitor, String text) {
  if (visitor is TextSpan && visitor.text == text) {
    (visitor.recognizer as TapGestureRecognizer).onTap!();

    return false;
  }

  return true;
}

bool tapTextSpan(RichText richText, String text) {
  final isTapped = !richText.text.visitChildren(
    (visitor) => findTextAndTap(visitor, text),
  );

  return isTapped;
}
