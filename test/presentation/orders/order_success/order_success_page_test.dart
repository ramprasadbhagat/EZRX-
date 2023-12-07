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
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';
import 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_attachment_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../common_mock_data/customer_code_mock.dart';
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
  final fakeOrderNumber = OrderNumber('fake-order-number');
  final fakeBundleItem = OrderHistoryDetailsOrderItem.empty().copyWith(
    productType: MaterialInfoType.bundle(),
  );
  final fakeMaterialItem = OrderHistoryDetailsOrderItem.empty().copyWith(
    productType: MaterialInfoType.material(),
  );
  setUpAll(
    () {
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
      userBlocMock = UserBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      viewByOrderDetailsBlocMock = ViewByOrderDetailsBlocMock();
      cartBlocMock = CartBlocMock();
      viewByItemDetailsBlocMock = ViewByItemDetailsBlocMock();
      productImageBlocMock = ProductImageBlocMock();
      poAttachmentBlocMock = PoAttachmentBlocMock();
      mixpanelServiceMock = locator<MixpanelService>();
    },
  );
  setUp(
    () {
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
        ViewByItemDetailsState.initial(),
      );
      when(() => productImageBlocMock.state).thenReturn(
        ProductImageState.initial(),
      );
      when(() => poAttachmentBlocMock.state).thenReturn(
        PoAttachmentState.initial(),
      );
      when(() => autoRouterMock.currentPath).thenReturn('fake-path');
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
        BlocProvider<PoAttachmentBloc>(
          create: (context) => poAttachmentBlocMock,
        ),
      ],
    );
  }

  group('Test Order Success Page', () {
    testWidgets(
      'Payment Term',
      (tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              enablePaymentTerms: true,
            ),
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
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              enablePaymentTerms: true,
              vatValue: vatValue,
              displayItemTaxBreakdown: true,
              salesOrg: SalesOrg('2601'),
            ),
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
            matching: find.text('Subtotal (incl.tax):'),
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
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              enablePaymentTerms: true,
              vatValue: vatValue,
              displayItemTaxBreakdown: true,
              salesOrg: SalesOrg('2601'),
              displaySubtotalTaxBreakdown: true,
            ),
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
              fakeOrderDetail.invoiceNumber,
              false,
              false,
            ),
            MixpanelProps.unitPrice: fakeBundleItem.itemUnitPrice(
              fakeOrderDetail.invoiceNumber,
              false,
              false,
            ),
          },
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

    testWidgets('Show Bundle Section When Have Data', (tester) async {
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeBundleItem,
            ],
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.viewByOrderDetailItemsSection),
        findsOneWidget,
      );
    });

    testWidgets('Show Material Section When Have Data', (tester) async {
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) => OrderSummaryState.initial().copyWith(
          orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsOrderItem: [
              fakeMaterialItem,
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
    });

    testWidgets('Order Detail Header', (tester) async {
      final fakeRequestedDeliveryDate = DateTimeStringValue('2023-09-11');
      const fakeReferenceNotes = 'fake-ref-note';
      final fakeOrderHistoryDetailsPaymentTerm =
          OrderHistoryDetailsPaymentTerm.empty();
      final fakeContactPerson = ContactPerson('fake-contact-person');
      final fakePhoneNumber = PhoneNumber('fake-phone-number');
      final fakeInstruction = SpecialInstructions('fake-instruction');
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith.salesOrgConfigs(
              enableFutureDeliveryDay: true,
              enableReferenceNote: true,
              enableMobileNumber: true,
              enableSpecialInstructions: true,
              showPOAttachment: true,
            ),
      );
      when(() => orderSummaryBlocMock.state).thenAnswer(
        (invocation) =>
            OrderSummaryState.initial().copyWith.orderHistoryDetails(
                  requestedDeliveryDate: fakeRequestedDeliveryDate,
                  referenceNotes: fakeReferenceNotes,
                  orderHistoryDetailsPaymentTerm:
                      fakeOrderHistoryDetailsPaymentTerm,
                  telephoneNumber: fakePhoneNumber,
                  orderHistoryDetailsSpecialInstructions: fakeInstruction,
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

    testWidgets('Show Payer Information', (tester) async {
      final customerCodeInfo = fakeCustomerCodeInfo.copyWith(
        billToInfos: [
          BillToInfo.empty().copyWith(
            billToCustomerCode: 'fake-bill-to',
            emailAddresses: ['fake-email'],
          ),
        ],
      );
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrgConfigs: fakeSalesOrganisationConfigs.copyWith(
            enableBillTo: true,
          ),
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
        (invocation) => EligibilityState.initial().copyWith.salesOrgConfigs(
              showPOAttachment: true,
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
        (invocation) => EligibilityState.initial().copyWith.salesOrgConfigs(
              showPOAttachment: true,
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
        (invocation) => EligibilityState.initial().copyWith.salesOrgConfigs(
              showPOAttachment: true,
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
        (invocation) => EligibilityState.initial().copyWith.salesOrgConfigs(
              showPOAttachment: true,
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
