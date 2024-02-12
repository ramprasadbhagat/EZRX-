import 'package:bloc_test/bloc_test.dart';
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
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/item_tax.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
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

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MockMixpanelService extends Mock implements MixpanelService {}

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
  late ProductImageBloc productImageBloc;
  late MaterialPriceBloc materialPriceBlocMock;
  final userBlocMock = UserMockBloc();
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;
  final fakeCartProduct = <PriceAggregate>[
    PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('123456789'),
        quantity: MaterialQty(1),
        tax: 10,
        type: MaterialInfoType.material(),
      ),
      price: Price.empty().copyWith(
        finalPrice: MaterialPrice(234.50),
      ),
      salesOrgConfig: fakeIDSalesOrgConfigs,
      bonusSampleItems: [
        BonusSampleItem.empty().copyWith(
          materialNumber: MaterialNumber('fake-bonus-1'),
          inStock: MaterialInStock('Yes'),
          qty: MaterialQty(5),
        ),
        BonusSampleItem.empty().copyWith(
          materialNumber: MaterialNumber('fake-bonus-2'),
          inStock: MaterialInStock('No'),
          type: MaterialInfoType('Bonus'),
          qty: MaterialQty(10),
        ),
        BonusSampleItem.empty().copyWith(
          materialNumber: MaterialNumber('fake-bonus-3'),
          type: MaterialInfoType('Deals'),
          inStock: MaterialInStock('No'),
          qty: MaterialQty(15),
        )
      ],
    ),
  ];

  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    locator.registerSingleton<MixpanelService>(MockMixpanelService());

    autoRouterMock = locator<AppRouter>();
  });
  group('Pre Order Modal Test', () {
    setUp(() {
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
      autoRouterMock = locator<AppRouter>();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();
      poAttachmentBloc = PoAttachmentBlocMock();
      priceOverrideBloc = PriceOverrideBlocMock();
      comboDealListBloc = ComboDealListBlocMock();
      productImageBloc = ProductImageBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();

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
      when(() => productImageBloc.state).thenReturn(
        ProductImageState.initial(),
      );
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial(),
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
            BlocProvider<ProductImageBloc>(
              create: (context) => productImageBloc,
            ),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBlocMock,
            ),
          ],
          child: const Material(
            child: PreOrderModal(),
          ),
        ),
      );
    }

    testWidgets(
      '=> test Pre Order Modal App Bar ',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderModelFinder = find.byKey(WidgetKeys.preOrderModel);
        expect(preOrderModelFinder, findsOneWidget);
        final appBarTitle = find.text('OOS-Preorder items in cart');
        expect(appBarTitle, findsOneWidget);
        final appBarSubTitle = find
            .text('These item will only be delivered when stock is available.');
        expect(appBarSubTitle, findsOneWidget);
      },
    );
    testWidgets(
      '=> test Pre Order Modal Body ',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderModelFinder = find.byKey(WidgetKeys.preOrderModel);
        expect(preOrderModelFinder, findsOneWidget);
        final preOrderModalItemListFinder =
            find.byKey(WidgetKeys.preOrderModalItemList);
        expect(preOrderModalItemListFinder, findsOneWidget);
        final preOrderMaterialFinder = find.byKey(
          WidgetKeys.preOrderMaterial(
            fakeCartProduct.first.getMaterialNumber.displayMatNo,
          ),
        );
        expect(preOrderMaterialFinder, findsOneWidget);
        final preOrderModalItemFinalPrice = find.byKey(
          WidgetKeys.preOrderModalItemFinalPrice,
        );
        expect(preOrderModalItemFinalPrice, findsOneWidget);
        final preOrderModalItemTotalPrice = find.byKey(
          WidgetKeys.preOrderModalItemTotalPrice,
        );
        expect(preOrderModalItemTotalPrice, findsOneWidget);
        final preOrderModalItemTax = find.byType(
          ItemTax,
        );
        expect(preOrderModalItemTax, findsOneWidget);
      },
    );
    testWidgets(
      '=> test Pre Order Modal Body item image section for covid material',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                materialInfo: fakeCartProduct.first.materialInfo.copyWith(
                  isFOCMaterial: true,
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderModelFinder = find.byKey(WidgetKeys.preOrderModel);
        expect(preOrderModelFinder, findsOneWidget);
        final preOrderModalItemListFinder =
            find.byKey(WidgetKeys.preOrderModalItemList);
        expect(preOrderModalItemListFinder, findsOneWidget);
        final preOrderMaterialFinder = find.byKey(
          WidgetKeys.preOrderMaterial(
            fakeCartProduct.first.getMaterialNumber.displayMatNo,
          ),
        );
        expect(preOrderMaterialFinder, findsOneWidget);
        expect(find.byType(CovidTag), findsOneWidget);
        expect(
          find.byType(GovtListPriceComponent),
          findsOneWidget,
        );
      },
    );
    testWidgets(
      '=> test Pre Order Modal Body Manufacturer Name',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                materialInfo: fakeCartProduct.first.materialInfo.copyWith(
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode',
                    ),
                    principalName: PrincipalName('fake_principalName-1'),
                  ),
                ),
              ),
              fakeCartProduct.first.copyWith(
                materialInfo: fakeCartProduct.first.materialInfo.copyWith(
                  materialNumber: MaterialNumber('1234567'),
                  principalData: PrincipalData(
                    principalCode: PrincipalCode(
                      'fake_principalCode1',
                    ),
                    principalName: PrincipalName('fake_principalName-2'),
                  ),
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderModelFinder = find.byKey(WidgetKeys.preOrderModel);
        expect(preOrderModelFinder, findsOneWidget);
        final preOrderModalItemListFinder =
            find.byKey(WidgetKeys.preOrderModalItemList);
        expect(preOrderModalItemListFinder, findsOneWidget);
        final preOrderMaterialFinder = find.byKey(
          WidgetKeys.preOrderMaterial(
            fakeCartProduct.first.getMaterialNumber.displayMatNo,
          ),
        );
        expect(preOrderMaterialFinder, findsOneWidget);
        final preOrderModalItemFinalPrice = find.byKey(
          WidgetKeys.preOrderModalItemFinalPrice,
        );
        expect(preOrderModalItemFinalPrice, findsWidgets);
        final preOrderModalItemTotalPrice = find.byKey(
          WidgetKeys.preOrderModalItemTotalPrice,
        );
        expect(preOrderModalItemTotalPrice, findsWidgets);
        final preOrderModalItemTax = find.byType(
          ItemTax,
        );
        expect(preOrderModalItemTax, findsWidgets);
      },
    );

    testWidgets(
      '=> test Pre Order Modal Bottom section',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                materialInfo: fakeCartProduct.first.materialInfo.copyWith(
                  isFOCMaterial: true,
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderModelFinder = find.byKey(WidgetKeys.preOrderModel);
        expect(preOrderModelFinder, findsOneWidget);
        final preOrderModalCancelButton =
            find.byKey(WidgetKeys.preOrderModalCancelButton);
        expect(preOrderModalCancelButton, findsOneWidget);
        final preOrderModalContinueButton =
            find.byKey(WidgetKeys.preOrderModalContinueButton);
        expect(preOrderModalContinueButton, findsOneWidget);
      },
    );

    testWidgets(
      '=> List price strike through price visible, if final price is less than list price && enableListPrice = true',
      (tester) async {
        final finalPrice = MaterialPrice(80);
        final listPrice = MaterialPrice(100);
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                salesOrgConfig: fakeIDSalesOrgConfigs,
                price: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                  materialNumber:
                      fakeCartProduct.first.materialInfo.materialNumber,
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

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
      },
    );

    testWidgets(
      '=> List price strike through price not visible, if final price is less than list price && enableListPrice = false',
      (tester) async {
        final finalPrice = MaterialPrice(80);
        final listPrice = MaterialPrice(100);
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                salesOrgConfig: fakeMYSalesOrgConfigs,
                price: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                  materialNumber:
                      fakeCartProduct.first.materialInfo.materialNumber,
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

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
      },
    );

    testWidgets(
      '=> List price strike through price not visible, if final price is greater than and equal to list price && enableListPrice = true',
      (tester) async {
        final finalPrice = MaterialPrice(200);
        final listPrice = MaterialPrice(100);
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                salesOrgConfig: fakeIDSalesOrgConfigs,
                price: Price.empty().copyWith(
                  lastPrice: listPrice,
                  finalPrice: finalPrice,
                  materialNumber:
                      fakeCartProduct.first.materialInfo.materialNumber,
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

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
      },
    );

    testWidgets(
      'Find out of stock bonus items in pre order items list',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
            config: fakeIDSalesOrgConfigs,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final preOrderList = find.byKey(WidgetKeys.preOrderModalItemList);
        final preOrderBonus = find.text('fake-bonus-2');
        expect(preOrderList, findsOneWidget);
        expect(preOrderBonus, findsOneWidget);
      },
    );

    testWidgets(
      '=> Find Offer Tag',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              fakeCartProduct.first.copyWith(
                price: Price.empty().copyWith(
                  tiers: [
                    PriceTier.empty().copyWith(
                      tier: 'C',
                      items: [
                        PriceTierItem.empty().copyWith(
                          rate: 41,
                          quantity: 5,
                        ),
                        PriceTierItem.empty().copyWith(
                          rate: 20,
                          quantity: 10,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final offerTag = find.byType(OfferLabel);
        expect(offerTag, findsWidgets);
      },
    );
    testWidgets(
      'Find Bonus Tag for deal bonus',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final dealBonusItem = find.text('fake-bonus-3');
        expect(dealBonusItem, findsOneWidget);
        final bonusTag = find.byType(BonusTag);
        expect(bonusTag, findsNWidgets(2));
      },
    );

    testWidgets(
      'Find Correct Quantity for added bonus item in pre-order model',
      (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: fakeCartProduct,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final dealBonusItem = find.text('fake-bonus-3');
        expect(dealBonusItem, findsOneWidget);
        final bonusQuantity = find.text('Qty: 15');
        expect(bonusQuantity, findsOneWidget);
      },
    );
  });
}
