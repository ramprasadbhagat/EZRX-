import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart'
    as payment_term;
import 'package:ezrxmobile/domain/utils/date_time_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/po_upload_attachment_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_mm_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class PaymentTermBlocMock extends MockBloc<PaymentTermEvent, PaymentTermState>
    implements PaymentTermBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class OrderSummaryBlocMock
    extends MockBloc<OrderSummaryEvent, OrderSummaryState>
    implements OrderSummaryBloc {}

class ComboDealListBlocMock
    extends MockBloc<ComboDealListEvent, ComboDealListState>
    implements ComboDealListBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class PriceOverrideBlocMock
    extends MockBloc<PriceOverrideEvent, PriceOverrideState>
    implements PriceOverrideBloc {}

class OrderEligibilityBlocMock
    extends MockBloc<OrderEligibilityEvent, OrderEligibilityState>
    implements OrderEligibilityBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MockMixpanelService extends Mock implements MixpanelService {}

class PaymentCustomerInformationBlocMock extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

void main() {
  late CartBloc cartBloc;
  late SalesOrgBloc salesOrgBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late PaymentTermBloc paymentTermBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBloc;
  late CustomerCodeBloc customerCodeBloc;
  late OrderSummaryBloc orderSummaryBlocMock;
  late PoAttachmentBloc poAttachmentBloc;
  late PriceOverrideBloc priceOverrideBloc;
  late ComboDealListBloc comboDealListBloc;
  final userBlocMock = UserMockBloc();
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late OrderEligibilityBloc orderEligibilityBlocMock;
  late List<PriceAggregate> mockCartItems;
  late List<PriceAggregate> mockCartBundleItems;
  late List<Price> priceList;
  late AplSimulatorOrder aplSimulatorOrder;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  final checkoutPageRouteRouteData = RouteData(
    route: const RouteMatch(
      name: CheckoutPageRoute.name,
      segments: [],
      path: 'orders/cart/checkout',
      stringMatch: 'orders/cart/checkout',
      key: ValueKey('CheckoutPageRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );

  final fakeCartProduct = <PriceAggregate>[
    PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('123456789'),
        quantity: MaterialQty(1),
        taxClassification: MaterialTaxClassification('Product : Full Tax'),
        tax: 10,
      ),
      price: Price.empty().copyWith(
        finalPrice: MaterialPrice(234.50),
      ),
      salesOrgConfig: fakeVNSalesOrgConfigs,
    ),
  ];

  final salesOrgConfigVariant = ValueVariant<SalesOrganisationConfigs>(
    {
      fakeIDSalesOrgConfigs,
      fakeKHSalesOrgConfigs,
      fakeMMSalesOrgConfigs,
      fakeMYSalesOrgConfigs,
      fakePHSalesOrgConfigs,
      fakeSGSalesOrgConfigs,
      fakeTHSalesOrgConfigs,
      fakeTWSalesOrgConfigs,
      fakeVNSalesOrgConfigs,
    },
  );

  setUpAll(() async {
    locator.registerFactory(() => AutoRouteMock());
    locator.registerSingleton<MixpanelService>(MockMixpanelService());

    autoRouterMock = locator<AutoRouteMock>();
    mockCartBundleItems = await CartLocalDataSource().upsertCartItems();
    mockCartItems =
        (await CartLocalDataSource().getAddedToCartProductList()).cartProducts;
    priceList = await MaterialPriceLocalDataSource().getPriceList();
    aplSimulatorOrder = await CartLocalDataSource().aplSimulateOrder();
  });

  ///////////////////////////Finder//////////////////////////////////////////
  final checkoutSummaryTax = find.byKey(WidgetKeys.checkoutSummaryTax);
  final checkoutSummarySmallOrderFee =
      find.byKey(WidgetKeys.checkoutSummarySmallOrderFee);
  final checkoutSummaryGrandTotalPrice =
      find.byKey(WidgetKeys.checkoutSummaryGrandTotalPrice);
  final checkoutSummaryTaxPrice =
      find.byKey(WidgetKeys.checkoutSummaryTaxPrice);
  final checkoutSummaryTotalSaving =
      find.byKey(WidgetKeys.checkoutSummaryTotalSaving);

  //////////////////////////////////////////////////////////////////////////
  group('Checkout Page Test', () {
    setUp(() async {
      locator = GetIt.instance;
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeClientOrderTypeEnabled,
        ),
      );
      eligibilityBloc = EligibilityBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      cartBloc = CartBlocMock();
      paymentTermBlocMock = PaymentTermBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      customerCodeBloc = CustomerCodeBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();
      poAttachmentBloc = PoAttachmentBlocMock();
      priceOverrideBloc = PriceOverrideBlocMock();
      comboDealListBloc = ComboDealListBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      orderEligibilityBlocMock = OrderEligibilityBlocMock();
      paymentCustomerInformationBlocMock = PaymentCustomerInformationBlocMock();

      when(() => orderDocumentTypeBlocMock.state).thenReturn(
        OrderDocumentTypeState.initial(),
      );
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(),
      );
      when(() => customerCodeBloc.state).thenReturn(
        CustomerCodeState.initial(),
      );
      when(() => poAttachmentBloc.state).thenReturn(
        PoAttachmentState.initial(),
      );
      when(() => priceOverrideBloc.state).thenReturn(
        PriceOverrideState.initial(),
      );
      when(() => comboDealListBloc.state).thenReturn(
        ComboDealListState.initial(),
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(isFetching: false),
      );
      when(() => paymentTermBlocMock.state)
          .thenReturn(PaymentTermState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(
        () => orderEligibilityBlocMock.state,
      ).thenReturn(OrderEligibilityState.initial());
      when(() => autoRouterMock.current).thenReturn(checkoutPageRouteRouteData);
      when(() => autoRouterMock.pop()).thenAnswer((invocation) async => true);
      when(() => autoRouterMock.pushNamed(any()))
          .thenAnswer((invocation) async => null);
      when(() => paymentCustomerInformationBlocMock.state).thenReturn(
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation:
              await PaymentCustomerInformationLocalDataSource()
                  .getPaymentCustomerInformation(),
        ),
      );
    });
    Widget getScopedWidget() {
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
          usingLocalization: true,
          providers: [
            BlocProvider<PaymentTermBloc>(
              create: (context) => paymentTermBlocMock,
            ),
            BlocProvider<AdditionalDetailsBloc>(
              create: (context) => additionalDetailsBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<PoAttachmentBloc>(
              create: (context) => poAttachmentBloc,
            ),
            BlocProvider<PriceOverrideBloc>(
              create: (context) => priceOverrideBloc,
            ),
            BlocProvider<OrderSummaryBloc>(
              create: (context) => orderSummaryBlocMock,
            ),
            BlocProvider<OrderDocumentTypeBloc>(
              create: (context) => orderDocumentTypeBlocMock,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBloc,
            ),
            BlocProvider<ComboDealListBloc>(
              create: (context) => comboDealListBloc,
            ),
            BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
            BlocProvider<CartBloc>(create: (context) => cartBloc),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBlocMock,
            ),
            BlocProvider<OrderEligibilityBloc>(
              create: (context) => orderEligibilityBlocMock,
            ),
            BlocProvider<PaymentCustomerInformationBloc>(
              create: ((context) => paymentCustomerInformationBlocMock),
            ),
          ],
          child: const Material(
            child: CheckoutPage(),
          ),
        ),
      );
    }

    testWidgets(
      '=> test checkout page AppBar ',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final closeButtonFinder = find.byKey(WidgetKeys.closeButton);
        expect(closeButtonFinder, findsOneWidget);
        await tester.tap(closeButtonFinder);
        await tester.pump();
        verify(() => autoRouterMock.navigateBack()).called(1);
      },
    );

    testWidgets(
      '=> test checkout page bottom Navigation Bar test ',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final showOrderSumaryListTileFinder =
            find.byKey(WidgetKeys.priceSummaryListTile);
        expect(showOrderSumaryListTileFinder, findsOneWidget);
        await tester.tap(showOrderSumaryListTileFinder);
        await tester.pumpAndSettle();
        final orderPriceSummarySheetFinder =
            find.byKey(WidgetKeys.priceSummarySheet);
        expect(orderPriceSummarySheetFinder, findsOneWidget);
        final orderPriceSummarySheetCloseButtonFinder = find.descendant(
          of: find.byKey(WidgetKeys.closeButton),
          matching: find.textContaining('Close'.tr()),
        );
        expect(orderPriceSummarySheetCloseButtonFinder, findsOneWidget);
        await tester.tap(orderPriceSummarySheetCloseButtonFinder);
        await tester.pumpAndSettle();
        verify(() => autoRouterMock.pop()).called(1);
      },
    );
    testWidgets(
      '=> test checkout page bottom Navigation Bar test with Additional Details',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            salesOrganisation: fakeMYSalesOrganisation,
            aplSimulatorOrder:
                AplSimulatorOrder.empty().copyWith(smallOrderFee: 12500.0),
          ),
        );
        final expectedState = [
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            focusTo: DeliveryInfoLabel.paymentTerm,
            deliveryInfoData: DeliveryInfoData.empty()
                .copyWith(contactPerson: ContactPerson('fakeInput')),
          ),
        ];
        whenListen(
          additionalDetailsBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final showOrderSumaryListTileFinder =
            find.byKey(WidgetKeys.priceSummaryListTile);
        expect(showOrderSumaryListTileFinder, findsOneWidget);
        final checkoutStickyGrandTotalFinder =
            find.byKey(WidgetKeys.priceSummaryGrandTotal);
        expect(checkoutStickyGrandTotalFinder, findsOneWidget);
        verify(
          () => orderSummaryBlocMock.add(
            OrderSummaryEvent.submitOrder(
              cartProducts: fakeCartProduct,
              grandTotal: 234.5,
              orderValue: 234.5,
              totalTax: 0.0,
              smallOrderFee: 12500.0,
              data: DeliveryInfoData.empty()
                  .copyWith(contactPerson: ContactPerson('fakeInput')),
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      '=> test AdditionalDetailsBloc Listener when isValidated is false',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        final expectedState = [
          AdditionalDetailsState.initial().copyWith(
            focusTo: DeliveryInfoLabel.contactPerson,
          ),
        ];
        whenListen(
          additionalDetailsBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final showOrderSumaryListTileFinder =
            find.byKey(WidgetKeys.priceSummaryListTile);
        expect(showOrderSumaryListTileFinder, findsOneWidget);
        final checkoutStickyGrandTotalFinder =
            find.byKey(WidgetKeys.priceSummaryGrandTotal);
        expect(checkoutStickyGrandTotalFinder, findsOneWidget);
      },
    );
    testWidgets(
      '=> test OrderSummaryBloc Listener when isSubmitting is false',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        final expectedState = [
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
          OrderSummaryState.initial(),
        ];
        whenListen(
          orderSummaryBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        verify(
          () => orderSummaryBlocMock.add(
            OrderSummaryEvent.orderConfirmationDetail(
              priceAggregate: fakeCartProduct,
            ),
          ),
        ).called(1);
        verify(
          () => priceOverrideBloc.add(
            const PriceOverrideEvent.initialized(),
          ),
        ).called(1);
        verify(
          () => poAttachmentBloc.add(
            const PoAttachmentEvent.initialized(),
          ),
        ).called(1);
        verify(() => autoRouterMock..pushNamed('orders/order_confirmation'))
            .called(1);
      },
    );
    testWidgets(
      '=> test OrderSummaryBloc Listener when isSubmitting is true and api have successful response',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        final expectedState = [
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
            apiFailureOrSuccessOption:
                optionOf(Right(SubmitOrderResponse.empty())),
          ),
        ];
        whenListen(
          orderSummaryBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
      },
    );
    testWidgets(
      '=> test OrderSummaryBloc Listener when isSubmitting is true and api have failure response',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        final expectedState = [
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-error'))),
          ),
        ];
        whenListen(
          orderSummaryBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        verify(
          () => trackMixpanelEvent(
            MixpanelEvents.placeOrderFailure,
            props: {
              MixpanelProps.errorMessage:
                  const ApiFailure.other('Fake-error').failureMessage,
            },
          ),
        ).called(1);
      },
    );

    testWidgets(
      '=> test Checkout Body ',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        final expectedState = [
          AdditionalDetailsState.initial().copyWith(
            isLoading: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              greenDeliveryEnabled: true,
              deliveryDate: DateTimeStringValue(''),
            ),
          ),
          AdditionalDetailsState.initial(),
        ];
        whenListen(
          additionalDetailsBlocMock,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final deliveryInformationTextFinder =
            find.textContaining('Delivery information'.tr());
        expect(deliveryInformationTextFinder, findsOneWidget);
        final checkoutScrollListFinder =
            find.byKey(WidgetKeys.checkoutScrollList);
        final checkoutDeliveryArrowButtonFinder =
            find.byKey(WidgetKeys.checkoutDeliveryArrowButton);
        expect(checkoutDeliveryArrowButtonFinder, findsOneWidget);
        await tester.tap(checkoutDeliveryArrowButtonFinder);
        final pOReferenceKeyFinder =
            find.byKey(WidgetKeys.genericKey(key: 'pOReferenceKey'));
        expect(pOReferenceKeyFinder, findsOneWidget);
        final deliveryDateFinder = find.byKey(WidgetKeys.deliveryDate);
        expect(deliveryDateFinder, findsOneWidget);
        expect(
          (tester.widget(deliveryDateFinder) as TextFormField)
              .validator
              ?.call('DeliveryDate field'),
          null,
        );
        await tester.dragUntilVisible(
          deliveryDateFinder,
          checkoutScrollListFinder,
          const Offset(0, -100),
        );
        if (DateTime.now().hour < fakeTHSalesOrgConfigs.salesOrg.cutOffTime) {
          await tester.tap(deliveryDateFinder);
          await tester.pumpAndSettle();
          expect(find.byType(CalendarDatePicker), findsOneWidget);
        }
      },
    );
    testWidgets(
      '=> test Delivery Date ',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final deliveryInformationTextFinder =
            find.textContaining('Delivery information'.tr());
        expect(deliveryInformationTextFinder, findsOneWidget);
        final checkoutScrollListFinder =
            find.byKey(WidgetKeys.checkoutScrollList);
        final deliveryDateFinder = find.byKey(WidgetKeys.deliveryDate);
        expect(deliveryDateFinder, findsOneWidget);
        expect(
          (tester.widget(deliveryDateFinder) as TextFormField)
              .validator
              ?.call('DeliveryDate field'),
          null,
        );
        await tester.dragUntilVisible(
          deliveryDateFinder,
          checkoutScrollListFinder,
          const Offset(0, -100),
        );
        if (DateTime.now().hour < fakeTHSalesOrgConfigs.salesOrg.cutOffTime) {
          await tester.tap(deliveryDateFinder);
          await tester.pumpAndSettle();
          expect(find.byType(CalendarDatePicker), findsOneWidget);
        }
      },
    );

    testWidgets('=> test DeliveryInfo with reference note', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
          salesOrganisation: fakeTHSalesOrganisation,
        ),
      );
      final expectedState = [
        AdditionalDetailsState.initial().copyWith(
          isLoading: true,
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            greenDeliveryEnabled: true,
            deliveryDate: DateTimeStringValue(''),
          ),
        ),
        AdditionalDetailsState.initial(),
      ];
      whenListen(
        additionalDetailsBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final referenceNoteKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'referenceNoteKey'));
      expect(referenceNoteKeyFinder, findsOneWidget);
      final deliveryInstructionKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey'));
      expect(deliveryInstructionKeyFinder, findsOneWidget);
    });

    testWidgets('=> test DeliveryInfo with payment Terms', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
          salesOrganisation: fakeTWSalesOrganisation,
        ),
      );
      final expectedState = [
        AdditionalDetailsState.initial().copyWith(
          isLoading: true,
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            greenDeliveryEnabled: true,
            deliveryDate: DateTimeStringValue(''),
          ),
        ),
        AdditionalDetailsState.initial(),
      ];
      whenListen(
        additionalDetailsBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final paymentTermKeyFinder = find.byKey(WidgetKeys.paymentTermKey);
      expect(paymentTermKeyFinder, findsOneWidget);
      final deliveryInstructionKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey'));
      expect(deliveryInstructionKeyFinder, findsOneWidget);
    });

    testWidgets('=> test DeliveryInfo with contact details', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeVNSalesOrgConfigs,
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );
      final expectedState = [
        AdditionalDetailsState.initial().copyWith(
          isLoading: true,
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            greenDeliveryEnabled: true,
            deliveryDate: DateTimeStringValue(''),
          ),
        ),
        AdditionalDetailsState.initial(),
      ];
      whenListen(
        additionalDetailsBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final contactPersonKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'contactPersonKey'));
      expect(contactPersonKeyFinder, findsOneWidget);
      final mobileNumberFinder = find.byKey(WidgetKeys.mobileNumber);
      expect(mobileNumberFinder, findsOneWidget);
      final deliveryInstructionKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey'));
      expect(deliveryInstructionKeyFinder, findsOneWidget);
    });

    testWidgets('=> test TextEditingValue on change for Reference Note',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTHSalesOrgConfigs,
          salesOrganisation: fakeTHSalesOrganisation,
        ),
      );
      final expectedState = [
        AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            referenceNote: ReferenceNote('fake'),
          ),
        ),
        AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            referenceNote: ReferenceNote(''),
          ),
        ),
      ];
      whenListen(
        additionalDetailsBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final referenceNoteKeyFinder =
          find.byKey(WidgetKeys.genericKey(key: 'referenceNoteKey'));
      expect(referenceNoteKeyFinder, findsOneWidget);
      await tester.enterText(referenceNoteKeyFinder, 'f');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(
        () => additionalDetailsBlocMock.add(
          const AdditionalDetailsEvent.onTextChange(
            label: DeliveryInfoLabel.referenceNote,
            newValue: 'f',
          ),
        ),
      ).called(1);
    });
    testWidgets('=> test TextEditingValue on change for Payment Terms',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
          salesOrganisation: fakeTWSalesOrganisation,
        ),
      );
      when(() => additionalDetailsBlocMock.state).thenReturn(
        AdditionalDetailsState.initial().copyWith(
          deliveryInfoData: DeliveryInfoData.empty().copyWith(
            paymentTerm: PaymentTerm('fake_input'),
          ),
        ),
      );
      final expectedState = [
        PaymentTermState.initial().copyWith(
          isFetching: true,
        ),
        PaymentTermState.initial().copyWith(
          paymentTerms: [
            payment_term.PaymentTerm.empty().copyWith(
              paymentTermCode: 'fake_payment_term',
              paymentTermDescription: 'fake_payment_term_description',
            )
          ],
        ),
      ];
      whenListen(
        paymentTermBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final paymentTermKeyFinder = find.byKey(WidgetKeys.paymentTermKey);
      expect(paymentTermKeyFinder, findsOneWidget);
      final paymentTermDropdownKeyFinder =
          find.byKey(WidgetKeys.paymentTermDropdownKey);
      expect(paymentTermDropdownKeyFinder, findsOneWidget);
      await tester.tap(paymentTermDropdownKeyFinder);
      await tester.pumpAndSettle();
      await tester
          .tap(find.text('fake_payment_term-fake_payment_term_description'));
      await tester.pumpAndSettle();
    });
    testWidgets(
      '=> test Checkout Body Product Scroll List for material type',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('12345'),
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('fake_principalName-1'),
                  ),
                  type: MaterialInfoType.material(),
                ),
                bonusSampleItems: [
                  BonusSampleItem.empty()
                      .copyWith(materialNumber: MaterialNumber('12345'))
                ],
              ),
            ],
            salesOrganisation: fakeTHSalesOrganisation,
            additionInfo: {
              MaterialNumber('12345'): ProductMetaData.empty().copyWith(
                productImages: [
                  ProductImages.empty()
                      .copyWith(thumbNail: 'fake_product_thumbNail')
                ],
              )
            },
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial(),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final checkoutScrollListFinder =
            find.byKey(WidgetKeys.checkoutScrollList);
        final addressInfoSectionFinder = find.byType(AddressInfoSection);
        expect(checkoutScrollListFinder, findsOneWidget);
        expect(addressInfoSectionFinder, findsOneWidget);
      },
    );

    testWidgets(
      '=> test Checkout Body Product Scroll List for bundle type',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('12345'),
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('fake_principalName-1'),
                  ),
                  type: MaterialInfoType.bundle(),
                ),
                bundle: Bundle.empty().copyWith(
                  bundleCode: 'fake_bundle_code',
                  materials: [fakeCartProduct.first.materialInfo],
                ),
                bonusSampleItems: [
                  BonusSampleItem.empty()
                      .copyWith(materialNumber: MaterialNumber('12345'))
                ],
              ),
            ],
            salesOrganisation: fakeTHSalesOrganisation,
            additionInfo: {
              MaterialNumber('12345'): ProductMetaData.empty().copyWith(
                productImages: [
                  ProductImages.empty()
                      .copyWith(thumbNail: 'fake_product_thumbNail')
                ],
              )
            },
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial(),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();
        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final checkoutScrollListFinder =
            find.byKey(WidgetKeys.checkoutScrollList);
        final addressInfoSectionFinder = find.byType(AddressInfoSection);
        expect(checkoutScrollListFinder, findsOneWidget);
        expect(addressInfoSectionFinder, findsOneWidget);
        final cartItemProductTileFinder = find.byKey(
          WidgetKeys.cartItemProductTile(
            fakeCartProduct.first.materialInfo.materialNumber.displayMatNo,
          ),
        );
        await tester.dragUntilVisible(
          cartItemProductTileFinder,
          checkoutScrollListFinder,
          const Offset(0, -100),
        );
        expect(cartItemProductTileFinder, findsOneWidget);
      },
    );
    testWidgets(
      '=> test Checkout Body Product Scroll List',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('fake_principalName-1'),
                  ),
                ),
              ),
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('fake_principalName-1'),
                  ),
                ),
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            additionInfo: {
              MaterialNumber('12345'): ProductMetaData.empty().copyWith(
                productImages: [
                  ProductImages.empty()
                      .copyWith(thumbNail: 'fake_product_thumbNail')
                ],
              )
            },
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial(),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final checkoutScrollListFinder =
            find.byKey(WidgetKeys.checkoutScrollList);
        final addressInfoSectionFinder = find.byType(AddressInfoSection);
        expect(checkoutScrollListFinder, findsOneWidget);
        expect(addressInfoSectionFinder, findsOneWidget);
      },
    );
    testWidgets(
      '=> test Checkout Body Product Scroll List for combo type',
      (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('principal_name_fake'),
                  ),
                  type: MaterialInfoType('combo'),
                  bundle:
                      Bundle.empty().copyWith(bundleCode: 'fake_bundleCode'),
                ),
                comboMaterials: [
                  ComboMaterialItem.empty().copyWith(
                    materialInfo: fakeCartProduct.first.materialInfo,
                  )
                ],
              ),
            ],
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial(),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        final checkoutScrollListFinder =
            find.byKey(WidgetKeys.checkoutScrollList);
        final addressInfoSectionFinder = find.byType(AddressInfoSection);
        expect(addressInfoSectionFinder, findsOneWidget);
        expect(checkoutScrollListFinder, findsOneWidget);
      },
    );

    testWidgets(
      '=> test PO Reference in place Order when  poNumberRequired is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerPOReferenceKey = find.byKey(const Key('pOReferenceKey'));
        expect(customerPOReferenceKey, findsOneWidget);

        expect(
          (tester.widget(customerPOReferenceKey) as TextFormField)
              .validator
              ?.call('PO field'),
          'PO reference is a required field.',
        );
      },
    );
    testWidgets(
      '=> test Reference Note in place Order when referenceNote is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
            salesOrganisation: fakeTHSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerReferenceNoteKey =
            find.byKey(const Key('referenceNoteKey'));
        expect(customerReferenceNoteKey, findsOneWidget);

        expect(
          (tester.widget(customerReferenceNoteKey) as TextFormField)
              .validator
              ?.call('ReferenceNote field'),
          'Reference note is a required field',
        );
      },
    );
    testWidgets(
      '=> test Payment Terms in place Order when enablePaymentTerms is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeTWSalesOrgConfigs,
            salesOrganisation: fakeTWSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTWSalesOrgConfigs,
            salesOrganisation: fakeTWSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerPaymentTermDropdownKey =
            find.byKey(WidgetKeys.paymentTermDropdownKey);
        expect(customerPaymentTermDropdownKey, findsOneWidget);

        expect(
          (tester.widget(customerPaymentTermDropdownKey)
                  as DropdownButtonFormField<String>)
              .validator
              ?.call('PaymentTerm field'),
          'Please Select Payment Term',
        );
      },
    );
    testWidgets(
      '=> test International PhoneNumber Input in place Order when enablePaymentTerms is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerMobileNumberKey = find.byKey(WidgetKeys.mobileNumber);
        expect(customerMobileNumberKey, findsOneWidget);
        final internationalPhoneNumberInputKey =
            find.byKey(WidgetKeys.internationalPhoneNumberInput);
        expect(internationalPhoneNumberInputKey, findsOneWidget);

        expect(
          (tester.widget(internationalPhoneNumberInputKey)
                  as InternationalPhoneNumberInput)
              .validator
              ?.call('MobileNumber field'),
          'Mobile number is a required field',
        );
      },
    );
    testWidgets(
      '=> test Contact Person in place Order when EnableMobileNumber is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerContactPersonKey =
            find.byKey(const Key('contactPersonKey'));
        expect(customerContactPersonKey, findsOneWidget);

        expect(
          (tester.widget(customerContactPersonKey) as TextFormField)
              .validator
              ?.call('ContactPerson field'),
          'Contact person is a required field',
        );
      },
    );
    testWidgets(
      '=> test PoAttachment Upload in place Order when showPOAttachment is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poDocuments: [
                PoDocuments.empty().copyWith(
                  name: 'fake_file',
                  url: 'fake_url',
                )
              ],
            ),
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
            user: fakeClientUser,
          ),
        );

        final expectedState = [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(PermissionStatus)),
            fileOperationMode: FileOperationMode.upload,
            fileUrl: [
              PoDocuments.empty().copyWith(
                name: 'fake_file',
                url: 'fake_url',
              )
            ],
          ),
        ];
        whenListen(
          poAttachmentBloc,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final poAttachmentUploadKey = find.byType(PoAttachmentUpload);
        expect(poAttachmentUploadKey, findsOneWidget);
        verify(
          () => additionalDetailsBlocMock.add(
            AdditionalDetailsEvent.addPoDocument(
              poDocuments: [
                PoDocuments.empty().copyWith(
                  name: 'fake_file',
                  url: 'fake_url',
                )
              ],
            ),
          ),
        ).called(1);
        final uploadAttachmentKeyKey =
            find.byKey(WidgetKeys.uploadAttachmentKey);
        expect(uploadAttachmentKeyKey, findsOneWidget);
        await tester.tap(uploadAttachmentKeyKey);
        await tester.pump();
        final poAttachmentUploadDialogKey =
            find.byKey(WidgetKeys.poAttachmentUploadDialog);
        expect(poAttachmentUploadDialogKey, findsOneWidget);
        final poAttachmentPhotoUploadButtonKey =
            find.byKey(WidgetKeys.poAttachmentPhotoUploadButton);
        expect(poAttachmentPhotoUploadButtonKey, findsOneWidget);
        await tester.tap(poAttachmentPhotoUploadButtonKey);
        await tester.pump();
        verify(
          () => poAttachmentBloc.add(
            PoAttachmentEvent.uploadFile(
              uploadedPODocument: [
                PoDocuments.empty().copyWith(
                  name: 'fake_file',
                  url: 'fake_url',
                )
              ],
              uploadOptionType: UploadOptionType.gallery,
              user: fakeClientUser,
            ),
          ),
        ).called(1);
        final poAttachmentFileUploadButtonKey =
            find.byKey(WidgetKeys.poAttachmentFileUploadButton);
        expect(poAttachmentFileUploadButtonKey, findsOneWidget);
        await tester.tap(poAttachmentFileUploadButtonKey);
        await tester.pump();
        verify(
          () => poAttachmentBloc.add(
            PoAttachmentEvent.uploadFile(
              uploadedPODocument: [
                PoDocuments.empty().copyWith(
                  name: 'fake_file',
                  url: 'fake_url',
                )
              ],
              uploadOptionType: UploadOptionType.file,
              user: fakeClientUser,
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      '=> test PoAttachment Upload in place Order check uploaded list',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
            deliveryInfoData: DeliveryInfoData.empty().copyWith(
              poDocuments: [
                PoDocuments.empty().copyWith(
                  name: 'fake_file',
                  url: 'fake_url',
                )
              ],
            ),
          ),
        );

        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        final expectedState = [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(PermissionStatus)),
            fileOperationMode: FileOperationMode.upload,
            fileUrl: [
              PoDocuments.empty().copyWith(
                name: 'fake_file',
                url: 'fake_url',
              )
            ],
          ),
        ];
        whenListen(
          poAttachmentBloc,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final poAttachmentUploadKey = find.byType(PoAttachmentUpload);
        expect(poAttachmentUploadKey, findsOneWidget);
        verify(
          () => additionalDetailsBlocMock.add(
            AdditionalDetailsEvent.addPoDocument(
              poDocuments: [
                PoDocuments.empty().copyWith(
                  name: 'fake_file',
                  url: 'fake_url',
                )
              ],
            ),
          ),
        ).called(1);
        final uploadAttachmentKeyKey =
            find.byKey(WidgetKeys.uploadAttachmentKey);
        expect(uploadAttachmentKeyKey, findsOneWidget);
        final itemDeleteButtonKey = find.byIcon(Icons.delete_outline_outlined);
        expect(itemDeleteButtonKey, findsOneWidget);
        final scrollListFinder = find.byKey(WidgetKeys.checkoutScrollList);
        expect(scrollListFinder, findsOneWidget);

        await tester.dragUntilVisible(
          itemDeleteButtonKey,
          scrollListFinder,
          const Offset(0.0, -200.0),
        );
        await tester.pumpAndSettle();
        await tester.tap(itemDeleteButtonKey);
        await tester.pump();
        verify(
          () => poAttachmentBloc.add(
            PoAttachmentEvent.deleteFile(
              file: PoDocuments.empty().copyWith(
                name: 'fake_file',
                url: 'fake_url',
              ),
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      '=> test PoAttachment Upload in place Order when showPOAttachment is true  and the bloc return error  ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        final expectedState = [
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake_error'))),
          ),
        ];
        whenListen(
          poAttachmentBloc,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final poAttachmentUploadKey = find.byType(PoAttachmentUpload);
        expect(poAttachmentUploadKey, findsOneWidget);
      },
    );

    testWidgets(
      '=> test PoAttachment Upload in place Order when showPOAttachment is true  and the bloc return none  ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        final expectedState = [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            fileUrl: [
              PoDocuments.empty().copyWith(
                name: 'fake_file',
                url: 'fake_url',
              )
            ],
          ),
        ];
        whenListen(
          poAttachmentBloc,
          Stream.fromIterable(expectedState),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final poAttachmentUploadKey = find.byType(PoAttachmentUpload);
        expect(poAttachmentUploadKey, findsOneWidget);
      },
    );

    testWidgets(
      '=> test PO Reference in place Order when  poNumberRequired is false ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        final customerPOReferenceKey = find.byKey(const Key('pOReferenceKey'));
        expect(customerPOReferenceKey, findsOneWidget);

        expect(
          (tester.widget(customerPOReferenceKey) as TextFormField)
              .validator
              ?.call('PO reference is a required field.'),
          null,
        );
      },
    );

    testWidgets(
      '=> test PO Attachment in place Order when poAttachmentRequired is true ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isPoAttachmentValidated: false,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(
          find.text(
            'Upload attachment',
          ),
          findsOneWidget,
        );

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        expect(
          find.text(
            'PO attachment is required',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> test PO Attachment in place Order when poAttachmentRequired is false ',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isPoAttachmentValidated: true,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeIDSalesOrgConfigs,
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(
          find.text(
            'Upload attachment',
          ),
          findsOneWidget,
        );

        final placeOrder = find.text('Place order');
        expect(placeOrder, findsOneWidget);
        await tester.tap(placeOrder);
        await tester.pump();

        expect(
          find.text(
            'PO attachment is required',
          ),
          findsNothing,
        );
      },
    );

    testWidgets(
      '=> test PO Attachment in place Order when showAttachment is false ',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        expect(
          find.text(
            'Upload attachment',
          ),
          findsNothing,
        );
      },
    );

    testWidgets(
      '=> test Payment Terms enabled',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeTWSalesOrgConfigs,
            salesOrganisation: fakeTWSalesOrganisation,
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTWSalesOrgConfigs,
            salesOrganisation: fakeTWSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPage = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPage, findsOneWidget);

        final paymentTermDropdown =
            find.byKey(WidgetKeys.paymentTermDropdownKey);
        expect(paymentTermDropdown, findsOneWidget);
      },
    );

    testWidgets(
      '=> test Payment Terms disabled',
      (tester) async {
        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            isValidated: true,
          ),
        );
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final checkoutPage = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPage, findsOneWidget);

        final paymentTermDropdown =
            find.byKey(WidgetKeys.paymentTermDropdownKey);
        expect(paymentTermDropdown, findsNothing);
      },
    );

    testWidgets(
      '=> Show tax details on material level when displaySubtotalTaxBreakdown && displayItemTaxBreakdown is enabled for vn with material level tax',
      (tester) async {
        final salesOrgState = SalesOrgState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
          configs: fakeVNSalesOrgConfigs,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                tax: 10,
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(234.50),
              ),
              salesOrgConfig: fakeVNSalesOrgConfigs,
            ),
          ],
          config: fakeVNSalesOrgConfigs,
        );

        when(() => salesOrgBlocMock.state).thenReturn(
          salesOrgState,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeVNSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.byWidgetPredicate((w) => w is SliverToBoxAdapter),
          findsAtLeastNWidgets(3),
        );
        final sliverFinder =
            find.byWidgetPredicate((w) => w is CustomScrollView);
        await tester.fling(sliverFinder, const Offset(0, -10000), 100);
        await tester.pump();

        final taxPercentageFinder = find.textContaining('Tax');
        expect(taxPercentageFinder, findsOneWidget);
        final vatPercentageFinder = find.text('Tax at 5%');
        expect(vatPercentageFinder, findsNothing);
        final listPriceWithTax = cartState
            .cartProducts.first.finalPriceTotalWithTax
            .toStringAsFixed(2);
        expect(
          find.text(
            'VND $listPriceWithTax',
            findRichText: true,
          ),
          findsAtLeastNWidgets(1),
        );
        expect(
          find.text('${'Subtotal (excl.tax)'.tr()}:'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> Do not Show tax details on total when displaySubtotalTaxBreakdown is disabled for ph',
      (tester) async {
        final salesOrgState = SalesOrgState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          configs: fakePHSalesOrgConfigs,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                tax: 10,
                type: MaterialInfoType.material(),
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(234.50),
              ),
              salesOrgConfig: fakePHSalesOrgConfigs,
            ),
          ],
          config: fakePHSalesOrgConfigs,
        );

        when(() => salesOrgBlocMock.state).thenReturn(
          salesOrgState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakePHSalesOrganisation,
            salesOrgConfigs: fakePHSalesOrgConfigs,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        expect(
          find.byWidgetPredicate((w) => w is SliverToBoxAdapter),
          findsAtLeastNWidgets(3),
        );
        final sliverFinder =
            find.byWidgetPredicate((w) => w is CustomScrollView);
        await tester.fling(sliverFinder, const Offset(0, -10000), 100);
        await tester.pump();

        final taxPercentageFinder = find.text('Tax at 10%');
        expect(taxPercentageFinder, findsNothing);
        final vatPercentageFinder = find.text('Tax at 5%');
        expect(vatPercentageFinder, findsNothing);
        final listPriceWithTax = cartState
            .cartProducts.first.finalPriceTotalWithTax
            .toStringAsFixed(2);
        expect(
          find.text(
            'PHP $listPriceWithTax',
            findRichText: true,
          ),
          findsAtLeastNWidgets(1),
        );
        expect(find.text('Subtotal (incl.tax):'), findsOneWidget);
      },
    );

    testWidgets(
      '=> Hide tax rate on material level when displaySubtotalTaxBreakdown && displayItemTaxBreakdown is enabled for VN',
      (tester) async {
        final cartState = CartState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
          cartProducts: <PriceAggregate>[PriceAggregate.empty()],
          config: fakeVNSalesOrgConfigs,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        await tester.fling(
          find.byType(CustomScrollView),
          const Offset(0, -10000),
          100,
        );
        await tester.pump();

        //Hide the vat value
        final taxRateFinder = find.text('Tax:');
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: taxRateFinder,
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> Show tax rate on material level when displaySubtotalTaxBreakdown && displayItemTaxBreakdown is enabled for VN',
      (tester) async {
        final cartState = CartState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          cartProducts: <PriceAggregate>[
            PriceAggregate.empty(),
          ],
          config: fakeVNSalesOrgConfigs,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        await tester.fling(
          find.byType(CustomScrollView),
          const Offset(0, -10000),
          100,
        );
        await tester.pump();

        final taxRateFinder = find.text('Tax at:');
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.checkoutSummaryTax),
            matching: taxRateFinder,
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> Do not Show delivery Instruction textfield  when displaySubtotalTaxBreakdown is false',
      (tester) async {
        final salesOrgState = SalesOrgState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
        );

        when(() => salesOrgBlocMock.state).thenReturn(
          salesOrgState,
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey')),
          findsNothing,
        );
      },
    );

    testWidgets(
      '=> Do not Show delivery Instruction textfield  when displaySubtotalTaxBreakdown is true',
      (tester) async {
        final salesOrgState = SalesOrgState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeVNSalesOrganisation,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
          ),
        );

        when(() => salesOrgBlocMock.state).thenReturn(
          salesOrgState,
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey')),
          findsOneWidget,
        );
      },
    );

    testWidgets('=> Hide Request Delivery Date', (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      // Verify that the initial delivery date is invisible
      expect(
        find.textContaining('Request delivery date'.tr(), findRichText: true),
        findsNothing,
      );
      expect(
        find.textContaining('Select date'.tr(), findRichText: true),
        findsNothing,
      );
    });

    testWidgets('=> Show Request Delivery Date', (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      // Verify that the initial delivery date is displayed correctly
      expect(
        find.textContaining('Request delivery date'.tr(), findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining('Select date'.tr(), findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('=> Test default request delivery date is empty',
        (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final rddFieldFinder = find.byKey(WidgetKeys.deliveryDate);
      expect(rddFieldFinder, findsOneWidget);
      final textField =
          rddFieldFinder.evaluate().single.widget as TextFormField;
      expect(textField.initialValue, '');
    });

    testWidgets('=> Selecting a date updates the delivery date text',
        (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
          salesOrgConfigs: fakeTHSalesOrgConfigs,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      // Verify that the initial delivery date is displayed correctly
      expect(
        find.textContaining('Request delivery date'.tr(), findRichText: true),
        findsOneWidget,
      );
      expect(
        find.textContaining('Select date'.tr(), findRichText: true),
        findsOneWidget,
      );
      var selectedDate = fakeTHSalesOrgConfigs.deliveryStartDate;

      expect(
        find.text(DateTimeUtils.getDeliveryDateString(selectedDate)),
        findsNothing,
      );

      // Simulate tapping the select date button
      await tester.tap(find.byKey(WidgetKeys.deliveryDate));
      await tester.pumpAndSettle();

      // Verify that the date picker is displayed
      final okButton = find.text('OK');
      expect(okButton, findsOneWidget);
      await tester.tap(find.widgetWithIcon(IconButton, Icons.edit));
      await tester.pump();
      selectedDate = DateTimeUtils.addWorkingDay(
        fakeTHSalesOrgConfigs.deliveryStartDate,
        fakeTHSalesOrgConfigs.futureDeliveryDay.intValue - 1,
      ).add(const Duration(days: 1));
      await tester.enterText(
        find.byType(InputDatePickerFormField),
        '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
      );
      await tester.pump();
      await tester.tap(okButton);
      await tester.pumpAndSettle();
      expect(find.text('Out of range.'), findsOneWidget);

      selectedDate = DateTimeUtils.addWorkingDay(
        fakeTHSalesOrgConfigs.deliveryStartDate,
        fakeTHSalesOrgConfigs.futureDeliveryDay.intValue - 1,
      );
      await tester.enterText(
        find.byType(InputDatePickerFormField),
        '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
      );
      await tester.pump();
      await tester.tap(okButton);
      await tester.pumpAndSettle();
      // Verify that the selected date is updated in the delivery date text field
      expect(
        find.text(DateTimeUtils.getDeliveryDateString(selectedDate)),
        findsOneWidget,
      );
    });

    testWidgets('Find Total Tax', (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSGSalesOrganisation,
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );

      final cartState = CartState.initial().copyWith(
        cartProducts: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(1),
              tax: 10,
            ),
            price: Price.empty().copyWith(
              finalPrice: MaterialPrice(234.50),
            ),
            salesOrgConfig: fakeSGSalesOrgConfigs,
          ),
        ],
        config: fakeSGSalesOrgConfigs,
      );

      when(() => cartBloc.state).thenReturn(cartState);

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final scrollListFinder = find.byKey(WidgetKeys.checkoutScrollList);
      expect(scrollListFinder, findsOneWidget);

      final taxValue = find.textContaining(
        'Tax at 9%:',
      );
      await tester.dragUntilVisible(
        taxValue,
        scrollListFinder,
        const Offset(0.0, -200.0),
      );
    });

    testWidgets(
      'Display Price Not Available Message for hide price materials',
      (tester) async {
        final cartProducts = <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(1),
              taxClassification:
                  MaterialTaxClassification('Product : Full Tax'),
              type: MaterialInfoType('material'),
              hidePrice: true,
            ),
            price: Price.empty().copyWith(
              finalPrice: MaterialPrice(354.60),
            ),
          ),
        ];
        final cartState = CartState.initial().copyWith(
          cartProducts: cartProducts,
        );

        final orderEligibilityState = OrderEligibilityState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          cartItems: cartProducts,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          orderEligibilityState,
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final priceMessageWidgetFinder =
            find.byKey(WidgetKeys.priceNotAvailableMessageWidget);
        final priceMessageFinder = find.text(
          'Price is not available for at least one item. Grand total reflected may not be accurate.'
              .tr(),
        );
        expect(priceMessageWidgetFinder, findsOneWidget);
        expect(priceMessageFinder, findsOneWidget);
      },
    );

    testWidgets(
        'Test Grand Total value for bundles with displaySubtotalTaxBreakdown enabled',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs,
          salesOrganisation: fakeKHSalesOrganisation,
        ),
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          config: fakeKHSalesOrgConfigs,
          salesOrganisation: fakeKHSalesOrganisation,
          cartProducts: [
            mockCartBundleItems.first.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            )
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final scrollListFinder = find.byKey(WidgetKeys.checkoutScrollList);
      expect(scrollListFinder, findsOneWidget);

      final subTotalTextFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
        matching: find.textContaining(
          'Subtotal (${fakeKHSalesOrgConfigs.displayPrefixTax}.tax)',
        ),
      );
      final subTotalValueFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
        matching: find.text(
          '${fakeKHSalesOrgConfigs.currency.code} 990.00',
          findRichText: true,
        ),
      );
      final taxAtTextFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummaryTax),
        matching: find.textContaining('Tax at 10%'),
      );
      final taxAtValueFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummaryTax),
        matching: find.text(
          '${fakeKHSalesOrgConfigs.currency.code} 99.00',
          findRichText: true,
        ),
      );
      final grandTotalTextFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
        matching: find.textContaining('Grand total:'),
      );
      final grandTotalValueFinder = find.descendant(
        of: find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
        matching: find.text(
          '${fakeKHSalesOrgConfigs.currency.code} 1,089.00',
          findRichText: true,
        ),
      );

      await tester.dragUntilVisible(
        subTotalTextFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );

      await tester.dragUntilVisible(
        subTotalValueFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );

      await tester.dragUntilVisible(
        taxAtTextFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );

      await tester.dragUntilVisible(
        taxAtValueFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );

      await tester.dragUntilVisible(
        grandTotalTextFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );

      await tester.dragUntilVisible(
        grandTotalValueFinder,
        scrollListFinder,
        const Offset(0.0, -300.0),
      );
    });

    testWidgets(
      'Checkout page Price Breakdown for every market',
      (tester) async {
        final currentSalesOrgConfigVariant =
            salesOrgConfigVariant.currentValue ?? fakeIDSalesOrgConfigs;
        final currentSalesOrganisation = fakeEmptySalesOrganisation.copyWith(
          salesOrg: currentSalesOrgConfigVariant.salesOrg,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: currentSalesOrgConfigVariant,
            salesOrganisation: currentSalesOrganisation,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            config: currentSalesOrgConfigVariant,
            salesOrganisation: currentSalesOrganisation,
            cartProducts: [
              mockCartItems.first.copyWith(
                salesOrgConfig: currentSalesOrgConfigVariant,
                price: priceList.first,
                quantity: 1,
              )
            ],
            aplSimulatorOrder: aplSimulatorOrder,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final scrollListFinder = find.byKey(WidgetKeys.checkoutScrollList);
        expect(scrollListFinder, findsOneWidget);

        final subTotalTextFinder = find.descendant(
          of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
          matching: find.textContaining(
            'Subtotal (${currentSalesOrgConfigVariant.displayPrefixTax}.tax)',
          ),
        );
        await tester.dragUntilVisible(
          subTotalTextFinder,
          scrollListFinder,
          const Offset(0.0, -300.0),
        );
        final subTotalValueFinder = find.descendant(
          of: find.byKey(WidgetKeys.checkoutSummarySubTotal),
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              currentSalesOrgConfigVariant,
              currentSalesOrgConfigVariant.salesOrg.isID
                  ? aplSimulatorOrder.totalPriceWithoutTax
                  : priceList.first.finalPrice.getValue(),
              false,
            ),
            findRichText: true,
          ),
        );
        expect(subTotalValueFinder, findsOneWidget);
        expect(
          checkoutSummaryTax,
          currentSalesOrgConfigVariant.showSubtotalTaxBreakdown
              ? findsOneWidget
              : findsNothing,
        );
        expect(
          checkoutSummaryTaxPrice,
          currentSalesOrgConfigVariant.showSubtotalTaxBreakdown
              ? findsOneWidget
              : findsNothing,
        );
        expect(
          checkoutSummarySmallOrderFee,
          currentSalesOrgConfigVariant.salesOrg.showSmallOrderFee
              ? findsOneWidget
              : findsNothing,
        );
        final checkoutSummarySmallOrderFeePriceFinder = find.descendant(
          of: find.byKey(WidgetKeys.checkoutSummarySmallOrderFee),
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              currentSalesOrgConfigVariant,
              aplSimulatorOrder.smallOrderFee,
              false,
            ),
            findRichText: true,
          ),
        );
        expect(
          checkoutSummarySmallOrderFeePriceFinder,
          currentSalesOrgConfigVariant.salesOrg.showSmallOrderFee
              ? findsOneWidget
              : findsNothing,
        );
        expect(checkoutSummaryGrandTotalPrice, findsOneWidget);
        final totalSaving = find.descendant(
          of: checkoutSummaryTotalSaving,
          matching: find.text('Total savings:'),
        );
        expect(
          totalSaving,
          currentSalesOrgConfigVariant.salesOrg.showTotalSaving
              ? findsOneWidget
              : findsNothing,
        );
        final totalSavingValue = find.descendant(
          of: checkoutSummaryTotalSaving,
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              currentSalesOrgConfigVariant,
              aplSimulatorOrder.totalDiscountValue,
              false,
            ),
            findRichText: true,
          ),
        );
        expect(
          totalSavingValue,
          currentSalesOrgConfigVariant.salesOrg.showTotalSaving
              ? findsOneWidget
              : findsNothing,
        );
      },
      variant: salesOrgConfigVariant,
    );
    testWidgets(
      '=> test Checkout Bonus stock tag',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              mockCartItems.first.copyWith(
                materialInfo: mockCartItems.first.materialInfo.copyWith(
                  type: MaterialInfoType.material(),
                ),
                bonusSampleItems: [
                  BonusSampleItem.empty().copyWith(
                    materialNumber: mockCartItems.first.getMaterialNumber,
                  )
                ],
                stockInfoList: [
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    materialNumber: mockCartItems.first.getMaterialNumber,
                  )
                ],
              ),
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.checkoutScrollList),
          const Offset(0.0, -1000.0),
          1000.0,
        );
        final checkoutPageFinder = find.byKey(WidgetKeys.checkoutPage);
        expect(checkoutPageFinder, findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(StatusLabel),
            matching: find.text('Out of stock'),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets('BillToInfo test when enablebillto is true', (tester) async {
      final cartState = CartState.initial().copyWith(
        cartProducts: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(1),
            ),
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ],
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs,
          salesOrganisation: fakeKHSalesOrganisation,
        ),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final payerInformation = find.byKey(WidgetKeys.payerInformation);
      expect(payerInformation, findsOneWidget);
    });

    testWidgets(
        'BillToInfo test when enablebillto is true and billToInfo empty',
        (tester) async {
      final cartState = CartState.initial().copyWith(
        cartProducts: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(1),
            ),
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ],
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs,
          salesOrganisation: fakeKHSalesOrganisation,
        ),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );

      when(() => paymentCustomerInformationBlocMock.state).thenReturn(
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation: PaymentCustomerInformation.empty(),
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final payerInformation = find.byKey(WidgetKeys.payerInformation);
      expect(payerInformation, findsNothing);
    });

    testWidgets('BillToInfo test when enablebillto is false', (tester) async {
      final cartState = CartState.initial().copyWith(
        cartProducts: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              materialNumber: MaterialNumber('123456789'),
              quantity: MaterialQty(1),
            ),
            salesOrgConfig: fakeSGSalesOrgConfigs,
          ),
        ],
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
          salesOrganisation: fakeSGSalesOrganisation,
        ),
      );
      when(() => cartBloc.state).thenReturn(
        cartState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final payerInformation = find.byKey(WidgetKeys.payerInformation);
      expect(payerInformation, findsNothing);
    });

    testWidgets('Counter offer Requested for png material', (tester) async {
      final pnGCartItem = PriceAggregate.empty().copyWith(
        quantity: 2,
        price: Price.empty().copyWith(
          isPriceOverride: true,
          finalPrice: MaterialPrice(364.80),
          lastPrice: MaterialPrice(364.80),
        ),
        materialInfo: MaterialInfo.empty().copyWith(
          type: MaterialInfoType('material'),
          hidePrice: true,
          counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
            counterOfferPrice: CounterOfferValue('500'),
          ),
        ),
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: [pnGCartItem],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final materialKey = find.byKey(WidgetKeys.cartItemProductMaterialNumber);
      expect(materialKey, findsOneWidget);

      final priceNotAvailableFinder = find.descendant(
        of: find.byKey(WidgetKeys.cartItemProductUnitPrice),
        matching: find.text('Price Not Available', findRichText: true),
      );
      expect(priceNotAvailableFinder, findsOneWidget);

      final requestedCounterOfferKey =
          find.text('Requested counter offer'.tr());
      expect(requestedCounterOfferKey, findsOneWidget);
    });
  });
}
